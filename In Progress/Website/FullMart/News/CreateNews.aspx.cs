using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using FullMart.Code.DAO;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FullMart.News
{
    public partial class CreateNews : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) { 
                string NewID = Request.QueryString["ID"];
                if (string.IsNullOrEmpty(NewID) != true)
                {
                    try
                    {
                        DataTable newDetail = GetNewDetailByID(Convert.ToInt32(NewID));
                        if (newDetail != null && newDetail.Rows.Count > 0)
                        {
                            btnCreateNews.Text = "SAVE";
                            CKContent.Text = newDetail.Rows[0][1].ToString();
                            txttitle.Text = newDetail.Rows[0][0].ToString();
                            CKpreview.Text = newDetail.Rows[0][4].ToString();
                            imgthumbN.ImageUrl = newDetail.Rows[0][5].ToString();
                            txtimagethumb.Text = newDetail.Rows[0][5].ToString();
                        }
                    }
                    catch (Exception ex)
                    {
                    }
                }
            }
        }
        private DataTable GetNewDetailByID(int NewID)
        {
            DataTable newDetail = new DataTable();
            newDetail = NewManagerment.GetNewDetailByID(NewID);
            return newDetail;
        }
        protected void btnCreateNews_Click(object sender, EventArgs e)
        {
            if (btnCreateNews.Text == "SAVE")
            {
                string NewID = Request.QueryString["ID"];
                if (string.IsNullOrEmpty(NewID) != true)
                {
                    string content = HttpUtility.HtmlDecode(CKContent.Text);
                    string preview = HttpUtility.HtmlDecode(CKpreview.Text);
                    string title = txttitle.Text;
                    string thumb = txtimagethumb.Text;
                    if (NewManagerment.UpdateNew(NewID, title, thumb, preview, content))
                    {
                        txtmes.Text = "New Updated successfully !";
                    }
                    else
                    {
                        txtmes.Text = "Get Error while updating, Please check it !";
                    }
                }
            }
            else {

                string content = HttpUtility.HtmlDecode(CKContent.Text);
                string preview = HttpUtility.HtmlDecode(CKpreview.Text);
                string title = txttitle.Text;
                string thumb = txtimagethumb.Text;
                string posterID = "1";
                if (NewManagerment.CreateNew(posterID, title, thumb, preview, content))
                {
                    txtmes.Text = "New Updated successfully !";
                }
                else
                {
                    txtmes.Text = "Get Error while updating, Please check it !";
                }
            }
        }
    }
}