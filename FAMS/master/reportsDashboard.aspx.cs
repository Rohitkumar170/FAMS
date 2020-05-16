using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using FAMS.Entity;
using FAMS.Models.LoginClasss;
using BusinessLibrary;

namespace FAMS.master
{
    public partial class mainDashboard : System.Web.UI.Page
    {
       
        protected void Page_Load(object sender, EventArgs e)
        {
            lblIsDefaultPswdChange.Text = Convert.ToString(Session["IsDefaultPswdChange"]); // Added by Bibhu on 16May2020
            if (Session["AccountNo"].ToString() == "Cust_000134")
            {
                anchorID.Attributes["href"] = "../Reports/PSMtrialBalanceReport.aspx";
            }
            else
            {
                anchorID.Attributes["href"] = "../Reports/trialBalanceReport.aspx";
            }


    //        FAMSEntities context = new FAMSEntities();
    //        var results = context.MultipleResults("[dbo].[FAMS_Login]").With<Logindetails>()
    //                       .Execute("@QueryType", "@Emailid", "UserAccess", Convert.ToString(Session["EmailId"]));
    //        foreach (List<Logindetails> cust in results)
    //        {
    //            if (cust.Count > 0)
    //            {
    //                ////Added by Bibhu on 15May2020 start
    //                if (cust.FirstOrDefault().IsDefaultPswdChange == false)
    //                {
    //                    //ScriptManager.RegisterStartupScript(this, typeof(Page), "msg", "$('#changepasswordpop').modal('show');", true);
    //                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none",
    //"<script>$('#changepasswordpop').modal('show');</script>", false);
    //                }
    //                ////Added by Bibhu on 15May2020 end
    //            }
    //        }
            }
    }
}