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
    public static class HtmlHelperExtend
    {
        /// <summary>
        /// 
        /// </summary>
        /// <param name="helper"></param>
        /// <param name="title"></param>
        /// <param name="center"></param>
        /// <returns></returns>
        public static string Decode(this HtmlHelper helper, string content)
        {
            if (content != null)
            {
                string str = content;
                str = str.Replace("&lt;", "<");
                str = str.Replace("&gt;", ">");
                str = str.Replace("&quot;", "\"");
                str = str.Replace("&amp;", "&");
                content = str;
            }
            return content;
        }

        public static string ActionImage(this HtmlHelper helper, string link, string htmlAttributes, string imgSrc, string Content, int size=32)
        {
            string strTemp = "<a ";

            if (htmlAttributes != null)
                strTemp += htmlAttributes;                   
                   strTemp += " shape='rect' href='";
                   strTemp += link + "' style='text-decoration: none'>";
                   strTemp += "<img alt='" + Content + "' src='" +  imgSrc + "' ";
                   strTemp += " width='" + size + "' height='" + size + "' ";
                   strTemp += "style='border-style: none;'/></a>";
            return strTemp;
        }
       
        public static string PageSize(this HtmlHelper helper, string ActionLink, int currentPage, int TotalItem)
        {
            string strPage = "";

            strPage += "<a href=\"" + ActionLink + "?pageSize=10\""; 
            if (currentPage == 10)
                strPage += " class = \"current\" ";
            strPage += " >10</a>\n";
            
           // if (currentPage >= 30)
           // {
                strPage += "<a href=\"" + ActionLink + "?pageSize=30\"";
                if (currentPage == 30)
                    strPage += " class = \"current\" ";
                strPage += " >30</a>\n";
           // }
            //if (currentPage >= 50)
           // {
                strPage += "<a href=\"" + ActionLink + "?pageSize=50\"";
                if (currentPage == 50)
                    strPage += " class = \"current\" ";
                strPage += " >50</a>\n";
           // }
            strPage += "<a href=\"" + ActionLink + "?pageSize=" + TotalItem + "\"";
            if (currentPage == TotalItem)
                strPage += " class = \"current\" ";
            strPage += " >All</a>\n";
            
            return strPage;
        }
    }

}