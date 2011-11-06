using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Configuration;
using System.Text;

namespace Demo
{
    /// <summary>
    /// Summary description for CKEditor1
    /// </summary>
    public class CKEditor1 : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            Encoding unicode = Encoding.Unicode;
            Encoding ascii = Encoding.ASCII;
            byte[] unicodeBytes = unicode.GetBytes(context.Request.Form["Content"].ToString());



            string ProductID = context.Request.Form["ProductID"].ToString();
            string Content = context.Request.Form["Content"].ToString();           



            context.Response.ContentType = "application/html";
            var responseData = string.Empty;

            try
            {
                using (SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["FullMartConnectionString"].ConnectionString))
                {
                    string sqlStatement = string.Format("INSERT INTO [FullMart].[dbo].[ProductDetail]([ProductID],[Content]) VALUES (N'{0}',N'{1}')",ProductID,Content);
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
            catch (Exception ex)
            {
                context.Response.Write(string.Format("alert(\"Có lỗi: {0}\");", ex.Message));
                return;
            }
        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}