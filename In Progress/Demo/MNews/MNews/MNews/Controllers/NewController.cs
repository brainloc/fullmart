using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

using MNews.Models;
using MNews.Helpers;

namespace MNews.Controllers
{
    public class NewController : Controller, IDisposable
    {
        NewResponsitory newRes = new NewResponsitory();
        
        private static int defaultPageSize = 10;

        public ActionResult Index(int? page)
        {
            try
            {
                NewViewModel newVM = new NewViewModel();
                               
                var news = newRes.GetAll() as IQueryable<New>;
                int pageIndex = page.HasValue ? page.Value - 1 : 0;

                newVM.News = news.ToPagedList(pageIndex, defaultPageSize);
                newVM.Banners = newRes.GetBanners().ToList();

                return View(newVM);
            }
            catch (Exception ex)
            {
                ViewData["message"] = ex.Message;
                return View("/Shared/Error");
            }
        }

        public ActionResult Details(int id)
        {
            try
            {
                New n = newRes.GetById((object)id) as New;
                if (n != null)
                {
                    return View(n);
                }
                return View("Manager");
            }
            catch (Exception ex)
            {
                ViewData["message"] = ex.Message;
                return View("~/Shared/Error");
            }
        }

        [Authorize(Roles = "Administrator")]
        public ActionResult Manager(int? page)
        {
            try
            {
                var news = newRes.GetAll() as IQueryable<New>;

                int pageIndex = page.HasValue ? page.Value - 1 : 0;
                return View(news.ToPagedList(pageIndex, defaultPageSize));
            }
            catch (Exception ex)
            {
                ViewData["message"] = ex.Message;
                return View("/Shared/Error");
            }
        }

        [Authorize(Roles = "Administrator")]
        [ValidateInput(false)]
        public ActionResult Create(string id)
        {
            try
            {
                New n = new New();
                n.nDate = DateTime.Now;
                return View(n);
            }
            catch (Exception ex)
            {
                ViewData["message"] = ex.Message;
                return View("/Shared/Error");
            }
        }

        [HttpPost]
        [Authorize(Roles = "Administrator")]
        [ValidateInput(true)]
        public ActionResult Create(FormCollection collection)
        {
            try
            {
                New n = new New();
                UpdateModel(n);
                foreach (string item in Request.Form.AllKeys)
                {
                    if (item.Contains("ncontent"))
                    {
                        n.nContent = Request.Form.Get(item);
                    }
                    if (item.Contains("npreview"))
                    {
                        n.npreview = Request.Form.Get(item);
                    }
                }
                n.nDate = DateTime.Now;
                newRes.Insert(n);
                newRes.Save();
                return RedirectToAction("Manager");
            }
            catch (Exception ex)
            {
                ViewData["message"] = ex.Message;
                return View("/Shared/Error");
            }
        }

        [Authorize(Roles = "Administrator")]
        [ValidateInput(false)]
        public ActionResult Edit(int id)
        {
            try
            {
                New n = newRes.GetById(id) as New;
                if (n != null)
                {
                    n.nDate = DateTime.Now;
                    return View(n);
                }
                return View("Manager");
            }
            catch (Exception ex)
            {
                ViewData["message"] = ex.Message;
                return View("/Shared/Error");
            }
        }

        [HttpPost]
        [Authorize(Roles = "Administrator")]
        [ValidateInput(false)]
        public ActionResult Edit(int id, FormCollection collection)
        {
            try
            {
                New n = newRes.GetById(id) as New;
                if (n != null)
                {
                    UpdateModel(n);
                    foreach (string item in Request.Form.AllKeys)
                    {
                        if (item.Contains("ncontent"))
                        {
                            n.nContent = Request.Form.Get(item);
                        }
                        if (item.Contains("npreview"))
                        {
                            n.npreview = Request.Form.Get(item);
                        }
                    }
                    newRes.Save();
                }
                return RedirectToAction("Manager");
            }
            catch (Exception ex)
            {
                ViewData["message"] = ex.Message;
                return View("/Shared/Error");
            }
        }

        [Authorize(Roles = "Administrator")]
        public ActionResult Delete(int id, int? page)
        {
            try
            {
                New n = newRes.GetById(id) as New;
                if (n != null)
                {
                    newRes.Delete(n);
                    newRes.Save();
                }
                return RedirectToAction("Manager", new { page = page });
            }
            catch (Exception ex)
            {
                ViewData["message"] = ex.Message;
                return View("/Shared/Error");
            }
        }

        protected override void Dispose(bool disposing)
        {
            base.Dispose(disposing);
            newRes.Dispose();
        }
    }
}
