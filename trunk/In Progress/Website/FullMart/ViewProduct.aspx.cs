using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using FullMart.Code.DAO;
using System.Text.RegularExpressions;

namespace FullMart
{
    public partial class ViewProduct : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (this.Page.IsPostBack == false)
            {
                string productID = Request.QueryString["ID"];
                if (string.IsNullOrEmpty(productID) == false)
                {
                    try
                    {
                        DataTable productDetail = GetProductDetailByID(Convert.ToInt32(productID));
                        if (productDetail != null && productDetail.Rows.Count > 0)
                        {
                            rpProductDetail.DataSource = productDetail;
                            rpProductDetail.DataBind();
                            string subCatID = productDetail.Rows[0]["SubCategoryID"].ToString();
                            if (String.IsNullOrEmpty(subCatID) == false)
                            {
                                DataTable productsOfCat = GetAllProductsOfCategoryBySubCatID(Convert.ToInt32(subCatID));
                                if (productsOfCat != null && productsOfCat.Rows.Count > 0)
                                {
                                    rpProductsOfCurrentCategory.DataSource = productsOfCat;
                                    rpProductsOfCurrentCategory.DataBind();
                                }

                            }
                            int posterID = 1;
                            DataTable productsByPoster = GetAllProductsOfPoster(posterID);
                            if (productsByPoster != null && productsByPoster.Rows.Count > 0)
                            {
                                rpProductByPoster.DataSource = productsByPoster;
                                rpProductByPoster.DataBind();
                            }
                        }
                    }
                    catch (Exception ex)
                    {
                    }
                }                
            }
        }

        private DataTable GetProductDetailByID(int productID)
        {
            DataTable productDetail = new DataTable();
            productDetail = ProductManagement.GetProductDetailByID(productID);
            return productDetail;
        }

        private DataTable GetAllProductsOfCategoryBySubCatID(int subCatID)
        {
            DataTable productsOfCat = new DataTable();
            productsOfCat = ProductManagement.GetAllProductsOfCategoryBySubCatID(subCatID);
            return productsOfCat;
        }

        private DataTable GetAllProductsOfPoster(int posterID)
        {
            DataTable productsOfPoster = new DataTable();
            productsOfPoster = ProductManagement.GetAllProductsOfPoster(posterID);
            return productsOfPoster;
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

    }
}