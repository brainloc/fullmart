using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using FullMart.Code.DAO;
using System.Text.RegularExpressions;
using System.Threading;
using System.Globalization;

namespace FullMart
{
    public partial class ListProducts : System.Web.UI.Page
    {
        protected string correctshortCT(object content, int length)
        {
            if (content != DBNull.Value)
            {
                string tmp1 = content.ToString();
                tmp1 = Regex.Replace(tmp1, @"<(.|\n)*?>", string.Empty);
                if (tmp1.Length > length)
                {
                    return tmp1.Substring(0, length) + "...";
                }
                else { return tmp1; }
            }
            return content.ToString();
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (this.Page.IsPostBack == false)
            {
                string catID = Request.QueryString["cat"];
                string subcatID = Request.QueryString["subcat"];

                DataTable products = new DataTable();

                if (String.IsNullOrEmpty(catID) == false)
                {
                    products = GetAllProductsOfCategory(Convert.ToInt32(catID));
                    if (products != null)
                    {
                        string catName = products.Rows.Count > 0 ? products.Rows[0]["CatName"].ToString() : string.Empty;
                        txtCatName.Text = catName;
                    }
                    else {
                        Response.Redirect("/Default.aspx", false);
                    }
                }
                else if (String.IsNullOrEmpty(subcatID) == false)
                {
                    products = GetAllProductsInSubCategory(Convert.ToInt32(subcatID));
                    if (products != null && products.Rows.Count > 0)
                    {
                        string catName = products.Rows[0]["CatName"].ToString();
                        string subcatName = products.Rows[0]["SubcatName"].ToString();

                        txtCatName.Text = catName;
                        txtSubcatName.Text = subcatName;
                    }
                    else {
                        Response.Redirect("/Default.aspx", false);
                    }
                }

                if (products != null)
                {
                    rpListProducts.DataSource = products;                    
                    rpListProducts.DataBind();
                }
            }
        }

        private DataTable GetAllProductsOfCategory(int catID)
        {
            DataTable products = new DataTable();
            products = ProductManagement.GetAllProductsOfCategory(catID);
            return products;
        }

        private DataTable GetAllProductsInSubCategory(int SubcatID)
        {
            DataTable products = new DataTable();
            products = ProductManagement.GetAllProductsInSubCat(SubcatID);
            return products;
        }

        protected override void InitializeCulture()
        {
            string ui = "en";
            if (Request.Cookies["lang"] != null)
            {
                ui = Request.Cookies["lang"].Value;
            }
            string culture = ui == "en" ? "en-us" : ui + "-" + "VN";
            Thread.CurrentThread.CurrentUICulture = new CultureInfo(ui);
            Thread.CurrentThread.CurrentCulture = new CultureInfo(culture);
            base.InitializeCulture();
        }

        protected override void OnPreInit(EventArgs e)
        {
            base.OnPreInit(e);
        }
    }
}