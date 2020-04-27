using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using PagedList;
namespace CAFE_Song_Lo.Models
{
    public class ReceiptData
    {
        public List<account> allaccounts { get; set; }
        public List<string> listnames { get; set; }
        public IPagedList<bill> allbills { get; set; }
    }
}