using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

namespace FullMart.Code.DAO
{
    public class BindingUltilities:Base
    {
        public static DataTable GetCategories()
        {
            using (SqlConnection connection = GetConnection())
            {
                SqlCommand command = new SqlCommand("GetCategories", connection);
                command.CommandType = CommandType.StoredProcedure;

                SqlDataAdapter dbAdapter = new SqlDataAdapter(command);                
                DataTable cats = new DataTable();                

                try
                {
                    connection.Open();
                    dbAdapter.Fill(cats);

                    if (cats != null && cats.Rows.Count > 0)
                    {
                        return cats;
                    }
                    return null;
                }
                catch (Exception ex)
                {
                    return null;
                }
            }
        }

        public static DataTable GetSubCategories(int catID)
        {
            using (SqlConnection connection = GetConnection())
            {
                SqlCommand command = new SqlCommand("GetSubCategories", connection);
                command.CommandType = CommandType.StoredProcedure;

                command.Parameters.Add(new SqlParameter("@catID", catID));

                SqlDataAdapter dbAdapter = new SqlDataAdapter(command);
                DataTable subCats = new DataTable();

                try
                {
                    connection.Open();
                    dbAdapter.Fill(subCats);

                    if (subCats != null && subCats.Rows.Count > 0)
                    {
                        return subCats;
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