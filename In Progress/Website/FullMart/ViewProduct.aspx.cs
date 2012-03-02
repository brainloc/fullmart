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
        public string tmprole = "";
        public bool tmpisAdmin = false;
        public int usID = 0;
        public string shopID = "-1";
        public string shopchecked = "Checking";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (this.Page.IsPostBack == false)
            {
                if (Page.User.Identity.IsAuthenticated)
                {
                    tmpisAdmin = UserManagement.isAdminbyNoM(Page.User.Identity.Name);
                    usID = int.Parse(UserManagement.GetUserRole(Page.User.Identity.Name).Rows[0][0].ToString());

                }

                string productID = Request.QueryString["ID"];
                if (string.IsNullOrEmpty(productID) == false)
                {
                    try
                    {
                        DataTable productDetail = GetProductDetailByID(Convert.ToInt32(productID));
                        if (productDetail != null && productDetail.Rows.Count > 0)
                        {
                            rpProductDetail.DataSource = productDetail;
                            shopID = productDetail.Rows[0]["ShopID"].ToString();
                            if (shopID != "-1")
                            {
                                if (bool.Parse(productDetail.Rows[0]["ShopActive"].ToString()))
                                {
                                    if (bool.Parse(productDetail.Rows[0]["ShopChecked"].ToString()))
                                    {
                                        shopchecked = "Checked";
                                    }
                                }
                                else
                                {
                                    shopchecked = "Closed";
                                }
                            }
                            else {
                                productDetail.Columns.Add("ShopAddress");
                                productDetail.Rows[0]["ShopAddress"] = "";
                                productDetail.Columns.Add("ShopYahoo");
                                productDetail.Rows[0]["ShopYahoo"] = "";
                                productDetail.Columns.Add("ShopCreatedDate");
                                productDetail.Rows[0]["ShopCreatedDate"] = "";
                                productDetail.Columns.Add("ShopPhone");
                                productDetail.Rows[0]["ShopPhone"] = "";
                                productDetail.Columns.Add("ShopName");
                                productDetail.Rows[0]["ShopName"] = "";
                                productDetail.Columns.Add("ShopActive");
                                productDetail.Rows[0]["ShopActive"] = "";
                                productDetail.Columns.Add("ShopChecked");
                                productDetail.Rows[0]["ShopChecked"] = "";
                                productDetail.Columns.Add("Shoprate");
                                productDetail.Rows[0]["Shoprate"] = "";
                            }
                            rpProductDetail.DataBind();
                            string subCatID = productDetail.Rows[0]["SubCategoryID"].ToString();
                            if (String.IsNullOrEmpty(subCatID) == false)
                            {
                                DataTable productsOfCat = GetAllProductsOfCategoryBySubCatID(Convert.ToInt32(subCatID));
                                ListView2.DataSource = productsOfCat;
                                ListView2.DataBind();
                                //if (productsOfCat != null && productsOfCat.Rows.Count > 0)
                                //{
                                //    ListView2.DataSource = productsOfCat;
                                //    ListView2.DataBind();
                                //}

                            }
                            int posterID = Convert.ToInt32(productDetail.Rows[0]["PosterID"].ToString());
                            DataTable productsByPoster = GetAllProductsOfPoster(posterID);
                            ListView3.DataSource = productsByPoster;
                            ListView3.DataBind();

                        }
                        else {
                            Response.Redirect("~/", false);
                        }
                    }
                    catch (Exception ex)
                    {
                    }
                }
                BindStates();
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

        protected void updatePostList_Load(object sender, EventArgs e)
        {
            if (this.Page.IsPostBack)
            {
                
                try
                {
                    List<string> eventArgs = ParseEventArgs(Request.Params.Get("__EVENTARGUMENT"));

                    if (eventArgs != null)
                    {
                        if (!Page.User.Identity.IsAuthenticated)
                        {
                            Response.Redirect("~/Login.aspx", false);
                        }
                        string command = eventArgs.First();

                        switch (command)
                        {
                            case "AddSubComment":
                                {
                                    int posterID = usID;
                                    int commentID = Convert.ToInt32(eventArgs.ElementAt(2));
                                    string content = eventArgs.Last();
                                    AddSubComment(posterID, commentID, content);
                                    break;
                                }
                            case "DeleteSubComment":
                                {
                                    int subCommentID = Convert.ToInt32(eventArgs.ElementAt(1));
                                    DeleteProductSubComment(subCommentID);
                                    break;
                                }
                            case "DeleteComment":
                                {
                                    int commentID = Convert.ToInt32(eventArgs.ElementAt(1));
                                    DeleteComment(commentID);
                                    break;
                                }
                        }

                        if (string.IsNullOrEmpty(command) == false)
                        {
                            updatePostList.DataBind();
                        }
                    }
                }
                catch (Exception ex)
                {
                }
            }
        }

        private List<string> ParseEventArgs(string eventArgs)
        {
            if (string.IsNullOrEmpty(eventArgs) == false)
            {
                List<string> eventArgsList = new List<string>();
                List<string> tmp = eventArgs.Split('$').ToList();

                string command = tmp.ElementAt(0);
                string posterID = tmp.ElementAt(1);

                string postID = string.Empty;
                if (tmp.Count > 2)
                {
                    postID = tmp.ElementAt(2);
                }
                string comment = string.Empty;
                if (tmp.Count > 3)
                {
                    comment = eventArgs.Substring(command.Length + posterID.Length + postID.Length + 3);
                }

                eventArgsList.Add(command);
                eventArgsList.Add(posterID);
                eventArgsList.Add(postID);
                eventArgsList.Add(comment);

                return eventArgsList;
            }

            return null;
        }

        protected void btnPost_Click(object sender, EventArgs e)
        {
            if (!Page.User.Identity.IsAuthenticated)
            {
                Response.Redirect("~/Login.aspx", false);
            }
            string content = txtPost.Text.Trim();
            txtPost.Text = "";
            int posterID = usID;
            string productID = Request.QueryString["ID"];
            if (string.IsNullOrEmpty(content) == false)
            {
                PostComment(posterID, Convert.ToInt32(productID), content);
                updatePostList.DataBind();
            }
        }

        private void PostComment(int posterID, int productID, string content)
        {
            ProductManagement.AddProductComment(posterID, productID, content);
        }

        private void AddSubComment(int posterID, int commentID, string content)
        {
            ProductManagement.AddProductSubComment(posterID, commentID, content);
        }

        private void DeleteProductSubComment(int subCommentID)
        {
            ProductManagement.DeleteProductSubComment(subCommentID);
        }

        private void DeleteComment(int commentID)
        {
            ProductManagement.DeleteComment(commentID);
        }

        protected void idTinhThanhFull_SelectedIndexChanged(object sender, EventArgs e)
        {
            string stateID = idTinhThanhFull.SelectedItem.Value;
            if (string.IsNullOrEmpty(stateID) == false)
            {
                DataTable zonesOfState = new DataTable();
                zonesOfState = BindingUltilities.GetZoneByStateID(Convert.ToInt32(stateID));

                if (zonesOfState != null)
                {
                    idQuanHuyen.DataSource = zonesOfState;
                    idQuanHuyen.DataTextField = "Name";
                    idQuanHuyen.DataValueField = "ID";
                    idQuanHuyen.DataBind();
                }
                else
                {
                    idQuanHuyen.Items.Clear();
                }
            }
            else
            {
                idQuanHuyen.Items.Clear();
            }
        }

        private void BindStates()
        {
            DataTable states = new DataTable();
            states = BindingUltilities.GetStates();
            if (states != null)
            {
                DataRow r = states.NewRow();
                r["ID"] = "-9999";
                r["StateName"] = "Please select a state...";
                states.Rows.InsertAt(r, 0);
                idTinhThanhFull.DataSource = states;
                idTinhThanhFull.DataTextField = "StateName";
                idTinhThanhFull.DataValueField = "id";
                idTinhThanhFull.DataBind();
                idTinhThanhFull.SelectedIndex = 0;
            }
        }

        protected void btnContiue_Click(object sender, EventArgs e)
        {
            string product = Request.QueryString["ID"];
            string buyer = Session["ID"].ToString();

            if (string.IsNullOrEmpty(product) == false && string.IsNullOrEmpty(buyer) == false)
            {
                try
                {
                    int productID = Convert.ToInt32(product);
                    int amount = Convert.ToInt32(txtAmount.Text.Trim());
                    int buyerID = Convert.ToInt32(buyer);

                    string moreDetail = txtNote.Text.Trim();
                    string recipientName = txtName.Text.Trim();
                    string recipientPhone = txtPhoneNumber.Text.Trim();
                    string recipientAddress = txtAddress.Text.Trim();
                    string recipientEmail = txtEmail.Text.Trim();

                    AddPurchaseBooking(productID, amount, buyerID, moreDetail, recipientName, recipientPhone, recipientAddress, recipientEmail);
                    UpdatePanel updateCart = (UpdatePanel)(Master.FindControl("updateCart"));
                    updateCart.DataBind();
                }
                catch (Exception ex)
                {
                }
            }
        }

        private void AddPurchaseBooking(int productID, int amount, int buyerID, string moreDetail, string recipientName, string recipientPhone, string recipientAddress, string recipientEmail)
        {
            ProductManagement.AddPurchaseBooking(productID, amount, buyerID, moreDetail, recipientName, recipientPhone, recipientAddress, recipientEmail);
        }
    }
}