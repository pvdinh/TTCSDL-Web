using CAFE_Song_Lo.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace CAFE_Song_Lo.Areas.admin.Controllers
{
    public class orderController : Controller
    {
        // GET: admin/order
        QuanLyCafeEntities db = new QuanLyCafeEntities();
        classdata data = new classdata();
        public ActionResult Index(int id)
        {
            //nhận được id bàn
            ViewBag.idtable = id;

            //tìm trong bill xem bàn đã có hoá đơn chưa theo id bàn và status của bill
            var x = db.bills.ToList().Where(s => s.idtable == id && string.Compare(s.status, "0", true) == 0).FirstOrDefault();
            if (x == null)
            {
                //nếu bàn chưa có bill thì tạo tạm thời 1 bill để lưu thông tin món ăn
                DateTime Timecheckin = DateTime.Now;
                DateTime? Timecheckout = null;
                db.add_bill(Timecheckin, Timecheckout, "0", int.Parse(Session["idaccount"].ToString()), id);
                var y = db.bills.ToList().Where(s => s.idtable == id & string.Compare(s.status, "0", true) == 0).FirstOrDefault();
                Session["idbill"] = y.id; //lấy giá trị idbill để dùng cho việc xem billinfo của 1 bàn nào đó
            }
            else
            {
                /*ngược lại nếu bàn đó trống mà trước đó ta có chọn món mà ko xác nhận thì ở bước này sẽ xoá billinfo của bàn đó.
                cái này cũng dùng cho trường hợp sau khi xác nhận thanh toán sẽ xoá hết thông tin billinfo của bàn đó */
                Session["idbill"] = x.id;
                var y = db.tablefoods.ToList().Where(s => s.id == id && string.Compare(s.status, "Trống", true) == 0).FirstOrDefault();
                if (y != null)
                {
                    db.delete_billinfo(x.id);
                    x.datecheckin = DateTime.Now;
                    db.SaveChanges();
                }

            }

            data.allfoods = db.foods.ToList();
            return View(data);
        }



        classdata cartfood = new classdata();

        [ChildActionOnly]
        //không được gọi thông qua URL
        public ActionResult cart()
        {
            using (QuanLyCafeEntities dbb = new QuanLyCafeEntities())
            {
                cartfood.allbillinfos = dbb.billinfoes.ToList();
                cartfood.allfoods = new List<food>();
                foreach (billinfo item in cartfood.allbillinfos)
                {
                    var x = dbb.foods.ToList().Where(s => s.id == item.idfood).FirstOrDefault();
                    cartfood.allfoods.Add(x);
                }
            }
            return PartialView("/Views/Shared/_cartproduct.cshtml", cartfood);
        }

        public ActionResult cartt(int id)
        {
            using (QuanLyCafeEntities dbb = new QuanLyCafeEntities())
            {
                //tìm món ăn và hoá đơn đã có trong billinfo chưa
                var x = dbb.billinfoes.ToList().Where(s => s.idfood == id && s.idbill == int.Parse(Session["idbill"].ToString())).FirstOrDefault();
                if (x == null)
                {
                    //nếu không tìm thấy thì ta tạo mới billinfo chứa món ăn và idbill của bàn ăn đó
                    dbb.add_billinfo(int.Parse(Session["idbill"].ToString()), id, 1);
                }
                else
                {
                    //nếu tìm thấy ta tăng số lượng món ăn lên 1
                    x.count++;
                    dbb.SaveChanges();
                }
            }
            return cart();
        }

        public ActionResult reduction(int id)
        {
            //nếu count =1 thì không làm gì, ngược lại thì giảm đi 1
            var y = db.billinfoes.ToList().Where(s => s.idfood == id && s.idbill == int.Parse(Session["idbill"].ToString())).FirstOrDefault();
            if (y.count == 1)
            {
                return RedirectToAction("index", "order");
            }
            else
            {
                using (QuanLyCafeEntities dbb = new QuanLyCafeEntities())
                {
                    var x = dbb.billinfoes.ToList().Where(s => s.idfood == id && s.idbill == int.Parse(Session["idbill"].ToString())).FirstOrDefault();
                    x.count = x.count - 1;
                    dbb.SaveChanges();
                }
            }
            return cart();
        }

        public ActionResult delproduct(int id)
        {
            //khởi tạo tạm thời 1 dbb
            using (QuanLyCafeEntities dbb = new QuanLyCafeEntities())
            {
                db.delete_billinfo_idfood(id, int.Parse(Session["idbill"].ToString()));
            }

            return cart();
        }
    }

}