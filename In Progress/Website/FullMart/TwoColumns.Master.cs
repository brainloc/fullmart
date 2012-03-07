using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using FullMart.Code.DAO;
using System.Web.Security;

namespace FullMart
{
    public partial class TwoColumns : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ffooter.Text = OptionManagement.GetFooter("VI");
                if (Page.User.Identity.IsAuthenticated)
                {
                    if (Session["ID"] == null)
                    {
                        DataTable us = UserManagement.GetUserRole(Page.User.Identity.Name);
                        Session["ID"] = us.Rows[0]["ID"].ToString();
                        Session["roleID"] = Convert.ToInt32(us.Rows[0]["roleID"]);
                    }
                    loginPanel.Visible = false;
                    txtLoginName.Text = Page.User.Identity.Name;
                    if (Roles.IsUserInRole("1"))
                    {
                        hlAdmin.NavigateUrl = "/Administration/admin.aspx";
                        hlAdmin.Text = "Administrator"; hlAdmin.Visible = true;
                        updateCart.Visible = true;
                        updateListLetter.Visible = true;
                        updateUnreadMailCount.Visible = true;
                        updateUnsubmittedPurchaseCount.Visible = true;
                    }
                    else
                    {
                        if (Roles.IsUserInRole("2"))
                        {
                            hlAdmin.NavigateUrl = "/Shop/CreateProduct.aspx";
                            hlAdmin.Text = "ShopUser"; hlAdmin.Visible = true;
                            updateCart.Visible = true;
                            updateListLetter.Visible = true;
                            updateUnreadMailCount.Visible = true;
                            updateUnsubmittedPurchaseCount.Visible = true;
                        }
                        else
                        {
                            if (Roles.IsUserInRole("3"))
                            {
                                hlAdmin.NavigateUrl = "/ManageProducts.aspx";
                                hlAdmin.Text = "User"; hlAdmin.Visible = true;
                                updateCart.Visible = true;
                                updateUnreadMailCount.Visible = false;
                                updateUnsubmittedPurchaseCount.Visible = true;
                            }
                        }
                    }
                    pnloged.Visible = true;
                }
                else
                {
                    loginPanel.Visible = true;
                    pnloged.Visible = false;
                }
            }
        }

        protected void loginPanel_Authenticate(object sender, AuthenticateEventArgs e)
        {
            string us = loginPanel.UserName.Trim();
            string pw = FormsAuthentication.HashPasswordForStoringInConfigFile(loginPanel.Password, "SHA1");
            bool isUserValidated = ValidateUser(us, pw);
            e.Authenticated = isUserValidated;
        }

        private bool ValidateUser(string username, string password)
        {
            DataTable us = UserManagement.Login(password, username);
            if (us != null && us.Rows.Count > 0)
            {
                if (bool.Parse(us.Rows[0]["isActive"].ToString()) || bool.Parse(us.Rows[0]["isBanned"].ToString()))
                {
                    Response.Redirect("~/Denied.aspx", false);
                }
                Session["ID"] = us.Rows[0]["ID"].ToString();
                Session["roleID"] = Convert.ToInt32(us.Rows[0]["roleID"]);
                return true;
            }
            Response.Redirect("~/login.aspx", true);
            return false;
        }

        protected void btLogout_Click(object sender, EventArgs e)
        {
            FormsAuthentication.SignOut();
            Session.Abandon();
            Response.Redirect("~/", false);
        }
        protected void rpCart_ItemCommand(object sender, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "Remove")
            {
                ProductManagement.RemovePurchaseBooking(Convert.ToInt32(e.CommandArgument));
                updateCart.DataBind();
            }
        }

        protected void btnVerify_Click(object sender, EventArgs e)
        {
            string idCollection = "(";
            foreach (RepeaterItem i in rpCart.Items)
            {
                Button btnRemove = (Button)(i.Controls[1]);
                idCollection += btnRemove.CommandArgument + ",";
            }

            idCollection = idCollection.Substring(0, idCollection.Length - 1) + ")";

            ProductManagement.SubmitOrder(idCollection);
            updateListLetter.DataBind();
            updateCart.DataBind();
        }
        
        protected void LangEN_Click(object sender, EventArgs e)
        {
            Response.Redirect(Request.Url.AbsoluteUri);
        }

        protected void LangVI_Click(object sender, EventArgs e)
        {          
            Response.Redirect(Request.Url.AbsoluteUri);
        }

        protected void dsCart_Selected(object sender, SqlDataSourceStatusEventArgs e)
        {
            lblUnsubmittedPurchaseCount.Text = e.AffectedRows.ToString();
            updateUnsubmittedPurchaseCount.Update();

            DataView viewMail = (DataView)dsNewOrders.Select(DataSourceSelectArguments.Empty);
            int unreadMailCount = 0;
            foreach (DataRow r in viewMail.Table.Rows)
            {
                if (Convert.ToBoolean(r.ItemArray[7]) == false)
                {
                    unreadMailCount++;
                }
            }
            lblUnreadMailCount.Text = unreadMailCount.ToString();
            updateUnreadMailCount.Update();
        }

        protected void updateListLetter_Load(object sender, EventArgs e)
        {
            string eventArgs = Request.Params.Get("__EVENTARGUMENT");
            if (string.IsNullOrEmpty(eventArgs) == false && eventArgs.Contains("DelMail#"))
            {
                string orderInfoID = eventArgs.Substring(eventArgs.LastIndexOf('#') + 1);
                ProductManagement.RemoveOrderMailInfo(Convert.ToInt32(orderInfoID));
                updateListLetter.DataBind();
            }
        }
    }
}