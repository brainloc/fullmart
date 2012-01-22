using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;

namespace FullMart
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (this.Page.IsPostBack == false)
            {
                dsTopSection.SelectCommand = String.Format("SELECT TOP {0} [ID],[Price],[Thumbnail],[Title] FROM [FullMart].[dbo].[Product] ORDER BY [CreatedDate] DESC", ConfigurationManager.AppSettings["MaxItemsNumberPerSection"].ToString());
            }
        }
    }
}