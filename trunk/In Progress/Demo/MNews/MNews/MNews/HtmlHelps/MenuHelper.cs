using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Text;

using MNews.Models;

namespace MNews.Helpers
{
    /// <summary>
    /// Lop bo sung vao HtmlHelper cho phep ghi Menu ra trang
    /// </summary>
    public static class MenuHelper
    {
        /// <summary>
        /// Ham tien ich HtmlHelper dung tao ra Menu duoi dang Html
        /// Menu duoc cau hinh trong file Web.sitemap
        /// </summary>
        /// <param name="helper">HtmlHelper</param>
        /// <returns>Chuoi Html tra ve</returns>
        public static string TopMenu(this HtmlHelper helper)
        {
            var sb = new StringBuilder();
            try
            {
               // sb.AppendLine("<div id=\"menu-item\">");
                sb.AppendLine("<ul id=\"menu\">");

                var topLevelNodes = SiteMap.RootNode.ChildNodes;
          
                foreach (SiteMapNode node in topLevelNodes)
                {
                    if (node.Description == "top-menu")
                    {
                        sb.Append("<li>");
                        if (SiteMap.CurrentNode == node)
                        {
                            sb.AppendFormat("<a id=\"mActive\" href=\"{0}\">{1}</a>", node.Url, helper.Encode(node.Title));                            
                        }
                        else
                        {
                            sb.AppendFormat("<a href=\"{0}\">{1}</a>", node.Url, helper.Encode(node.Title));
                        }

                        sb.AppendLine("</li>");                       
                    }
                }

                // Close unordered list tag
                sb.AppendLine("</ul>");
             //   sb.AppendLine("\t\t</div>");
            }
            finally
            {
            }            
            return sb.ToString();
        }

        /// <summary>
        /// Ham tien ich HtmlHelper dung tao ra Menu trai duoi dang Html
        /// Menu duoc cau hinh trong file Web.sitemap
        /// </summary>
        /// <param name="helper">HtmlHelper</param>
        /// /// <param name="helper">Loại menu chức năng theo quyền hạn</param>
        /// <returns>Chuoi Html tra ve</returns>
        public static string LeftMenu(this HtmlHelper helper, string type, string url)
        {
            var sb = new StringBuilder();
            try
            {
                var topLevelNodes = SiteMap.RootNode.ChildNodes;
                string host = SiteMap.RootNode.Url;
                if (host.Length > 1)
                {
                    host = host.Substring(1, host.Length - 1);
                    host = host.Substring(0, host.IndexOf("/"));
                    host = "/" + host;
                }
                else
                    host = "";

                foreach (SiteMapNode node in topLevelNodes)
                {
                    if (node.Description == type)
                    {
                        if (SiteMap.CurrentNode == node)
                            sb.AppendLine("<div class=\"left-selected-menu-item\">");
                        else
                            sb.AppendLine("<div class=\"left-menu-item\">");

                        sb.AppendLine("<div class=\"left-menu-icon\">");
                        sb.AppendFormat("<img src=\"{0}\" width=\"32px\" height=\"32px\" />", node.Title.Substring(0, node.Title.IndexOf("|")).Replace("~", host));
                        sb.AppendLine("</div>");

                        sb.AppendLine("<div class=\"left-menu-text\">");
                        sb.AppendFormat("<a href=\"{0}\">{1}</a>", node.Url,
                            node.Title.Substring(node.Title.IndexOf("|") + 1, node.Title.Length - (node.Title.IndexOf("|") + 1)));
                        sb.AppendLine("</div>");
                        sb.AppendLine("</div>");
                        sb.AppendLine();
                    }

                }
            }
            finally
            {

            }            
            return sb.ToString();
        }

        ///// <summary>
        ///// Hàm tiện ích trả về thông tin người sử dụng hiện tại
        ///// </summary>
        ///// <param name="userName">Tài khoản</param>
        ///// <returns>Mã html hiển thị thông tin</returns>
        //public static string UserInfo(this HtmlHelper helper, string userName)
        //{
        //    string str = "";
        //    try
        //    {
        //        AccountResponsitory accountRes = new AccountResponsitory();
        //        aspnet_User user = accountRes.GetByUserName(userName);
        //        TaiKhoan taikhoan = accountRes.GetTaiKhoan(user.UserId);

        //        str += "<div class=\"userinfo\">";
        //        str += "<center>Thông tin tài khoản</center>";
        //        str += "      <div class=\"editor-field\">ID: " + taikhoan.UserId.ToString().Substring(0, taikhoan.UserId.ToString().IndexOf("-"));
        //        str += "      </div>";
        //        str += "      <div class=\"editor-field\">  Tài khoản: " + taikhoan.aspnet_User.UserName;
        //        str += "       </div>";
        //        str += "</div>";
        //    }
        //    finally
        //    {
                
        //    }
        //    return str;
        //}

    }
}