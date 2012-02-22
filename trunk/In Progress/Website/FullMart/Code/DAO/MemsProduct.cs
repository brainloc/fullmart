using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using FullMart.Code.Entities;
using System.Data.SqlClient;
using System.Data;

namespace FullMart.Code.DAO
{
    public class MemsProduct:Base
    {
        public static bool CreateMemsProduct(Product p, int type)
        {
            using (SqlConnection connection = GetConnection())
            {
                SqlCommand command = new SqlCommand("CreateProduct", connection);
                command.CommandType = CommandType.StoredProcedure;
                command.Parameters.Add(new SqlParameter("@Type", type));
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

        public static bool UpdateMemsProduct(Product p, int type)
        {
            using (SqlConnection connection = GetConnection())
            {
                SqlCommand command = new SqlCommand("UpdateProduct", connection);
                command.CommandType = CommandType.StoredProcedure;
                command.Parameters.Add(new SqlParameter("@ID", p.ID));
                command.Parameters.Add(new SqlParameter("@Type", type));
                command.Parameters.Add(new SqlParameter("@SubCategoryID", p.SubCategoryID));
                command.Parameters.Add(new SqlParameter("@Price", p.Price));
                command.Parameters.Add(new SqlParameter("@Picture", p.Picture));
                command.Parameters.Add(new SqlParameter("@Thumbnail", p.Thumbnail));
                command.Parameters.Add(new SqlParameter("@PosterID", p.PosterID));
                command.Parameters.Add(new SqlParameter("@Content", p.Content));
                command.Parameters.Add(new SqlParameter("@Title", p.Title));
                command.Parameters.Add(new SqlParameter("@State", p.State));

                try
                {
                    connection.Open();
                    int isUserCreated = command.ExecuteNonQuery();
                    return isUserCreated == -1;
                }
                catch (Exception ex)
                {
                    return false;
                }
            }
        }
        public static DataTable GetMemsProductDetailByID(int productID)
        {
            using (SqlConnection connection = GetConnection())
            {
                SqlCommand command = new SqlCommand("GetMemsProductDetail", connection);
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

        public static DataTable GetAllMemsProductsOfCategoryBySubCatID(int subCatID)
        {
            using (SqlConnection connection = GetConnection())
            {
                SqlCommand command = new SqlCommand("GetAllMemsProductsOfCategoryBySubCatID", connection);
                command.CommandType = CommandType.StoredProcedure;

                command.Parameters.Add(new SqlParameter("@SubCatID", subCatID));

                SqlDataAdapter dbAdapter = new SqlDataAdapter(command);
                DataTable productsOfCategory = new DataTable();

                try
                {
                    connection.Open();
                    dbAdapter.Fill(productsOfCategory);

                    if (productsOfCategory != null && productsOfCategory.Rows.Count > 0)
                    {
                        return productsOfCategory;
                    }
                    return null;
                }
                catch (Exception ex)
                {
                    return null;
                }
            }
        }

        public static DataTable GetAllMemsProductsOfPoster(int posterID)
        {
            using (SqlConnection connection = GetConnection())
            {
                SqlCommand command = new SqlCommand("GetAllMemsProductsByPoster", connection);
                command.CommandType = CommandType.StoredProcedure;

                command.Parameters.Add(new SqlParameter("@PosterID", posterID));

                SqlDataAdapter dbAdapter = new SqlDataAdapter(command);
                DataTable productsByPoster = new DataTable();

                try
                {
                    connection.Open();
                    dbAdapter.Fill(productsByPoster);

                    if (productsByPoster != null && productsByPoster.Rows.Count > 0)
                    {
                        return productsByPoster;
                    }
                    return null;
                }
                catch (Exception ex)
                {
                    return null;
                }
            }
        }

        public static DataTable GetAllMemsProductsOfCategory(int catID)
        {
            using (SqlConnection connection = GetConnection())
            {
                SqlCommand command = new SqlCommand("GetAllMemsProductsOfCategory", connection);
                command.CommandType = CommandType.StoredProcedure;

                command.Parameters.Add(new SqlParameter("@CatID", catID));

                SqlDataAdapter dbAdapter = new SqlDataAdapter(command);
                DataTable productsOfCategory = new DataTable();

                try
                {
                    connection.Open();
                    dbAdapter.Fill(productsOfCategory);

                    if (productsOfCategory != null && productsOfCategory.Rows.Count > 0)
                    {
                        return productsOfCategory;
                    }
                    return null;
                }
                catch (Exception ex)
                {
                    return null;
                }
            }
        }

        public static DataTable SearchAllMemsProductsOfCategory(int catID, string title)
        {
            using (SqlConnection connection = GetConnection())
            {
                SqlCommand command = new SqlCommand("SearchAllMemsProductsOfCategory", connection);
                command.CommandType = CommandType.StoredProcedure;

                command.Parameters.Add(new SqlParameter("@CatID", catID));
                command.Parameters.Add(new SqlParameter("@Key", title));

                SqlDataAdapter dbAdapter = new SqlDataAdapter(command);
                DataTable productsOfCategory = new DataTable();

                try
                {
                    connection.Open();
                    dbAdapter.Fill(productsOfCategory);

                    if (productsOfCategory != null && productsOfCategory.Rows.Count > 0)
                    {
                        return productsOfCategory;
                    }
                    return null;
                }
                catch (Exception ex)
                {
                    return null;
                }
            }
        }

        public static DataTable SearchAllMemsProductsOfByKey(string title)
        {
            using (SqlConnection connection = GetConnection())
            {
                SqlCommand command = new SqlCommand("SearchAllMemsProducts", connection);
                command.CommandType = CommandType.StoredProcedure;

                command.Parameters.Add(new SqlParameter("@Key", title));

                SqlDataAdapter dbAdapter = new SqlDataAdapter(command);
                DataTable productsOfCategory = new DataTable();

                try
                {
                    connection.Open();
                    dbAdapter.Fill(productsOfCategory);

                    if (productsOfCategory != null && productsOfCategory.Rows.Count > 0)
                    {
                        return productsOfCategory;
                    }
                    return null;
                }
                catch (Exception ex)
                {
                    return null;
                }
            }
        }

        public static DataTable GetAllMemsProductsInSubCat(int subcatID)
        {
            using (SqlConnection connection = GetConnection())
            {
                SqlCommand command = new SqlCommand("GetAllMemsProductsInSubCategory", connection);
                command.CommandType = CommandType.StoredProcedure;

                command.Parameters.Add(new SqlParameter("@SubcatID", subcatID));

                SqlDataAdapter dbAdapter = new SqlDataAdapter(command);
                DataTable productsOfSubCategory = new DataTable();

                try
                {
                    connection.Open();
                    dbAdapter.Fill(productsOfSubCategory);

                    if (productsOfSubCategory != null && productsOfSubCategory.Rows.Count > 0)
                    {
                        return productsOfSubCategory;
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