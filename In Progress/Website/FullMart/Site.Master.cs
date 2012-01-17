using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using FullMart.Code.DAO;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

namespace FullMart
{
    public partial class Site : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (this.Page.User.Identity.IsAuthenticated == true)
            {
                if (this.Page.IsPostBack == false)
                {
                    loginPane.Visible = false;
                    loginStatus.Visible = true;
                }
            }            
        }

        protected bool LoadSubCategories(int CatID)
        {
            using (SqlConnection connection = Base.GetConnection())
            {
                string sqlStatement = string.Format("SELECT [ID],[Name] FROM [FullMart].[dbo].[SubCategory] WHERE [CategoryID] = {0}", CatID);
                SqlCommand command = new SqlCommand(sqlStatement, connection);

                SqlDataAdapter dataAdap = new SqlDataAdapter(command);
                DataTable data = new DataTable();

                try
                {
                    connection.Open();
                    dataAdap.Fill(data);

                    if (data != null && data.Rows.Count > 0)
                    {
                        Repeater rpSubCat = (Repeater)rpCategories.FindControl("rpSubCategories");
                        rpSubCat.DataSource = data;
                        rpSubCat.DataBind();
                    }
                    return false;
                }
                catch (Exception ex)
                {
                    return false;
                }
            }
        }

        protected void loginPane_Authenticate(object sender, AuthenticateEventArgs e)
        {
            bool isUserValidated = ValidateUser(loginPane.UserName.Trim(), loginPane.Password.Trim());
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
                            loginPane.UserNameLabelText = username;
                            loginPane.Visible = false;
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

        protected void Button1_Click(object sender, EventArgs e)
        {
            this.Page.Response.Redirect("google.com");
        }
    }
}