using BusinessLibrary;
using FAMS.Entity;
using FAMS.Models.CustomerClasses;
using FAMS.Models;
using FAMS.Models.UserLogin;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Data;
using System.Reflection;
using System.Configuration;
using System.Net.Mail;
using System.IO;
using System.Web.UI;
using System.Text;

namespace FAMS.WebServices
{
    /// <summary>
    /// Summary description for Customer
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
     [System.Web.Script.Services.ScriptService]
    public class Customer : System.Web.Services.WebService
    {
        FAMSEntities context = new FAMSEntities();
        FAMSEntities context1 = new FAMSEntities();
        List<UserDetails> dataList_results_Password = new List<UserDetails>();
         List<DefaultPasswordChange> dataList_value = new List<DefaultPasswordChange>();

        List<DefaultPasswordChange> dataList_Save_value = new List<DefaultPasswordChange>();
        DataTable dt_value;
        DataTable dt_Save_value;

        // ---------------------------------------------Password Change--------------------------------------------------

        [WebMethod]
        public int ChangePassword(string OldPassword, string NewPassword, string ConfmPassword, string UserId)
        {
            int value = -1;
            string Password = string.Empty;
            string PasswordKey = string.Empty;
            string ChangePassword = string.Empty;
            string changePasswordKey = string.Empty;
            DataTable dt_results_Password;
            //CommonManger objManager = new CommonManger();
            var results_Password = context.MultipleResults("[dbo].[Sp_UserLogin]").With<UserDetails>().Execute("@QueryType", "@UserId", "FindPassword", UserId);

            foreach (var data in results_Password)
            {
                dataList_results_Password = data.Cast<UserDetails>().ToList();
            }
            dt_results_Password = ToDataTable(dataList_results_Password);
            //dt = objManager.FillDatatableWithParam("Sp_UserLogin", "@QueryType", "@UserId", "FindPassword", UserId);
            if (dt_results_Password != null && dt_results_Password.Rows.Count > 0)
            {
                Password = DbSecurity.Decrypt(dt_results_Password.Rows[0]["Password"].ToString(), dt_results_Password.Rows[0]["PasswordKey"].ToString());
                if (Password == OldPassword)
                {
                    ChangePassword = DbSecurity.Encrypt(NewPassword, ref changePasswordKey);
                    //dt = objManager.FillDatatableWithParam("Sp_UserLogin", "@QueryType", "@ChangePassword", "@ChangePasswordKey",
                    //    "@UserId", "UpdatePassword", ChangePassword, changePasswordKey, UserId);

                    var results = context1.MultipleResults("[dbo].[Sp_UserLogin]").With<DefaultPasswordChange>().Execute("@QueryType", "@ChangePassword", "@ChangePasswordKey",
                               "@UserId", "UpdatePassword", ChangePassword, changePasswordKey, UserId);
                    foreach (var data in results)
                    {
                        dataList_value = data.Cast<DefaultPasswordChange>().ToList();
                    }
                    dt_value = ToDataTable(dataList_value);

                    return Convert.ToInt32(dt_value.Rows[0]["value"]);
                }
            }
            return value;
        }


