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
        public static void CreateProduct(int subCatID, int posterID, int price, string content, string img)
        {
            Product p = new Product();
            p.SubCategoryID = subCatID;
            p.PosterID = posterID;
            p.Price = price;
            p.Content = content;
            p.Picture = img;
            p.Thumbnail = img + "_thumb.jpg";
            ProductManagement.CreateProduct(p);
        }
    }
}