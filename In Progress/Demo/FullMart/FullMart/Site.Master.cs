using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using FullMart.Code.DAO;
using System.Data.SqlClient;
using System.Data;

namespace FullMart
{
    public partial class Site : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected bool LoadSubCategories(int CatID)
        {
            using (SqlConnection connection = Base.GetConnection())
            {
                string sqlStatement = string.Format("SELECT [ID],[Name] FROM [FullMart].[dbo].[SubCategory] WHERE [CategoryID] = {0}",CatID);
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
    }
}