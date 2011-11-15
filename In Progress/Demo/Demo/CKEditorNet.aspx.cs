using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

namespace Demo
{
    public partial class CKEditorNet : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnPostData_Click(object sender, EventArgs e)
        {
            int ProductID = 1;
            string Content = HttpUtility.HtmlDecode(CKENet.Text);
            using (SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["FullMartConnectionString"].ConnectionString))
            {
                string sqlStatement = string.Format("INSERT INTO [FullMart].[dbo].[ProductDetail]([ProductID],[Content]) VALUES (N'{0}',N'{1}')", ProductID, Content);
                SqlCommand command = new SqlCommand(sqlStatement, connection);

                try
                {
                    connection.Open();
                    command.ExecuteNonQuery();
                    connection.Close();
                }
                catch (Exception ex)
                {
                    throw ex;
                }
            }
        }
    }
}