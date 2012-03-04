using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using FullMart.Code.Business;
using System.Data;
using FullMart.Code.DAO;
using System.Threading;
using System.Globalization;

namespace FullMart.Shop
{
    public partial class CreateProduct : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (this.Page.IsPostBack == false)
            {
                if (Page.User.Identity.IsAuthenticated)
                {
                    string ID = Request.QueryString["ID"];
                    if (string.IsNullOrEmpty(ID) != true)
                    {
                        try
                        {

                            DataTable newDetail = ProductManagement.GetProductDetailByID(Convert.ToInt32(ID));
                            if (newDetail != null && newDetail.Rows.Count > 0)
                            {   
                                dlState.DataSourceID = "dsState";
                                dlState.DataBind();
                                btnCreateProduct.Text = "SAVE";
                                txtTitle.Text = newDetail.Rows[0]["Title"].ToString();
                                txtPrice.Text = newDetail.Rows[0]["Price"].ToString();
                                string idSubcate = newDetail.Rows[0]["SubCategoryID"].ToString();
                                
                                dlState.SelectedValue = newDetail.Rows[0]["StateName"].ToString();
                                DataTable subcats1 = new DataTable();
                                subcats1 = BindingUltilities.GetNameCatSubCatByIDSub(int.Parse(idSubcate));
                                DataTable subcats = new DataTable();
                                subcats = BindingUltilities.GetListSubSameCat(int.Parse(idSubcate));

                                if (subcats != null)
                                {
                                    dlSubCategories.DataSource = subcats;
                                    dlSubCategories.DataTextField = "NAMESUB";
                                    dlSubCategories.DataValueField = "SUBID";
                                    dlSubCategories.DataBind();
                                    dlSubCategories.SelectedValue = idSubcate;
                                }
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
                                    dlCategories.SelectedValue = subcats1.Rows[0][0].ToString();
                                }
                                imgthumbN.ImageUrl = "/media/upload/" + newDetail.Rows[0][3].ToString();
                                CKENet.Text = newDetail.Rows[0]["Content"].ToString();
                            }
                        }
                        catch (Exception ex)
                        {
                        }
                    }
                    else
                    {
                        BindCategories();
                    }
                }
                else {
                    Response.Redirect("~/login.aspx?ReturnUrl=%2fShop%2fCreateProduct.aspx", false);
                }
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
            if (btnCreateProduct.Text == "SAVE")
            {
                string ID = Request.QueryString["ID"];
                if (string.IsNullOrEmpty(ID) != true)
                {
                    int state = int.Parse(dlState.SelectedValue);
                    string title = txtTitle.Text.Trim();
                    int subCatID = Convert.ToInt32(dlSubCategories.SelectedItem.Value);
                    int posterID = 1;
                    string price = txtPrice.Text.Replace(",","");
                    string content = HttpUtility.HtmlDecode(CKENet.Text);
                    string image1 = string.Empty;
                    string image2 = string.Empty;
                    string image3 = string.Empty;
                    if (txtimg1.Text.Trim() != "" && txtimg1.Text.Trim() != "Another product's image") {
                        image1 = txtimg1.Text;
                    }
                    if (txtimg2.Text.Trim() != "" && txtimg2.Text.Trim() != "Another product's image")
                    {
                        image2 = txtimg2.Text;
                    }
                    if (txtimg3.Text.Trim() != "" && txtimg3.Text.Trim() != "Another product's image")
                    {
                        image3 = txtimg3.Text;
                    }
                    string imgURL = string.Empty;
                    if (imgUploader.PostedFile.FileName != string.Empty)
                    {
                        imgURL = FilesUltilities.UploadImages(imgUploader.PostedFile.FileName, imgUploader, 70, 70, Request.PhysicalApplicationPath + "\\media\\upload\\");
                    }
                    else { 
                        imgURL = imgthumbN.ImageUrl;
                    }
                        
                        ProductBusiness.UpdateProduct(int.Parse(ID), title, subCatID, posterID, price, content, imgURL, state,image1,image2,image3);
                        txtmessage.Text = "Product Updated Successfull ! <a href='/Default.aspx'>Click here to go to homepage</a>";    
                        pnCreate.Visible = false;
                }
            }
            else {
                int state = 1;
                string title = txtTitle.Text.Trim();
                int subCatID = Convert.ToInt32(dlSubCategories.SelectedItem.Value);
                int posterID = 1;
                string price = txtPrice.Text.Replace(",", "");
                string content = HttpUtility.HtmlDecode(CKENet.Text);
                string image1 = string.Empty;
                string image2 = string.Empty;
                string image3 = string.Empty;
                if (txtimg1.Text.Trim() != "" && txtimg1.Text.Trim() != "Another product's image")
                {
                    image1 = txtimg1.Text;
                }
                if (txtimg2.Text.Trim() != "" && txtimg2.Text.Trim() != "Another product's image")
                {
                    image2 = txtimg2.Text;
                }
                if (txtimg3.Text.Trim() != "" && txtimg3.Text.Trim() != "Another product's image")
                {
                    image3 = txtimg3.Text;
                }
                if (imgUploader.PostedFile.FileName == string.Empty)
                {
                    txtmessage.Text = "Please select image product!";
                }
                else
                {
                    string imgURL = FilesUltilities.UploadImages(imgUploader.PostedFile.FileName, imgUploader, 70, 70, Request.PhysicalApplicationPath + "\\media\\upload\\");
                
                    //string imgURL = imageProduct.Text;
                    ProductBusiness.CreateProduct(title, subCatID, posterID, price, content, imgURL, state,image1,image2,image3);
                    txtmessage.Text = "Product Updated Successfull ! <a href='/Default.aspx'>Click here to go to homepage</a>";
                    pnCreate.Visible = false;
                }
            }
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