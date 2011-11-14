using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MNews.Models;
using MNews.Helpers;
namespace MNews.Controllers
{
    public class SlideController : Controller, IDisposable
    {
        SlideResponsitory slideRes = new SlideResponsitory();
        private static int defaultPageSize = 10;
        //
        // GET: /Slide/
        [Authorize(Roles = "Administrator")]
        public ActionResult Index(int ?page)
        {
            try
            {
                var slides = slideRes.GetAll() as IQueryable<Slide>;

                int pageIndex = page.HasValue ? page.Value - 1 : 0;
                return View(slides.ToPagedList(pageIndex, defaultPageSize));              
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
                Slide slide = slideRes.GetById(id) as Slide;
                if (slide == null)
                    slide = new Slide();
                return View(slide);
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
                Slide slide = new Slide();
                return View(slide);
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
                Slide slide = new Slide();
                UpdateModel(slide);
                slideRes.Insert(slide);
                slideRes.Save();
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
                Slide slide = slideRes.GetById(id) as Slide;
                return View(slide);
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
                Slide slide = slideRes.GetById(id) as Slide;
                UpdateModel(slide);
                slideRes.Update(slide); 
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
                Slide slide = slideRes.GetById(id) as Slide;
                slideRes.Delete(slide);
                slideRes.Save();
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
            if (slideRes != null)
                slideRes.Dispose();
            base.Dispose(disposing);
        }
    }
}
