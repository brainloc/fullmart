using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Data;

namespace FullMart.Code.DAO
{
    public class QAManagement : Base
    {
        public static void PostQuestion(int posterID, string content, string type)
        {
            using (SqlConnection connection = GetConnection())
            {
                SqlCommand command = new SqlCommand("PostQuestion", connection);
                command.CommandType = CommandType.StoredProcedure;

                command.Parameters.Add(new SqlParameter("@PosterID", posterID));
                command.Parameters.Add(new SqlParameter("@Content", content));
                command.Parameters.Add(new SqlParameter("@Type", type));

                try
                {
                    connection.Open();
                    command.ExecuteNonQuery();
                }
                catch (Exception ex)
                {
                    return;
                }
            }
        }
    }
}