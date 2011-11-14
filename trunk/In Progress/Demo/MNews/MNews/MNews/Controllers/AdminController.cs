using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

/*
 * khi vào trang quản lý thì có quản lý news
 * Vũ Nam Nguyễn: quản lý pages
 * Vũ Nam Nguyễn: quản lý slide
 * Vũ Nam Nguyễn: quản lý slider
 * Vũ Nam Nguyễn: quản lý column
 * Vũ Nam Nguyễn: quản lý banner
 */

namespace MNews.Controllers
{
    public class AdminController : Controller
    {

        [Authorize(Roles = "Administrator")]
        public ActionResult Index()
        {
            return View();
        }

    }
}
