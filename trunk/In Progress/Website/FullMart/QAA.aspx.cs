using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text.RegularExpressions;

namespace FullMart
{
    public partial class QAA : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected string correctshortCT(object content, int length)
        {
            if (content != DBNull.Value)
            {
                string tmp1 = content.ToString();
                tmp1 = Regex.Replace(tmp1, @"<(.|\n)*?>", string.Empty);
                if (tmp1.Length > length)
                {
                    return tmp1.Substring(0, length) + "...";
                }
                else { return tmp1; }
            }
            return content.ToString();
        }
    }
}