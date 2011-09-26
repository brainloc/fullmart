using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

namespace CoolNews.Data
{
    /// <summary>
    /// Summary description for DataAccessException
    /// </summary>
    public class DataAccessException : Exception
    {
        public DataAccessException(string message) : base(message)
        {
            //
            // TODO: Add constructor logic here
            //
        }
    }
}
