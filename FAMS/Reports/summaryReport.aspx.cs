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
using System.Configuration;
using System.Data;
using System.IO;
using System.Reflection;

namespace FAMS.Reports
{
    public partial class summaryReport : System.Web.UI.Page
    {
        string fromdate = "";
        string todate = "";
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



        protected void btnDowloadExcel_Click(object sender, EventArgs e)
        {
            FAMSEntities context = new FAMSEntities();
            List<SummaryReports> dataList = new List<SummaryReports>();
            try
            {
                fromdate = hdnFromDate.Value;
                todate = hdnToDate.Value;
                var results =context.MultipleResults("[dbo].[Sp_DemoReport]").With<SummaryReports>()
                        .Execute("@Querytype", "@CustomerAccount", "@Fromdate", "@Todate", "GetSummaryReportDataExcel", Session["UserName"].ToString(), fromdate, todate);

                foreach (var data in results)
                {
                    dataList = data.Cast<SummaryReports>().ToList();
                }
                DataTable dt = ToDataTable(dataList);

                string filename = "Excel";
               
                CreateExcel(dt, filename);
            
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public void CreateExcel(System.Data.DataTable dt, string FileName)
        {
            try
            {
                System.Data.DataTable dtTemp = new System.Data.DataTable();


                //TableRow row1 = new TableRow();
                //TableCell cell1 = new TableCell();
                //cell1.Text = "blah blah blah";
                //row1.Cells.Add(cell1);
                //dtTemp.Rows.Add(row1);

                //DataRow workRow = dtTemp.NewRow();
                //dtTemp.Columns.Add("CustLName", string.Empty.GetType());
                //workRow["CustLName"] = "Smith";               
                //workRow[1] = "Smith";
                //dtTemp.Rows.Add(new Object[] { 1, "Smith" });

                //Creating dummy datatable for testing
                //DataColumn dc = new DataColumn("XYZ Financials", typeof(String));
                //dtTemp.Columns.Add(dc);

                //dc = new DataColumn("col2", typeof(String));
                //dt.Columns.Add(dc);

                //dc = new DataColumn("col3", typeof(String));
                //dt.Columns.Add(dc);

                //dc = new DataColumn("col4", typeof(String));
                //dt.Columns.Add(dc);
                string colName = "Portfolio Performance Summary";
                /////more than one columns take the count
                /////more than one column case use below code inside a loop with count of columns
                dtTemp.Columns.Add(colName, typeof(string));
                dtTemp.Columns.Add(" ", typeof(string));
                ////////////add new row after adding columns
                for (int i=1; i<=3;i++)
                {
                    if (i == 1)
                        {
                        DataRow dr1 = dtTemp.NewRow();
                        dr1[colName] = "Account : Cust_000134 ABC ";
                        dtTemp.Rows.Add(dr1.ItemArray);
                    }
                    if (i == 2)
                    {
                        DataRow dr1 = dtTemp.NewRow();
                        dr1[colName] = "Aggressive Portfolio";
                        dtTemp.Rows.Add(dr1.ItemArray);
                    }
                    if (i == 3)
                    {
                        DataRow dr1 = dtTemp.NewRow();
                        var value = "From "; value += fromdate; value += "to "; value += fromdate;
                        dr1[colName] = value;
                       // dtTemp.Rows.Add(dr1.ItemArray);
                       // dr1[" "] = "d";
                        dtTemp.Rows.Add(dr1.ItemArray);
                    }

                }




                foreach (System.Data.DataColumn dc in dt.Columns)
                {
                    try
                    {
                        // dtTemp.Columns.Add(dc.ColumnName.ToString(), string.Empty.GetType());
                        DataRow dr1 = dtTemp.NewRow();
                        if (dc.ColumnName.ToString() == "OpeningMarketValue")
                        {
                            dr1[colName] = "OpeningMarketValue as of" + fromdate;
                        }
                        else if(dc.ColumnName.ToString() == "OpeningNAV")
                        {
                            dr1[colName] = "OpeningNAV as of" + fromdate;
                        }
                        else if (dc.ColumnName.ToString() == "OpeningOutstandingUnits")
                        {
                            dr1[colName] = "OpeningOutstandingUnits as of" + fromdate;
                        }
                        else if (dc.ColumnName.ToString() == "ClosingMarketValue")
                        {
                            dr1[colName] = "ClosingMarketValue as of" + todate;
                        }
                        else if (dc.ColumnName.ToString() == "ClosingNAV")
                        {
                            dr1[colName] = "ClosingNAV as of" + todate;
                        }
                        else if (dc.ColumnName.ToString() == "ClosingOutstanding")
                        {
                            dr1[colName] = "ClosingOutstanding as of" + todate;
                        }
                        else
                        {
                            dr1[colName] = dc.ColumnName.ToString();
                        }
                           
                        
                       // dtTemp.Rows.Add(dr1.ItemArray);
                       string Rowdata= dt.Rows[0][dc.ColumnName.ToString()].ToString();
                        dr1[" "] = Rowdata;
                        dtTemp.Rows.Add(dr1.ItemArray);
                    }
                    catch
                    {
                    }
                }

                //foreach (System.Data.DataRow dr in dt.Rows)
                //{
                //    System.Data.DataRow row = dtTemp.NewRow();
                //    foreach (System.Data.DataColumn DC in dt.Columns)
                //    {
                //        DataRow dr1 = dtTemp.NewRow();
                //        dr1[colName] = DC.ColumnName.ToString();
                //        dtTemp.Rows.Add(dr1.ItemArray);
                //        row[DC.ColumnName] = dr[DC.ColumnName];
                //    }
                //    //dtTemp.Rows.Add(row);
                //}
                DataGrid DataGrid1 = new DataGrid();
                DataGrid1.DataSource = dtTemp;
                DataGrid1.DataBind();

                Response.Cache.SetExpires(DateTime.Now.AddSeconds(1));
                Response.ContentType = "application/vnd.ms-excel";
                Response.Charset = "";
                this.EnableViewState = false;
                Response.Write("<html xmlns:x=\"urn:schemas-microsoft-com:office:excel\">");
                Response.Write("\r\n");
                Response.Write("<style> td {mso-number-format:" + "\\@" + "; text-align:center;} </style>");

                StringWriter tw = new StringWriter();
                HtmlTextWriter hw = new HtmlTextWriter(tw);
                DataGrid1.RenderControl(hw);
                Response.AppendHeader("content-disposition", "attachment;filename=" + FileName + ".xls");
                Response.Write(tw.ToString());
                Response.End();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }


        public DataTable ToDataTable<T>(List<T> items)
        {
            DataTable dataTable = new DataTable(typeof(T).Name);
            //Get all the properties by using reflection   
            PropertyInfo[] Props = typeof(T).GetProperties(BindingFlags.Public | BindingFlags.Instance);
            foreach (PropertyInfo prop in Props)
            {
                //Setting column names as Property names  
                dataTable.Columns.Add(prop.Name);
            }
            foreach (T item in items)
            {
                var values = new object[Props.Length];
                for (int i = 0; i < Props.Length; i++)
                {


                    values[i] = Props[i].GetValue(item, null);
                }
                dataTable.Rows.Add(values);
            }

            return dataTable;
        }
    }
}