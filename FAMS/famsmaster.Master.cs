using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FAMS
{
    public partial class famsmaster : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            SPUserName.InnerText = Session["UserName"].ToString();
            SPAccountNo.InnerText = Session["AccountNo"].ToString();
            string path = HttpContext.Current.Request.Url.AbsolutePath;
            if (path == "/master/reportsDashboard.aspx")
            {
                BtnHome.Visible = false;
            }
            else
            {
                BtnHome.Visible = true;
            }
            if (!Page.IsPostBack)
            {
                if (System.Web.HttpContext.Current.Session["UserId"] != null)
                {
                    lblUserid.Text = Convert.ToString(System.Web.HttpContext.Current.Session["UserId"]);

                }
            }
        }
    }
}