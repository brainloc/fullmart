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
    public partial class OneColumn : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ffooter.Text = OptionManagement.GetFooter("VI");
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
    }
}