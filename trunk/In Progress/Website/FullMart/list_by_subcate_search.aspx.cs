using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using FullMart.Code.DAO;
using System.Threading;
using System.Globalization;
using System.Text.RegularExpressions;

namespace FullMart
{
    public partial class list_by_subcate_search : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (this.Page.IsPostBack == false)
            {
                string catID = Request.QueryString["cat"];
                string searchKey = Request.QueryString["title"];
                string subcatID = Request.QueryString["subcat"];
                DataTable products = new DataTable();
                
                if (String.IsNullOrEmpty(catID) == false && string.IsNullOrEmpty(searchKey)==false)
                {   txtKey.Text = searchKey;
                    products = SearchAllProductsOfCategory(Convert.ToInt32(catID), searchKey);
                    if (products != null && products.Rows.Count > 0)
                    {
                        string catName = products.Rows[0]["CatName"].ToString();
                        txtCatName.Text = catName;
                    }
                }
                else
                {
                    if (String.IsNullOrEmpty(catID) == false)
                    {
                        products = GetAllProductsOfCategory(Convert.ToInt32(catID));
                        if ( products!=null && products.Rows.Count > 0)
                        {
                            string catName = products.Rows[0]["CatName"].ToString();
                            txtCatName.Text = catName;
                            txtKey.Text = "";
                        }
                    }
                    else {
                        if (String.IsNullOrEmpty(subcatID)==false) {

                            products = GetAllProductsInSubCategory(Convert.ToInt32(subcatID));
                            if (products != null && products.Rows.Count > 0)
                            {
                                string catName = products.Rows[0]["CatName"].ToString();
                                txtCatName.Text = catName;
                                txtKey.Text = "";
                            }
                        }
                        else
                        {
                            products = SearchAllProductsByKey(searchKey);
                            txtKey.Text = searchKey;
                        }
                    }
                }

                if (products != null)
                {
                    rpListProducts.DataSource = products;
                    rpListProducts.DataBind();
                    txtNumRearch.Text = products.Rows.Count.ToString() + " Product(s)";
                }
                else {
                    txtNumRearch.Text = "0 Product";
                }
            }
        }

        private DataTable SearchAllProductsOfCategory(int catID, string title)
        {
            DataTable products = new DataTable();
            products = ProductManagement.SearchAllProductsOfCategory(catID, title);
            return products;
        }
        private DataTable GetAllProductsOfCategory(int catID)
        {
            DataTable products = new DataTable();
            products = ProductManagement.GetAllProductsOfCategory(catID);
            return products;
        }
        private DataTable SearchAllProductsByKey(string title)
        {
            DataTable products = new DataTable();
            products = ProductManagement.SearchAllProductsOfByKey(title);
            return products;
        }
        private DataTable GetAllProductsInSubCategory(int SubcatID)
        {
            DataTable products = new DataTable();
            products = ProductManagement.GetAllProductsInSubCat(SubcatID);
            return products;
        }
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

        protected override void InitializeCulture()
        {
            string ui = "en";
            if (Request.Cookies["lang"] != null)
            {
                ui = Request.Cookies["lang"].Value;
            }
            string culture = ui == "en" ? "en-us" : "vi-VN";
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