using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;

namespace MNews.Helpers
{
    /// <summary>
    /// 
    /// </summary>
    public static class BoxHelper
    {
        /// <summary>
        /// 
        /// </summary>
        /// <param name="helper"></param>
        /// <param name="title"></param>
        /// <param name="center"></param>
        /// <returns></returns>
        public static string TitleBox(this HtmlHelper helper, string title, bool center)
        {
            string titleBox = "<div class=\"box\">\n";
                   titleBox += "\t<div class=\"left-title-box\"></div>\n";

            if (center)
                titleBox += "\t<div class=\"title-center-box\">\n";
            else
                titleBox += "\t<div class=\"title-left-box\">\n";

                   titleBox += "\t\t<div class=\"title-icon\"></div>\n";
                   titleBox += "\t\t<div class=\"title-box\">\n";
                   titleBox += "\t\t" + title + "</div>\n";
                   titleBox += "\t</div>";
            return titleBox;
        }       

        /// <summary>
        /// 
        /// </summary>
        /// <param name="helper"></param>
        /// <returns></returns>
        public static string BeginContentBox(this HtmlHelper helper)
        {
            string beginContentBox = "<div class=\"right-title-box\"></div>\n";
            beginContentBox += "\t<div class=\"content-box\"><div style=\"margin-top:26px;\">";
            return beginContentBox;
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="helper"></param>
        /// <returns></returns>
        public static string EndContentBox(this HtmlHelper helper)
        {
            return "\t</div></div>\n</div>";
        }
    }
}