using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using FullMart.Code.Entities;
using System.Data.SqlClient;
using System.Data;

namespace FullMart.Code.DAO
{
    public class NewManagerment:Base

    {
        public static DataTable GetNewDetailByID(int productID)
        {
            using (SqlConnection connection = GetConnection())
            {
                SqlCommand command = new SqlCommand("GetNewDetail", connection);
                command.CommandType = CommandType.StoredProcedure;

                command.Parameters.Add(new SqlParameter("@ID", productID));

                SqlDataAdapter dbAdapter = new SqlDataAdapter(command);
                DataTable pDetail = new DataTable();

                try
                {
                    connection.Open();
                    dbAdapter.Fill(pDetail);

                    if (pDetail != null && pDetail.Rows.Count > 0)
                    {
                        return pDetail;
                    }
                    return null;
                }
                catch (Exception ex)
                {
                    return null;
                }
            }
        }
    }
}