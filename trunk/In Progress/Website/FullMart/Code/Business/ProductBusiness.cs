﻿using System;
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
        public static void CreateProduct(string title, int subCatID, int posterID, int price, string content, string img, int state)
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
            ProductManagement.CreateProduct(p);
        }
    }
}