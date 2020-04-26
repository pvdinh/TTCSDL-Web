using CAFE_Song_Lo.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace CAFE_Song_Lo.Areas.staff.Controllers
{
    public class HomeController : Controller
    {
        // GET: staff/Home
        QuanLyCafeEntities db = new QuanLyCafeEntities();
        classdata data = new classdata();
        public ActionResult Index(int? id, int? temp)
        {

            if (id != null)
            {
                ViewBag.temp = 0;
            }
            //nếu id != null tức là có bàn yêu cầu xác nhận đặt món
            if (id != null && db.tablefoods.ToList().Where(s => s.id == id && string.Compare(s.status, "trống", true) == 0).FirstOrDefault() != null)
            {
                ViewBag.temp = temp;
                db.customer_table(id);
            }
            using (QuanLyCafeEntities dbb = new QuanLyCafeEntities())
            {
                data.alltablefoods = dbb.tablefoods.SqlQuery("select * from tablefood").ToList();
            }
            return View(data);
        }
        public ActionResult product()
        {
            data.allfoods = db.foods.ToList();
            return View(data);
        }
        public ActionResult bill(int? id, int? temp, double? tongtien)
        {

            if (id != null && db.tablefoods.ToList().Where(s => s.id == id && string.Compare(s.status, "trống", true) == 0).FirstOrDefault() == null)
            {
                ViewBag.temp = temp;
                db.empty_table(id);
                var x = db.bills.ToList().Where(s => s.idtable == id && string.Compare(s.status, "0", true) == 0).FirstOrDefault();
                x.status = "1";
                x.idaccount = int.Parse(Session["idaccount"].ToString());
                x.datecheckout = DateTime.Now;
                x.Tongtien = tongtien;
                db.SaveChanges();
            }
            using (QuanLyCafeEntities dbb = new QuanLyCafeEntities())
            {
                data.alltablefoods = dbb.tablefoods.SqlQuery("select * from tablefood").ToList();
            }
            return View("index", data);
        }

    }
}