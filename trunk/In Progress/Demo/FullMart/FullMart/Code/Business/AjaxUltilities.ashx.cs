using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using FullMart.Code.DAO;

namespace FullMart.Code.Business
{
    /// <summary>
    /// Summary description for AjaxUltilities
    /// </summary>
    public class AjaxUltilities : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            var action = context.Request.Form["action"] != null ? context.Request.Form["action"].Trim().Replace("'", "''") : string.Empty;

            switch (action)
            {
                case "CreateUser":
                    {
                        context.Response.ContentType = "text/plain";                        
                        string username = "myUsername";
                        string password = "myPassword";
                        string email = "myEmail";
                        string yahooID = "myYahooID";
                        string mobile = "myMobile";
                        int? roleID = null;

                        UserManagement.CreateUser(username, password, email, yahooID, mobile, roleID);
                        break;
                    }
                case "EditUser":
                    {
                        break;
                    }
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