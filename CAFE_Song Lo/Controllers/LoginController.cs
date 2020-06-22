using CAFE_Song_Lo.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace CAFE_Song_Lo.Controllers
{
    public class LoginController : Controller
    {
        // GET: Login
        public ActionResult Index()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Result(account user)
        {
            using (QuanLyCafeEntities db = new QuanLyCafeEntities())
            {
                var search = db.accounts.ToList().Where(x => x.username == user.username && x.password == user.password).FirstOrDefault();
                if (search != null)
                {
                    Session["type"] = search.type;
                    Session["idaccount"] = search.id;
                    if (Session["type"].ToString() == "admin")
                    {
                        return RedirectToAction("home", "admin");
                    }
                    else
                    {
                        return RedirectToAction("home", "staff");
                    }
                }
                else
                {
                    //user.LoginErrorMessage = "Wrong username or password.";
                    TempData["LoginMessage"] = "Tài khoản hoặc mật khẩu không đúng";
                    return View("index", user);
                }
            }
        }

        public ActionResult logout()
        {
            Session.Abandon();
            return RedirectToAction("index", "Login");
        }

    }
}