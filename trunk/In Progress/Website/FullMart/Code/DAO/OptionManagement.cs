using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using FullMart.Code.Entities;
using System.Data.SqlClient;
using System.Data;

namespace FullMart.Code.DAO
{
    public class OptionManagement:Base
    {
        public static DataTable GetOption(){
           using (SqlConnection connection = GetConnection())
            {
                SqlCommand command = new SqlCommand("GetGeneralOption", connection);
                command.CommandType = CommandType.StoredProcedure;

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
        public static bool UpdateOption(int ID,string EN,String VI) {
            using (SqlConnection connection = GetConnection())
            {
                SqlCommand command = new SqlCommand("UpdateGeneralOption", connection);
                command.CommandType = CommandType.StoredProcedure;

                command.Parameters.Add(new SqlParameter("@ID", ID));
                command.Parameters.Add(new SqlParameter("@EN", EN));
                command.Parameters.Add(new SqlParameter("@VI", VI));
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
        public static string GetFooter(string lang) {
            DataTable genoption = GetOption();
            if (genoption != null && genoption.Rows.Count > 0)
            {
                if (lang == "VI")
                {
                    return genoption.Rows[1][3].ToString();
                }
                else {
                    return genoption.Rows[1][2].ToString();
                }
            }
            else { return null; }
        }
        public static string GetTermCondition(string lang)
        {
            DataTable genoption = GetOption();
            if (genoption != null && genoption.Rows.Count > 0)
            {
                if (lang == "VI")
                {
                    return genoption.Rows[0][3].ToString();
                }
                else
                {
                    return genoption.Rows[0][2].ToString();
                }
            }
            else { return null; }
        }

        public static string GetTermConditionShop(string lang)
        {
            DataTable genoption = GetOption();
            if (genoption != null && genoption.Rows.Count > 0)
            {
                if (lang == "VI")
                {
                    return genoption.Rows[2][3].ToString();
                }
                else
                {
                    return genoption.Rows[2][2].ToString();
                }
            }
            else { return null; }
        }
    }
}