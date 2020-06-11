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
        public ActionResult edit(get_info_product_Result data)
        {
            db.update_product(data.id, data.name, data.price, data.idcategory, data.image);
            get_info_product_Result product = db.get_info_product(data.id).FirstOrDefault();
            return View("index", product);
        }
        public ActionResult delete(int? id)
        {
            db.delete_product(id);
            return RedirectToAction("product", "home", new { area = "staff" });
        }
        [HttpPost]
        public ActionResult add(get_info_product_Result data, HttpPostedFileBase file)
        {
            if (file != null)
            {
                if (data.idcategory == 1)
                {
                    //save image in folder
                    string physicaPath = Server.MapPath("/assets/image/icon/cà phê/" + file.FileName);
                    file.SaveAs(physicaPath);
                }
                else if (data.idcategory == 2)
                {
                    //save image in folder
                    string physicaPath = Server.MapPath("/assets/image/icon/TRÀ VÀ MACCHIATO/" + file.FileName);
                    file.SaveAs(physicaPath);
                }
                else if (data.idcategory == 3)
                {
                    //save image in folder
                    string physicaPath = Server.MapPath("/assets/image/icon/THỨC UỐNG ĐÁ XAY/" + file.FileName);
                    file.SaveAs(physicaPath);
                }
                else if (data.idcategory == 4)
                {
                    //save image in folder
                    string physicaPath = Server.MapPath("/assets/image/icon/THỨC UỐNG TRÁI CÂY/" + file.FileName);
                    file.SaveAs(physicaPath);
                }
                else if (data.idcategory == 5)
                {
                    //save image in folder
                    string physicaPath = Server.MapPath("/assets/image/icon/BÁNH VÀ SNACK/" + file.FileName);
                    file.SaveAs(physicaPath);
                }
                db.add_product(data.name, data.price, data.idcategory, file.FileName);
            }
            else
            {
                db.add_product(data.name, data.price, data.idcategory, "No picture");
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