using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.IO;
using System.Xml;
using System.Xml.Linq;

namespace MNews.Models
{
    /// <summary>
    /// Interface giao tiep co so du lieu
    /// </summary>
    public interface IResponsitory : IDisposable
    {
        /// <summary>
        /// Ham mo ket noi den server
        /// </summary>
        /// <returns></returns>
        bool Open();

        /// <summary>
        /// Ham mo ket noi den server chi dinh
        /// </summary>
        /// <param name="connectionString"></param>
        /// <returns></returns>
        bool Open(string connectionString);

        /// <summary>
        /// Ham lay het tat ca object
        /// </summary>
        /// <returns></returns>
        IQueryable<object> GetAll();

        /// <summary>
        /// Ham lay theo id
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        object GetById(object id);

        /// <summary>
        /// Ham Insert entity vao csdl
        /// </summary>
        /// <param name="entity"></param>
        /// <returns></returns>
        bool Insert(object entity);

        /// <summary>
        /// Ham update entity vao csdl
        /// </summary>
        /// <param name="entity"></param>
        /// <returns></returns>
        bool Update(object entity);

        /// <summary>
        /// Ham delete entity ra khoi csdl
        /// </summary>
        /// <param name="entity"></param>
        /// <returns></returns>
        bool Delete(object entity);

        /// <summary>
        /// Ham save lai
        /// </summary>
        /// <returns></returns>
        bool Save();

    }

    /// <summary>
    /// 
    /// </summary>
    public class HomeResponsitory : IResponsitory
    {
        #region Properties

        DBMonDataContext db;

        #endregion

        public HomeResponsitory()
        {
            Open();
        }
        #region Methods

        public bool Open()
        {
            try
            {
                db = new DBMonDataContext();
                return true;
            }
            catch
            {
                return false;
            }
        }

        public bool Open(string connectionString)
        {
            try
            {
                db = new DBMonDataContext(connectionString);
                return true;
            }
            catch
            {
                return false;
            }
        }

        public IQueryable<object> GetAll()
        {
            return null;
        }

        public IQueryable<Banner> GetBanners()
        {
            return db.Banners.Where(b => b.bPage == 0).OrderByDescending(b => b.bID);
        }

        public IQueryable<Slide> GetSlides()
        {
            return db.Slides.OrderByDescending(s => s.slID);
        }

        public IQueryable<Slider> GetSliders()
        {
            return db.Sliders.OrderByDescending(s => s.sID);
        }

        public IQueryable<Collumn> GetColumns()
        {
            return db.Collumns.OrderBy(c => c.cCo).OrderBy(c => c.cindex);
        }

        public object GetById(object id)
        {
            return null;
        }

        public IQueryable<New> GetNews(int num)
        {
            return db.News.OrderByDescending(n => n.nDate).Take(num);
        }

        public IQueryable<Banner> GetBanners(int num)
        {
            return db.Banners.OrderByDescending(b => b.bID).Take(num);
        }

        public IQueryable<Slide> GetSlides(int num)
        {
            return db.Slides.OrderByDescending(s => s.slID).Take(num);
        }

        public IQueryable<Slider> GetSliders(int num)
        {
            return db.Sliders.OrderByDescending(s => s.sID).Take(num);
        }

        public IQueryable<Collumn> GetColumns(int num)
        {
            return db.Collumns.OrderBy(c => c.cCo).OrderBy(c => c.cindex).Take(num);
        }


        public bool Insert(object entity)
        {
            return true;
        }

        public bool Update(object entity)
        {
            return true;
        }

        public bool Delete(object entity)
        {
            return true;
        }

        public bool Save()
        {
            return true;
        }

