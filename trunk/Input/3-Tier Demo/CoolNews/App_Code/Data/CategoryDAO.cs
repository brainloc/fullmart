using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Globalization;
using System.Collections.Generic;

using CoolNews.Entities;

namespace CoolNews.Data
{
    /// <summary>
    /// Summary description for CategoryDAO
    /// </summary>
    public class CategoryDAO : BaseDAO
    {
        public CategoryDAO()
        {
            //
            // TODO: Add constructor logic here
            //
        }

        private Category CreateCategoryFromReader(IDataReader reader)
        {
            Category category = new Category();
            category.ID = (long)reader["ID"];
            category.Name = (string)reader["Name"];
            category.Description = (string)reader["Description"];
            category.LastModification = (DateTime)reader["LastModification"];
            category.CreationTime = (DateTime)reader["CreationTime"];
            return category;
        }

        public void CreateCategory(Category category)
        {
            using (SqlConnection connection = GetConnection())
            {
                SqlCommand command = new SqlCommand("spCategoriesCreate", connection);               
                command.CommandType = CommandType.StoredProcedure;

                command.Parameters.Add(new SqlParameter("@Name", category.Name));
                command.Parameters.Add(new SqlParameter("@Description", category.Description));
                command.Parameters.Add(new SqlParameter("@LastModification", category.LastModification));
                command.Parameters.Add(new SqlParameter("@CreationTime", category.CreationTime));
                SqlParameter paramId = new SqlParameter("@ID", SqlDbType.BigInt, 8);
              
                paramId.Direction = ParameterDirection.Output;         
                command.Parameters.Add(paramId);
                connection.Open();
                command.ExecuteNonQuery();
                if (paramId.Value != DBNull.Value)
                    category.ID = (long)paramId.Value;
                else
                    throw new DataAccessException(String.Format(Resources.Strings.CreateEntityException, "Category"));
            }
        }

        public void UpdateCategory(Category category)
        {
            using (SqlConnection connection = GetConnection())
            {
                SqlCommand command = new SqlCommand("spCategoriesUpdate", connection);
                command.CommandType = CommandType.StoredProcedure;

                command.Parameters.Add(new SqlParameter("@ID", category.ID));
                command.Parameters.Add(new SqlParameter("@Name", category.Name));
                command.Parameters.Add(new SqlParameter("@Description", category.Description));
                command.Parameters.Add(new SqlParameter("@LastModification", DateTime.Now));
                command.Parameters.Add(new SqlParameter("@CreationTime", category.CreationTime));

                connection.Open();
                if (command.ExecuteNonQuery() <= 0)
                    throw new DataAccessException(String.Format(Resources.Strings.UpdateEntityException, "Category", category.ID));
            }
        }

        public void DeleteCategory(Category category)
        {
            using (SqlConnection connection = GetConnection())
            {
                SqlCommand command = new SqlCommand("spCategoriesDelete", connection);
                command.CommandType = CommandType.StoredProcedure;

                command.Parameters.Add(new SqlParameter("@ID", category.ID));

                connection.Open();
                if (command.ExecuteNonQuery() <= 0)
                    throw new DataAccessException(String.Format(Resources.Strings.DeleteEntityException, "Category", category.ID));
            }
        }

        public Category GetCategoryByID(long ID)
        {
            using (SqlConnection connection = GetConnection())
            {
                SqlCommand command = new SqlCommand("spCategoriesGetById", connection);
                command.CommandType = CommandType.StoredProcedure;

                command.Parameters.Add(new SqlParameter("@ID", ID));

                connection.Open();
                Category category = null;
                using (IDataReader reader = command.ExecuteReader(CommandBehavior.CloseConnection))
                {
                    if (reader.Read())
                        category = CreateCategoryFromReader(reader);
                    else
                        throw new DataAccessException(String.Format(Resources.Strings.GetEntityException, "Category", ID));
                }

                return category;
            }
        }

        public List<Category> GetCategories()
        {
            using (SqlConnection connection = GetConnection())
            {
                SqlCommand command = new SqlCommand("spCategoriesGetAll", connection);
                command.CommandType = CommandType.StoredProcedure;

                connection.Open();
                List<Category> categories = new List<Category>();
                using (IDataReader reader = command.ExecuteReader(CommandBehavior.CloseConnection))
                {
                    while (reader.Read())
                    {
                        categories.Add(CreateCategoryFromReader(reader));
                    }
                }
                return categories;
            }
        }
    }
}