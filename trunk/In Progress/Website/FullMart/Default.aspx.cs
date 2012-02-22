using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Text.RegularExpressions;

namespace FullMart
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (this.Page.IsPostBack == false)
            {  
                //Configuration MaxItemsTopSection = System.Web.Configuration.WebConfigurationManager.OpenWebConfiguration("~");
                //MaxItemsTopSection.AppSettings.Settings["MaxItemsTopSection"].Value = "40";
                //MaxItemsTopSection.Save();

                //Configuration MaxItemsNewSection = System.Web.Configuration.WebConfigurationManager.OpenWebConfiguration("~");
                //MaxItemsNewSection.AppSettings.Settings["MaxItemsNewSection"].Value = "20";
                //MaxItemsNewSection.Save();

                dsTopSection.SelectCommand = String.Format("SELECT TOP {0} [dbo].[Product].[ID] AS ID,[Price],[Thumbnail],[Title] FROM [dbo].[Product],[dbo].[User] WHERE [Outstanding] = 1 AND [Type] = 1 AND [PosterID]=[dbo].[User].[ID] AND [roleID] <>3 ORDER BY [CreatedDate] DESC", ConfigurationManager.AppSettings["MaxItemsTopSection"].ToString());
                dsNewSection.SelectCommand = String.Format("SELECT TOP {0} [dbo].[Product].[ID] AS ID,[Price],[Thumbnail],[Title] FROM [dbo].[Product],[dbo].[User] WHERE [Outstanding] = 1 AND [Type] = 1 AND [PosterID]=[dbo].[User].[ID] AND [roleID] <>3 ORDER BY [CreatedDate] DESC", ConfigurationManager.AppSettings["MaxItemsNewSection"].ToString());
            }
        }

        protected string correctshortCT(object content,int length)
        {
            if (content != DBNull.Value)
            {
                string tmp1 = content.ToString();
                tmp1=Regex.Replace(tmp1,@"<(.|\n)*?>", string.Empty);
                if (tmp1.Length > length)
                {
                    return tmp1.Substring(0, length) + "...";
                }
                else { return tmp1; }
            }
            return content.ToString();
        }
    }
}