using BusinessLibrary;
using FAMS.Entity;
using FAMS.Models.CustomerClasses;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;

namespace FAMS.WebServices
{
    /// <summary>
    /// Summary description for Customer
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
     [System.Web.Script.Services.ScriptService]
    public class Customer : System.Web.Services.WebService
    {
        FAMSEntities context = new FAMSEntities();
        [WebMethod]
        public Dictionary<string, object> BindCustomerType()
        {
            try
            {

                var results = Common.Getdata(context.MultipleResults("[dbo].[FAMS_Customer]").With<BindCustomerType>().With<BindCustRep>()
                          .Execute("@QueryType", "BindUserType"));
                return results;

            }
            catch (Exception ex)
            {
                throw ex;
            }

        }
        [WebMethod]
        public Dictionary<string, object> BindState()
        {
            try
            {

                var results = Common.Getdata(context.MultipleResults("[dbo].[FAMS_Customer]").With<BindState>()
                          .Execute("@QueryType", "BindState"));
                return results;

            }
            catch (Exception ex)
            {
                throw ex;
            }

        }
        [WebMethod]
        public Dictionary<string, object> BindCity( string StateId)
        {
            try
            {

                var results = Common.Getdata(context.MultipleResults("[dbo].[FAMS_Customer]").With<BindCity>()
                          .Execute("@QueryType", "@StateId" , "BindCity", StateId));
                return results;

            }
            catch (Exception ex)
            {
                throw ex;
            }

        }
    }
}
