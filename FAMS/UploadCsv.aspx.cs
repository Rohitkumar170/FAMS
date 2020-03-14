using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Text;
using FAMS.Entity;
using FAMS.Models.GETCOA;
using BusinessLibrary;
using System.Web.UI;

namespace FAMS
{
    public partial class UploadCsv : System.Web.UI.Page
    {
        DataTable dt; SplitCsv csv = new SplitCsv();
        protected void Page_Load(object sender, EventArgs e)
        {
            UploadCSV();
        }
        private void UploadCSV()
        {
            try
            {
                string SourceDirectorypath = ""; string[] files; string filename = ""; string[] split; int flag = 0; string DestinationDirectorypath = "";
                SourceDirectorypath = Server.MapPath("//FAMSIN//");
                DestinationDirectorypath = Server.MapPath("//FAMSOUT//");
                files = Directory.GetFiles(SourceDirectorypath, "*.csv");
                if (files.Length > 0)
                {
                    foreach (string file in files)
                    {
                        filename = Path.GetFileName(file);
                        split = filename.Split(new Char[] { ' ', '_' });
                        switch (split[1].ToString())
                        {
                            case "TB":
                                dt = new DataTable();
                                dt.Clear(); dt.Columns.Clear(); dt.Columns.Add("Col1", typeof(String)); dt.Columns.Add("Col2", typeof(String)); dt.Columns.Add("Col3", typeof(String)); dt.Columns.Add("Col4", typeof(String)); dt.Columns.Add("Col5", typeof(String)); dt.Columns.Add("Col6", typeof(String)); dt.Columns.Add("Col7", typeof(String)); dt.Columns.Add("Col8", typeof(String)); dt.Columns.Add("Col9", typeof(String));
                                flag = 1;
                                break;
                            case "NAV":
                                if (dt != null)
                                {
                                    dt.Clear(); dt.Columns.Clear(); dt.Columns.Add("Col1", typeof(String)); dt.Columns.Add("Col2", typeof(String));
                                }
                                flag = 2;
                                break;
                            case "Holding":
                                if (dt != null)
                                {
                                    dt.Clear(); dt.Columns.Clear(); dt.Columns.Add("Col1", typeof(String)); dt.Columns.Add("Col2", typeof(String)); dt.Columns.Add("Col3", typeof(String)); dt.Columns.Add("Col4", typeof(String)); dt.Columns.Add("Col5", typeof(String)); dt.Columns.Add("Col6", typeof(String)); dt.Columns.Add("Col7", typeof(String)); dt.Columns.Add("Col8", typeof(String)); dt.Columns.Add("Col9", typeof(String)); dt.Columns.Add("Col10", typeof(String));
                                }
                                flag = 3;
                                break;
                            case "Transaction":
                                if (dt != null)
                                {
                                    dt.Clear(); dt.Columns.Clear(); dt.Columns.Add("Col1", typeof(String)); dt.Columns.Add("Col2", typeof(String)); dt.Columns.Add("Col3", typeof(String)); dt.Columns.Add("Col4", typeof(String)); dt.Columns.Add("Col5", typeof(String)); dt.Columns.Add("Col6", typeof(String)); dt.Columns.Add("Col7", typeof(String)); dt.Columns.Add("Col8", typeof(String)); dt.Columns.Add("Col9", typeof(String)); dt.Columns.Add("Col10", typeof(String));
                                }
                                flag = 4;
                                break;
                            case "Cash":
                                if (dt != null)
                                {
                                    dt.Clear(); dt.Columns.Clear(); dt.Columns.Add("Col1", typeof(String)); dt.Columns.Add("Col2", typeof(String)); dt.Columns.Add("Col3", typeof(String)); dt.Columns.Add("Col4", typeof(String)); dt.Columns.Add("Col5", typeof(String)); dt.Columns.Add("Col6", typeof(String)); dt.Columns.Add("Col7", typeof(String)); dt.Columns.Add("Col8", typeof(String)); dt.Columns.Add("Col9", typeof(String)); dt.Columns.Add("Col10", typeof(String)); dt.Columns.Add("Col11", typeof(String)); dt.Columns.Add("Col12", typeof(String)); dt.Columns.Add("Col13", typeof(String)); dt.Columns.Add("Col14", typeof(String)); dt.Columns.Add("Col15", typeof(String));
                                }
                                flag = 5;
                                break;
                            case "Performance":
                                if (dt != null)
                                {
                                    dt.Clear(); dt.Columns.Clear();
                                }
                                flag = 6;
                                break;
                            case "Fact":
                                if (dt != null)
                                {
                                    dt.Clear(); dt.Columns.Clear();
                                }
                                flag = 7;
                                break;

                        }
                        if (dt != null)
                        {
                            if (dt.Columns.Count > 0)
                            {
                                DataRow dr = dt.NewRow();
                                using (StreamReader sr = new StreamReader(file))
                                {

                                    while (!sr.EndOfStream)
                                    {
                                        string line = sr.ReadLine();
                                        string[] rows = SplitCsv.Split(line);
                                        FAMSEntities dbcontext = new FAMSEntities();
                                        for (int i = 0; i < dt.Columns.Count; i++)
                                        {
                                            dr[i] = rows[i];
                                        }
                                        dt.Rows.Add(dr);
                                        if (flag == 1)
                                        {
                                            dbcontext.INSERTTBTransactions(Convert.ToString(dt.Rows[0]["Col1"]), Convert.ToString(dt.Rows[0]["Col2"]), Convert.ToString(dt.Rows[0]["Col3"]), Convert.ToString(dt.Rows[0]["Col4"]), Convert.ToString(dt.Rows[0]["Col5"]), Convert.ToString(dt.Rows[0]["Col6"]), Convert.ToString(dt.Rows[0]["Col7"]), Convert.ToString(dt.Rows[0]["Col8"]), Convert.ToString(dt.Rows[0]["Col9"]));
                                            dt.Rows.Clear();
                                            dbcontext.SaveChanges();
                                        }
                                        if (flag == 2)
                                        {
                                            dbcontext.FAMSNAVTransactions(Convert.ToString(dt.Rows[0]["Col1"]), Convert.ToString(dt.Rows[0]["Col2"]));
                                            dt.Rows.Clear();
                                            dbcontext.SaveChanges();
                                        }
                                        if (flag == 3)
                                        {
                                            dbcontext.FAMSHoldingTrans(Convert.ToString(dt.Rows[0]["Col1"]), Convert.ToString(dt.Rows[0]["Col2"]), Convert.ToString(dt.Rows[0]["Col3"]), Convert.ToString(dt.Rows[0]["Col4"]), Convert.ToString(dt.Rows[0]["Col5"]), Convert.ToString(dt.Rows[0]["Col6"]), Convert.ToString(dt.Rows[0]["Col7"]), Convert.ToString(dt.Rows[0]["Col8"]), Convert.ToString(dt.Rows[0]["Col9"]), Convert.ToString(dt.Rows[0]["Col10"]));
                                            dt.Rows.Clear();
                                            dbcontext.SaveChanges();
                                        }
                                        if (flag == 4)
                                        {
                                            dbcontext.FAMSTransTransactions(Convert.ToString(dt.Rows[0]["Col1"]), Convert.ToString(dt.Rows[0]["Col2"]), Convert.ToString(dt.Rows[0]["Col3"]), Convert.ToString(dt.Rows[0]["Col4"]), Convert.ToString(dt.Rows[0]["Col5"]), Convert.ToString(dt.Rows[0]["Col6"]), Convert.ToString(dt.Rows[0]["Col7"]), Convert.ToString(dt.Rows[0]["Col8"]), Convert.ToString(dt.Rows[0]["Col9"]), Convert.ToString(dt.Rows[0]["Col9"]));
                                            dt.Rows.Clear();
                                            dbcontext.SaveChanges();
                                        }
                                        if (flag == 5)
                                        {
                                            dbcontext.FAMSCashTransactions(Convert.ToString(dt.Rows[0]["Col1"]), Convert.ToString(dt.Rows[0]["Col2"]), Convert.ToString(dt.Rows[0]["Col3"]), Convert.ToString(dt.Rows[0]["Col4"]), Convert.ToString(dt.Rows[0]["Col5"]), Convert.ToString(dt.Rows[0]["Col6"]), Convert.ToString(dt.Rows[0]["Col7"]), Convert.ToString(dt.Rows[0]["Col8"]), Convert.ToString(dt.Rows[0]["Col9"]), Convert.ToString(dt.Rows[0]["Col10"]), Convert.ToString(dt.Rows[0]["Col11"]), Convert.ToString(dt.Rows[0]["Col12"]), Convert.ToString(dt.Rows[0]["Col13"]), Convert.ToString(dt.Rows[0]["Col14"]), Convert.ToString(dt.Rows[0]["Col15"]));
                                            dt.Rows.Clear();
                                            dbcontext.SaveChanges();
                                        }
                                    }

                                }
                                /////////////Move file from source to destination
                                string sourceFile = System.IO.Path.Combine(SourceDirectorypath, filename);
                                String Todaysdate = DateTime.Now.ToString("yyyy-MM-dd");
                                if (!Directory.Exists(DestinationDirectorypath + Todaysdate))
                                {
                                    var DIR = Directory.CreateDirectory(DestinationDirectorypath + Todaysdate);

                                }

                                string destFile = System.IO.Path.Combine(DestinationDirectorypath + Todaysdate, filename);
                                System.IO.File.Copy(sourceFile, destFile, true);
                                if (File.Exists(destFile))
                                {
                                    File.Delete(sourceFile);
                                }
                            }
                        }

                    }
                }
            }
            catch (Exception ex) { throw ex; }
        }
       
    }
}