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
        public static DataTable GetNewDetailByID(int NewID)
        {
            using (SqlConnection connection = GetConnection())
            {
                SqlCommand command = new SqlCommand("GetNewDetail", connection);
                command.CommandType = CommandType.StoredProcedure;

                command.Parameters.Add(new SqlParameter("@ID", NewID));

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
        public static bool UpdateNew(string ID, string title, string imgthumb, string PreviewContent, string Content)
        {
            using (SqlConnection connection = GetConnection())
            {
                SqlCommand command = new SqlCommand("UpdateNew", connection);
                command.CommandType = CommandType.StoredProcedure;

                command.Parameters.Add(new SqlParameter("@ID", ID));
                command.Parameters.Add(new SqlParameter("@title", title));
                command.Parameters.Add(new SqlParameter("@content", Content));
                command.Parameters.Add(new SqlParameter("@preview", PreviewContent));
                command.Parameters.Add(new SqlParameter("@img", imgthumb));

                SqlParameter isUpdated = new SqlParameter("@isUpdated", DbType.Int32);
                isUpdated.Direction = ParameterDirection.ReturnValue;
                command.Parameters.Add(isUpdated);

                try
                {
                    connection.Open();
                    command.ExecuteNonQuery();
                    int isUserCreated = Convert.ToInt32(command.Parameters["@isUpdated"].Value.ToString());
                    return isUserCreated == 1;
                }
                catch (Exception ex)
                {
                    return false;
                }
            }
        }
        public static bool CreateNew(string posterID, string title, string imgthumb, string PreviewContent, string Content)
        {
            using (SqlConnection connection = GetConnection())
            {
                SqlCommand command = new SqlCommand("CreateNew", connection);
                command.CommandType = CommandType.StoredProcedure;

                command.Parameters.Add(new SqlParameter("@posterID", posterID));
                command.Parameters.Add(new SqlParameter("@title", title));
                command.Parameters.Add(new SqlParameter("@content", Content));
                command.Parameters.Add(new SqlParameter("@preview", PreviewContent));
                command.Parameters.Add(new SqlParameter("@img", imgthumb));

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
        public static bool DeleteNew(string NewID) {
            using (SqlConnection connection = GetConnection())
            {
                SqlCommand command = new SqlCommand("DeleteNew", connection);
                command.Parameters.Add(new SqlParameter("@ID", NewID));
                command.CommandType = CommandType.StoredProcedure;
                //SqlParameter intid = new SqlParameter("@ID", DbType.Int32);
                //intid.Value = Convert.ToInt32(NewID);
                //command.Parameters.Add(intid);

                SqlParameter isUpdated = new SqlParameter("@isUpdated", DbType.Int32);
                isUpdated.Direction = ParameterDirection.ReturnValue;
                command.Parameters.Add(isUpdated);

                try
                {
                    connection.Open();
                    command.ExecuteNonQuery();
                    int isUserCreated = Convert.ToInt32(command.Parameters["@isUpdated"].Value.ToString());
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