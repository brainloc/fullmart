using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using FullMart.Code.DAO;
using FullMart.Code.Entities;
using System.Web.Security;

namespace FullMart
{
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            pnReg.Visible = true;
            pnTC.Visible = true;
            pnSuccess.Visible = false;
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
            us.cls=txtClass.Text.Trim();
            us.birthday = DateTime.Parse(txtbirthday.Text.Trim());
            if (UserManagement.CreateUser(us))
            {
                pnReg.Visible = false;
                pnTC.Visible = false;
                pnSuccess.Visible = true;
            }
            else {
                pnReg.Visible = true;
                pnTC.Visible = false;
                pnSuccess.Visible = false;
                txtmessage.Text = "Error during Register, Please retry again!";
            }
        }
    }
}