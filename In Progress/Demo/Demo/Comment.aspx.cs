using System;
using System.Configuration;
using System.Data;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;

namespace Demo
{
    public partial class Comment : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            HiddenField hdnDateTime = (HiddenField)FormView.FindControl("hdnDateTime");            
            hdnDateTime.Value = DateTime.Now.ToString();
        }
    }
}