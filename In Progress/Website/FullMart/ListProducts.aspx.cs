using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using FullMart.Code.DAO;

namespace FullMart
{
    public partial class ListProducts : System.Web.UI.Page
    {
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
                    string catName = products.Rows.Count > 0 ? products.Rows[0]["CatName"].ToString() : string.Empty;
                    txtCatName.Text = catName;
                }
                else if (String.IsNullOrEmpty(subcatID) == false)
                {
                    products = GetAllProductsInSubCategory(Convert.ToInt32(subcatID));
                    if(products.Rows.Count> 0)
                    {
                        string catName = products.Rows[0]["CatName"].ToString();
                        string subcatName = products.Rows[0]["SubcatName"].ToString();

                        txtCatName.Text = catName;
                        txtSubcatName.Text = subcatName;
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
    }
}