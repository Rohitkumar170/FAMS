using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FAMS.Models.ReportsClasses
{
    public class GetTransStatementReportData
    {
        public string TransDescription { get; set; }
        public string TransDate { get; set; }
        public string SettlementDate { get; set; }
        public string Security { get; set; }
        public string Exchange { get; set; }
        public decimal Quantity { get; set; }
        public decimal UnitPrice { get; set; }
        public decimal BrKg { get; set; }
        public decimal STT { get; set; }
        public decimal SettlementAmount { get; set; }

    }
}