using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Threading;
using System.Globalization;

namespace Demo
{
    public partial class Multilang : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected override void InitializeCulture()
        {
            string ui = Request.QueryString["lang"];
            if (string.IsNullOrEmpty(ui))
                ui = "vi";
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