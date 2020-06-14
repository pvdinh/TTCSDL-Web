using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using PagedList;
namespace CAFE_Song_Lo.Models
{
    public class SupplierData
    {
        public List<nhacungcap> allnhacungcaps { get; set; }
        public List<string> listnamesanpham { get; set; }
        public List<string> listallmoneynhapsanphams { get; set; }
        public IPagedList<nhacungcap> nhapsanphamFromNCC { get; set; }
    }
}