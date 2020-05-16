using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.IO;
using System.Linq;
using System.Net.Mail;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using FAMS.Models.ReportsClasses;
using FAMS.Models.UserLogin;
using FAMS.Entity;
using BusinessLibrary;
using System.Reflection;

namespace FAMS
{
    public partial class forgetpassword : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
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
        protected void btnAgree_Click(object sender, EventArgs e)
        {
            if (txtRecoverEmail.Text != "")
            {
                FAMSEntities context = new FAMSEntities();
                List<UserDetailCode> dataList_value = new List<UserDetailCode>();
                List<UserDetails> dataList = new List<UserDetails>();
                DataTable dt_value;
                DataTable dt;
                try
                {
                    var results = context.MultipleResults("[dbo].[Sp_UserLogin]").With<UserDetailCode>().With<UserDetails>()
                            .Execute("@QueryType", "@EmailId", "ChkEmail", txtRecoverEmail.Text);
                    int i = 0;
                    foreach (var data in results)
                    {
                        i++;
                        if (i == 1)
                        {
                            dataList_value = data.Cast<UserDetailCode>().ToList();
                        }
                        else
                        {
                            dataList = data.Cast<UserDetails>().ToList();
                        }
                        
                    }
                    dt_value = ToDataTable(dataList_value);
                    dt = ToDataTable(dataList);
                }
                catch (Exception)
                {

                    throw;
                }


                //  DataSet ds = CommonManger.FillDatasetWithParam("Sp_UserLogin", "@QueryType", "@EmailId", "ChkEmail", txtRecoverEmail.Text);
                // if (ds.Tables[0].Rows.Count > 0 && ds.Tables[0] != null && Convert.ToInt32(ds.Tables[0].Rows[0]["value"]) == 1)
                if (dt_value.Rows.Count > 0 && dt_value != null && Convert.ToInt32(dt_value.Rows[0]["value"]) == 1)
                {
                    // if (ds.Tables[1].Rows.Count > 0 && ds.Tables[1] != null)
                    if (dt.Rows.Count > 0 && dt != null)
                    {
                        using (StringWriter sw = new StringWriter())
                        {
                            using (HtmlTextWriter hw = new HtmlTextWriter(sw))
                            {
                                StringBuilder sb = new StringBuilder();
                                string WebAppUrl = ConfigurationManager.AppSettings["WebAppUrl"].ToString();
                                string SMTPHost = ConfigurationManager.AppSettings["Amazon_SMTPHost"].ToString();
                                string UserId = ConfigurationManager.AppSettings["Amazon_UserId"].ToString();
                                string MailPassword = ConfigurationManager.AppSettings["Amazon_MailPassword"].ToString();
                                string SMTPPort = ConfigurationManager.AppSettings["Amazon_SMTPPort"].ToString();
                                string SMTPEnableSsl = ConfigurationManager.AppSettings["Amazon_SMTPEnableSsl"].ToString();
                                string FromMailId = ConfigurationManager.AppSettings["Amazon_FromMailId"].ToString();
                                string Teamtext = ConfigurationManager.AppSettings["Team"].ToString();

                                sb.Append("Dear " + dt.Rows[0]["UserName"].ToString() + ",<br> <br>");
                                sb.Append("Please click on the below button to set a new Password . <br> <br>");

                                string User = DbSecurity.Encrypt(dt.Rows[0]["UserId"].ToString());
                                sb.Append("<a href='" + WebAppUrl + "changepassword.aspx?Id=" + User + "' target='_blank'>");
                                sb.Append("<input style='background-color: #3965a9;color: #fff;padding: 3px 10px 3px 10px;' type='button' value='Change Password' /></a> </div>");

                                SmtpClient smtpClient = new SmtpClient();
                                MailMessage mailmsg = new MailMessage();
                                MailAddress mailaddress = new MailAddress(FromMailId);
                                mailmsg.To.Add(txtRecoverEmail.Text);
                                mailmsg.From = mailaddress;

                                mailmsg.Subject = "Recover Password";
                                mailmsg.IsBodyHtml = true;
                                mailmsg.Body = sb.ToString();

                                smtpClient.Host = SMTPHost;
                                smtpClient.Port = Convert.ToInt32(SMTPPort);
                                smtpClient.EnableSsl = Convert.ToBoolean(SMTPEnableSsl);
                                smtpClient.UseDefaultCredentials = true;
                                smtpClient.Credentials = new System.Net.NetworkCredential(UserId, MailPassword);
                                smtpClient.Send(mailmsg);
                                //  CommonManger.FillDatasetWithParam("Sp_SendEmail", "@QueryType", "@MandateId", "@EmailCount", "@SmsCount", "SendMail", Convert.ToString(0), "1", "0");

                            }
                        }
                    }
                    txtRecoverEmail.Text = "";
                    ScriptManager.RegisterStartupScript(this, typeof(Page), "msg", "alert('Email is sent!!!')", true);

                }
                //    //else if (ds.Tables[0].Rows.Count > 0 && ds.Tables[0] != null && Convert.ToInt32(ds.Tables[0].Rows[0]["value"]) == 2)
                //    //{
                //    //    if (ds.Tables[1].Rows.Count > 0 && ds.Tables[1] != null)
                //    //    {
                //    //        using (StringWriter sw = new StringWriter())
                //    //        {
                //    //            using (HtmlTextWriter hw = new HtmlTextWriter(sw))
                //    //            {
                //    //                StringBuilder sb = new StringBuilder();
                //    //                string WebAppUrl = ConfigurationManager.AppSettings["WebAppUrl"].ToString();
                //    //                string SMTPHost = ConfigurationManager.AppSettings["Amazon_SMTPHost"].ToString();
                //    //                string UserId = ConfigurationManager.AppSettings["Amazon_UserId"].ToString();
                //    //                string MailPassword = ConfigurationManager.AppSettings["Amazon_MailPassword"].ToString();
                //    //                string SMTPPort = ConfigurationManager.AppSettings["Amazon_SMTPPort"].ToString();
                //    //                string SMTPEnableSsl = ConfigurationManager.AppSettings["Amazon_SMTPEnableSsl"].ToString();
                //    //                string FromMailId = ConfigurationManager.AppSettings["Amazon_FromMailId"].ToString();
                //    //                string Teamtext = ConfigurationManager.AppSettings["Team"].ToString();
                //    //                sb.Append("Dear Sir/Mam ,<br> <br>");
                //    //                sb.Append(" " + ds.Tables[1].Rows[0]["Name"].ToString() + " has requested to set a new password. Please click on the below button to set a new Password. <br> <br>");

                //    //                string User = DbSecurity.Encrypt(ds.Tables[1].Rows[0]["UserId"].ToString());
                //    //                sb.Append("<a href='" + WebAppUrl + "ChangePassword.aspx?Id=" + User + "' target='_blank'>");
                //    //                sb.Append("<input style='background-color: #3965a9;color: #fff;padding: 3px 10px 3px 10px;' type='button' value='Change Password' /></a> </div>");
                //    //                SmtpClient smtpClient = new SmtpClient();
                //    //                MailMessage mailmsg = new MailMessage();
                //    //                MailAddress mailaddress = new MailAddress(FromMailId);
                //    //                mailmsg.To.Add(ds.Tables[2].Rows[0]["EmailId"].ToString());
                //    //                mailmsg.From = mailaddress;
                //    //                mailmsg.Subject = "Recover Password";
                //    //                mailmsg.IsBodyHtml = true;
                //    //                mailmsg.Body = sb.ToString();
                //    //                smtpClient.Host = SMTPHost;
                //    //                smtpClient.Port = Convert.ToInt32(SMTPPort);
                //    //                smtpClient.EnableSsl = Convert.ToBoolean(SMTPEnableSsl);
                //    //                smtpClient.UseDefaultCredentials = true;
                //    //                smtpClient.Credentials = new System.Net.NetworkCredential(UserId, MailPassword);
                //    //                smtpClient.Send(mailmsg);
                //    //                CommonManger.FillDatasetWithParam("Sp_SendEmail", "@QueryType", "@MandateId", "@EmailCount", "@SmsCount", "SendMail", Convert.ToString(0), "1", "0");

                //    //            }
                //    //        }
                //    //    }
                //    //    txtEmail_Zipnach.Text = "";
                //    //    ScriptManager.RegisterStartupScript(this, typeof(Page), "msg", "alert('Email is sent to Admin !!')", true);
                //    //}
                //    else if (ds.Tables[0].Rows.Count > 0 && ds.Tables[0] != null && Convert.ToInt32(ds.Tables[0].Rows[0]["value"]) == -1)
                //    {
                //        txtRecoverEmail.Text = "";
                //        ScriptManager.RegisterStartupScript(this, typeof(Page), "msg", "alert('Not exist!!!')", true);
                //    }

                //}
                //else
                //{

                //}
            }
        //protected void btnAgree_Click(object sender, EventArgs e)
        //{
        //    FAMSEntities context = new FAMSEntities();

        //    if (txtEmail.Value != "")
        //    {
        //        var results = context.MultipleResults("[dbo].[Sp_DemoReport]").With<SummaryReportExcel>()
        //.Execute("@Querytype", "@CustomerAccount", "@Fromdate", "@Todate", "GetSummaryReportDataExcel", Session["UserName"].ToString(), fromdate, todate);
        //        DataSet ds = CommonManger.FillDatasetWithParam("Sp_UserLogin", "@QueryType", "@EmailId", "ChkEmail", txtEmail.Value);
        //        if (ds.Tables[0].Rows.Count > 0 && ds.Tables[0] != null && Convert.ToInt32(ds.Tables[0].Rows[0]["value"]) == 1)
        //        {
        //            if (ds.Tables[1].Rows.Count > 0 && ds.Tables[1] != null)
        //            {
        //                using (StringWriter sw = new StringWriter())
        //                {
        //                    using (HtmlTextWriter hw = new HtmlTextWriter(sw))
        //                    {
        //                        StringBuilder sb = new StringBuilder();
        //                        string WebAppUrl = ConfigurationManager.AppSettings["WebAppUrl"].ToString();
        //                        string SMTPHost = ConfigurationManager.AppSettings["Amazon_SMTPHost"].ToString();
        //                        string UserId = ConfigurationManager.AppSettings["Amazon_UserId"].ToString();
        //                        string MailPassword = ConfigurationManager.AppSettings["Amazon_MailPassword"].ToString();
        //                        string SMTPPort = ConfigurationManager.AppSettings["Amazon_SMTPPort"].ToString();
        //                        string SMTPEnableSsl = ConfigurationManager.AppSettings["Amazon_SMTPEnableSsl"].ToString();
        //                        string FromMailId = ConfigurationManager.AppSettings["Amazon_FromMailId"].ToString();
        //                        string Teamtext = ConfigurationManager.AppSettings["Team"].ToString();

        //                        //string User = DbSecurity.Encrypt(ds.Tables[1].Rows[0]["UserId"].ToString());

        //                        //sb.Append("Dear " + ds.Tables[1].Rows[0]["UserName"].ToString() + ",<br> <br>");
        //                        //sb.Append("Please click on the below button to set a new Password . <br> <br>");
        //                        //sb.Append("<a href='" + WebAppUrl + "ChangePassword.aspx?Id=" + User + "' target='_blank'>");
        //                        //sb.Append("<input style='background-color: #3965a9;color: #fff;padding: 3px 10px 3px 10px;' type='button' value='Change Password' /></a> </div>");
        //                        string User = DbSecurity.Encrypt(ds.Tables[1].Rows[0]["UserId"].ToString());
        //                        sb.Append("Hi " + ds.Tables[1].Rows[0]["UserName"].ToString() + ",<br> <br>");
        //                        sb.Append("We have received a request to reset your password. In case you have not initiated such request, you should ignore this email.<br/>");
        //                        sb.Append("Reset your password by clicking on this link:");
        //                        sb.Append("<a href='" + WebAppUrl + "ChangePassword.aspx?Id=" + User + "' target='_blank'>" + WebAppUrl + "ChangePassword.aspx?Id=" + User + "/> <br/>");

        //                        sb.Append("Thanks<br/>");
        //                        sb.Append("Team " + Convert.ToString(ConfigurationManager.AppSettings["Team"]));
        //                        sb.Append("<br/>");
        //                        sb.Append("<i style='font-size:11px'>(Email Generated from Unattendable MailBox, Please Do Not reply.)</i>");

        //                        SmtpClient smtpClient = new SmtpClient();
        //                        MailMessage mailmsg = new MailMessage();
        //                        MailAddress mailaddress = new MailAddress(FromMailId);
        //                        mailmsg.To.Add(txtEmail.Value);
        //                        mailmsg.From = mailaddress;

        //                        mailmsg.Subject = "Reset your QuickCheck Password";
        //                        mailmsg.IsBodyHtml = true;
        //                        mailmsg.Body = sb.ToString();

        //                        smtpClient.Host = SMTPHost;
        //                        smtpClient.Port = Convert.ToInt32(SMTPPort);
        //                        smtpClient.EnableSsl = Convert.ToBoolean(SMTPEnableSsl);
        //                        smtpClient.UseDefaultCredentials = true;
        //                        smtpClient.Credentials = new System.Net.NetworkCredential(UserId, MailPassword);
        //                        smtpClient.Send(mailmsg);

        //                        CommonManger.FillDatasetWithParam("Sp_SendEmail", "@QueryType", "@MandateId", "@EmailCount", "@SmsCount", "SendMail", Convert.ToString(0), "1", "0");

        //                    }
        //                }
        //            }
        //            txtEmail.Value = "";
        //            ScriptManager.RegisterStartupScript(this, typeof(Page), "msg", "alert('Email is sent!!!')", true);

        //        }
        //        else if (ds.Tables[0].Rows.Count > 0 && ds.Tables[0] != null && Convert.ToInt32(ds.Tables[0].Rows[0]["value"]) == 2)
        //        {
        //            if (ds.Tables[1].Rows.Count > 0 && ds.Tables[1] != null)
        //            {
        //                using (StringWriter sw = new StringWriter())
        //                {
        //                    using (HtmlTextWriter hw = new HtmlTextWriter(sw))
        //                    {
        //                        StringBuilder sb = new StringBuilder();
        //                        string WebAppUrl = ConfigurationManager.AppSettings["WebAppUrl"].ToString();
        //                        string SMTPHost = ConfigurationManager.AppSettings["Amazon_SMTPHost"].ToString();
        //                        string UserId = ConfigurationManager.AppSettings["Amazon_UserId"].ToString();
        //                        string MailPassword = ConfigurationManager.AppSettings["Amazon_MailPassword"].ToString();
        //                        string SMTPPort = ConfigurationManager.AppSettings["Amazon_SMTPPort"].ToString();
        //                        string SMTPEnableSsl = ConfigurationManager.AppSettings["Amazon_SMTPEnableSsl"].ToString();
        //                        string FromMailId = ConfigurationManager.AppSettings["Amazon_FromMailId"].ToString();
        //                        string Teamtext = ConfigurationManager.AppSettings["Team"].ToString();

        //                        string User = DbSecurity.Encrypt(ds.Tables[1].Rows[0]["UserId"].ToString());
        //                        sb.Append("Hi " + ds.Tables[1].Rows[0]["UserName"].ToString() + ",<br> <br>");
        //                        sb.Append("We have received a request to reset your password. In case you have not initiated such request, you should ignore this email.<br/>");
        //                        sb.Append("Reset your password by clicking on this link:");
        //                        sb.Append("<a href='" + WebAppUrl + "ChangePassword.aspx?Id=" + User + "' target='_blank'>" + WebAppUrl + "ChangePassword.aspx?Id=" + User + "/> <br/>");

        //                        sb.Append("Thanks<br/>");
        //                        sb.Append("Team " + Convert.ToString(ConfigurationManager.AppSettings["Team"]));
        //                        sb.Append("<br/>");
        //                        sb.Append("<i style='font-size:11px'>(Email Generated from Unattendable MailBox, Please Do Not reply.)</i>");

        //                        SmtpClient smtpClient = new SmtpClient();
        //                        MailMessage mailmsg = new MailMessage();
        //                        MailAddress mailaddress = new MailAddress(FromMailId);
        //                        mailmsg.To.Add(ds.Tables[2].Rows[0]["EmailId"].ToString());
        //                        mailmsg.From = mailaddress;
        //                        mailmsg.Subject = "Reset your QuickCheck Password";
        //                        mailmsg.IsBodyHtml = true;
        //                        mailmsg.Body = sb.ToString();
        //                        smtpClient.Host = SMTPHost;
        //                        smtpClient.Port = Convert.ToInt32(SMTPPort);
        //                        smtpClient.EnableSsl = Convert.ToBoolean(SMTPEnableSsl);
        //                        smtpClient.UseDefaultCredentials = true;
        //                        smtpClient.Credentials = new System.Net.NetworkCredential(UserId, MailPassword);
        //                        smtpClient.Send(mailmsg);
        //                        CommonManger.FillDatasetWithParam("Sp_SendEmail", "@QueryType", "@MandateId", "@EmailCount", "@SmsCount", "SendMail", Convert.ToString(0), "1", "0");

        //                    }
        //                }
        //            }
        //            txtEmail.Value = "";
        //            ScriptManager.RegisterStartupScript(this, typeof(Page), "msg", "alert('Email is sent to Admin !!')", true);
        //        }
        //        else if (ds.Tables[0].Rows.Count > 0 && ds.Tables[0] != null && Convert.ToInt32(ds.Tables[0].Rows[0]["value"]) == -1)
        //        {
        //            txtEmail.Value = "";
        //            ScriptManager.RegisterStartupScript(this, typeof(Page), "msg", "alert('Not exist!!!')", true);
        //        }

        //    }
        //    else
        //    {

        //    }
        }
    }
}