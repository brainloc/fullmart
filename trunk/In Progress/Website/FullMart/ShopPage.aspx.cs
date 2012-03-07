using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Text.RegularExpressions;
using System.Globalization;
using System.Data;
using FullMart.Code.DAO;
using System.Threading;

namespace FullMart
{
    public partial class ShopPage : System.Web.UI.Page
    {
        public string shopchecked = "Checking";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) {
                string ID = Request.QueryString["Shop"];
                string u = Request.QueryString["u"];
                if (!string.IsNullOrEmpty(ID))
                {
                    DataTable us=UserManagement.GetUShopByShopID(int.Parse(ID));
                    if(us!=null && us.Rows.Count>0){
                        DataTable dslistProduct = new DataTable();
                        dslistProduct=UserManagement.GetAllProductsByPoster(int.Parse(us.Rows[0]["ID"].ToString()));
                        ListProductShop.DataSource = dslistProduct;
                        ListProductShop.DataBind();
                        DataTable shopinfor = UserManagement.GetShopInfor(int.Parse(ID));
                        if (shopinfor != null && shopinfor.Rows.Count > 0)
                        {
                            rpShopInfor.DataSource = shopinfor;
                            rpShopInfor.DataBind();
                        }
                        else {
                            Response.Redirect("~/ShopC.aspx", false);
                        }
                    }else{
                        Response.Redirect("~/Error.aspx", false);
                    }
                }
                else {
                    if (!string.IsNullOrEmpty(u)) {
                        DataTable us = UserManagement.GetUserInforbyID(int.Parse(u));
                        if (us != null && us.Rows.Count > 0)
                        {
                            if (us.Rows[0]["ShopID"].ToString() != "-1")
                            {
                                DataTable dslistProduct = new DataTable();
                                dslistProduct = UserManagement.GetAllProductsByPoster(int.Parse(us.Rows[0]["ID"].ToString()));
                                ListProductShop.DataSource = dslistProduct;
                                ListProductShop.DataBind();
                                DataTable shopinfor = UserManagement.GetShopInfor(int.Parse(ID));
                                if (shopinfor != null && shopinfor.Rows.Count > 0)
                                {
                                    rpShopInfor.DataSource = shopinfor;
                                    rpShopInfor.DataBind();
                                }
                                else
                                {
                                    Response.Redirect("~/ShopC.aspx", false);
                                }
                            }
                            else {
                                Response.Redirect("~/ShopC.aspx", false);
                            }
                        }
                        else
                        {
                            Response.Redirect("~/Error.aspx", false);
                        }
                    }
                    else
                    {
                        Response.Redirect("~/ShopC.aspx", false);
                    }
                }
            }
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