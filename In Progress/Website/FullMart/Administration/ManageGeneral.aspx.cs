using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;
using FullMart.Code.DAO;
using System.Threading;
using System.Globalization;
using System.Configuration;

namespace FullMart
{
    public partial class ManagerGeneral : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            bool isAdmin=true;
            if (isAdmin)
            {
                if (!IsPostBack)
                {
                    DataTable option = GetOption();
                    if (option != null && option.Rows.Count > 0)
                    {
                        UserEN.Text = option.Rows[0][2].ToString();
                        UserVi.Text = option.Rows[0][3].ToString();
                        FooterEN.Text = option.Rows[1][2].ToString();
                        FooterVI.Text = option.Rows[1][3].ToString();
                        txtnumberNewestProducts.Text = ConfigurationManager.AppSettings["MaxItemsNewSection"].ToString();
                        txtnumberTopProducts.Text = ConfigurationManager.AppSettings["MaxItemsTopSection"].ToString();
                        txtimg1.Text = option.Rows[3][2].ToString();
                        txtimg2.Text = option.Rows[4][2].ToString();
                        txtimg3.Text = option.Rows[5][2].ToString();
                        txtimg4.Text = option.Rows[6][2].ToString();
                        txtimg5.Text = option.Rows[7][2].ToString();
                    }
                }
            }
            else { Response.Redirect("../Default.aspx", false); }
        }

        protected void cmdSave_Click(object sender, EventArgs e)
        {
            Configuration MaxItemsTopSection = System.Web.Configuration.WebConfigurationManager.OpenWebConfiguration("~");
            MaxItemsTopSection.AppSettings.Settings["MaxItemsTopSection"].Value = txtnumberTopProducts.Text;
            MaxItemsTopSection.Save();

            Configuration MaxItemsNewSection = System.Web.Configuration.WebConfigurationManager.OpenWebConfiguration("~");
            MaxItemsNewSection.AppSettings.Settings["MaxItemsNewSection"].Value = txtnumberNewestProducts.Text;
            MaxItemsNewSection.Save();
            if (UpdateOption(1, HttpUtility.HtmlDecode(UserEN.Text), HttpUtility.HtmlDecode(UserVi.Text)))
            {
                lbnotemessage.Text = "Term Condition updated";
            }
            else { lbnotemessage.Text = "Term Condition get error in update please check it"; }
            if (UpdateOption(2, HttpUtility.HtmlDecode(FooterEN.Text), HttpUtility.HtmlDecode(FooterVI.Text)))
            {
                lbnotemessage.Text += "<br />Footer updated";
            }
            else { lbnotemessage.Text += "<br />Footer get error in update please check it"; }

            if (UpdateOption(4, txtimg1.Text, txtimg1.Text))
            {
                lbnotemessage.Text += "<br />Slider Updated";
            }
            else { lbnotemessage.Text += "<br />Slider1 get error in update please check it"; }
            if (UpdateOption(5, txtimg2.Text, txtimg2.Text))
            {
                lbnotemessage.Text += "<br />Slider Updated";
            }
            else { lbnotemessage.Text += "<br />Slider get error in update please check it"; }
            if (UpdateOption(6, txtimg3.Text, txtimg3.Text))
            {
                lbnotemessage.Text += "<br />Slider Updated";
            }
            else { lbnotemessage.Text += "<br />Slider get error in update please check it"; }
            if (UpdateOption(7, txtimg4.Text, txtimg4.Text))
            {
                lbnotemessage.Text += "<br />Slider1 Updated";
            }
            else { lbnotemessage.Text += "<br />Slider get error in update please check it"; }
            if (UpdateOption(8, txtimg5.Text, txtimg5.Text))
            {
                lbnotemessage.Text += "<br />Slider1 Updated";
            }
            else { lbnotemessage.Text += "<br />Slider get error in update please check it"; }
        }
        private DataTable GetOption()
        {
            DataTable option = new DataTable();
            option = OptionManagement.GetOption();
            return option;
        }
        private bool UpdateOption(int ID,string EN,String VI) {
            return OptionManagement.UpdateOption(ID, EN, VI);
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