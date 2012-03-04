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
using System.Threading;
using System.Globalization;

namespace FullMart
{
    public partial class Admin : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Page.User.Identity.IsAuthenticated)
                {
                    loginPanel.Visible = false;
                    txtLoginName.Text = Page.User.Identity.Name;
                    if (Roles.IsUserInRole("1"))
                    {
                        hlAdmin.NavigateUrl = "/Administration/admin.aspx";
                        hlAdmin.Text = "Administrator"; hlAdmin.Visible = true;
                    }                    
                    pnloged.Visible = true;
                }
                else
                {
                    loginPanel.Visible = true;
                    pnloged.Visible = false;
                }                
            }
            ffooter.Text = OptionManagement.GetFooter("VI");
        }

        protected void loginPanel_Authenticate(object sender, AuthenticateEventArgs e)
        {
            string us = loginPanel.UserName.Trim();
            string pw = FormsAuthentication.HashPasswordForStoringInConfigFile(loginPanel.Password, "SHA1");
            e.Authenticated = ValidateUser(us, pw);
        }

        private bool ValidateUser(string username, string password)
        {
            DataTable us = UserManagement.Login(password, username);
            if (us != null && us.Rows.Count > 0)
            {
                Session["ID"] = us.Rows[0]["ID"].ToString();
                Session["roleID"] = Convert.ToInt32(us.Rows[0]["roleID"]);
                return true;
            }            
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
                dsCart.DataBind();
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
        }        

        protected void LangEN_Click(object sender, EventArgs e)
        {
            if (Request.Cookies["lang"] != null)
            {
                HttpCookie lang = new HttpCookie("lang");
                lang.Value = "en";
                lang.Expires = DateTime.Now.AddDays(30);
                Response.Cookies.Add(lang);
            }
            else
            {
                HttpCookie lang = Request.Cookies["lang"];
                lang.Value = "en";
                lang.Expires = DateTime.Now.AddDays(30);
                Response.Cookies.Add(Response.Cookies["lang"]);
            }
            Response.Redirect(Request.Url.AbsoluteUri);
        }

        protected void LangVI_Click(object sender, EventArgs e)
        {
            if (Request.Cookies["lang"] != null)
            {
                HttpCookie lang = new HttpCookie("lang");
                lang.Value = "vi";
                lang.Expires = DateTime.Now.AddDays(30);
                Response.Cookies.Add(lang);
            }
            else
            {
                HttpCookie lang = Request.Cookies["lang"];
                lang.Value = "vi";
                lang.Expires = DateTime.Now.AddDays(30);
                Response.Cookies.Add(Response.Cookies["lang"]);
            }
            Response.Redirect(Request.Url.AbsoluteUri);
        }
    }
}