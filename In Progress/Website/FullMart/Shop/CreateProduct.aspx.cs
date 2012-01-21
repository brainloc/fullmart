using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using FullMart.Code.Business;
using System.Data;
using FullMart.Code.DAO;

namespace FullMart.Shop
{
    public partial class CreateProduct : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (this.Page.IsPostBack == false)
            {
                BindCategories();
            }
        }

        private void BindCategories()
        {
            DataTable cats = new DataTable();
            cats = BindingUltilities.GetCategories();
            if (cats != null)
            {
                DataRow r = cats.NewRow();
                r["ID"] = "-9999";
                r["Name"] = "Please select a category...";
                cats.Rows.InsertAt(r, 0);
                dlCategories.DataSource = cats;
                dlCategories.DataTextField = "Name";
                dlCategories.DataValueField = "ID";
                dlCategories.DataBind();
                dlCategories.SelectedIndex = 0;
            }
        }

        protected void btnCreateProduct_Click(object sender, EventArgs e)
        {
            int state = 1;
            string title = txtTitle.Text.Trim();
            int subCatID = Convert.ToInt32(dlSubCategories.SelectedItem.Value);
            int posterID = 1;
            int price = Convert.ToInt32(txtPrice.Text);
            string content = HttpUtility.HtmlDecode(CKENet.Text);
            string imgURL = FilesUltilities.UploadImages(imgUploader.PostedFile.FileName, imgUploader, 70, 70, Request.PhysicalApplicationPath + "\\media\\upload\\");

            ProductBusiness.CreateProduct(title, subCatID, posterID, price, content, imgURL, state);
        }

        protected void dlCategories_SelectedIndexChanged(object sender, EventArgs e)
        {
            string catID = dlCategories.SelectedItem.Value;
            if (string.IsNullOrEmpty(catID) == false)
            {
                DataTable subCats = new DataTable();
                subCats = BindingUltilities.GetSubCategories(Convert.ToInt32(catID));

                if (subCats != null)
                {
                    dlSubCategories.DataSource = subCats;
                    dlSubCategories.DataTextField = "Name";
                    dlSubCategories.DataValueField = "ID";
                    dlSubCategories.DataBind();
                }
                else
                {
                    dlSubCategories.Items.Clear();
                }
            }
            else
            {
                dlSubCategories.Items.Clear();
            }
        }
    }
}