using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FAMS.master
{
    public partial class mainDashboard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["AccountNo"].ToString() == "Cust_000134")
            {
                anchorID.Attributes["href"] = "../Reports/PSMtrialBalanceReport.aspx";
            }
            else
            {
                anchorID.Attributes["href"] = "../Reports/trialBalanceReport.aspx";
            }
        }
    }
}