        public void Dispose()
        {
            try
            {
                db.DatabaseExists();
                db.Dispose();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        #endregion
    }

    /// <summary>
    /// 
    /// </summary>
    public class NewResponsitory : IResponsitory
    {
        #region Properties

        DBMonDataContext db;

        #endregion

        public NewResponsitory()
        {
            Open();
        }

        #region Methods

        public bool Open()
        {
            try
            {
                db = new DBMonDataContext();
                return true;
            }
            catch
            {
                return false;
            }
        }

        public bool Open(string connectionString)
        {
            try
            {
                db = new DBMonDataContext(connectionString);
                return true;
            }
            catch
            {
                return false;
            }
        }

        public IQueryable<object> GetAll()
        {
            return db.News.OrderByDescending(n => n.nDate);
        }

        public object GetById(object id)
        {
            return db.News.SingleOrDefault(n => n.nID == (int)id);
        }

        public IQueryable<Banner> GetBanners()
        {
            return db.Banners.Where(b => b.bPage == -2).OrderByDescending(b => b.bID);
        }

        public IQueryable<object> Get(int num)
        {
            return db.News.OrderBy(n => n.nDate).Take(num);
        }

        public bool Insert(object entity)
        {
            try
            {
                db.News.InsertOnSubmit(entity as New);
                return true;
            }
            catch
            {
                return false;
            }
        }

        public bool Update(object entity)
        {
            try
            {
                db.SubmitChanges();
                return true;
            }
            catch
            {
                return false;
            }
        }

        public bool Delete(object entity)
        {
            try
            {
                db.News.DeleteOnSubmit(entity as New);
                return true;
            }
            catch
            {
                return false;
            }
        }

        public bool Save()
        {
            try
            {
                db.SubmitChanges();
                return true;
            }
            catch
            {
                return false;
            }
        }

        public void Dispose()
        {
            try
            {
                db.DatabaseExists();
                db.Dispose();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        #endregion
    }

    /// <summary>
    /// 
    /// </summary>
    public class ContactResponsitory : IResponsitory
    {
        #region Properties

        DBMonDataContext db;

        #endregion

        public ContactResponsitory()
        {
            Open();
        }

        #region Methods

        public bool Open()
        {
            try
            {
                db = new DBMonDataContext();
                return true;
            }
            catch
            {
                return false;
            }
        }

        public bool Open(string connectionString)
        {
            try
            {
                db = new DBMonDataContext(connectionString);
                return true;
            }
            catch
            {
                return false;
            }
        }

        public IQueryable<object> GetAll()
        {
            return db.Contacts;
        }

        public object GetById(object id)
        {
            return db.Contacts.SingleOrDefault(c => c.cID == (int)id);
        }

        public bool Insert(object entity)
        {
            try
            {
                db.Contacts.InsertOnSubmit(entity as Contact);
                return true;
            }
            catch
            {
                return false;
            }
        }

        public bool Update(object entity)
        {
            try
            {
                db.SubmitChanges();
                return true;
            }
            catch
            {
                return false;
            }
        }

        public bool Delete(object entity)
        {
            try
            {
                db.Contacts.DeleteOnSubmit(entity as Contact);
                return true;
            }
            catch
            {
                return false;
            }
        }

        public bool Save()
        {
            try
            {
                db.SubmitChanges();
                return true;
            }
            catch
            {
                return false;
            }
        }

        public void Dispose()
        {
            try
            {
                db.DatabaseExists();
                db.Dispose();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        #endregion
    }

    /// <summary>
    /// 
    /// </summary>
    public class PageResponsitory : IResponsitory
    {
        #region Properties

        DBMonDataContext db;

        #endregion

        public PageResponsitory()
        {
            Open();
        }

        #region Methods

        public bool Open()
        {
            try
            {
                db = new DBMonDataContext();
                return true;
            }
            catch
            {
                return false;
            }
        }

        public bool Open(string connectionString)
        {
            try
            {
                db = new DBMonDataContext(connectionString);
                return true;
            }
            catch
            {
                return false;
            }
        }

        public IQueryable<object> GetAll()
        {
            return db.Pages;
        }

        public IQueryable<Banner> GetBanners(int id)
        {
            return db.Banners.Where(b => b.bPage == id).OrderByDescending(b => b.bID);
        }

        public object GetById(object id)
        {
            return db.Pages.SingleOrDefault(p => p.pID == (int)id);
        }

        public bool Insert(object entity)
        {
            try
            {
                db.Pages.InsertOnSubmit(entity as Page);
                return true;
            }
            catch
            {
                return false;
            }
        }

        public bool Update(object entity)
        {
            try
            {
                db.SubmitChanges();
                return true;
            }
            catch
            {
                return false;
            }
        }

        public bool Delete(object entity)
        {
            try
            {
                db.Pages.DeleteOnSubmit(entity as Page);
                return true;
            }
            catch
            {
                return false;
            }
        }

        public bool Save()
        {
            try
            {
                db.SubmitChanges();
                return true;
            }
            catch
            {
                return false;
            }
        }

        public void Dispose()
        {
            try
            {
                db.DatabaseExists();
                db.Dispose();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        #endregion
    }

    /// <summary>
    /// 
    /// </summary>
    public class BannerResponsitory : IResponsitory
    {
        #region Properties

        DBMonDataContext db;

        #endregion

        public BannerResponsitory()
        {
            Open();
        }

        #region Methods

        public bool Open()
        {
            try
            {
                db = new DBMonDataContext();
                return true;
            }
            catch
            {
                return false;
            }
        }

        public bool Open(string connectionString)
        {
            try
            {
                db = new DBMonDataContext(connectionString);
                return true;
            }
            catch
            {
                return false;
            }
        }

        public IQueryable<object> GetAll()
        {
            return db.Banners;
        }

        public object GetById(object id)
        {
            return db.Banners.SingleOrDefault(p => p.bID == (int)id);
        }

        public bool Insert(object entity)
        {
            try
            {
                db.Banners.InsertOnSubmit(entity as Banner);
                return true;
            }
            catch
            {
                return false;
            }
        }

        public bool Update(object entity)
        {
            try
            {
                db.SubmitChanges();
                return true;
            }
            catch
            {
                return false;
            }
        }

        public bool Delete(object entity)
        {
            try
            {
                db.Banners.DeleteOnSubmit(entity as Banner);
                return true;
            }
            catch
            {
                return false;
            }
        }

        public bool Save()
        {
            try
            {
                db.SubmitChanges();
                return true;
            }
            catch
            {
                return false;
            }
        }

        public void Dispose()
        {
            try
            {
                db.DatabaseExists();
                db.Dispose();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        #endregion
    }

    /// <summary>
    /// 
    /// </summary>
    public class SliderResponsitory : IResponsitory
    {
        #region Properties

        DBMonDataContext db;

        #endregion

        public SliderResponsitory()
        {
            Open();
        }

        #region Methods

        public bool Open()
        {
            try
            {
                db = new DBMonDataContext();
                return true;
            }
            catch
            {
                return false;
            }
        }

        public bool Open(string connectionString)
        {
            try
            {
                db = new DBMonDataContext(connectionString);
                return true;
            }
            catch
            {
                return false;
            }
        }

        public IQueryable<object> GetAll()
        {
            return db.Sliders;
        }

        public object GetById(object id)
        {
            return db.Sliders.SingleOrDefault(p => p.sID == (int)id);
        }

        public bool Insert(object entity)
        {
            try
            {
                db.Sliders.InsertOnSubmit(entity as Slider);
                return true;
            }
            catch
            {
                return false;
            }
        }

        public bool Update(object entity)
        {
            try
            {
                db.SubmitChanges();
                return true;
            }
            catch
            {
                return false;
            }
        }

        public bool Delete(object entity)
        {
            try
            {
                db.Sliders.DeleteOnSubmit(entity as Slider);
                return true;
            }
            catch
            {
                return false;
            }
        }

        public bool Save()
        {
            try
            {
                db.SubmitChanges();
                return true;
            }
            catch
            {
                return false;
            }
        }

        public void Dispose()
        {
            try
            {
                db.DatabaseExists();
                db.Dispose();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        #endregion
    }

    /// <summary>
    /// 
    /// </summary>
    public class SlideResponsitory : IResponsitory
    {
        #region Properties

        DBMonDataContext db;

        #endregion

        public SlideResponsitory()
        {
            Open();
        }

        #region Methods

        public bool Open()
        {
            try
            {
                db = new DBMonDataContext();
                return true;
            }
            catch
            {
                return false;
            }
        }

        public bool Open(string connectionString)
        {
            try
            {
                db = new DBMonDataContext(connectionString);
                return true;
            }
            catch
            {
                return false;
            }
        }

        public IQueryable<object> GetAll()
        {
            return db.Slides;
        }

        public object GetById(object id)
        {
            return db.Slides.SingleOrDefault(p => p.slID == (int)id);
        }

        public bool Insert(object entity)
        {
            try
            {
                db.Slides.InsertOnSubmit(entity as Slide);
                return true;
            }
            catch
            {
                return false;
            }
        }

        public bool Update(object entity)
        {
            try
            {
                db.SubmitChanges();
                return true;
            }
            catch
            {
                return false;
            }
        }

        public bool Delete(object entity)
        {
            try
            {
                db.Slides.DeleteOnSubmit(entity as Slide);
                return true;
            }
            catch
            {
                return false;
            }
        }

        public bool Save()
        {
            try
            {
                db.SubmitChanges();
                return true;
            }
            catch
            {
                return false;
            }
        }

        public void Dispose()
        {
            try
            {
                db.DatabaseExists();
                db.Dispose();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        #endregion
    }

    /// <summary>
    /// 
    /// </summary>
    public class CollumnResponsitory : IResponsitory
    {
        #region Properties

        DBMonDataContext db;

        #endregion

        public CollumnResponsitory()
        {
            Open();
        }

        #region Methods

        public bool Open()
        {
            try
            {
                db = new DBMonDataContext();
                return true;
            }
            catch
            {
                return false;
            }
        }

        public bool Open(string connectionString)
        {
            try
            {
                db = new DBMonDataContext(connectionString);
                return true;
            }
            catch
            {
                return false;
            }
        }

        public IQueryable<object> GetAll()
        {
            return db.Collumns;
        }

        public object GetById(object id)
        {
            return db.Collumns.SingleOrDefault(c => c.cID == (int)id);
        }

        public List<string> GetTittles()
        {
            return db.Collumns.Select(c => c.cCo).Distinct().ToList();
        }

        public bool Insert(object entity)
        {
            try
            {
                db.Collumns.InsertOnSubmit(entity as Collumn);
                return true;
            }
            catch
            {
                return false;
            }
        }

        public bool Update(object entity)
        {
            try
            {
                db.SubmitChanges();
                return true;
            }
            catch
            {
                return false;
            }
        }

        public bool Delete(object entity)
        {
            try
            {
                db.Collumns.DeleteOnSubmit(entity as Collumn);
                return true;
            }
            catch
            {
                return false;
            }
        }

        public bool Save()
        {
            try
            {
                db.SubmitChanges();
                return true;
            }
            catch
            {
                return false;
            }
        }

        public void Dispose()
        {
            try
            {
                db.DatabaseExists();
                db.Dispose();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        #endregion
    }

    public class MenuResponsitory : IDisposable
    {
        //private string _xmlContent = "";
        private XDocument _xDoc;
        private XElement _xRoot;

        public MenuResponsitory()
        {
            Read();
        }

        public MenuNode GetByUrl(string url)
        {
            try
            {
                url = url.Trim();
                XElement child = (from e in _xRoot.Descendants()
                                  where e.Attribute("url") != null && 
                                  ( e.Attribute("url").Value.Contains(url) || url.Contains(e.Attribute("url").Value))
                                  select e).SingleOrDefault();
                if (child != null)
                {
                    MenuNode menuNode = new MenuNode();
                    menuNode.Url = child.Attribute("url").Value;
                    menuNode.Title = child.Attribute("title").Value;
                    return menuNode;
                }
                else
                    return null;
            }
            catch (Exception)
            {
                
                throw;
            }
        }

        public void Add(string url, string title)
        {
            try
            {
                XElement xElement = new XElement("siteMapNode");
                xElement.Add(new XAttribute("url", url));
                xElement.Add(new XAttribute("title", title));
                xElement.Add(new XAttribute("description", "top-menu"));

                _xRoot.Add(xElement);
            }
            catch (Exception)
            {
                throw;
            }

        }

        public void Remove(string url)
        {
            try
            {
                XElement child = (from e in _xRoot.Descendants()
                                  where e.Attribute("url") != null
                                  && (e.Attribute("url").Value.Contains(url) || url.Contains(e.Attribute("url").Value))
                                  select e).SingleOrDefault();
                child.Remove();
            }
            catch (Exception)
            {
                throw;
            }
        }

        public void Edit(string oldUrl, string url, string title)
        {
            try
            {
                XElement child = (from e in _xRoot.Descendants()
                                  where e.Attribute("url") != null
                                  && (e.Attribute("url").Value.Contains(oldUrl) || oldUrl.Contains(e.Attribute("url").Value))
                                  select e).SingleOrDefault();
                child.Attribute("url").Value = url;
                child.Attribute("title").Value = title;
            }
            catch (Exception)
            {
                throw;
            }
        }

        public void Save()
        {
            try
            {
                XmlWriter xw = XmlWriter.Create(AppDomain.CurrentDomain.BaseDirectory + "Web.sitemap");
                lock (xw)
                {
                    _xDoc.WriteTo(xw);
                    xw.Close();
                }


            }
            catch (Exception)
            {
                throw;
            }
        }

        public void Read()
        {
            try
            {
                _xDoc = new XDocument();
                using (StreamReader sr = new StreamReader(AppDomain.CurrentDomain.BaseDirectory + "Web.sitemap"))
                {
                    _xDoc = XDocument.Load(sr);
                }
                _xRoot = (from e in _xDoc.Descendants()
                          where e.Attribute("url") != null && e.Attribute("url").Value == "~/"
                          select e).SingleOrDefault();
            }
            catch (Exception)
            {
                throw;
            }
        }

        public void Dispose()
        {
            try
            {
                _xDoc = null;
                _xRoot = null;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}