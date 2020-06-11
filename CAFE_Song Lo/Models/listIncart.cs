using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CAFE_Song_Lo.Models
{
    public class listIncart
    {

        private int id;
        private int idbill;
        private int count;

        public listIncart() { }
        public listIncart(int id, int idbill , int count) { this.id = id; this.idbill = idbill ; this.count = count; }
        public int ID { set { id = value; } get { return id; } }
        public int IDBILL { set { idbill = value; } get { return idbill; } }
        public int COUNT { set { count = value; } get { return count; } }

    }
}