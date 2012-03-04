﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;
using FullMart.Code.DAO;
using System.Threading;
using System.Globalization;

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
                    }
                }
            }
            else { Response.Redirect("../Default.aspx", false); }
        }

        protected void cmdSave_Click(object sender, EventArgs e)
        {
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