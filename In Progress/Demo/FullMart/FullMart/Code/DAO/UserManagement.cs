using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Data;

namespace FullMart.Code.DAO
{
    public class UserManagement : Base
    {
        public static bool CreateUser(string username, string password, string email, string yahooID, string mobile, int? roleID)
        {
            using (SqlConnection connection = GetConnection())
            {
                SqlCommand command = new SqlCommand("CreateUser", connection);
                command.CommandType = CommandType.StoredProcedure;

                command.Parameters.Add(new SqlParameter("@username", username));
                command.Parameters.Add(new SqlParameter("@password", password));
                command.Parameters.Add(new SqlParameter("@email", email));
                command.Parameters.Add(new SqlParameter("@yahooID", yahooID));
                command.Parameters.Add(new SqlParameter("@mobile", mobile));
                command.Parameters.Add(new SqlParameter("@roleID", roleID));

                try
                {
                    connection.Open();
                    command.ExecuteNonQuery();
                    int isCreated = Convert.ToInt32(command.Parameters[0].ToString());
                    return isCreated == 1;
                }
                catch (Exception ex)
                {
                    return false;
                }
            }
        }
    }
}