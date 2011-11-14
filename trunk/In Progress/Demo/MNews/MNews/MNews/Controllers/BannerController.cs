using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MNews.Models;
using MNews.Helpers;
namespace MNews.Controllers
{
    public class BannerController : Controller, IDisposable
    {
        BannerResponsitory bannerRes = new BannerResponsitory();
        private static int defaultPageSize = 10;
        //
        // GET: /Slide/
        [Authorize(Roles = "Administrator")]
        public ActionResult Index(int? page)
        {
            try
            {
                var banners = bannerRes.GetAll() as IQueryable<Banner>;

                int pageIndex = page.HasValue ? page.Value - 1 : 0;
                return View(banners.ToPagedList(pageIndex, defaultPageSize));
            }
            catch (Exception ex)
            {
                ViewData["Message"] = ex.Message;
                return View("/Shared/Error");
            }

        }

        //
        // GET: /Slide/Details/5
        [Authorize(Roles = "Administrator")]
        public ActionResult Details(int id)
        {
            try
            {
                Banner banner = bannerRes.GetById(id) as Banner;
                if (banner == null)
                    banner = new Banner();
                return View(banner);
            }
            catch (Exception ex)
            {
                ViewData["Message"] = ex.Message;
                return View("/Shared/Error");
            }
        }

        //
        // GET: /Slide/Create
        [Authorize(Roles = "Administrator")]
        public ActionResult Create()
        {
            try
            {
                Banner banner = new Banner();
                return View(banner);
            }
            catch (Exception ex)
            {
                ViewData["Message"] = ex.Message;
                return View("/Shared/Error");
            }
        }

        //
        // POST: /Slide/Create
        [HttpPost]
        public ActionResult Create(FormCollection collection)
        {
            try
            {
                Banner banner = new Banner();
                UpdateModel(banner);
                foreach (string item in Request.Form.AllKeys)
                {
                    if (item.Contains("bContent"))
                    {
                        banner.bContent = Request.Form.Get(item);
                    }
                }
                bannerRes.Insert(banner);
                bannerRes.Save();
                return RedirectToAction("Index");
            }
            catch (Exception ex)
            {
                ViewData["Message"] = ex.Message;
                return View("/Shared/Error");
            }
        }

        //
        // GET: /Slide/Edit/5
        [Authorize(Roles = "Administrator")]
        public ActionResult Edit(int id)
        {
            try
            {
                Banner banner = bannerRes.GetById(id) as Banner;
                return View(banner);
            }
            catch (Exception ex)
            {
                ViewData["Message"] = ex.Message;
                return View("/Shared/Error");
            }
        }

        //
        // POST: /Slide/Edit/5
        [Authorize(Roles = "Administrator")]
        [HttpPost]
        public ActionResult Edit(int id, FormCollection collection)
        {
            try
            {
                Banner banner = bannerRes.GetById(id) as Banner;
                UpdateModel(banner);
                foreach (string item in Request.Form.AllKeys)
                {
                    if (item.Contains("bContent"))
                    {
                        banner.bContent = Request.Form.Get(item);
                    }
                }
                bannerRes.Update(banner);
                return RedirectToAction("Index");
            }
            catch (Exception ex)
            {
                ViewData["Message"] = ex.Message;
                return View("/Shared/Error");
            }
        }

        //
        // GET: /Slide/Delete/5
        [Authorize(Roles = "Administrator")]
        public ActionResult Delete(int id)
        {
            try
            {
                Banner banner = bannerRes.GetById(id) as Banner;
                bannerRes.Delete(banner);
                bannerRes.Save();
                return RedirectToAction("Index");
            }
            catch (Exception ex)
            {
                ViewData["Message"] = ex.Message;
                return View("/Shared/Error");
            }
        }


        protected override void Dispose(bool disposing)
        {
            if (bannerRes != null)
                bannerRes.Dispose();
            base.Dispose(disposing);
        }
    }
}