        [WebMethod]
        public int CreateUser(string UserName, string UserEmail, string UserAccount, string UserId)
        {
            try
            {
                string Password = string.Empty;
                string PasswordKey = string.Empty;
                //int value = CommonManger.IntMethodWithParam("Sp_BankBulkUpload", "@QueryType", "@MandateId", "@UserId", "CancelMandate", MandateId, DbSecurity.Decrypt(UserId));
                //return value;
                Password = DbSecurity.Encrypt(UserEmail.Split('@').ElementAtOrDefault(0), ref PasswordKey);
                var results_Password = context.MultipleResults("[dbo].[Sp_user]").With<DefaultPasswordChange>().Execute("@QueryType", "@UserName", "@EmailId", "@AccountNo", "@UserId", "@UserType", "@Password", "@PasswordKey", "SaveData", UserName,UserEmail,UserAccount, UserId,"1",Password,PasswordKey);

                foreach (var data in results_Password)
                {
                    dataList_Save_value = data.Cast<DefaultPasswordChange>().ToList();
                }
                dt_Save_value = ToDataTable(dataList_Save_value);

                if (Convert.ToInt32(dt_Save_value.Rows[0]["value"]) != -1)
                {
                    // For mail purpose start
                    using (StringWriter sw = new StringWriter())
                    {
                        using (HtmlTextWriter hw = new HtmlTextWriter(sw))
                        {
                            StringBuilder sb = new StringBuilder();
                            string WebAppUrl = ConfigurationManager.AppSettings["WebAppUrl"].ToString();
                            string SMTPHost = ConfigurationManager.AppSettings["Amazon_SMTPHost"].ToString();
                            string UserId_Mail = ConfigurationManager.AppSettings["Amazon_UserId"].ToString();
                            string MailPassword = ConfigurationManager.AppSettings["Amazon_MailPassword"].ToString();
                            string SMTPPort = ConfigurationManager.AppSettings["Amazon_SMTPPort"].ToString();
                            string SMTPEnableSsl = ConfigurationManager.AppSettings["Amazon_SMTPEnableSsl"].ToString();
                            string FromMailId = ConfigurationManager.AppSettings["Amazon_FromMailId"].ToString();
                            string Teamtext = ConfigurationManager.AppSettings["Team"].ToString();

                            sb.Append("Dear " + UserName + ",<br> <br>");
                            sb.Append("Please find your new Password is --   " + UserEmail.Split('@').ElementAtOrDefault(0) + " <br> <br>");

                            //  string User = DbSecurity.Encrypt(dt.Rows[0]["UserId"].ToString());
                            //sb.Append("<a href='" + WebAppUrl + "changepassword.aspx?Id=" + User + "' target='_blank'>");
                            //sb.Append("<input style='background-color: #3965a9;color: #fff;padding: 3px 10px 3px 10px;' type='button' value='Change Password' /></a> </div>");

                            SmtpClient smtpClient = new SmtpClient();
                            MailMessage mailmsg = new MailMessage();
                            MailAddress mailaddress = new MailAddress(FromMailId);
                            mailmsg.To.Add(UserEmail);
                            mailmsg.From = mailaddress;

                            mailmsg.Subject = "Recover Password";
                            mailmsg.IsBodyHtml = true;
                            mailmsg.Body = sb.ToString();

                            smtpClient.Host = SMTPHost;
                            smtpClient.Port = Convert.ToInt32(SMTPPort);
                            smtpClient.EnableSsl = Convert.ToBoolean(SMTPEnableSsl);
                            smtpClient.UseDefaultCredentials = true;
                            smtpClient.Credentials = new System.Net.NetworkCredential(UserId_Mail, MailPassword);
                           //smtpClient.Send(mailmsg);
                            //  CommonManger.FillDatasetWithParam("Sp_SendEmail", "@QueryType", "@MandateId", "@EmailCount", "@SmsCount", "SendMail", Convert.ToString(0), "1", "0");

                        }
                    }
                }
                 return Convert.ToInt32(dt_Save_value.Rows[0]["value"]); 
                
            }
            catch (Exception ex)
            {
                throw;
            }
        }
        //[WebMethod]
        //public int ChangePassword(string OldPassword, string NewPassword, string ConfmPassword, string UserId)
        //{
        //    int value = -1;
        //    string Password = string.Empty;
        //    string PasswordKey = string.Empty;
        //    string ChangePassword = string.Empty;
        //    string changePasswordKey = string.Empty;
        //    DataTable dt_results_Password;
        //    //CommonManger objManager = new CommonManger();
        //    var results_Password = context.MultipleResults("[dbo].[Sp_UserLogin]").With<UserDetails>().Execute("@QueryType", "@UserId", "FindPassword", UserId);

