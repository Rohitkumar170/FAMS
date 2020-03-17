using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FAMS.Models.GETCOA
{
    public class GetReportData
    {
        public Int32 TBID { get; set; }
        public string AccontName { get; set; }
        public string AccontSubName { get; set; }
        public string AccontSubCat { get; set; }
        public string OpeningbalDR { get; set; }
        public string OpeningbalCR { get; set; }
        public string TransduringDR { get; set; }
        public string TransduringCR { get; set; }
        public string ClosingbalDR { get; set; }
        public string ClosingbalCR { get; set; }
    }
}