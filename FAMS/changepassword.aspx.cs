using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using FAMS.Entity;
using FAMS.Models.UserLogin;
using BusinessLibrary;
using System.Configuration;
using System.Data;
using System.Reflection;

namespace FAMS
{
    public partial class changepassword : System.Web.UI.Page
    {
        string Password = string.Empty;
        string PasswordKey = string.Empty;
        string ChangePassword = string.Empty;
        string changePasswordKey = string.Empty;
        string zipnachpassword = string.Empty;
        string zipnachconfirmpassword = string.Empty;
        string theme = ConfigurationManager.AppSettings["Theme"];
        FAMSEntities context = new FAMSEntities();
        List<DefaultPasswordChange> dataList_value = new List<DefaultPasswordChange>();
        DataTable dt_value;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                string UserId = DbSecurity.Decrypt(Request.QueryString["Id"]);
                ViewState["UserId"] = UserId;
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
        protected void btnChangePassword_Click(object sender, EventArgs e)
        {
           try
            {
                if (txtPassword.Text == txtConfirmPassword.Text)
                {
                    if (txtPassword.Text.Length >= 6)
                    {
                        ChangePassword = DbSecurity.Encrypt(txtPassword.Text, ref changePasswordKey);
                        //int Text = objManager.IntMethodWithParam("Sp_UserLogin", "@QueryType", "@ChangePassword", "@ChangePasswordKey",
                        //    "@UserId", "UpdatePassword", ChangePassword, changePasswordKey, ViewState["UserId"].ToString());
                        var results = context.MultipleResults("[dbo].[Sp_UserLogin]").With<DefaultPasswordChange>().Execute("@QueryType", "@ChangePassword", "@ChangePasswordKey",
                            "@UserId", "UpdatePassword", ChangePassword, changePasswordKey, ViewState["UserId"].ToString());
                        foreach (var data in results)
                        {
                            dataList_value = data.Cast<DefaultPasswordChange>().ToList();
                        }
                        dt_value = ToDataTable(dataList_value);
                        if (Convert.ToInt32(dt_value.Rows[0]["value"]) >= 0)
                        {

                            ScriptManager.RegisterStartupScript(this, typeof(Page), "msg", "alert('Password Updated Successfuly !!');window.location ='Login.aspx';", true);
                            //Response.Redirect("~/Login.aspx");
                            txtConfirmPassword.Text = "";
                            txtPassword.Text = "";
                        }
                        else
                        {
                            ScriptManager.RegisterStartupScript(this, typeof(Page), "msg", "alert('Password Updated Unsuccessfuly !!')", true);
                        }
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(this, typeof(Page), "msg", "alert('Minimum Length Of Password Is 6 !!')", true);
                        txtConfirmPassword.Text = "";
                        txtPassword.Text = "";
                        // popup1.Visible = true;
                    }
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, typeof(Page), "msg", "alert('New Password Does Not Match To Confirm Password !!')", true);
                    txtConfirmPassword.Text = "";
                    txtPassword.Text = "";
                    //  popup1.Visible = true;
                }

            }
            catch (Exception ex)
            {

                throw;
            }
        }
    }
}