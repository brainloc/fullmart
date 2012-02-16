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
        
        public static DataTable GetNameCatSubCatByIDSub(int IDSUB) {
            using (SqlConnection connection = GetConnection())
            {
                SqlCommand command = new SqlCommand("GetNameCatSubCatByIDSub", connection);
                command.CommandType = CommandType.StoredProcedure;

                command.Parameters.Add(new SqlParameter("@ID", IDSUB));

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
        public static DataTable GetListSubSameCat(int IDSUB)
        {
            using (SqlConnection connection = GetConnection())
            {
                SqlCommand command = new SqlCommand("GetListSubSameCat", connection);
                command.CommandType = CommandType.StoredProcedure;

                command.Parameters.Add(new SqlParameter("@ID", IDSUB));

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

        public static int AddCategory(string catName, int catOrder)
        {
            using (SqlConnection connection = GetConnection())
            {
                SqlCommand command = new SqlCommand("AddCategory", connection);
                command.CommandType = CommandType.StoredProcedure;

                command.Parameters.Add(new SqlParameter("@CatName", catName));
                command.Parameters.Add(new SqlParameter("@CatOrder", catOrder));
                SqlParameter isUpdated = new SqlParameter("@isCreated", DbType.Int32);
                isUpdated.Direction = ParameterDirection.ReturnValue;
                command.Parameters.Add(isUpdated);
                try
                {
                    connection.Open();
                    command.ExecuteNonQuery();
                    int isCreated = Convert.ToInt32(command.Parameters["@isCreated"].Value.ToString());
                    return isCreated;
                }
                catch (Exception ex)
                {
                    return 0;
                }
            }
        }
        public static bool UpdateCategory(int ID,string catName, int catOrder)
        {
            using (SqlConnection connection = GetConnection())
            {
                SqlCommand command = new SqlCommand("UpdateCategory", connection);
                command.CommandType = CommandType.StoredProcedure;
                command.Parameters.Add(new SqlParameter("@ID", ID));
                command.Parameters.Add(new SqlParameter("@CatName", catName));
                command.Parameters.Add(new SqlParameter("@CatOrder", catOrder));
                SqlParameter isUpdated = new SqlParameter("@isCreated", DbType.Int32);
                isUpdated.Direction = ParameterDirection.ReturnValue;
                command.Parameters.Add(isUpdated);
                try
                {
                    connection.Open();
                    command.ExecuteNonQuery();
                    int isCreated = Convert.ToInt32(command.Parameters["@isCreated"].Value.ToString());
                    return isCreated == 1;
                }
                catch (Exception ex)
                {
                    return false;
                }
            }
        }

        public static int AddSubCategory(int catID, string subcatName, int subcatOrder)
        {
            using (SqlConnection connection = GetConnection())
            {
                SqlCommand command = new SqlCommand("AddSubCategory", connection);
                command.CommandType = CommandType.StoredProcedure;

                command.Parameters.Add(new SqlParameter("@CatID", catID));
                command.Parameters.Add(new SqlParameter("@SubcatName", subcatName));
                command.Parameters.Add(new SqlParameter("@SubcatOrder", subcatOrder));
                SqlParameter isUpdated = new SqlParameter("@isCreated", DbType.Int32);
                isUpdated.Direction = ParameterDirection.ReturnValue;
                command.Parameters.Add(isUpdated);
                try
                {
                    connection.Open();
                    command.ExecuteNonQuery();
                    int isCreated = Convert.ToInt32(command.Parameters["@isCreated"].Value.ToString());
                    return isCreated;
                }
                catch (Exception ex)
                {
                    return 0;
                }
            }
        }

        public static bool UpdateSubCategory(int ID, string catName, int catOrder)
        {
            using (SqlConnection connection = GetConnection())
            {
                SqlCommand command = new SqlCommand("UpdateSubCategory", connection);
                command.CommandType = CommandType.StoredProcedure;
                command.Parameters.Add(new SqlParameter("@ID", ID));
                command.Parameters.Add(new SqlParameter("@CatName", catName));
                command.Parameters.Add(new SqlParameter("@CatOrder", catOrder));
                SqlParameter isUpdated = new SqlParameter("@isCreated", DbType.Int32);
                isUpdated.Direction = ParameterDirection.ReturnValue;
                command.Parameters.Add(isUpdated);
                try
                {
                    connection.Open();
                    command.ExecuteNonQuery();
                    int isCreated = Convert.ToInt32(command.Parameters["@isCreated"].Value.ToString());
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