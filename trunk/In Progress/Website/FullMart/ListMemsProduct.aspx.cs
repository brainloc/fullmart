using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using FullMart.Code.DAO;
using System.Data;

namespace FullMart
{
    public partial class ListMemsProduct : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["subcat"] != null)
                {
                    pnViewAll.Visible = false;
                    pnViewSub.Visible = true;
                    string tmp2 = Request.QueryString["subcat"].ToString();
                    dsViewSub.SelectCommand = "SELECT Product.ID, Product.Price, Product.Thumbnail, Product.Title, Product.type, Product.CreatedDate, SubCategory.ID AS Expr1 FROM Product INNER JOIN [User] ON Product.PosterID = [User].ID INNER JOIN SubCategory ON Product.SubCategoryID = SubCategory.ID WHERE ([User].roleID = 3) AND (SubCategory.ID = " + tmp2 + ") ORDER BY Product.CreatedDate DESC";
                    listAllSub(int.Parse(tmp2));
                }
                else
                {
                    if (Request.QueryString["cat"] != null)
                    {
                        pnViewAll.Visible = false;
                        pnViewCat.Visible = true;
                    }
                }
            }
        }
        protected void listAllSub(int id) {
            DataTable tmp1= BindingUltilities.GetNameCatSubCatByIDSub(id);
            if (tmp1 != null && tmp1.Rows.Count > 0) {
                lbSubTitle.Text = tmp1.Rows[0]["NAMESUB"].ToString();
            }
        }
    }
}