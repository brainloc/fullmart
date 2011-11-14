using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

using MNews.Models;
using MNews.Helpers;
namespace MNews.Controllers
{
    public class ContactController : Controller
    {
        ContactResponsitory contactRes = new ContactResponsitory();
        private static int defaultPageSize = 10;
        //
        // GET: /Contact/
        [Authorize(Roles = "Administrator")] 
        public ActionResult Index(int? page)
        {
            try
            {
                var contacts = contactRes.GetAll() as IQueryable<Contact>;

                int pageIndex = page.HasValue ? page.Value - 1 : 0;
                return View(contacts.ToPagedList(pageIndex, defaultPageSize));
            }
            catch (Exception ex)
            {
                ViewData["message"] = ex.Message;
                return View("/Shared/Error");
            }
        }

        //
        // GET: /Contact/Details/5
        [Authorize(Roles = "Administrator")]
        public ActionResult Details(int id)
        {
            try
            {
                Contact c = contactRes.GetById((object)id) as Contact;
                if (c != null)
                {
                    return View(c);
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
                var contacts = contactRes.GetAll() as IQueryable<Contact>;

                int pageIndex = page.HasValue ? page.Value - 1 : 0;
                return View(contacts.ToPagedList(pageIndex, defaultPageSize));
            }
            catch (Exception ex)
            {
                ViewData["message"] = ex.Message;
                return View("/Shared/Error");
            }
        }

        [ValidateInput(false)]
        [Authorize(Roles = "Administrator")]
        public ActionResult Create()
        {
            try
            {
                Contact c = new Contact();
                return View(c);
            }
            catch
            {
                return View();
            }
        }

        //
        // POST: /Contact/Create

        [HttpPost]
        [Authorize(Roles = "Administrator")]
        public ActionResult Create(FormCollection collection)
        {
            try
            {
                Contact c = new Contact();
                UpdateModel(c);
                foreach (string item in Request.Form.AllKeys)
                {
                    if (item.Contains("cContent"))
                    {
                        c.cContent = Request.Form.Get(item);
                    }
                    if (item.Contains("cEmail"))
                    {
                        c.cEmail = Request.Form.Get(item);
                    }
                    if (item.Contains("cEmail"))
                    {
                        c.cEmail = Request.Form.Get(item);
                    }
                }
                contactRes.Insert(c);
                contactRes.Save();
                return RedirectToAction("index");
            }
            catch (Exception ex)
            {
                ViewData["message"] = ex.Message;
                return View("/Shared/Error");
            }
        }

        //
        // GET: /Contact/Edit/5
        [Authorize(Roles = "Administrator")]
        [ValidateInput(false)]
        public ActionResult Edit(int id)
        {
            return View();
        }

        //
        // POST: /Contact/Edit/5

        [HttpPost]
        [Authorize(Roles = "Administrator")]
        public ActionResult Edit(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add update logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        //
        // GET: /Contact/Delete/5
        [Authorize(Roles = "Administrator")]
        public ActionResult Delete(int id, int? page)
        {
            try
            {
                Contact c = contactRes.GetById(id) as Contact;
                if (c != null)
                {
                    contactRes.Delete(c);
                    contactRes.Save();
                }
                return RedirectToAction("Manager", new { page = page });
            }
            catch (Exception ex)
            {
                ViewData["message"] = ex.Message;
                return View("/Shared/Error");
            }
        }

        //
        // POST: /Contact/Delete/5

        

        protected override void Dispose(bool disposing)
        {
            base.Dispose(disposing);
            contactRes.Dispose();
        }
    }
}
