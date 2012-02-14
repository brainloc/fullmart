using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Data;

namespace FullMart.Code.DAO
{
    public class UserManagement : Base
    {
        public static bool CreateUser(string Fname, string Lname, string email, string password,DateTime birthday, string state, string CU, string Class, int? roleID)
        {
            using (SqlConnection connection = GetConnection())
            {
                SqlCommand command = new SqlCommand("CreateUser", connection);
                command.CommandType = CommandType.StoredProcedure;

                command.Parameters.Add(new SqlParameter("@fname", Fname));
                command.Parameters.Add(new SqlParameter("@lname", Lname));
                command.Parameters.Add(new SqlParameter("@email", email));
                command.Parameters.Add(new SqlParameter("@pass", password));
                command.Parameters.Add(new SqlParameter("@bday", birthday));
                command.Parameters.Add(new SqlParameter("@state", state));
                command.Parameters.Add(new SqlParameter("@CU", CU));
                command.Parameters.Add(new SqlParameter("@class", Class));
                command.Parameters.Add(new SqlParameter("@roleID", roleID));

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
        public static bool CreateShop(string shopname,string sfname,string slname,string spass,string semail,string sweb,string fregsstate,int? roleID)
        {
            using (SqlConnection connection = GetConnection())
            {
                SqlCommand command = new SqlCommand("CreateShop", connection);
                command.CommandType = CommandType.StoredProcedure;

                command.Parameters.Add(new SqlParameter("@Shopname", shopname));
                command.Parameters.Add(new SqlParameter("@Fname", sfname));
                command.Parameters.Add(new SqlParameter("@Lname", slname));
                command.Parameters.Add(new SqlParameter("@Pass", spass));
                command.Parameters.Add(new SqlParameter("@Email", semail));
                command.Parameters.Add(new SqlParameter("@Web", sweb));
                command.Parameters.Add(new SqlParameter("@state", fregsstate));
                command.Parameters.Add(new SqlParameter("@roleID", roleID));
                try
                {
                    connection.Open();
                    int tp = command.ExecuteNonQuery();
                    //int isCreated = Convert.ToInt32(command.Parameters[0].ToString());
                    connection.Close();
                    return tp == 1;
                }
                catch (Exception ex)
                {
                    return false;
                }
            }
        }
        public static bool CheckUser(string email)
        {
            using (SqlConnection connection = GetConnection())
            {
                SqlCommand command = new SqlCommand("CheckUser", connection);
                command.CommandType = CommandType.StoredProcedure;
                command.Parameters.Add(new SqlParameter("@email", email));
                try
                {
                    connection.Open();
                    SqlDataAdapter da = new SqlDataAdapter(command);
                    DataTable ds=new DataTable();
                    da.Fill(ds);
                    connection.Close();
                    return ds.Rows.Count == 0;
                }
                catch (Exception ex)
                {
                    return false;
                }
            }
        }
        public static bool Login(string pass,string email)
        {
            using (SqlConnection connection = GetConnection())
            {
                SqlCommand command = new SqlCommand("CheckLogin", connection);
                command.CommandType = CommandType.StoredProcedure;
                command.Parameters.Add(new SqlParameter("@email", email));
                try
                {
                    connection.Open();
                    SqlDataAdapter da = new SqlDataAdapter(command);
                    DataSet ds = new DataSet();
                    da.Fill(ds);
                    connection.Close();
                    return ds.Tables[0].Rows.Count == 0;
                }
                catch (Exception ex)
                {
                    return false;
                }
            }
        }
        public static DataTable GetAllUserByRole(int role) {
            using (SqlConnection connection = GetConnection())
            {
                SqlCommand command = new SqlCommand("GetAllUserByRole", connection);
                command.CommandType = CommandType.StoredProcedure;

                command.Parameters.Add(new SqlParameter("@roleID", role));

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
        public static DataTable SearchAllUserByKey(string key) {
            using (SqlConnection connection = GetConnection())
            {
                SqlCommand command = new SqlCommand("SearchAllUserByKey", connection);
                command.CommandType = CommandType.StoredProcedure;

                command.Parameters.Add(new SqlParameter("@key", key));

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
        public static DataTable GetUserInforByMail(string email) {
            using (SqlConnection connection = GetConnection())
            {
                SqlCommand command = new SqlCommand("GetUserInforByMail", connection);
                command.CommandType = CommandType.StoredProcedure;

                command.Parameters.Add(new SqlParameter("@email", email));

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
        public static bool UpdateUserinfor(string Fname, string Lname, string email, string password, DateTime birthday, string state, string CU, string Class, int roleID,string yahoo,string mobile,string shopname,string web,string wishlist)
        {
            using (SqlConnection connection = GetConnection())
            {
                SqlCommand command = new SqlCommand("UpdateUser", connection);
                command.CommandType = CommandType.StoredProcedure;

                command.Parameters.Add(new SqlParameter("@fname", Fname));
                command.Parameters.Add(new SqlParameter("@lname", Lname));
                command.Parameters.Add(new SqlParameter("@email", email));
                command.Parameters.Add(new SqlParameter("@pass", password));
                command.Parameters.Add(new SqlParameter("@bday", birthday));
                command.Parameters.Add(new SqlParameter("@state", state));
                command.Parameters.Add(new SqlParameter("@CU", CU));
                command.Parameters.Add(new SqlParameter("@class", Class));
                command.Parameters.Add(new SqlParameter("@roleID", roleID));
                command.Parameters.Add(new SqlParameter("@mobile", mobile));
                command.Parameters.Add(new SqlParameter("@yahoo", yahoo));
                command.Parameters.Add(new SqlParameter("@web", web));
                command.Parameters.Add(new SqlParameter("@Shopname", shopname));
                command.Parameters.Add(new SqlParameter("@Wishlist", wishlist));
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
        public static bool DeleteUser(string email)
        {
            using (SqlConnection connection = GetConnection())
            {
                SqlCommand command = new SqlCommand("DeleteUser", connection);
                command.Parameters.Add(new SqlParameter("@email", email));
                command.CommandType = CommandType.StoredProcedure;
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