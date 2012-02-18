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
    public partial class Admin : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Page.User.Identity.IsAuthenticated)
            {
                if (!IsPostBack)
                {
                    loginPanel.Visible = false;
                    txtLoginName.Text = Page.User.Identity.Name;
                    if (int.Parse(Session["role"].ToString()) == 1) {
                        hlAdmin.NavigateUrl = "/Administration/admin.aspx";
                        hlAdmin.Text = "Administrator";hlAdmin.Visible = true;
                        
                    }
                    pnloged.Visible = true;
                }
            }else{
                loginPanel.Visible = true;
                    pnloged.Visible = false;
            }
            ffooter.Text = OptionManagement.GetFooter("VI");
        }

        protected void loginPanel_Authenticate(object sender, AuthenticateEventArgs e)
        {
            string us=loginPanel.UserName.Trim();
            string pw=FormsAuthentication.HashPasswordForStoringInConfigFile(loginPanel.Password,"SHA1");
            bool isUserValidated = ValidateUser(us,pw );
            e.Authenticated = isUserValidated;
        }

        private bool ValidateUser(string username, string password)
        {
            DataTable us = UserManagement.Login(password, username);
            if (us != null && us.Rows.Count > 0)
            {
                Session["UserName"] = us.Rows[0]["UserName"].ToString();
                Session["ID"] = us.Rows[0]["ID"].ToString();
                Session["role"] = us.Rows[0]["roleID"].ToString();
                HttpCookie fullmart = new HttpCookie("fullmartN");
                fullmart.Values["UserName"] = us.Rows[0]["UserName"].ToString();
                fullmart.Values["ID"] = us.Rows[0]["ID"].ToString();
                fullmart.Expires = DateTime.Now.AddDays(30);
                fullmart.Values["P"] = FormsAuthentication.HashPasswordForStoringInConfigFile(us.Rows[0]["pass"].ToString(), "SHA1");
                Response.Cookies.Add(fullmart);
                if (int.Parse(Session["role"].ToString()) == 1)
                {
                    hlAdmin.NavigateUrl = "/Administration/admin.aspx";
                    hlAdmin.Text = "Administrator";hlAdmin.Visible = true;
                }
                return true;
            }
            return false;
        }

        protected void btLogout_Click(object sender, EventArgs e)
        {
            Session["UserName"] = null;
            HttpCookie aCookie = new HttpCookie("fullmartN");
            aCookie.Expires = DateTime.Now.AddDays(-1);
            Response.Cookies.Add(aCookie);
            Response.Redirect("~/",false);
        }
    }
}