using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace AjaxUpdate
{
    /// <summary>
    /// Summary description for ImageLoader
    /// </summary>
    public class ImageLoader : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            string fileName = context.Request.QueryString["file"];

            if (string.IsNullOrEmpty(fileName) == false)
            {
                context.Response.ContentType = "image/jpg";
                context.Response.WriteFile(string.Format("Images/{0}.jpg",fileName));
            }
        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}