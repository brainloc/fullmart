using System;
using System.Collections.Generic;
using System.Linq;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using FullMart.Code.DAO;

namespace FullMart.Administration
{
    public partial class ManageUser : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            bool isAdmin = true;
            if (isAdmin)
            {
                if (!IsPostBack)
                {

                }
            }
            else { Response.Redirect("../Default.aspx", false); }
        }
        private DataTable GetAllUserByRole(int role) {
            return UserManagement.GetAllUserByRole(role);
        }
        private DataTable SearchAllUserByKey(string key) {
            return UserManagement.SearchAllUserByKey(key);
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            string key=txtSearchKey.Text;
            if (!string.IsNullOrEmpty(key)&&key!="Enter Email to search user")
            {
                pnSearchUser.Visible = true;
                rpSearchUserList.DataSource = SearchAllUserByKey(key);
                rpSearchUserList.DataBind();
            }
        }

    }
}