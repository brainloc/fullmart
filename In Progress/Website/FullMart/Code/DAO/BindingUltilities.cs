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

        public static DataTable GetStates()
        {
            using (SqlConnection connection = GetConnection())
            {
                SqlCommand command = new SqlCommand("GetStates", connection);
                command.CommandType = CommandType.StoredProcedure;

                SqlDataAdapter dbAdapter = new SqlDataAdapter(command);
                DataTable allStates = new DataTable();

                try
                {
                    connection.Open();
                    dbAdapter.Fill(allStates);

                    if (allStates != null && allStates.Rows.Count > 0)
                    {
                        return allStates;
                    }
                    return null;
                }
                catch (Exception ex)
                {
                    return null;
                }
            }
        }

        public static void DisableCategoryItem(int catID)
        {
            using (SqlConnection connection = GetConnection())
            {
                SqlCommand command = new SqlCommand("DisableCategoryItem", connection);
                command.CommandType = CommandType.StoredProcedure;

                command.Parameters.Add(new SqlParameter("@CatID", catID));
                
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

        public static void DisableSubCategoryItem(int SubcatID)
        {
            using (SqlConnection connection = GetConnection())
            {
                SqlCommand command = new SqlCommand("DisableCategoryItem", connection);
                command.CommandType = CommandType.StoredProcedure;

                command.Parameters.Add(new SqlParameter("@CatID", SubcatID));

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

        public static void AddCategory(string catName, int catOrder)
        {
            using (SqlConnection connection = GetConnection())
            {
                SqlCommand command = new SqlCommand("AddCategory", connection);
                command.CommandType = CommandType.StoredProcedure;

                command.Parameters.Add(new SqlParameter("@CatName", catName));
                command.Parameters.Add(new SqlParameter("@CatOrder", catOrder));

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

        public static void AddSubCategory(int catID, string subcatName, int subcatOrder)
        {
            using (SqlConnection connection = GetConnection())
            {
                SqlCommand command = new SqlCommand("AddSubCategory", connection);
                command.CommandType = CommandType.StoredProcedure;

                command.Parameters.Add(new SqlParameter("@CatID", catID));
                command.Parameters.Add(new SqlParameter("@SubcatName", subcatName));
                command.Parameters.Add(new SqlParameter("@SubcatOrder", subcatOrder));

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