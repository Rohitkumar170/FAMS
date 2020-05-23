using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FAMS.Reports
{
    public partial class holdingReport : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Convert.ToString(Session["AccountNo"]) == "Cust_000134")
            {
                divDropdown.Visible = true;
                CustAcc.Value = Session["AccountNo"].ToString();
            }
            else
            {
                divDropdown.Visible = false;
                CustAcc.Value = Session["AccountNo"].ToString();
            }
        }
    }
}