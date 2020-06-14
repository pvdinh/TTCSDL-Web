using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using CAFE_Song_Lo.Models;

namespace CAFE_Song_Lo.Areas.staff.Controllers
{
    public class productController : Controller
    {
        QuanLyCafeEntities db = new QuanLyCafeEntities();
        // GET: admin/product
        public ActionResult Index(int? id)
        {
            get_info_product_Result product = db.get_info_product(id).FirstOrDefault();
            List<category> listcategory = db.categories.ToList();
            ViewBag.list = listcategory;
            return View(product);
        }
        [HttpPost]
        public ActionResult edit(get_info_product_Result data, HttpPostedFileBase file)
        {
            if (file != null)
            {
                var x = db.categories.Where(s => s.id == data.idcategory).FirstOrDefault();
                string physicaPath = Server.MapPath("/assets/image/icon/" + x.name + "/" + file.FileName);
                file.SaveAs(physicaPath);
                db.update_product(data.id, data.name, data.price, data.idcategory, file.FileName);
            }
            else
            {
                db.update_product(data.id, data.name, data.price, data.idcategory, data.image);
            }
            get_info_product_Result product = db.get_info_product(data.id).FirstOrDefault();
            return RedirectToAction("index", "product", new { id = data.id });
        }
        public ActionResult delete(int? id)
        {
            db.delete_product(id);
            return RedirectToAction("product", "home", new { area = "staff" });
        }
        [HttpPost]
        public ActionResult add(get_info_product_Result data, HttpPostedFileBase file)
        {
            if (db.categories.Find(data.idcategory) != null)
            {
                if (file != null)
                {
                    var x = db.categories.Where(s => s.id == data.idcategory).FirstOrDefault();
                    string physicaPath = Server.MapPath("/assets/image/icon/" + x.name + "/" + file.FileName);
                    file.SaveAs(physicaPath);
                    db.add_product(data.name, data.price, data.idcategory, file.FileName);
                }
                else
                {
                    db.add_product(data.name, data.price, data.idcategory, "No picture");
                }
            }
            else
            {
                TempData["alert"] = "Thêm mới sản phẩm không thành công do hạng mục món ăn không tồn tại !!";
                TempData["AlertType"] = "alert-danger";
                return RedirectToAction("product", "home");
            }
            using (QuanLyCafeEntities dbb = new QuanLyCafeEntities())
            {
                var x = db.foods.OrderByDescending(s => s.id).Take(1).FirstOrDefault();
                get_info_product_Result product = db.get_info_product(x.id).FirstOrDefault();
                List<category> listcategory = db.categories.ToList();
                ViewBag.list = listcategory;
                return View("index", product);
            }
        }
    }
}