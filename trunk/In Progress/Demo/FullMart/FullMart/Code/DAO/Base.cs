using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Configuration;
using System.Data.SqlClient;

namespace FullMart.Code.DAO
{
    public class Base
    {
        public static SqlConnection GetConnection()
        {
            string connectionString = ConfigurationManager.ConnectionStrings["FullMartConnectionString"].ConnectionString;
            return new SqlConnection(connectionString);
        }
    }
}