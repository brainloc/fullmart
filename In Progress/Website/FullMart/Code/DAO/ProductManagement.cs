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
                command.Parameters.Add(new SqlParameter("@Type", 1));

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

        public static bool UpdateProduct(Product p)
        {
            using (SqlConnection connection = GetConnection())
            {
                SqlCommand command = new SqlCommand("UpdateProduct", connection);
                command.CommandType = CommandType.StoredProcedure;
                command.Parameters.Add(new SqlParameter("@ID", p.ID));
                command.Parameters.Add(new SqlParameter("@SubCategoryID", p.SubCategoryID));
                command.Parameters.Add(new SqlParameter("@Price", p.Price));
                command.Parameters.Add(new SqlParameter("@Picture", p.Picture));
                command.Parameters.Add(new SqlParameter("@Thumbnail", p.Thumbnail));
                command.Parameters.Add(new SqlParameter("@PosterID", p.PosterID));
                command.Parameters.Add(new SqlParameter("@Content", p.Content));
                command.Parameters.Add(new SqlParameter("@Title", p.Title));
                command.Parameters.Add(new SqlParameter("@State", p.State));
                command.Parameters.Add(new SqlParameter("@Type", 1));
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
        public static bool OutstandProduct(int ID, bool outstand)
        {
            using (SqlConnection connection = GetConnection())
            {
                SqlCommand command = new SqlCommand("OutstandProduct", connection);
                command.CommandType = CommandType.StoredProcedure;
                command.Parameters.Add(new SqlParameter("@ID", ID));
                command.Parameters.Add(new SqlParameter("@os", outstand));

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
        public static bool delProduct(Product p)
        {
            using (SqlConnection connection = GetConnection())
            {
                SqlCommand command = new SqlCommand("delProduct", connection);
                command.CommandType = CommandType.StoredProcedure;
                command.Parameters.Add(new SqlParameter("@ID", p.ID));
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
        public static DataTable GetProductDetailByID(int productID)
        {            
            using (SqlConnection connection = GetConnection())
            {
                SqlCommand command = new SqlCommand("GetProductDetail", connection);
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

        public static DataTable GetAllProductsOfCategoryBySubCatID(int subCatID)
        {
            using (SqlConnection connection = GetConnection())
            {
                SqlCommand command = new SqlCommand("GetAllProductsOfCategoryBySubCatID", connection);
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

        public static DataTable GetAllProductsOfPoster(int posterID)
        {
            using (SqlConnection connection = GetConnection())
            {
                SqlCommand command = new SqlCommand("GetAllProductsByPoster", connection);
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

        public static DataTable GetAllProductsOfCategory(int catID)
        {
            using (SqlConnection connection = GetConnection())
            {
                SqlCommand command = new SqlCommand("GetAllProductsOfCategory", connection);
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

        public static DataTable SearchAllProductsOfCategory(int catID, string title)
        {
            using (SqlConnection connection = GetConnection())
            {
                SqlCommand command = new SqlCommand("SearchAllProductsOfCategory", connection);
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

        public static DataTable SearchAllProductsOfByKey(string title)
        {
            using (SqlConnection connection = GetConnection())
            {
                SqlCommand command = new SqlCommand("SearchAllProducts", connection);
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

        public static DataTable GetAllProductsInSubCat(int subcatID)
        {
            using (SqlConnection connection = GetConnection())
            {
                SqlCommand command = new SqlCommand("GetAllProductsInSubCategory", connection);
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

        public static void AddProductComment(int posterID, int productID, string content)
        {
            using (SqlConnection connection = GetConnection())
            {
                SqlCommand command = new SqlCommand("AddProductComment", connection);
                command.CommandType = CommandType.StoredProcedure;

                command.Parameters.Add(new SqlParameter("@PosterID", posterID));
                command.Parameters.Add(new SqlParameter("@ProductID", productID));
                command.Parameters.Add(new SqlParameter("@Content", content));

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

        public static void AddProductSubComment(int posterID, int commentID, string content)
        {
            using (SqlConnection connection = GetConnection())
            {
                SqlCommand command = new SqlCommand("AddProductSubComment", connection);
                command.CommandType = CommandType.StoredProcedure;

                command.Parameters.Add(new SqlParameter("@PosterID", posterID));
                command.Parameters.Add(new SqlParameter("@CommentID", commentID));
                command.Parameters.Add(new SqlParameter("@Content", content));

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

        public static void DeleteProductSubComment(int subCommentID)
        {
            using (SqlConnection connection = GetConnection())
            {
                SqlCommand command = new SqlCommand("DeleteProductSubComment", connection);
                command.CommandType = CommandType.StoredProcedure;

                command.Parameters.Add(new SqlParameter("@SubCommentID", subCommentID));

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

        public static void DeleteComment(int commentID)
        {
            using (SqlConnection connection = GetConnection())
            {
                SqlCommand command = new SqlCommand("DeleteProductComment", connection);
                command.CommandType = CommandType.StoredProcedure;

                command.Parameters.Add(new SqlParameter("@CommentID", commentID));

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

        public static void AddPurchaseBooking(int productID, int amount, int buyerID, string moreDetail, string recipientName, string recipientPhone, string recipientAddress, string recipientEmail)
        {
            using (SqlConnection connection = GetConnection())
            {
                SqlCommand command = new SqlCommand("AddPurchaseBooking", connection);
                command.CommandType = CommandType.StoredProcedure;

                command.Parameters.Add(new SqlParameter("@ProductID", productID));
                command.Parameters.Add(new SqlParameter("@Amount", amount));
                command.Parameters.Add(new SqlParameter("@BuyerID", buyerID));
                command.Parameters.Add(new SqlParameter("@MoreDetail", moreDetail));
                command.Parameters.Add(new SqlParameter("@RecipientName", recipientName));
                command.Parameters.Add(new SqlParameter("@RecipientPhone", recipientPhone));
                command.Parameters.Add(new SqlParameter("@RecipientAddress", recipientAddress));
                command.Parameters.Add(new SqlParameter("@RecipientEmail", recipientEmail));

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