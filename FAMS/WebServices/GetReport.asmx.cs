using BusinessLibrary;
using FAMS.Entity;
using FAMS.Models.GETCOA;
using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.Services;

namespace FAMS.WebServices
{
    /// <summary>
    /// Summary description for GetReport
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
     [System.Web.Script.Services.ScriptService]
    public class GetReport : System.Web.Services.WebService
    {
        FAMSEntities context = new FAMSEntities();
        [WebMethod]
        public Dictionary<string, object> GetData(string fromdate,string Todate,string customerid,string Firstlevel,string Secondlevel,string Thirdlevel,string Firstlevelid,string Secondlevelid,string Thirdlevelid)
        {
            try
            {
                
                var results = Common.Getdata(context.MultipleResults("[dbo].[BINDREPORTS]").With<GetReportData>()
                          .Execute("@fromdate", "@Todate", "@customerid", "@Firstlevel", "@Secondlevel", "@Thirdlevel", "@Firstlevelid", "@Secondlevelid", "@Thirdlevelid", fromdate, Todate, customerid, Firstlevel, Secondlevel, Thirdlevel, Firstlevelid, Secondlevelid, Thirdlevelid));
                return results;

            }
            catch (Exception ex)
            {
                throw ex;
            }

        }
    }
}
