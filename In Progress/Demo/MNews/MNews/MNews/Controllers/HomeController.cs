using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MNews.Models;
using System.IO;
using MNews.Helpers;

namespace MNews.Controllers
{
    [HandleError]
    public class HomeController : Controller, IDisposable
    {
        string uploadPath = AppDomain.CurrentDomain.BaseDirectory + @"uploads\";
        HomeResponsitory homeRes = new HomeResponsitory();
        private static int defaultPageSize = 10;

        public ActionResult Index()
        {
            try
            {
                HomeViewModel homeVM = new HomeViewModel();
                int numofnew = MNews.Properties.Settings.Default.NumOfNewInHome;
                homeVM.Banners = homeRes.GetBanners().ToList();
                homeVM.News = homeRes.GetNews(numofnew).ToList();
                homeVM.Sliders = homeRes.GetSliders().ToList();
                homeVM.Slides = homeRes.GetSlides().ToList();
                homeVM.Collumns = homeRes.GetColumns().ToList();

                return View(homeVM);
            }
            catch (Exception ex)
            {
                ViewData["message"] = ex.Message;
                return View("~/Shared/Error");
            }
        }

        [Authorize(Roles = "Administrator")]
        public ActionResult ManagerHome()
        {

            return View();
        }

        [Authorize(Roles = "Administrator")]
        public ActionResult Contact(int? page)
        {
            try
            {
                ContactResponsitory contactRes = new ContactResponsitory();
                var contacts = contactRes.GetAll() as IQueryable<Contact>;
                int pageIndex = page.HasValue ? page.Value - 1 : 0;
                return View(contacts.ToPagedList(pageIndex, defaultPageSize));                
            }
            catch (Exception ex)
            {
                ViewData["message"] = ex.Message;
                return View("~/Shared/Error");
            }
        }

        [Authorize(Roles = "Administrator")]
        public ActionResult DeleteContact(int id, int? page)
        {
            try
            {
                ContactResponsitory contactRes = new ContactResponsitory();
                Contact c = contactRes.GetById(id) as Contact;
                if (c != null)
                {
                    contactRes.Delete(c);
                    contactRes.Save();
                }
                return RedirectToAction("Contact", new { page = page });
            }
            catch (Exception ex)
            {
                ViewData["message"] = ex.Message;
                return View("~/Shared/Error");
            }
        }
        
        [HttpPost]
        public ActionResult RegContact(FormCollection collection)
        {
            ContactResponsitory contactResx = new ContactResponsitory();
            try
            {
                Contact contact = new Contact();
                //contact.cEmail = collection["msemail"];
                //contact.cContent = collection["mscontent"];
                //contact.cTel = collection["mstel"];
                UpdateModel(contact);
                contactResx.Insert(contact);
                contactResx.Save();
                return RedirectToAction("Index");
            }
            catch (Exception ex)
            {
                ViewData["message"] = ex.Message;
                return View("~/Shared/Error");
            }
            finally
            {
                contactResx.Dispose();
            }
        }

        [Authorize(Roles = "Administrator")]
        public ActionResult ManagerUpload(int ?page)
        {
            try
            {
                List<UploadFile> lstUpload = new List<UploadFile>();
                var lstFile = Directory.GetFiles(uploadPath);

                for (int i = 0; i < lstFile.Length; i++)
                {
                    UploadFile uploadFile = new UploadFile();
                    uploadFile.FileName =  System.IO.Path.GetFileName(lstFile[i]);
                    uploadFile.Path = @"/uploads/" + System.IO.Path.GetFileName(lstFile[i]);
                    uploadFile.Type = System.IO.Path.GetExtension(lstFile[i]);
                    lstUpload.Add(uploadFile);
                }
                 int pageIndex = page.HasValue ? page.Value - 1 : 0;
                 return View(lstUpload.ToPagedList(pageIndex, defaultPageSize));
            }
            catch (Exception ex)
            {
                ViewData["message"] = ex.Message;
                return View("../Shared/Error");
            }
        }

        [HttpPost]
        [Authorize(Roles = "Administrator")]
        public ActionResult UploadImage()
        {
            try
            {
                foreach (string tagName in Request.Files)
                {
                    if (Request.Files[tagName] == null) continue;
                    HttpPostedFileBase file = Request.Files[tagName];
                    if (file.ContentLength > 0)
                    {
                        if (Path.GetExtension(file.FileName).Length > 0)
                        {
                            string name = Path.GetFileName(file.FileName);
                            file.SaveAs(uploadPath + name);
                        }
                    }
                }
                return RedirectToAction("ManagerUpload");
            }
            catch (Exception ex)
            {
                ViewData["Message"] = ex.Message;
            }
            finally
            {

            }
            return RedirectToAction("ManagerUpload");
        }

        [Authorize(Roles = "Administrator")]
        public ActionResult DeleteFile(string file)
        {
            try
            {
                file = uploadPath + file;
                if (System.IO.File.Exists(file))
                {
                    System.IO.File.Delete(file);
                }
                    
                return RedirectToAction("ManagerUpload");
            }
            catch (Exception ex)
            {
                ViewData["Message"] = ex.Message;
            }
            finally
            {

            }
            return RedirectToAction("ManagerUpload");
        }

