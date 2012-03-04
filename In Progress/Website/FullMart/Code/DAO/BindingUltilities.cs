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

        public static void DisableState(int ID)
        {
            using (SqlConnection connection = GetConnection())
            {
                SqlCommand command = new SqlCommand("DisableState", connection);
                command.CommandType = CommandType.StoredProcedure;

                command.Parameters.Add(new SqlParameter("@ID", ID));

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

        public static void DisableSubState(int ID)
        {
            using (SqlConnection connection = GetConnection())
            {
                SqlCommand command = new SqlCommand("DisableSubState", connection);
                command.CommandType = CommandType.StoredProcedure;

                command.Parameters.Add(new SqlParameter("@ID", ID));

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

        public static int AddState(string Name, int Order)
        {
            using (SqlConnection connection = GetConnection())
            {
                SqlCommand command = new SqlCommand("CreateState", connection);
                command.CommandType = CommandType.StoredProcedure;

                command.Parameters.Add(new SqlParameter("@Name", Name));
                command.Parameters.Add(new SqlParameter("@Order", Order));
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

        public static int AddSubState(int ID, string Name, int Order)
        {
            using (SqlConnection connection = GetConnection())
            {
                SqlCommand command = new SqlCommand("CreateSubState", connection);
                command.CommandType = CommandType.StoredProcedure;

                command.Parameters.Add(new SqlParameter("@ID", ID));
                command.Parameters.Add(new SqlParameter("@Name", Name));
                command.Parameters.Add(new SqlParameter("@Order", Order));
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

        public static bool UpdateState(int ID, string Name, int Order)
        {
            using (SqlConnection connection = GetConnection())
            {
                SqlCommand command = new SqlCommand("UpdateState", connection);
                command.CommandType = CommandType.StoredProcedure;
                command.Parameters.Add(new SqlParameter("@ID", ID));
                command.Parameters.Add(new SqlParameter("@Name", Name));
                command.Parameters.Add(new SqlParameter("@Order", Order));
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

        public static bool UpdateSubState(int ID, string Name, int Order)
        {
            using (SqlConnection connection = GetConnection())
            {
                SqlCommand command = new SqlCommand("UpdateSubState", connection);
                command.CommandType = CommandType.StoredProcedure;
                command.Parameters.Add(new SqlParameter("@ID", ID));
                command.Parameters.Add(new SqlParameter("@Name", Name));
                command.Parameters.Add(new SqlParameter("@Order", Order));
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

        public static DataTable GetZoneByStateID(int stateID)
        {
            using (SqlConnection connection = GetConnection())
            {
                SqlCommand command = new SqlCommand("GetZoneByStateID", connection);
                command.CommandType = CommandType.StoredProcedure;
                command.Parameters.Add(new SqlParameter("@StateID", stateID));

                SqlDataAdapter dbAdapter = new SqlDataAdapter(command);
                DataTable zoneOfState = new DataTable();

                try
                {
                    connection.Open();
                    dbAdapter.Fill(zoneOfState);

                    if (zoneOfState != null && zoneOfState.Rows.Count > 0)
                    {
                        return zoneOfState;
                    }
                    return null;
                }
                catch (Exception ex)
                {
                    return null;
                }
            }
        }

        public static string GetResourceValue(string key) {
            return Resources.LocalizedText.ResourceManager.GetString(key);
        }

        public static int GetUnreadMailCount(int userID)
        {
            using (SqlConnection connection = GetConnection())
            {
                SqlCommand command = new SqlCommand("GetUnreadMailCount", connection);
                command.CommandType = CommandType.StoredProcedure;

                command.Parameters.Add(new SqlParameter("@UserID", userID));
                SqlParameter count = new SqlParameter("@UnreadMail", DbType.Int32);
                count.Direction = ParameterDirection.ReturnValue;
                command.Parameters.Add(count);
                try
                {
                    connection.Open();
                    command.ExecuteNonQuery();
                    int unreadMail = Convert.ToInt32(command.Parameters["@UnreadMail"].Value.ToString());
                    return unreadMail;
                }
                catch (Exception ex)
                {
                    return 0;
                }
            }
        }
    }
}