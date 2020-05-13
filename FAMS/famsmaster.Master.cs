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
        }
    }
}