        //    foreach (var data in results_Password)
        //    {
        //        dataList_results_Password = data.Cast<UserDetails>().ToList();
        //    }
        //    dt_results_Password = ToDataTable(dataList_results_Password);
        //    //dt = objManager.FillDatatableWithParam("Sp_UserLogin", "@QueryType", "@UserId", "FindPassword", UserId);
        //    if (dt_results_Password != null && dt_results_Password.Rows.Count > 0)
        //    {
        //        Password = DbSecurity.Decrypt(dt_results_Password.Rows[0]["Password"].ToString(), dt_results_Password.Rows[0]["PasswordKey"].ToString());
        //        if (Password == OldPassword)
        //        {
        //            ChangePassword = DbSecurity.Encrypt(NewPassword, ref changePasswordKey);
        //            //dt = objManager.FillDatatableWithParam("Sp_UserLogin", "@QueryType", "@ChangePassword", "@ChangePasswordKey",
        //            //    "@UserId", "UpdatePassword", ChangePassword, changePasswordKey, UserId);

        //            var results = context.MultipleResults("[dbo].[Sp_UserLogin]").With<DefaultPasswordChange>().Execute("@QueryType", "@ChangePassword", "@ChangePasswordKey",
        //                       "@UserId", "UpdatePassword", ChangePassword, changePasswordKey, UserId);
        //            foreach (var data in results)
        //            {
        //                dataList_value = data.Cast<DefaultPasswordChange>().ToList();
        //            }
        //            dt_value = ToDataTable(dataList_value);

        //            //return Convert.ToInt32(dt.Rows[0]["IsDefaultPswdChange"]);
        //        }
        //    }
        //    return value;
        //}

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
        [WebMethod]
        public Dictionary<string, object> BindGrid()
        {
            var results = Common.Getdata(context.MultipleResults("[dbo].[Sp_user]").With<UserDetails>().Execute("@QueryType", "BindUser"));
            return results;
            //DataSet dt = CommonManger.FillDatasetWithParam("Sp_user", "@QueryType", "BindUser");
            //return ClsJson.JsonMethods.ToJson(dt);
        }

        [WebMethod]
        public Dictionary<string, object> BindCustomerType()
        {
            try
            {

                var results = Common.Getdata(context.MultipleResults("[dbo].[FAMS_Customer]").With<BindCustomerType>().With<BindCustRep>()
                          .Execute("@QueryType", "BindUserType"));
                return results;

            }
            catch (Exception ex)
            {
                throw ex;
            }

        }
        [WebMethod]
        public Dictionary<string, object> BindState()
        {
            try
            {

                var results = Common.Getdata(context.MultipleResults("[dbo].[FAMS_Customer]").With<BindState>()
                          .Execute("@QueryType", "BindState"));
                return results;

            }
            catch (Exception ex)
            {
                throw ex;
            }

        }
        [WebMethod]
        public Dictionary<string, object> BindCity( string StateId)
        {
            try
            {

                var results = Common.Getdata(context.MultipleResults("[dbo].[FAMS_Customer]").With<BindCity>()
                          .Execute("@QueryType", "@StateId" , "BindCity", StateId));
                return results;

            }
            catch (Exception ex)
            {
                throw ex;
            }

        }
        [WebMethod]
        public Dictionary<string, object> SaveEntity(string json)
        {
            try
            {

                var results = Common.Getdata(context.MultipleResults("[dbo].[FAMS_Customer]").With<CommonFlag>()
                          .Execute("@QueryType", "@Jsondata", "InsertBankCust", json));
                return results;

            }
            catch (Exception ex)
            {
                throw ex;
            }

        }
        [WebMethod]
        public Dictionary<string, object> BindBankCust()
        {
            try
            {

                var results = Common.Getdata(context.MultipleResults("[dbo].[FAMS_Customer]").With<Bindbankcust>()
                          .Execute("@QueryType", "BindBankcust"));
                return results;

            }
            catch (Exception ex)
            {
                throw ex;
            }

        }
        [WebMethod]
        public Dictionary<string, object> UpdateEntity(string json)
        {
            try
            {

                var results = Common.Getdata(context.MultipleResults("[dbo].[FAMS_Customer]").With<CommonFlag>()
                          .Execute("@QueryType", "@Jsondata", "UpdateBankCust", json));
                return results;

            }
            catch (Exception ex)
            {
                throw ex;
            }

        }
    }
}
