using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BusinessLibrary;
using FAMS.Models.GETCOA;
using FAMS.Entity;
namespace FAMS
{
    public partial class Test : System.Web.UI.Page
    {
        FAMSEntities dbcontext = new FAMSEntities();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindAccounts();
            }
        }
        private void BindAccounts()
        {
            
          
            ddlaccounts.DataSource=dbcontext.BINDACCOUNTS("0").ToList();
            ddlaccounts.Enabled = true;
            ddlaccounts.DataTextField = "Accountname"; ddlaccounts.DataValueField = "ACID";
            ddlaccounts.DataBind();
            ddlaccounts.Items.Insert(0, "Select");
            ddlaccountsublevel.Items.Clear();
            ddlsubcate.Items.Clear();
            ddlaccountsublevel.Items.Insert(0, "Select");
            ddlsubcate.Items.Insert(0, "Select");
        }
        protected void btnseach_Click(object sender, EventArgs e)
        {

        }

        protected void ddlaccounts_SelectedIndexChanged(object sender, EventArgs e)
        {
            ddlaccountsublevel.Items.Clear();
            ddlaccountsublevel.DataSource = dbcontext.BINDACCOUNTS(ddlaccounts.SelectedValue).ToList();
            ddlaccountsublevel.Enabled = true;
            ddlaccountsublevel.DataTextField = "Accountname"; ddlaccountsublevel.DataValueField = "ACID";
            ddlaccountsublevel.DataBind();
            ddlaccountsublevel.Items.Insert(0, "Select");
            ddlsubcate.Items.Clear();
            ddlsubcate.Items.Insert(0, "Select");
        }

        protected void ddlaccountsublevel_SelectedIndexChanged(object sender, EventArgs e)
        {
            ddlsubcate.Items.Clear();
            ddlsubcate.DataSource = dbcontext.BINDACCOUNTS(ddlaccountsublevel.SelectedValue).ToList();
            ddlsubcate.Enabled = true;
            ddlsubcate.DataTextField = "Accountname"; ddlsubcate.DataValueField = "ACID";
            ddlsubcate.DataBind();
            ddlsubcate.Items.Insert(0, "Select");
            
        }
    }
}