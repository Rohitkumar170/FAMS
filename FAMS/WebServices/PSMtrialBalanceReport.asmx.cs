using BusinessLibrary;
using FAMS.Entity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using FAMS.Models.PSMtrialBalanceReport;

namespace FAMS.WebServices
{
    /// <summary>
    /// Summary description for PSMtrialBalanceReport
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    [System.Web.Script.Services.ScriptService]
    public class PSMtrialBalanceReport : System.Web.Services.WebService
    {

        FAMSEntities context = new FAMSEntities();
        [WebMethod]
        public Dictionary<string, object> GetData(string fromdate, string Todate, string CustomerAccount, string Accounts, string AccountSubLayer)
        {
            try
            {
                var results = Common.Getdata(context.MultipleResults("[dbo].[Sp_TrialBalanceReport]").With<BindGridAllField>()
                          .Execute("@Querytype", "@CustomerAccount", "@Fromdate", "@Todate", "@Accounts", "@AccountSubLayer", "BindGride", CustomerAccount, fromdate, Todate, Accounts, AccountSubLayer));
                return results;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}
