using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using iTextSharp.text;
using iTextSharp.text.pdf;
using FAMS.Models.ReportsClasses;
using FAMS.Entity;
using BusinessLibrary;



namespace FAMS.Reports
{
    public partial class summaryReport : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnPdf_Click(object sender, EventArgs e)
        {
            try
            {
                FAMSEntities context = new FAMSEntities();

                var results = Common.Getdata(context.MultipleResults("[dbo].[Sp_DemoReport]").With<SummaryReports>()
                         .Execute("@Querytype", "@CustomerAccount", "@Fromdate", "@Todate", "GetSummaryReportData", "", "04/09/2020", "04/09/2020"));

                //string customerJSON = Request.Form["CustomerJSON"];
                //DataTable dataTable = JsonConvert.DeserializeObject<DataTable>(customerJSON);
                //string Name = "AccountData";
                //string[] columnNames = (from dc in dataTable.Columns.Cast<DataColumn>()
                //                        select dc.ColumnName).ToArray();
                //int Cell = 0;
                //int count = columnNames.Length;
                //object[] array = new object[count];

                //dataTable.Rows.Add(array);

                //Document pdfDoc = new Document(PageSize.A2, 10f, 10f, 10f, 0f);
                //System.IO.MemoryStream mStream = new System.IO.MemoryStream();
                //PdfWriter writer = iTextSharp.text.pdf.PdfWriter.GetInstance(pdfDoc, mStream);
                //int cols = dataTable.Columns.Count;
                //int rows = dataTable.Rows.Count;


                //HeaderFooter header = new HeaderFooter(new Phrase(Name), false);

                //// Remove the border that is set by default  
                //header.Border = iTextSharp.text.Rectangle.TITLE;
                //// Align the text: 0 is left, 1 center and 2 right.  
                //header.Alignment = Element.ALIGN_CENTER;
                //pdfDoc.Header = header;
                //// Header.  
                //pdfDoc.Open();
                //iTextSharp.text.Table pdfTable = new iTextSharp.text.Table(cols, rows);
                //pdfTable.BorderWidth = 0; pdfTable.Width = 80;
                //pdfTable.Padding = 0; pdfTable.Spacing = 4;

                ////creating table headers  
                ////for (int i = 0; i < cols; i++)
                ////{
                ////    Cell cellCols = new Cell();
                ////    Chunk chunkCols = new Chunk();
                ////    cellCols.BackgroundColor = new iTextSharp.text.Color(System.Drawing.ColorTranslator.FromHtml("#548B54"));
                ////    iTextSharp.text.Font ColFont = FontFactory.GetFont(FontFactory.HELVETICA, 12, iTextSharp.text.Font.BOLD, iTextSharp.text.Color.WHITE);

                ////    chunkCols = new Chunk(dataTable.Columns[i].ColumnName, ColFont);

                ////    cellCols.Add(chunkCols);
                ////    pdfTable.AddCell(cellCols);
                ////}


                //for (int k = 0; k < rows; k++)
                //{
                //    for (int j = 0; j < cols; j++)
                //    {
                //        Cell cellRows = new Cell();
                //        //if (k % 2 == 0)
                //        //{
                //        //    cellRows.BackgroundColor = new iTextSharp.text.Color(System.Drawing.ColorTranslator.FromHtml("#cccccc")); ;
                //        //}
                //        //else { cellRows.BackgroundColor = new iTextSharp.text.Color(System.Drawing.ColorTranslator.FromHtml("#ffffff")); }
                //        iTextSharp.text.Font RowFont = FontFactory.GetFont(FontFactory.HELVETICA, 10);
                //        Chunk chunkRows = new Chunk(dataTable.Rows[k][j].ToString(), RowFont);
                //        cellRows.Add(chunkRows);

                //        pdfTable.AddCell(cellRows);
                //    }
                //}

                //pdfDoc.Add(pdfTable);
                //pdfDoc.Close();
                //Response.ContentType = "application/octet-stream";
                //Response.AddHeader("Content-Disposition", "attachment; filename=" + Name + "_" + DateTime.Now.ToString() + ".pdf");
                //Response.Clear();
                //Response.BinaryWrite(mStream.ToArray());
                //Response.End();

            }
            catch (Exception ex)
            {

            }
        }
    }
}