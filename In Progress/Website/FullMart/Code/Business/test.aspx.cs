using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using FullMart.Code.DAO;

namespace FullMart.Code.Business
{
    public partial class test : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Response.ContentType = "text/javascript";
            var ema = Request.QueryString["uemail"] != null ? Request.QueryString["uemail"].Trim().Replace("'", "''") : string.Empty;

            //UserManagement.CreateUser(fname,lname,ema,pas,DateTime.Parse(bday),state,CU,cls,roleID);
            bool isAv = UserManagement.CheckUser(ema);
            Response.Write("alert(" + isAv.ToString() + ");");
        }
    }
}