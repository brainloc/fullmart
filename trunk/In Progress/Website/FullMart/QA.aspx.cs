using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using FullMart.Code.DAO;

namespace FullMart
{
    public partial class QA : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnPost_Click(object sender, EventArgs e)
        {
            string content = txtPost.Text.Trim();
            int posterID = 1;
            string type = "";
            if (string.IsNullOrEmpty(content) == false)
            {
                PostQuestion(posterID, content, type);
                updatePostList.Update();
                updatePostList.DataBind();                
            }
        }

        private void PostQuestion(int posterID, string content, string type)
        {
            QAManagement.PostQuestion(posterID, content, type);
        }
    }
}