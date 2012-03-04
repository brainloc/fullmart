using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using FullMart.Code.DAO;
using System.Globalization;
using System.Threading;

namespace FullMart
{
    public partial class ShopC : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Page.User.Identity.IsAuthenticated)
            {
                DataTable us=UserManagement.GetUserRole(User.Identity.Name);
                if ( us!= null&&us.Rows.Count>0) {
                    if (us.Rows[0]["ShopID"].ToString() != "-1")
                    {
                        DataTable uss = UserManagement.GetShopInfor(int.Parse(us.Rows[0]["ShopID"].ToString()));
                        if(uss!=null&&uss.Rows.Count>0){
                                pnRshop.Visible = false;
                                pnShop.Visible = true;
                            if (bool.Parse(uss.Rows[0]["isactive"].ToString()))
                            {
                                lbAddress.Text = uss.Rows[0]["Adress"].ToString();
                                lbCreatedDate.Text = uss.Rows[0]["CreateDate"].ToString();
                                lbPhone.Text = uss.Rows[0]["Phone"].ToString();
                                lbrate.Text = uss.Rows[0]["rate"].ToString();
                                lbShopName.Text = uss.Rows[0]["ShopName"].ToString();
                                if (bool.Parse(uss.Rows[0]["ischecked"].ToString()))
                                {
                                    lbstatus.Text = "Checked";
                                }else{
                                    lbstatus.Text = "Checking";
                                }
                                lbYahoo.Text = uss.Rows[0]["Chat"].ToString();
                            }
                            else {
                                lbmess.Text = "Your Shop CLosed, Please contact with administrator!";
                            }
                        }
                    }
                    else {
                        pnRshop.Visible = true;
                        pnRshop1.Visible = true;
                        lbShop.Text = OptionManagement.GetTermConditionShop("VI");
                        pnRshop2.Visible = false;
                    }
                }
            }
            else
            {
                Response.Redirect("~/Login.aspx?ReturnUrl=%2fShopC.aspx", false);
            }
        }

        protected void cmdAgree_Click(object sender, EventArgs e)
        {
            pnRshop.Visible = true;
            pnRshop1.Visible = false;
            pnRshop2.Visible = true;
            lbmess.Text = "Please input correct infomation, it's checked by Administrator!";
        }
        protected void cmdedit_Click(object sender, EventArgs e)
        {
            pnRshop.Visible = true;
            pnShop.Visible = false;
            pnRshop1.Visible = false;
            pnRshop2.Visible = true;
            pnRshop3.Visible = false;
            txtShopName.Text = lbShopName.Text;
            txtShopName.Enabled = false;
            txtAdress.Text = lbAddress.Text;
            txtPhone.Text = lbPhone.Text;
            txtYahoo.Text = lbYahoo.Text;
            cmdCREATEShop.Text = "SAVE";
            lbmess.Text = "Please input correct infomation, it's checked by Administrator!";
        }
        protected void cmdCREATEShop_Click(object sender, EventArgs e)
        {
            if (cmdCREATEShop.Text == "SAVE") {
                bool tmp1 = UserManagement.UpdateShopbyUser(txtShopName.Text.Trim(), Page.User.Identity.Name, txtAdress.Text.Trim(), txtPhone.Text.Trim(), txtYahoo.Text.Trim());
                if (tmp1)
                {
                    Response.Redirect(Request.Url.AbsoluteUri);
                }
                else
                {
                    pnRshop1.Visible = false;
                    pnRshop2.Visible = true;
                    lbmess.Text = "Get Error in update!";
                }
            }
            else
            {
                bool tmp1 = UserManagement.CreateShop(txtShopName.Text.Trim(), Page.User.Identity.Name, txtAdress.Text.Trim(), txtPhone.Text.Trim(), txtYahoo.Text.Trim());
                if (tmp1)
                {
                    pnRshop1.Visible = false;
                    pnRshop2.Visible = false;
                    pnRshop3.Visible = true;
                }
                else
                {
                    pnRshop1.Visible = false;
                    pnRshop2.Visible = true;
                    lbmess.Text = "This Shop is Exist! Please Choice another.";
                }
            }
        }
        protected override void InitializeCulture()
        {
            string ui = "en";
            if (Request.Cookies["lang"] != null)
            {
                ui = Request.Cookies["lang"].Value;
            }
            string culture = ui == "en" ? "en-us" : ui + "-" + "VN";
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