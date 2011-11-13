using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

namespace UserAuthentications
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void LoginPane_Authenticate(object sender, AuthenticateEventArgs e)
        {
            bool isUserValidated = ValidateUser(LoginPane.UserName.Trim(), LoginPane.Password.Trim());
            e.Authenticated = isUserValidated;            
        }

        private bool ValidateUser(string username, string password)
        {
            try
            {
                using (SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["FullMartConnectionString"].ConnectionString))
                {
                    string sqlStatement = string.Format("SELECT [ID],[Username],[Password],[Alias],[RoleID],[Email],[Yahoo],[Mobile],[CreatedDate] FROM [FullMart].[dbo].[User] WHERE [Username] = N'{0}' AND [Password] = N'{1}'", username, password);
                    SqlCommand command = new SqlCommand(sqlStatement, connection);
                    SqlDataAdapter dataAdap = new SqlDataAdapter(command);
                    DataTable data = new DataTable();
                    try
                    {
                        connection.Open();
                        dataAdap.Fill(data);

                        if (data != null && data.Rows.Count == 1)
                        {
                            return true;
                        }
                        else
                        {
                            return false;
                        }
                    }
                    catch (Exception ex)
                    {
                        throw ex;
                    }
                }
            }
            catch (Exception ex)
            {
                return false;
            }
        }
    }
}