        [Authorize(Roles = "Administrator")]
        public ActionResult ManagerMenu(bool? validate)
        {
            MenuResponsitory menuRes = null;
            try
            {
                if (validate.HasValue)
                {
                    ViewData["Validate"] = "Địa chỉ đã tồn tại.";
                }

                menuRes = new MenuResponsitory();

                MenuViewModel menuVM = new MenuViewModel();
                menuVM.Menus = new List<MenuNode>();
                var menuNodes = SiteMap.RootNode.ChildNodes;
                foreach (SiteMapNode menu in menuNodes)
                {
                    MenuNode menuNode = new MenuNode();
                    menuNode.Title = menu.Title;
                    menuNode.Url = menu.Url;
                    menuVM.Menus.Add(menuNode);
                }
                return View(menuVM);
            }
            catch (Exception ex)
            {
                ViewData["message"] = ex.Message;
                return View("~/Shared/Error");
            }
            finally
            {
                if (menuRes != null) 
                menuRes.Dispose();
            }
        }

        [Authorize(Roles = "Administrator")]
        public ActionResult CreateMenu()
        {
            try
            {
                MenuNode menuNode = new MenuNode();
                return View(menuNode);
            }
            catch (Exception ex)
            {
                ViewData["message"] = ex.Message;
                return View("~/Shared/Error");
            }
        }

        [Authorize(Roles = "Administrator")]
        [HttpPost]
        public ActionResult CreateMenu(FormCollection collection)
        {
            MenuResponsitory menuRes = null;
            try
            {
                menuRes = new MenuResponsitory();
                MenuNode menuNode;
                menuNode = menuRes.GetByUrl(collection["Url"]);
                if (menuNode == null)
                {
                    menuNode = new MenuNode();
                    UpdateModel(menuNode);
                    menuNode.Url = menuNode.Url.Trim();
                    menuRes.Add(menuNode.Url, menuNode.Title);
                    menuRes.Save();
                    return RedirectToAction("ManagerMenu");
                }
                else
                {
                    return RedirectToAction("ManagerMenu", new { validate = true}); 
                }
            }
            catch (Exception ex)
            {
                ViewData["message"] = ex.Message;
                return View("~/Shared/Error");
            }
            finally
            {
                if (menuRes != null)
                    menuRes.Dispose();
            }
        }

        [Authorize(Roles = "Administrator")]
        public ActionResult EditMenu(string url)
        {
            MenuResponsitory menuRes = null;
            try
            {                
                url = HttpUtility.UrlDecode(url);
                menuRes = new MenuResponsitory();
                MenuNode menuNode = menuRes.GetByUrl(url);
                return View(menuNode);
            }
            catch (Exception ex)
            {
                ViewData["message"] = ex.Message;
                return View("~/Shared/Error");
            }
            finally
            {
                if (menuRes != null)
                    menuRes.Dispose();
            }
        }

        [Authorize(Roles = "Administrator")]
        [HttpPost]
        public ActionResult EditMenu( FormCollection collection)
        {
            MenuResponsitory menuRes = null;
            try
            {
                menuRes = new MenuResponsitory();
                string url = Request.QueryString["url"];
                url = HttpUtility.UrlDecode(url);

                MenuNode menuNode = menuRes.GetByUrl(url);
                UpdateModel(menuNode);
                menuNode.Url = menuNode.Url.Trim();
                menuRes.Edit(url, menuNode.Url, menuNode.Title);
                menuRes.Save();
                //siteNode.Url = menuNode.Url;
                //siteNode.Title = menuNode.Title;
                
                return RedirectToAction("ManagerMenu");
            }
            catch (Exception ex)
            {
                ViewData["message"] = ex.Message;
                return View("~/Shared/Error");
            }
            finally
            {
                if (menuRes != null)
                    menuRes.Dispose();
            }
        }

        [Authorize(Roles = "Administrator")]
        public ActionResult DeleteMenu(string url)
        {
            MenuResponsitory menuRes = null;
            try
            {
                url = HttpUtility.UrlDecode(url);
                menuRes = new MenuResponsitory();
                menuRes.Remove(url);
                menuRes.Save();
                return RedirectToAction("ManagerMenu");
            }
            catch (Exception ex)
            {
                ViewData["message"] = ex.Message;
                return View("~/Shared/Error");
            }
            finally
            {
                if (menuRes != null)
                    menuRes.Dispose();
            }
        }

        [Authorize(Roles = "Administrator")]
        public bool CheckMenuExist(string url)
        {
            MenuResponsitory menuRes = null;
            try
            {
                menuRes = new MenuResponsitory();
                MenuNode menuNode;
                menuNode = menuRes.GetByUrl(url);
                if (menuNode == null)
                {
                    return false;
                }
                else
                    return true;
            }
            catch
            {
                return false;
            }
            finally
            {
                if (menuRes != null)
                    menuRes.Dispose();
            }
        }

        protected override void Dispose(bool disposing)
        {
            base.Dispose(disposing);
            homeRes.Dispose();
        }
    }
}
