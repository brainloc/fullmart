using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using FullMart.Code.DAO;
using System.Threading;
using System.Globalization;

namespace FullMart
{
    public partial class viewNews : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (this.Page.IsPostBack == false)
            {
                string NewID = Request.QueryString["ID"];
                if (string.IsNullOrEmpty(NewID) == false)
                {
                    try
                    {
                        DataTable newDetail = GetNewDetailByID(Convert.ToInt32(NewID));
                        if (newDetail != null && newDetail.Rows.Count > 0)
                        {
                            txtContentNew.Text = newDetail.Rows[0][1].ToString();
                            txtTimePostNew.Text = newDetail.Rows[0][6].ToString();
                            txtTitleNew.Text = newDetail.Rows[0][0].ToString();
                            txtAuthorNew.Text = newDetail.Rows[0][3].ToString();
                            //txtpewviewcontent.Text = newDetail.Rows[0][4].ToString();
                            //imgNew.ToolTip = newDetail.Rows[0][0].ToString();
                            //imgNew.ImageUrl = newDetail.Rows[0][5].ToString();
                        }
                    }
                    catch (Exception ex)
                    {
                    }
                }
            }
        }
        private DataTable GetNewDetailByID(int NewID)
        {
            DataTable newDetail = new DataTable();
            newDetail = NewManagerment.GetNewDetailByID(NewID);
            return newDetail;
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