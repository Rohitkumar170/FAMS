using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FAMS.Models.ReportsClasses
{
    public class SummaryReports
    {
        public decimal OpeningMarketValue { get; set; }
        public decimal OpeningNAV { get; set; }
        public decimal OpeningOutstandingUnits { get; set; }
        public decimal CapitalInOut { get; set; }
        public decimal RealizedGain { get; set; }
        public decimal UnrealizedGain { get; set; }
        public decimal GainPrior { get; set; }
        public decimal Income { get; set; }
        public decimal Fees { get; set; }
        public decimal Expenses { get; set; }
        public decimal AccruedIncome { get; set; }
        public decimal ClosingMarketValue { get; set; }
        public decimal ClosingNAV { get; set; }
        public decimal ClosingOutstanding { get; set; }
        public string FromDate { get; set; }
        public string ToDate { get; set; }

    }
}