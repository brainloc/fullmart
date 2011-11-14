using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MNews.Models;
using MNews.Helpers;
namespace MNews.Controllers
{
    public class CollumnController : Controller, IDisposable
    {
        CollumnResponsitory collumnRes = new CollumnResponsitory();
        private static int defaultPageSize = 10;
      
        //
        // GET: /Slide/
        [Authorize(Roles = "Administrator")]
        public ActionResult Index(int? page)
        {
            try
            {
                var collumns = collumnRes.GetAll() as IQueryable<Collumn>;

                int pageIndex = page.HasValue ? page.Value - 1 : 0;
                return View(collumns.ToPagedList(pageIndex, defaultPageSize));
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
                Collumn collumn = collumnRes.GetById(id) as Collumn;
                if (collumn == null)
                    collumn = new Collumn();
                return View(collumn);
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
                Collumn collumn = new Collumn();
                ViewData["Titles"] = collumnRes.GetTittles();
                return View(collumn);
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
                Collumn collumn = new Collumn();
                UpdateModel(collumn);
                collumnRes.Insert(collumn);
                collumnRes.Save();
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
                Collumn collumn = collumnRes.GetById(id) as Collumn;
                ViewData["Titles"] = collumnRes.GetTittles();
                return View(collumn);
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
                Collumn collumn = collumnRes.GetById(id) as Collumn;
                UpdateModel(collumn);
                collumnRes.Update(collumn);
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
                Collumn collumn = collumnRes.GetById(id) as Collumn;
                collumnRes.Delete(collumn);
                collumnRes.Save();
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
            if (collumnRes != null)
                collumnRes.Dispose();
            base.Dispose(disposing);
        }
    }
}
