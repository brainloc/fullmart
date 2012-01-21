using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using FullMart.Code.Entities;
using System.Data.SqlClient;
using System.Data;

namespace FullMart.Code.DAO
{
    public class ProductManagement:Base
    {
        public static bool CreateProduct(Product p)
        {
            using (SqlConnection connection = GetConnection())
            {
                SqlCommand command = new SqlCommand("CreateProduct", connection);
                command.CommandType = CommandType.StoredProcedure;
                
                command.Parameters.Add(new SqlParameter("@SubCategoryID", p.SubCategoryID));
                command.Parameters.Add(new SqlParameter("@Price", p.Price));
                command.Parameters.Add(new SqlParameter("@Picture", p.Picture));
                command.Parameters.Add(new SqlParameter("@Thumbnail", p.Thumbnail));
                command.Parameters.Add(new SqlParameter("@PosterID", p.PosterID));
                command.Parameters.Add(new SqlParameter("@Content", p.Content));
                command.Parameters.Add(new SqlParameter("@Title", p.Title));
                command.Parameters.Add(new SqlParameter("@State", p.State));
 

                SqlParameter isCreated = new SqlParameter("@isCreated", DbType.Int32);
                isCreated.Direction = ParameterDirection.ReturnValue;
                command.Parameters.Add(isCreated);

                try
                {
                    connection.Open();
                    command.ExecuteNonQuery();
                    int isUserCreated = Convert.ToInt32(command.Parameters["@isCreated"].Value.ToString());
                    return isUserCreated == 1;
                }
                catch (Exception ex)
                {
                    return false;
                }
            }
        }
    }
}