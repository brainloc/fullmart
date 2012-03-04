using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using FullMart.Code.DAO;
using FullMart.Code.Entities;
using System.Web.Security;
using System.Threading;
using System.Globalization;
using System.Data;

namespace FullMart
{
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                pnReg.Visible = true;
                pnTC.Visible = true;
                pnSuccess.Visible = false;
                txtTC.Text = OptionManagement.GetTermCondition("VI");
                drlState.DataBind();

                if (Page.User.Identity.IsAuthenticated)
                {
                    string action = Request.QueryString["Action"];
                    if (string.IsNullOrEmpty(action) == false && action == "Edit")
                    {
                        try
                        {
                            int userID = Convert.ToInt32(Session["ID"]);

                            DataTable userInfo = UserManagement.GetUserInforbyID(userID);

                            if (userInfo != null && userInfo.Rows.Count > 0)
                            {
                                cmdCreateUSer.Text = "Save";
                                BindUserInfoToRegisterForm(userInfo);
                            }
                        }
                        catch (Exception ex)
                        {

                        }
                    }
                }
            }
            else
            {
                pnReg.Visible = true;
                pnTC.Visible = false;
                pnSuccess.Visible = false;
            }
        }

        protected void cmdCreateUSer_Click(object sender, EventArgs e)
        {
            User us = new User();
            us.wishtlist = txtWishlist.Text.Trim();
            us.website = txtWebsite.Text.Trim();
            us.username = txtUserName.Text.Trim();
            us.yahoo = txtyahoo.Text.Trim();
            us.state = drlState.Text.Trim();
            us.rID = 3;
            us.pass = FormsAuthentication.HashPasswordForStoringInConfigFile(txtPass.Text, "SHA1");
            us.mobile = txtmobile.Text.Trim();
            us.lname = txtLname.Text.Trim();
            us.fname = txtFname.Text.Trim();
            us.email = txtmail.Text.Trim();
            us.CU = txtUC.Text.Trim();
            us.cls = txtClass.Text.Trim();
            try
            {
                us.birthday = DateTime.ParseExact(txtbirthday.Text.Trim(), "dd/mm/yyyy", null);
            }
            catch (Exception ex)
            {
                us.birthday = DateTime.MinValue;
            }

            if (cmdCreateUSer.Text == "Save")
            {
                us.ID = Convert.ToInt32(Session["ID"]);
                if (UserManagement.UpdateUserInfo(us))
                {
                    pnReg.Visible = false;
                    pnTC.Visible = false;
                    txtActionInform.Text = "Edit successful!";
                    pnSuccess.Visible = true;                    
                }
                else
                {
                    pnReg.Visible = true;
                    pnTC.Visible = false;
                    pnSuccess.Visible = false;
                    txtmessage.Text = "Error during update info, it's probably that the new email is existing!";
                }
            }
            else
            {
                if (UserManagement.CreateUser(us))
                {
                    pnReg.Visible = false;
                    pnTC.Visible = false;
                    pnSuccess.Visible = true;
                }
                else
                {
                    pnReg.Visible = true;
                    pnTC.Visible = false;
                    pnSuccess.Visible = false;
                    txtmessage.Text = "Error during Register, Please retry again!";
                }
            }
        }

        private void BindUserInfoToRegisterForm(DataTable userInfo)
        {
            txtUserName.Text = userInfo.Rows[0]["UserName"].ToString();
            txtUserName.Enabled = false;

            txtFname.Text = userInfo.Rows[0]["fname"].ToString();
            txtLname.Text = userInfo.Rows[0]["lname"].ToString();
            txtmail.Text = userInfo.Rows[0]["email"].ToString();
            txtPass.Text = userInfo.Rows[0]["pass"].ToString();

            txtbirthday.Text = DateTime.Parse(userInfo.Rows[0]["bday"].ToString()).ToShortDateString();

            ListItem userState = new ListItem();
            userState = drlState.Items.FindByText(userInfo.Rows[0]["state"].ToString());

            if (userState != null)
            {
                userState.Selected = true;
            }

            txtUC.Text = userInfo.Rows[0]["CU"].ToString();
            txtClass.Text = userInfo.Rows[0]["class"].ToString();
            txtyahoo.Text = userInfo.Rows[0]["yahoo"].ToString();
            txtmobile.Text = userInfo.Rows[0]["mobile"].ToString();
            txtWebsite.Text = userInfo.Rows[0]["Web"].ToString();
            txtWishlist.Text = userInfo.Rows[0]["Wishlist"].ToString();
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