using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using FullMart.Code.Entities;
using FullMart.Code.DAO;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;


namespace FullMart.Code.Business
{
    public class ProductBusiness
    {
        public static void CreateProduct(string title, int subCatID, int posterID, string price, string content, string img, int state, string img1, string img2, string img3)
        {
            Product p = new Product();
            p.Title = title;
            p.SubCategoryID = subCatID;
            p.PosterID = posterID;
            p.Price = price;
            p.Content = content;
            p.Picture = img;
            p.State = state;
            p.image3 = img3;
            p.image2 = img2;
            p.image1 = img1;
            p.Thumbnail = img.LastIndexOf(".jpg") != -1 ? img.Substring(0, img.LastIndexOf(".jpg")) + "_thumb.jpg" : img + "_thumb.jpg"; 
            ProductManagement.CreateProduct(p);
        }
        public static void UpdateProduct(int ID, string title, int subCatID, int posterID, string price, string content, string img, int state, string img1, string img2, string img3)
        {
            Product p = new Product();
            p.ID = ID;
            p.Title = title;
            p.SubCategoryID = subCatID;
            p.PosterID = posterID;
            p.Price = price;
            p.Content = content;
            p.Picture = img;
            p.State = state;
            p.image3 = img3;
            p.image2 = img2;
            p.image1 = img1;
            if (img != string.Empty)
            {
                p.Thumbnail = img.LastIndexOf(".jpg") != -1 ? img.Substring(0, img.LastIndexOf(".jpg")) + "_thumb.jpg" : img + "_thumb.jpg";
            }
            else { p.Thumbnail = ""; }
            ProductManagement.UpdateProduct(p);
        }
        public static void CreateMemsProduct(string title, int subCatID, int posterID, string price, string content, string img, int state, int type)
        {
            Product p = new Product();
            p.Title = title;
            p.SubCategoryID = subCatID;
            p.PosterID = posterID;
            p.Price = price;
            p.Content = content;
            p.Picture = img;
            p.State = state;
            p.Thumbnail = img.LastIndexOf(".jpg") != -1 ? img.Substring(0, img.LastIndexOf(".jpg")) + "_thumb.jpg" : img + "_thumb.jpg";
            MemsProduct.CreateMemsProduct(p,type);
        }
        public static void UpdateMemsProduct(int ID, string title, int subCatID, int posterID, string price, string content, string img, int state,int type)
        {
            Product p = new Product();
            p.ID = ID;
            p.Title = title;
            p.SubCategoryID = subCatID;
            p.PosterID = posterID;
            p.Price = price;
            p.Content = content;
            p.Picture = img;
            p.State = state;
            if (img != string.Empty)
            {
                p.Thumbnail = img.LastIndexOf(".jpg") != -1 ? img.Substring(0, img.LastIndexOf(".jpg")) + "_thumb.jpg" : img + "_thumb.jpg";
            }
            else { p.Thumbnail = ""; }
            MemsProduct.UpdateMemsProduct(p, type);
        }
    }
}