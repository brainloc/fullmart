using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

namespace UserAuthentications
{
    public partial class SignUp : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
      
        protected void btnCreateUser_Click(object sender, EventArgs e)
        {
            try
            {
                using (SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["FullMartConnectionString"].ConnectionString))
                {
                    string username = UserName.Text.Trim();
                    string password = Password.Text.Trim();
                    string alias = Alias.Text.Trim();
                    string email = Email.Text.Trim();
                    string ym = YM.Text.Trim();
                    string mobile = Mobile.Text.Trim();
                    int roleID = 3;
                    string createdDate = DateTime.Now.ToShortDateString();

                    string sqlStatement = string.Format("INSERT INTO [FullMart].[dbo].[User] ([Username],[Password],[Alias],[RoleID],[Email],[Yahoo],[Mobile],[CreatedDate]) VALUES (N'{0}',N'{1}',N'{2}',{3},N'{4}',N'{5}',N'{6}',N'{7}')", username, password,alias,roleID,email,ym,mobile,createdDate);
                    SqlCommand command = new SqlCommand(sqlStatement, connection);

                    try
                    {
                        connection.Open();
                        int isUserCreated = command.ExecuteNonQuery();
                    }
                    catch (Exception ex)
                    {
                        throw ex;
                    }
                }
            }
            catch (Exception ex)
            {
                return;
            }
        }
    }
}