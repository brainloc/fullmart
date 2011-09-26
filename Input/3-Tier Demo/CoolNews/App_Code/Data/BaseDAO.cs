using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

/// <summary>
/// Summary description for BaseDAO
/// </summary>
public class BaseDAO
{
	public BaseDAO()
	{
		//
		// TODO: Add constructor logic here
		//
	}
    
    public SqlConnection GetConnection()
    {
        return new SqlConnection(ConfigurationManager.ConnectionStrings["NewsConnection"].ConnectionString);
    }
}
