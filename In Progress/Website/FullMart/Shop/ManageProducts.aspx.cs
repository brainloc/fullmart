using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using FullMart.Code.DAO;

namespace FullMart.Shop
{
    public partial class ManageProducts : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (this.Page.IsPostBack == false)
            {
                BindCategories();

            }
        }

        private void BindCategories()
        {
            DataTable cats = new DataTable();
            cats = BindingUltilities.GetCategories();
            if (cats != null)
            {
                DataRow r = cats.NewRow();
                r["ID"] = "-9999";
                r["Name"] = "Please select a category...";
                cats.Rows.InsertAt(r, 0);
                dlCategories.DataSource = cats;
                dlCategories.DataTextField = "Name";
                dlCategories.DataValueField = "ID";
                dlCategories.DataBind();
                dlCategories.SelectedIndex = 0;
                BindEmptyToSubCat();
            }
        }

        protected void dlCategories_SelectedIndexChanged(object sender, EventArgs e)
        {
            string catID = dlCategories.SelectedItem.Value;
            if (string.IsNullOrEmpty(catID) == false)
            {
                DataTable subCats = new DataTable();
                subCats = BindingUltilities.GetSubCategories(Convert.ToInt32(catID));

                if (subCats != null)
                {
                    dlSubCategories.DataSource = subCats;
                    dlSubCategories.DataTextField = "Name";
                    dlSubCategories.DataValueField = "ID";
                    dlSubCategories.DataBind();
                }
                else
                {
                    dlSubCategories.Items.Clear();
                    BindEmptyToSubCat();
                }
            }
            else
            {
                dlSubCategories.Items.Clear();
                BindEmptyToSubCat();
            }
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
        }

        private void BindEmptyToSubCat()
        {
            DataTable subcats = new DataTable();
            subcats.Columns.Add("ID", typeof(int));
            subcats.Columns.Add("Name", typeof(string));
            DataRow r = subcats.NewRow();
            r["ID"] = "-9999";
            r["Name"] = "Please select a category...";
            subcats.Rows.InsertAt(r, 0);
            dlSubCategories.DataSource = subcats;
            dlSubCategories.DataTextField = "Name";
            dlSubCategories.DataValueField = "ID";
            dlSubCategories.DataBind();
            dlSubCategories.SelectedIndex = 0;
        }

        protected void updateSubCat_Load(object sender, EventArgs e)
        {   
            string selectedIDArgs = Request.Params.Get("__EVENTARGUMENT");
            List<string> eventArgs = selectedIDArgs.Split('$').ToList();            
            string commandName = eventArgs.ElementAt(0);
            int categoryType = eventArgs.Count; //2: Category; 3: Subcategory

            if (this.Page.IsPostBack == true)
            {
                switch (commandName)
                {
                    case "Select":
                        {
                            int catID = Convert.ToInt32(eventArgs.Last());
                            DataTable dsSubcats = BindingUltilities.GetSubCategories(catID);
                            //rpSubCategories.DataSource = dsSubcats;
                            //rpSubCategories.DataBind();
                            break;
                        }
                    case "Delete":
                        {
                            int selectedID = Convert.ToInt32(eventArgs.Last());
                            if (categoryType == 2)
                            {                                
                                BindingUltilities.DisableCategoryItem(selectedID);
                            }
                            else if(categoryType==3)
                            {                                
                                BindingUltilities.DisableSubCategoryItem(selectedID);
                            }
                            break;
                        }
                    case "Insert":
                        {
                            if (categoryType == 2)
                            {
                                string catName = eventArgs.Last();
                                BindingUltilities.AddCategory(catName, 99);
                            }
                            else if(categoryType==3)
                            {
                                int catID = Convert.ToInt32(eventArgs.ElementAt(1));
                                string subcatName = eventArgs.Last();
                                BindingUltilities.AddSubCategory(catID, subcatName, 99);
                            }
                            break;
                        }
                    default:
                        {
                            break;
                        }
                }                    
            }
            else
            {
                //First load so the page only has select event                
                DataTable dsSubcats = BindingUltilities.GetSubCategories(-9999);
                //rpSubCategories.DataSource = dsSubcats;
                //rpSubCategories.DataBind();
            }   
        }

        protected string convertos(object os) {
            bool a = bool.Parse(os.ToString());
            if (a) {
                return "checked=\"checked\"";
            }
            return "";
        }
    }
}