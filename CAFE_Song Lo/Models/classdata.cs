using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CAFE_Song_Lo.Models
{
    public class classdata
    {
        public List<tablefood> alltablefoods { get; set; }
        public List<staff> allstaffs { get; set; }
        public List<food> allfoods { get; set; }
        public List<bill> allbills { get; set; }
        public List<billinfo> allbillinfos { get; set; }

        public List<int?> top10sell { get; set; }

        public double? Tongtien { get; set; }
    }
}