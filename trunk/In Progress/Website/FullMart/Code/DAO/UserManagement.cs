using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Data;
using System.Web.Security;
using FullMart.Code.Entities;

namespace FullMart.Code.DAO
{
    public class UserManagement : Base
    {
        public static bool CreateUser(User us)
        {
            using (SqlConnection connection = GetConnection())
            {
                SqlCommand command = new SqlCommand("CreateUser", connection);
                command.CommandType = CommandType.StoredProcedure;
                command.Parameters.Add(new SqlParameter("@username", us.username));
                command.Parameters.Add(new SqlParameter("@fname", us.fname));
                command.Parameters.Add(new SqlParameter("@lname", us.lname));
                command.Parameters.Add(new SqlParameter("@email", us.email));
                command.Parameters.Add(new SqlParameter("@pass", us.pass));
                command.Parameters.Add(new SqlParameter("@bday", us.birthday));
                command.Parameters.Add(new SqlParameter("@state", us.state));
                command.Parameters.Add(new SqlParameter("@CU", us.CU));
                command.Parameters.Add(new SqlParameter("@class", us.cls));
                command.Parameters.Add(new SqlParameter("@roleID", us.rID));
                command.Parameters.Add(new SqlParameter("@mobile", us.mobile));
                command.Parameters.Add(new SqlParameter("@yahoo", us.yahoo));
                command.Parameters.Add(new SqlParameter("@web", us.website));
                command.Parameters.Add(new SqlParameter("@wishlist", us.wishtlist));

                SqlParameter isCreated = new SqlParameter("@isCreated", DbType.Int32);
                isCreated.Direction = ParameterDirection.ReturnValue;
                command.Parameters.Add(isCreated);

                try
                {
                    connection.Open();
                    command.ExecuteNonQuery();
                    int isUserCreated = Convert.ToInt32(command.Parameters["@isCreated"].Value.ToString());
                    if (isUserCreated == 1) {
                        Roles.AddUserToRole(us.username, us.rID.ToString());
                        return true;
                    }
                    return false;
                }
                catch (Exception ex)
                {
                    return false;
                }
            }
        }
        public static bool CreateShop(string shopname,string userName,string Adress,string Phone,string Yahoo)
        {
            using (SqlConnection connection = GetConnection())
            {
                SqlCommand command = new SqlCommand("CreateShop", connection);
                command.CommandType = CommandType.StoredProcedure;

                command.Parameters.Add(new SqlParameter("@Shopname", shopname));
                command.Parameters.Add(new SqlParameter("@username", userName));
                command.Parameters.Add(new SqlParameter("@Adress", Adress));
                command.Parameters.Add(new SqlParameter("@phone", Phone));
                command.Parameters.Add(new SqlParameter("@chat", Yahoo));
                SqlParameter Created = new SqlParameter("@isCreated", DbType.Int32);
                Created.Direction = ParameterDirection.ReturnValue;
                command.Parameters.Add(Created);
                try
                {
                    connection.Open();
                    int tp = command.ExecuteNonQuery();
                    int isCreated = Convert.ToInt32(command.Parameters["@isCreated"].Value.ToString());
                    connection.Close();
                    if (isCreated == 1)
                    {
                        Roles.RemoveUserFromRole(userName, "3");
                        Roles.AddUserToRole(userName, "2");
                        return true;
                    }
                    return false;
                }
                catch (Exception ex)
                {
                    return false;
                }
            }
        }
        public static bool CheckUsermail(string email)
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
        public static bool CheckUsername(string username)
        {
            using (SqlConnection connection = GetConnection())
            {
                SqlCommand command = new SqlCommand("CheckUser2", connection);
                command.CommandType = CommandType.StoredProcedure;
                command.Parameters.Add(new SqlParameter("@username", username));
                try
                {
                    connection.Open();
                    SqlDataAdapter da = new SqlDataAdapter(command);
                    DataTable ds = new DataTable();
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
        public static DataTable Login(string pass,string email)
        {
            using (SqlConnection connection = GetConnection())
            {
                SqlCommand command = new SqlCommand("CheckLogin", connection);
                command.CommandType = CommandType.StoredProcedure;
                command.Parameters.Add(new SqlParameter("@email", email));
                command.Parameters.Add(new SqlParameter("@pass", pass));
                try
                {
                    connection.Open();
                    SqlDataAdapter da = new SqlDataAdapter(command);
                    DataTable ds = new DataTable();
                    da.Fill(ds);
                    connection.Close();
                    return ds;
                }
                catch (Exception ex)
                {
                    return null;
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
        public static DataTable GetShopInfor(int ID)
        {
            using (SqlConnection connection = GetConnection())
            {
                SqlCommand command = new SqlCommand("GetShopInfor", connection);
                command.CommandType = CommandType.StoredProcedure;

                command.Parameters.Add(new SqlParameter("@ID", ID));

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

        public static DataTable GetAllProductsByPoster(int ID)
        {
            using (SqlConnection connection = GetConnection())
            {
                SqlCommand command = new SqlCommand("GetAllProductsByPoster", connection);
                command.CommandType = CommandType.StoredProcedure;

                command.Parameters.Add(new SqlParameter("@PosterID", ID));

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

        public static DataTable GetUShopByShopID(int ID)
        {
            using (SqlConnection connection = GetConnection())
            {
                SqlCommand command = new SqlCommand("GetUShopByShopID", connection);
                command.CommandType = CommandType.StoredProcedure;

                command.Parameters.Add(new SqlParameter("@ID", ID));

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
        public static bool UpdateUserinfor(string username,string Fname, string Lname, string email, string password, DateTime birthday, string state, string CU, string Class, int roleID,string yahoo,string mobile,string shopname,string web,string wishlist)
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
                    if (isUserCreated == 1)
                    {
                        Roles.RemoveUserFromRole(username, "1");
                        Roles.RemoveUserFromRole(username, "2");
                        Roles.RemoveUserFromRole(email, "1");
                        Roles.RemoveUserFromRole(email, "2");
                        Roles.RemoveUserFromRole(username, "3");
                        Roles.RemoveUserFromRole(email, "3");
                        Roles.AddUserToRole(username, roleID.ToString());
                        Roles.AddUserToRole(email, roleID.ToString());
                        return true;
                    }
                    return false;
                }
                catch (Exception ex)
                {
                    return false;
                }
            }
        }

        public static bool UpdateShopbyUser(string shopname, string userName, string Adress, string Phone, string Yahoo)
        {
            using (SqlConnection connection = GetConnection())
            {
                SqlCommand command = new SqlCommand("UpdateShopbyUser", connection);
                command.CommandType = CommandType.StoredProcedure;

                command.Parameters.Add(new SqlParameter("@Shopname", shopname));
                command.Parameters.Add(new SqlParameter("@username", userName));
                command.Parameters.Add(new SqlParameter("@Adress", Adress));
                command.Parameters.Add(new SqlParameter("@phone", Phone));
                command.Parameters.Add(new SqlParameter("@chat", Yahoo));
                SqlParameter Created = new SqlParameter("@isCreated", DbType.Int32);
                Created.Direction = ParameterDirection.ReturnValue;
                command.Parameters.Add(Created);
                try
                {
                    connection.Open();
                    int tp = command.ExecuteNonQuery();
                    int isCreated = Convert.ToInt32(command.Parameters["@isCreated"].Value.ToString());
                    connection.Close();
                    return isCreated == 1;
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

        public static bool banUnban(int ID,bool status)
        {
            using (SqlConnection connection = GetConnection())
            {
                SqlCommand command = new SqlCommand("BanUnBanUS", connection);
                command.Parameters.Add(new SqlParameter("@ID", ID));
                command.Parameters.Add(new SqlParameter("@status", status));
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

        public static DataTable GetUserRole(string email)
        {
            using (SqlConnection connection = GetConnection())
            {
                SqlCommand command = new SqlCommand("GetUserRole", connection);
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

        public static DataTable GetUserInforbyID(int ID)
        {
            using (SqlConnection connection = GetConnection())
            {
                SqlCommand command = new SqlCommand("GetUserInforbyID", connection);
                command.CommandType = CommandType.StoredProcedure;

                command.Parameters.Add(new SqlParameter("@ID", ID));

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
        
        public static bool isAdminbyNoM(string NoM) {
            DataTable tmpAdmin= GetUserRole(NoM);
            if (tmpAdmin != null && tmpAdmin.Rows.Count > 0) {
                if (tmpAdmin.Rows[0]["roleID"].ToString() == "1") {
                    return true;
                }
            }
            return false;
        }

        public static bool UpdateUserInfo(User us)
        {
            using (SqlConnection connection = GetConnection())
            {
                SqlCommand command = new SqlCommand("UpdateUserInfo", connection);
                command.CommandType = CommandType.StoredProcedure;
                command.Parameters.Add(new SqlParameter("@ID", us.ID));
                command.Parameters.Add(new SqlParameter("@fname", us.fname));
                command.Parameters.Add(new SqlParameter("@lname", us.lname));
                command.Parameters.Add(new SqlParameter("@email", us.email));
                command.Parameters.Add(new SqlParameter("@pass", us.pass));
                command.Parameters.Add(new SqlParameter("@bday", us.birthday));
                command.Parameters.Add(new SqlParameter("@state", us.state));
                command.Parameters.Add(new SqlParameter("@CU", us.CU));
                command.Parameters.Add(new SqlParameter("@class", us.cls));
                command.Parameters.Add(new SqlParameter("@mobile", us.mobile));
                command.Parameters.Add(new SqlParameter("@yahoo", us.yahoo));
                command.Parameters.Add(new SqlParameter("@web", us.website));
                command.Parameters.Add(new SqlParameter("@wishlist", us.wishtlist));

                SqlParameter isUpdated = new SqlParameter("@isUpdated", DbType.Int32);
                isUpdated.Direction = ParameterDirection.ReturnValue;
                command.Parameters.Add(isUpdated);

                try
                {
                    connection.Open();
                    command.ExecuteNonQuery();
                    int isUserUpdated = Convert.ToInt32(command.Parameters["@isUpdated"].Value.ToString());
                    return isUserUpdated == 1;
                }
                catch (Exception ex)
                {
                    ex.ToString();
                    return false;
                }
            }
        }
    }
}