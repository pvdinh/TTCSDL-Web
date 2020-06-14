using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using CAFE_Song_Lo.Models;

namespace CAFE_Song_Lo.Areas.admin.Controllers
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
            return RedirectToAction("product", "home", new { area = "admin" });
        }
        public ActionResult add(get_info_product_Result data)
        {
            db.add_product(data.name, data.price, data.idcategory, data.image);
            using (QuanLyCafeEntities dbb = new QuanLyCafeEntities())
            {
                var x = db.foods.OrderByDescending(s => s.id).Take(1).FirstOrDefault();
                get_info_product_Result product = db.get_info_product(x.id).FirstOrDefault();
                return View("index", product);
            }
        }
    }
}