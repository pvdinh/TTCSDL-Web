using CAFE_Song_Lo.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using PagedList;
using PagedList.Mvc;
using System.Globalization;

namespace CAFE_Song_Lo.Areas.admin.Controllers
{
    public class receiptController : Controller
    {
        // GET: admin/receipt
        QuanLyCafeEntities db = new QuanLyCafeEntities();
        classdata data = new classdata();
        List<get_receipt_Result> listreceipts = new List<get_receipt_Result>();
        public ActionResult index(int? page,string search,string type,string mindatee,string maxdatee)
        {
            /*==================== lưu vài seession để dùng tiếp =====================*/
            if(search == null)
            {
                Session["search"] = "";
            }
            else
            {
                Session["search"] = search;
            }
            Session["typesort"] = type;
            Session["min"] = mindatee;
            Session["max"] = maxdatee;
            /*=============================================================================*/

            listreceipts = db.get_receipt().ToList();
            if (search != null || string.Compare(search,"",true) ==0)
            {
                listreceipts = listreceipts.Where(s => s.name.ToLower().Contains(search.ToLower())).ToList();
            }
            if(type != null || string.Compare(type, "", true) == 0)
            {
                if(string.Compare(type,"tang",true) ==0)
                {
                    listreceipts = listreceipts.OrderBy(s => s.Tongtien).ToList();
                }else
                {
                    listreceipts = listreceipts.OrderByDescending(s => s.Tongtien).ToList();
                }
            }
            if(mindatee != null && maxdatee !=null && string.Compare(mindatee,"",true) != 0 && string.Compare(maxdatee, "", true) != 0)
            {
                mindatee = mindatee.Replace("-","/");
                maxdatee = maxdatee.Replace("-", "/");
                mindatee = DateTime.ParseExact(mindatee, "dd/MM/yyyy", CultureInfo.InvariantCulture).ToString("MM/dd/yyyy", CultureInfo.InvariantCulture);
                DateTime mindate = DateTime.ParseExact(mindatee, "MM/dd/yyyy", null);
                maxdatee = DateTime.ParseExact(maxdatee, "dd/MM/yyyy", CultureInfo.InvariantCulture).ToString("MM/dd/yyyy", CultureInfo.InvariantCulture);
                DateTime maxdate = DateTime.ParseExact(maxdatee, "MM/dd/yyyy", null);
                listreceipts = listreceipts.Where(s => s.datecheckout >= mindate && s.datecheckout <= maxdate).ToList();
            }
            double? tongtien = 0;
            foreach (var item in listreceipts)
            {
                tongtien += item.Tongtien;
            }
            ViewBag.count = listreceipts.Count();
            ViewBag.Tongtien = tongtien;
            return View(listreceipts.ToPagedList(page ?? 1,10));
        }
        public JsonResult listname(string term)
        {
            var dt = db.staffs.Where(s => s.name.Contains(term)).Take(8).Select(s => s.name).ToList();
            return Json(dt,JsonRequestBehavior.AllowGet);
        }
    }
}