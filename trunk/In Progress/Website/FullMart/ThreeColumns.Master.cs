using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using FullMart.Code.DAO;
using System.Web.Security;

namespace FullMart
{
    public partial class ThreeColumns : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserName"] != null)
            {
                if (!IsPostBack)
                {
                    loginPanel.Visible = false;
                    //LoginStatus.Visible = true;
                    txtLoginName.Text = Session["UserName"].ToString();
                    pnloged.Visible = true;
                }
            }
            else
            {
                if (Request.Cookies["fullmartN"] != null)
                {
                    DataTable tmp1 = UserManagement.Login(Request.Cookies["fullmartN"].Values["P"].ToString(), Request.Cookies["fullmartN"].Values["UserName"].ToString());
                    if (tmp1 != null && tmp1.Rows.Count > 0)
                    {
                        Session["UserName"] = tmp1.Rows[0]["UserName"].ToString();
                        Session["ID"] = tmp1.Rows[0]["ID"].ToString();
                        Session["role"] = tmp1.Rows[0]["roleID"].ToString();
                        loginPanel.Visible = false;
                        //LoginStatus.Visible = true;
                        txtLoginName.Text = Session["UserName"].ToString();
                        pnloged.Visible = true;
                    }
                    else
                    {

                        HttpCookie aCookie = new HttpCookie("fullmartN");
                        aCookie.Expires = DateTime.Now.AddDays(-1);
                        Response.Cookies.Add(aCookie);
                        loginPanel.Visible = true;
                        pnloged.Visible = false;
                    }
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
            bool isUserValidated = ValidateUser(us, pw);
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
                fullmart.Values["P"] = FormsAuthentication.HashPasswordForStoringInConfigFile(us.Rows[0]["pass"].ToString(), "SHA1");
                Response.Cookies.Add(fullmart);
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
            Response.Redirect("~/", false);
        }
    }
}