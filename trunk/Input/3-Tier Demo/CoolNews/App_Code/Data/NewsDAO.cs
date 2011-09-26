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
    /// Summary description for NewsDAO
    /// </summary>
    public class NewsDAO : BaseDAO
    {
        public NewsDAO()
        {
            //
            // TODO: Add constructor logic here
            //
        }
        private News CreateNewsFromReader(IDataReader reader)
        {
            News news = new News();
            news.ID = (long)reader["ID"];
            news.CatID = (long)reader["CatID"];
            news.Title = (string)reader["Title"];
            news.Excerpt = (string)reader["Excerpt"];
            news.Body = (string)reader["Body"];
            news.Picture = (string)reader["Picture"];
            news.Authors = (string)reader["Authors"];
            news.Keywords = (string)reader["Keywords"];
            news.TotalViews = (long)reader["TotalViews"];
            news.LastModification = (DateTime)reader["LastModification"];
            news.CreationTime = (DateTime)reader["CreationTime"];            
            return news;
        }

        public bool CheckTitle(News news)
        {
            using (SqlConnection connection = GetConnection())
            {
                SqlCommand command = new SqlCommand("spNewsCheckTitle", connection);
                command.CommandType = CommandType.StoredProcedure;
                command.Parameters.Add(new SqlParameter("@Title", news.Title));
                command.Parameters.Add(new SqlParameter("@CatID", news.CatID));
                
                connection.Open();
                using (IDataReader reader = command.ExecuteReader(CommandBehavior.CloseConnection))
                {  
                    return reader.Read();
                }
            }
        }

        public void CreateNews(News news)
        {
            using (SqlConnection connection = GetConnection())
            {
                SqlCommand command = new SqlCommand("spNewsCreate", connection);
                command.CommandType = CommandType.StoredProcedure;

                command.Parameters.Add(new SqlParameter("@CatID", news.CatID));
                command.Parameters.Add(new SqlParameter("@Title", news.Title));
                command.Parameters.Add(new SqlParameter("@Excerpt", news.Excerpt));
                command.Parameters.Add(new SqlParameter("@Body", news.Body));
                command.Parameters.Add(new SqlParameter("@Picture", news.Picture));
                command.Parameters.Add(new SqlParameter("@Authors", news.Authors));
                command.Parameters.Add(new SqlParameter("@Keywords", news.Keywords));
                command.Parameters.Add(new SqlParameter("@TotalViews", news.TotalViews));
                command.Parameters.Add(new SqlParameter("@LastModification", news.LastModification));
                command.Parameters.Add(new SqlParameter("@CreationTime", news.CreationTime));
                 
                SqlParameter paramID = new SqlParameter("@ID", SqlDbType.BigInt, 8);
                paramID.Direction = ParameterDirection.Output;
                command.Parameters.Add(paramID);

                connection.Open();
                command.ExecuteNonQuery();
                if (paramID.Value != DBNull.Value)
                    news.ID = (long)paramID.Value;
                else
                    throw new DataAccessException(String.Format(Resources.Strings.CreateEntityException, "News"));
            }
        }

        public void UpdateNews(News news)
        {
            using (SqlConnection connection = GetConnection())
            {
                SqlCommand command = new SqlCommand("spNewsUpdate", connection);
                command.CommandType = CommandType.StoredProcedure;

                command.Parameters.Add(new SqlParameter("@ID", news.ID));
                command.Parameters.Add(new SqlParameter("@CatID", news.CatID));
                command.Parameters.Add(new SqlParameter("@Title", news.Title));
                command.Parameters.Add(new SqlParameter("@Excerpt", news.Excerpt));
                command.Parameters.Add(new SqlParameter("@Body", news.Body));
                command.Parameters.Add(new SqlParameter("@Picture", news.Picture));
                command.Parameters.Add(new SqlParameter("@Authors", news.Authors));
                command.Parameters.Add(new SqlParameter("@Keywords", news.Keywords));
                command.Parameters.Add(new SqlParameter("@TotalViews", news.TotalViews));
                command.Parameters.Add(new SqlParameter("@LastModification", DateTime.Now));
                command.Parameters.Add(new SqlParameter("@CreationTime", news.CreationTime));
                
                connection.Open();
                if (command.ExecuteNonQuery() <= 0)
                    throw new DataAccessException(String.Format(Resources.Strings.UpdateEntityException, "News", news.ID));
            }
        }

        public void DeleteNews(News news)
        {
            using (SqlConnection connection = GetConnection())
            {
                SqlCommand command = new SqlCommand("spNewsDelete", connection);
                command.CommandType = CommandType.StoredProcedure;

                command.Parameters.Add(new SqlParameter("@ID", news.ID));

                connection.Open();
                if (command.ExecuteNonQuery() <= 0)
                    throw new DataAccessException(String.Format(Resources.Strings.DeleteEntityException, "News", news.ID));
            }
        }

        public News GetNewsByID(long ID)
        {
            using (SqlConnection connection = GetConnection())
            {
                SqlCommand command = new SqlCommand("spNewsGetById", connection);
                command.CommandType = CommandType.StoredProcedure;

                command.Parameters.Add(new SqlParameter("@ID", ID));

                connection.Open();
                News news = null;
                using (IDataReader reader = command.ExecuteReader(CommandBehavior.CloseConnection))
                {
                    if (reader.Read())
                        news = CreateNewsFromReader(reader);
                    else
                        throw new DataAccessException(String.Format(Resources.Strings.GetEntityException, "News", ID));
                }

                return news;
            }
        }

        public List<News> GetNewsOfCategory(long CatID)
        {
            using (SqlConnection connection = GetConnection())
            {
                SqlCommand command = new SqlCommand("spNewsGetOfCategory", connection);
                command.CommandType = CommandType.StoredProcedure;

                command.Parameters.Add(new SqlParameter("@CatID", CatID));

                connection.Open();
                List<News> newsList = new List<News>();
                using (IDataReader reader = command.ExecuteReader(CommandBehavior.CloseConnection))
                {
                    while (reader.Read())
                    {
                        newsList.Add(CreateNewsFromReader(reader));
                    }
                }
                return newsList;
            }
        }

        public News GetNewsTopOfCategory(long CatID)
        {
            using (SqlConnection connection = GetConnection())
            {
                SqlCommand command = new SqlCommand("spNewsTopGetOfCategory", connection);
                command.CommandType = CommandType.StoredProcedure;
                command.Parameters.Add(new SqlParameter("@CatID", CatID));
                connection.Open();
                News news = null;
                using (IDataReader reader = command.ExecuteReader(CommandBehavior.CloseConnection))
                {
                    if (reader.Read())
                    {
                        news = CreateNewsFromReader(reader);
                    }
                }
                return news;
            }
        }

        public void UpdateTotalViews(long newsID)
        {
            using (SqlConnection connection = GetConnection())
            {
                SqlCommand command = new SqlCommand("spNewsUpdateTotalViews", connection);
                command.CommandType = CommandType.StoredProcedure;

                command.Parameters.Add(new SqlParameter("@ID", newsID));                

                connection.Open();
                if (command.ExecuteNonQuery() <= 0)
                    throw new DataAccessException(String.Format(Resources.Strings.UpdateEntityException, "News", newsID));
            }
        }

        public List<News> GetNewsTopNewInCategoryByCatID(long CatID)
        {
            using (SqlConnection conn = GetConnection())
            {
                SqlCommand command = new SqlCommand("spNewsTopNewInCategoryGetByID", conn);
                command.CommandType = CommandType.StoredProcedure;
                command.Parameters.Add(new SqlParameter("@CatID", CatID));
               conn.Open();
                List<News> news = new List<News>();
                using (IDataReader reader = command.ExecuteReader(CommandBehavior.CloseConnection))
                {
                    while (reader.Read())
                    {
                        news.Add(CreateNewsFromReader(reader));
                    }
                }
                return news;
            }
        }
    }
}