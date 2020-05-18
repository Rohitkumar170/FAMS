using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FAMS.Models.ReportsClasses
{
    public class BindGridAllField
    {
        public Decimal OBDebit { get; set; }
        public Decimal OBCredit { get; set; }
        public Decimal TransDebit { get; set; }
        public Decimal TransCredit { get; set; }
        public Decimal CBCredit { get; set; }
        public Decimal CBDebit { get; set; }
    }
}