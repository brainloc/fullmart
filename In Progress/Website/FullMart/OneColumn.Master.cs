using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using FullMart.Code.DAO;

namespace FullMart
{
    public partial class OneColumn : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (this.Page.User.Identity.IsAuthenticated == true)
            {
                if (this.Page.IsPostBack == false)
                {
                    loginPanel.Visible = false;
                    //LoginStatus.Visible = true;
                    LoginStatus.Visible = true;
                }
            }
            DataTable genoption=OptionManagement.GetOption();
            if(genoption!=null&&genoption.Rows.Count>0){
                footer.Text = genoption.Rows[1][3].ToString();
            }
        }

        protected void loginPanel_Authenticate(object sender, AuthenticateEventArgs e)
        {
            bool isUserValidated = ValidateUser(loginPanel.UserName.Trim(), loginPanel.Password.Trim());
            e.Authenticated = isUserValidated;
        }

        private bool ValidateUser(string username, string password)
        {
            try
            {
                using (SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["FullMartConnectionString"].ConnectionString))
                {
                    string sqlStatement = string.Format("SELECT * FROM [FullMart].[dbo].[User] WHERE [email] = N'{0}' AND [pass] = N'{1}'", username, password);
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