using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MNews.Models;
using MNews.Helpers;
namespace MNews.Controllers
{
    public class SliderController : Controller, IDisposable
    {
        SliderResponsitory sliderRes = new SliderResponsitory();
        private static int defaultPageSize = 10;
        //
        // GET: /Slide/
        [Authorize(Roles = "Administrator")]
        public ActionResult Index(int? page)
        {
            try
            {
                var sliders = sliderRes.GetAll() as IQueryable<Slider>;

                int pageIndex = page.HasValue ? page.Value - 1 : 0;
                return View(sliders.ToPagedList(pageIndex, defaultPageSize));
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
                Slider slider = sliderRes.GetById(id) as Slider;
                if (slider == null)
                    slider = new Slider();
                return View(slider);
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
                Slider slider = new Slider();
                return View(slider);
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
                Slider slider = new Slider();
                UpdateModel(slider);
                foreach (string item in Request.Form.AllKeys)
                {
                    if (item.Contains("scontent"))
                    {
                        slider.scontent = Request.Form.Get(item);
                        break;
                    }
                }
                sliderRes.Insert(slider);
                sliderRes.Save();
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
                Slider slider = sliderRes.GetById(id) as Slider;
                return View(slider);
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
                Slider slider = sliderRes.GetById(id) as Slider;
                UpdateModel(slider);
                foreach (string item in Request.Form.AllKeys)
                {
                    if (item.Contains("scontent"))
                    {
                        slider.scontent = Request.Form.Get(item);
                        break;
                    }
                }
                sliderRes.Update(slider);
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
                Slider slider = sliderRes.GetById(id) as Slider;
                sliderRes.Delete(slider);
                sliderRes.Save();
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
            if (sliderRes != null)
                sliderRes.Dispose();
            base.Dispose(disposing);
        }
    }
}
