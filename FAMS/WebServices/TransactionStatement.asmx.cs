using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using FAMS.Entity;
using BusinessLibrary;
using FAMS.Models.ReportsClasses;




namespace FAMS.WebServices
{
    /// <summary>
    /// Summary description for TransactionStatement
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    [System.Web.Script.Services.ScriptService]
    public class TransactionStatement : System.Web.Services.WebService
    {

        FAMSEntities context = new FAMSEntities();
        [WebMethod]
        public Dictionary<string, object> GetData(string fromdate, string Todate, string CustomerAccount)
        {
            try
            {

                var results = Common.Getdata(context.MultipleResults("[dbo].[Sp_DemoReport]").With<GetTransStatementReportData>()
                          .Execute("@Querytype", "@CustomerAccount", "@Fromdate", "@Todate", "GetTransStatementData", CustomerAccount, fromdate, Todate));
                return results;

            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}
