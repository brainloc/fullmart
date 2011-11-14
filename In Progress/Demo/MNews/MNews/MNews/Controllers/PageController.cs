using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

using MNews.Models;
using MNews.Helpers;

namespace Mpages.Controllers
{
    public class PageController : Controller
    {
        PageResponsitory pageRes = new PageResponsitory();

        private static int defaultPageSize = 10;

        public ActionResult Index(int id)
        {
            try
            {
                PageViewModel pageVM = new PageViewModel();
                pageVM.ListID = new List<int>();
                pageVM.ListTitle = new List<string>();
                
                var currentPage = pageRes.GetById(id) as Page;

                var pages = from p in pageRes.GetAll() as IQueryable<Page>
                            where p.pSpage == id
                            select p;

                pageVM.ListID.Add(currentPage.pID);
                pageVM.ListTitle.Add(currentPage.pName);

                foreach (Page p in pages)
                {
                    pageVM.ListID.Add(p.pID);
                    pageVM.ListTitle.Add(p.pName);
                }
                
                pageVM.CurrentPage = currentPage;

                pageVM.ListBanner = pageRes.GetBanners(currentPage.pID).ToList();

                return View(pageVM);
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
                Page p = pageRes.GetById(id) as Page;
                if (p != null)
                {
                    return View(p);
                }
                return View("Manager");
            }
            catch (Exception ex)
            {
                ViewData["message"] = ex.Message;
                return View("/Shared/Error");
            }
        }

        [Authorize(Roles = "Administrator")]
        public ActionResult Manager(int? page)
        {
            try
            {
                var pages = pageRes.GetAll() as IQueryable<Page>;
                int pageIndex = page.HasValue ? page.Value - 1 : 0;
                return View(pages.ToPagedList(pageIndex, defaultPageSize));
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
                Page p = new Page();                
                return View(p);
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
                Page p = new Page();
                UpdateModel(p);
                foreach (string item in Request.Form.AllKeys)
                {
                    if (item.Contains("pContent"))
                    {
                        p.pContent = Request.Form.Get(item);
                        break;
                    }
                }               
                pageRes.Insert(p);
                pageRes.Save();
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
                Page p = pageRes.GetById(id) as Page;
                if (p != null)
                {                    
                    return View(p);
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
                Page p = pageRes.GetById(id) as Page;
                if (p != null)
                {
                    UpdateModel(p);
                    foreach (string item in Request.Form.AllKeys)
                    {
                        if (item.Contains("pContent"))
                        {
                            p.pContent = Request.Form.Get(item);
                            break;
                        }
                    }
                    pageRes.Save();
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
                Page p = pageRes.GetById(id) as Page;
                if (p != null)
                {
                    pageRes.Delete(p);
                    pageRes.Save();
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
            pageRes.Dispose();
        }

    }
}
