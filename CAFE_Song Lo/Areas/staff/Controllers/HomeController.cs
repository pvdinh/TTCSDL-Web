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
            using (QuanLyCafeEntities dbb = new QuanLyCafeEntities())
            {
                if (Session["idbill"] != null)
                {
                    var x = dbb.billinfoes.ToList().Where(s => s.idbill == int.Parse(Session["idbill"].ToString())).FirstOrDefault();
                    if (id != null && x == null)
                    {
                        //nếu không tìm thấy billinfo của bill thì thông báo chưa chọn món.
                        //3 là trạng thái gửi sang page order 
                        return RedirectToAction("index", "order", new { id = id, status = 3 });
                    }
                }

            }
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
            data.top10sell = db.top10bestsell().ToList();
            data.allfoods = db.foods.ToList();
            return View(data);
        }
        classdata cartfood = new classdata();
        public ActionResult bill(int? id, int? temp)
        {

            if (id != null && db.tablefoods.ToList().Where(s => s.id == id && string.Compare(s.status, "trống", true) == 0).FirstOrDefault() == null)
            {
                ViewBag.temp = temp;
                db.empty_table(id);
                var x = db.bills.ToList().Where(s => s.idtable == id && string.Compare(s.status, "0", true) == 0).FirstOrDefault();
                x.status = "1";
                x.idaccount = int.Parse(Session["idaccount"].ToString());
                x.datecheckout = DateTime.Now;
                //tính tổng tiền của bàn
                double tongtien = 0;
                using (QuanLyCafeEntities dbb = new QuanLyCafeEntities())
                {
                    cartfood.allbillinfos = dbb.billinfoes.ToList();
                    foreach (billinfo item in cartfood.allbillinfos)
                    {
                        if (item.idbill == int.Parse(Session["idbill"].ToString()))
                        {
                            var y = dbb.foods.ToList().Where(s => s.id == item.idfood).FirstOrDefault();
                            tongtien += (item.count * y.price);
                        }
                    }
                }
                x.Tongtien = tongtien;
                db.SaveChanges();
            }
            else if (id != null && db.tablefoods.ToList().Where(s => s.id == id && string.Compare(s.status, "trống", true) == 0).FirstOrDefault() != null)
            {
                ViewBag.temp = temp;
                db.empty_table(id);
                var x = db.bills.ToList().Where(s => s.idtable == id && string.Compare(s.status, "0", true) == 0).FirstOrDefault();
                x.status = "1";
                x.idaccount = int.Parse(Session["idaccount"].ToString());
                x.datecheckout = DateTime.Now;
                //tính tổng tiền của bàn
                double tongtien = 0;
                using (QuanLyCafeEntities dbb = new QuanLyCafeEntities())
                {
                    cartfood.allbillinfos = dbb.billinfoes.ToList();
                    foreach (billinfo item in cartfood.allbillinfos)
                    {
                        if (item.idbill == int.Parse(Session["idbill"].ToString()))
                        {
                            var y = dbb.foods.ToList().Where(s => s.id == item.idfood).FirstOrDefault();
                            tongtien += (item.count * y.price);
                        }
                    }
                }
                if(tongtien == 0)
                {
                    return RedirectToAction("index", "order", new { id = id });
                }
                else
                {
                    x.Tongtien = tongtien;
                    db.SaveChanges();
                }
            }
            //nếu thanh toán khi chưa chọn xác nhận

            using (QuanLyCafeEntities dbb = new QuanLyCafeEntities())
            {
                //List<bill> x = dbb.bills.SqlQuery("select * from bill where ");
                //dbb.delete_billinfo(x.id);
                data.alltablefoods = dbb.tablefoods.SqlQuery("select * from tablefood").ToList();
            }
            return View("index", data);
        }

    }
}