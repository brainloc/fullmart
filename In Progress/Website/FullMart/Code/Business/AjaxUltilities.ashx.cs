using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using FullMart.Code.DAO;
using System.Data;
using System.Text;

namespace FullMart.Code.Business
{
    /// <summary>
    /// Summary description for AjaxUltilities
    /// </summary>
    public class AjaxUltilities : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            var action = context.Request.Form["action"] != null ? context.Request.Form["action"].Trim().Replace("'", "''") : string.Empty;

            switch (action)
            {
                //case "CreateUser":
                //    {
                //        context.Response.ContentType = "application/html";
                //        var fname = context.Request.Form["ufname"] != null ? context.Request.Form["ufname"].Trim().Replace("'", "''") : string.Empty;
                //        var lname = context.Request.Form["ulname"] != null ? context.Request.Form["ulname"].Trim().Replace("'", "''") : string.Empty;
                //        var ema = context.Request.Form["uemail"] != null ? context.Request.Form["uemail"].Trim().Replace("'", "''") : string.Empty;
                //        var pas = context.Request.Form["upass"] != null ? context.Request.Form["upass"].ToString() : string.Empty;
                //        var bday = context.Request.Form["ubirthday"] != null ? context.Request.Form["ubirthday"].Trim().Replace("'", "''") : string.Empty;
                //        var state = context.Request.Form["freguserstate"] != null ? context.Request.Form["freguserstate"].Trim().Replace("'", "''") : string.Empty;
                //        var CU = context.Request.Form["freguserCU"] != null ? context.Request.Form["freguserCU"].Trim().Replace("'", "''") : string.Empty;
                //        var cls = context.Request.Form["freguserclass"] != null ? context.Request.Form["freguserclass"].Trim().Replace("'", "''") : string.Empty;
                //        int? roleID = 3;

                //        //UserManagement.CreateUser(fname,lname,ema,pas,DateTime.Parse(bday),state,CU,cls,roleID);
                //        bool isUserCreated = UserManagement.CreateUser(fname, lname, ema, pas, DateTime.Parse(bday), state, CU, cls, roleID);
                //        if (isUserCreated == true)
                //        {
                //            context.Response.Write("showdialogr(\"<Center><strong>Conguration!</strong><br />you Are register successfull<br/><br/></center>\", 200, 65, \"\", true,\"Default.aspx\");");
                //        }
                //        else
                //        {
                //            context.Response.Write("showdialog(\"<Center><strong>Error!</strong><br />This User Already Exist !<br/><br/></center>\", 200, 65, \"\", true);");
                //        }
                //        break;
                //    }
                case "CheckUsermail":
                    {
                        context.Response.ContentType = "application/html";
                        var ema = context.Request.Form["uemail"] != null ? context.Request.Form["uemail"].Trim().Replace("'", "''") : string.Empty;

                        //UserManagement.CreateUser(fname,lname,ema,pas,DateTime.Parse(bday),state,CU,cls,roleID);
                        if (UserManagement.CheckUsermail(ema))
                        {
                            context.Response.Write("$('#uscheckm').text('This email is avaliable');$('#uscheckm').css('color','green');");
                        }
                        else { context.Response.Write("$('#uscheckm').text('This email is not avaliable');$('#uscheckm').css('color','red');"); }
                        break;
                    }
                case "CheckUserName":
                    {
                        context.Response.ContentType = "application/html";
                        var name = context.Request.Form["name"] != null ? context.Request.Form["name"].Trim().Replace("'", "''") : string.Empty;

                        //UserManagement.CreateUser(fname,lname,ema,pas,DateTime.Parse(bday),state,CU,cls,roleID);
                        if (UserManagement.CheckUsername(name))
                        {
                            context.Response.Write("$('#checkUSnn').text('This UserName is avaliable');$('#checkUSnn').css('color','green');");
                        }
                        else { context.Response.Write("$('#checkUSnn').text('This UserName is not avaliable');$('#checkUSnn').css('color','red');"); }
                        break;
                    }
                case "EditUser":
                    {
                        context.Response.ContentType = "application/html";
                        int irole = 3;
                        var username = context.Request.Form["username"] != null ? context.Request.Form["username"].Trim().Replace("'", "''") : string.Empty;
                        var email = context.Request.Form["email"] != null ? context.Request.Form["email"].Trim().Replace("'", "''") : string.Empty;
                        var pass = context.Request.Form["pass"] != null ? context.Request.Form["pass"].Trim().Replace("'", "''") : string.Empty;
                        var fname = context.Request.Form["fname"] != null ? context.Request.Form["fname"].Trim().Replace("'", "''") : string.Empty;
                        var ema = context.Request.Form["uemail"] != null ? context.Request.Form["uemail"].Trim().Replace("'", "''") : string.Empty;
                        var lname = context.Request.Form["lname"] != null ? context.Request.Form["lname"].Trim().Replace("'", "''") : string.Empty;
                        var birthday = context.Request.Form["birthday"] != null ? context.Request.Form["birthday"].Trim().Replace("'", "''") : string.Empty;
                        DateTime bday = DateTime.Parse(birthday);
                        var state = context.Request.Form["state"] != null ? context.Request.Form["state"].Trim().Replace("'", "''") : string.Empty;
                        var CU = context.Request.Form["CU"] != null ? context.Request.Form["CU"].Trim().Replace("'", "''") : string.Empty;
                        var cls = context.Request.Form["cls"] != null ? context.Request.Form["cls"].Trim().Replace("'", "''") : string.Empty;
                        var yahoo = context.Request.Form["yahoo"] != null ? context.Request.Form["yahoo"].Trim().Replace("'", "''") : string.Empty;
                        var mobile = context.Request.Form["mobile"] != null ? context.Request.Form["mobile"].Trim().Replace("'", "''") : string.Empty;
                        var shopname = context.Request.Form["shopname"] != null ? context.Request.Form["shopname"].Trim().Replace("'", "''") : string.Empty;
                        var web = context.Request.Form["web"] != null ? context.Request.Form["web"].Trim().Replace("'", "''") : string.Empty;
                        var role = context.Request.Form["role"] != null ? context.Request.Form["role"].Trim().Replace("'", "''") : string.Empty;
                        var wishlist = context.Request.Form["wishlist"] != null ? context.Request.Form["wishlist"].Trim().Replace("'", "''") : string.Empty;
                        role = role.ToLower();
                        switch (role)
                        {
                            case "adminitrator": { irole = 1; break; }
                            case "shop": { irole = 2; break; }
                        }
                        if (UserManagement.UpdateUserinfor(username, fname, lname, email, pass, bday, state, CU, cls, irole, yahoo, mobile, shopname, web, wishlist))
                        {
                            context.Response.Write("$('.simplemodal-data').html('Users Information Update Successfully !');resizeDA(250, 30);");
                        }
                        else
                        {
                            context.Response.Write("$('.simplemodal-data').html('Users Information Update Unsuccessfully !');resizeDA(250, 30);");
                        }
                        break;
                    }
                case "delUser":
                    {
                        context.Response.ContentType = "application/html";
                        var email = context.Request.Form["email"] != null ? context.Request.Form["email"].Trim().Replace("'", "''") : string.Empty;
                        if (UserManagement.DeleteUser(email))
                        {
                            context.Response.Write("$('#cfdelete').hide(); $('.simplemodal-wrap').append('<div class=\"simplemodal-data\"><center>User Disabled !</center></div>');$.delay(1000).modal.close();$('.MNews table tr').each(function(){if($.trim($(this).find('td:nth-child(1)').text())==\"" + email + "\"){$(this).remove();}});");
                        }
                        else { context.Response.Write("$('#cfdelete').hide(); $('.simplemodal-wrap').append('<div class=\"simplemodal-data\"><center>User Undeleted !</center></div>');"); }
                        break;
                    }
                case "delNews":
                    {
                        context.Response.ContentType = "application/html";
                        var ID = context.Request.Form["ID"] != null ? context.Request.Form["ID"].Trim().Replace("'", "''") : string.Empty;
                        if (NewManagerment.DeleteNew(ID))
                        {
                            context.Response.Write("$.modal.close();$('.MNews table tr').each(function(){if($.trim($(this).find('td:nth-child(1)').text())==" + ID + "){$(this).remove();}});");
                        }
                        else { context.Response.Write("$('#cfdeleten').hide(); $('.simplemodal-wrap').append('<div class=\"simplemodal-data\"><center>New Undeleted !</center></div>');"); }
                        break;
                    }
                case "getUserInfor":
                    {
                        context.Response.ContentType = "application/html";
                        var email = context.Request.Form["email"] != null ? context.Request.Form["email"].Trim().Replace("'", "''") : string.Empty;
                        if (UserManagement.GetUserInforByMail(email) != null && UserManagement.GetUserInforByMail(email).Rows.Count != 0)
                        {
                            DataTable temptb = UserManagement.GetUserInforByMail(email);
                            //context.Response.Write("fillviewUser("+temptb.Rows[0][1].ToString()+","+temptb.Rows[0][2].ToString()+","+temptb.Rows[0][3].ToString()+","+temptb.Rows[0][5].ToString()+","+temptb.Rows[0][6].ToString()+","+temptb.Rows[0][7].ToString()+","+temptb.Rows[0][8].ToString()+","+temptb.Rows[0][9].ToString()+","+temptb.Rows[0][11].ToString()+","+temptb.Rows[0][12].ToString()+","+temptb.Rows[0][13].ToString()+","+temptb.Rows[0][14].ToString()+");");
                            //string tmp1 = " $('#tUser').text('" + temptb.Rows[0][3].ToString() + "'); $('#VUEmail').val('" + temptb.Rows[0][3].ToString() + "'); $('#VUFName').val('" + temptb.Rows[0][1].ToString() + "');" +
                            //    " $('#VULName').val('" + temptb.Rows[0][2].ToString() + "'); $('#VUBday').val('" + temptb.Rows[0][5].ToString() + "'); $('#VUState').val('" + temptb.Rows[0][6].ToString() + "');" +
                            //    " $('#VUCU').val('" + temptb.Rows[0][7].ToString() + "'); $('#VUClass').val('" + temptb.Rows[0][8].ToString() + "'); $('#VUCreatedate').val('" + temptb.Rows[0][9].ToString() + "');" +
                            //    " $('#VUYahoo').val('" + temptb.Rows[0][11].ToString() + "'); $('#VUMobile').val('" + temptb.Rows[0][12].ToString() + "'); $('#VUShopName').val('" + temptb.Rows[0][14].ToString() + "'); " +
                            //    "$('#VUWeb').val('" + temptb.Rows[0][15].ToString() + "'); $('#VUWishlist').val('" + temptb.Rows[0][16].ToString() + "');$('#VURole').val('" + temptb.Rows[0][10].ToString() + "');";

                            string tmp1 = "$('#VUEmail').val(\'" + temptb.Rows[0][3].ToString() + "\');";
                            context.Response.Write(tmp1);
                        }
                        else
                        {
                            context.Response.Write("$('#tUser').text('This User Not Avaliable');");
                        }
                        break;
                    }
                case "Login":
                    {
                        context.Response.ContentType = "text/plain";
                        var spass = context.Request.Form["spass"] != null ? context.Request.Form["spass"].ToString() : string.Empty;
                        var semail = context.Request.Form["semail"] != null ? context.Request.Form["semail"].Trim().Replace("'", "''") : string.Empty;
                        //UserManagement.CreateUser(fname,lname,ema,pas,DateTime.Parse(bday),state,CU,cls,roleID);
                        UserManagement.Login(spass, semail);
                        break;
                    }
                case "CreateProduct":
                    {
                        break;
                    }
                case "GetSubCategoriesByCatID":
                    {
                        var subCatID = context.Request.Form["subCatID"] != null ? context.Request.Form["subCatID"].Trim().Replace("'", "''") : string.Empty;
                        if (string.IsNullOrEmpty(subCatID.ToString()) == false)
                        {
                            DataTable subCats = new DataTable();
                            subCats = BindingUltilities.GetSubCategories(Convert.ToInt32(subCatID));

                            if (subCats != null)
                            {
                                StringBuilder bindingHTML = new StringBuilder();
                                foreach (DataRow r in subCats.Rows)
                                {
                                    bindingHTML.AppendFormat("<OPTION value={0}>{1}</OPTION>", r["ID"].ToString(), r["Name"].ToString());
                                }

                                string jsAppendSyntax = string.Format("$('#CatSubCat select:eq(1)').html('{0}');", bindingHTML.ToString());
                                context.Response.Write(jsAppendSyntax);
                            }
                            else
                            {
                                context.Response.Write("$('#CatSubCat select:eq(1)').html('');");
                            }
                        }
                        else
                        {
                            context.Response.Write("$('#CatSubCat select:eq(1)').html('');");
                        }
                        break;
                    }
                case "GetSubStateByID":
                    {
                        context.Response.ContentType = "application/html";
                        var ID = context.Request.Form["ID"] != null ? context.Request.Form["ID"].Trim().Replace("'", "''") : string.Empty;
                        var Target = context.Request.Form["Target"] != null ? context.Request.Form["Target"].Trim().Replace("'", "''") : string.Empty;
                        if (string.IsNullOrEmpty(ID.ToString()) == false)
                        {
                            DataTable subCats = new DataTable();
                            subCats = BindingUltilities.GetZoneByStateID(Convert.ToInt32(ID));
                            string tmp1 = "$('" + Target + "').attr('ref'," + ID + ");";
                            string tmp2 = "";
                            if (subCats != null)
                            {

                                foreach (DataRow r in subCats.Rows)
                                {
                                    tmp2 += "<tr ref='" + r["ID"].ToString() + "'>";
                                    tmp2 += "<td><input ref='" + r["ID"].ToString() + "' value='" + r["Name"].ToString() + "'/></td>";
                                    tmp2 += "<td><input ref='" + r["ID"].ToString() + "' value='" + r["Order"].ToString() + "'/></td>";
                                    tmp2 += "<td><img class='sDel' ref='" + r["ID"].ToString() + "' src='/themes/images/delete.png' /></td>";
                                    tmp2 += "</tr>";
                                }
                                tmp1 += "$('" + Target + "').html(\"" + "$('" + Target + "').html();" + tmp2 + "\");";

                            }
                            context.Response.Write(tmp1);
                        }
                        else
                        {
                            context.Response.Write("alert('ERROR');");
                        }
                        break;
                    }
                case "GetSubCategoriesByCatID1":
                    {
                        context.Response.ContentType = "application/html";
                        var ID = context.Request.Form["ID"] != null ? context.Request.Form["ID"].Trim().Replace("'", "''") : string.Empty;
                        var Target = context.Request.Form["Target"] != null ? context.Request.Form["Target"].Trim().Replace("'", "''") : string.Empty;
                        if (string.IsNullOrEmpty(ID.ToString()) == false)
                        {
                            DataTable subCats = new DataTable();
                            subCats = BindingUltilities.GetSubCategories(Convert.ToInt32(ID));
                            string tmp1 = "$('" + Target + "').attr('ref'," + ID + ");";
                            string tmp2 = "";
                            if (subCats != null)
                            {

                                foreach (DataRow r in subCats.Rows)
                                {
                                    tmp2 += "<tr ref='" + r["ID"].ToString() + "'>";
                                    tmp2 += "<td><input ref='" + r["ID"].ToString() + "' value='" + r["Name"].ToString() + "'/></td>";
                                    tmp2 += "<td><input ref='" + r["ID"].ToString() + "' value='" + r["Order"].ToString() + "'/></td>";
                                    tmp2 += "<td><img class='catDel' ref='" + r["ID"].ToString() + "' src='/themes/images/delete.png' /></td>";
                                    tmp2 += "</tr>";
                                }
                                tmp1 += "$('" + Target + "').html(\"" + "$('" + Target + "').html();" + tmp2 + "\");";

                            }
                            context.Response.Write(tmp1);
                        }
                        else
                        {
                            context.Response.Write("alert('ERROR');");
                        }
                        break;
                    }
                case "InsertCategories":
                    {
                        context.Response.ContentType = "application/html";
                        var Name = context.Request.Form["Name"] != null ? context.Request.Form["Name"].Trim().Replace("'", "''") : string.Empty;
                        var Order = context.Request.Form["Order"] != null ? context.Request.Form["Order"].Trim().Replace("'", "''") : string.Empty;
                        int id = BindingUltilities.AddCategory(Name, int.Parse(Order));
                        if (id > 0)
                        {
                            context.Response.Write("$('table.tbcates tbody').html($('table.tbcates tbody').html() + \"<tr ref='" + id.ToString() + "'><td><input ref='" + id.ToString() + "' value='" + Name + "'/></td><td><input ref='" + id.ToString() + "' value='" + Order + "'/></td><td><img class='catDel' ref='" + id.ToString() + "' src='/themes/images/delete.png' /><img class='bindSubCate' ref='" + id.ToString() + "' src='/themes/images/Arrow_Right.png' /></td></tr>\");");

                        }
                        else
                        {
                            context.Response.Write("alert('Get Error in Create new Categories')");
                        }
                        break;
                    }
                case "InsertState":
                    {
                        context.Response.ContentType = "application/html";
                        var Name = context.Request.Form["Name"] != null ? context.Request.Form["Name"].Trim().Replace("'", "''") : string.Empty;
                        var Order = context.Request.Form["Order"] != null ? context.Request.Form["Order"].Trim().Replace("'", "''") : string.Empty;
                        int id = BindingUltilities.AddState(Name, int.Parse(Order));
                        if (id > 0)
                        {
                            context.Response.Write("$('table.tbstates tbody').html($('table.tbstates tbody').html() + \"<tr ref='" + id.ToString() + "'><td><input ref='" + id.ToString() + "' value='" + Name + "'/></td><td><input ref='" + id.ToString() + "' value='" + Order + "'/></td><td><img class='sDel' ref='" + id.ToString() + "' src='/themes/images/delete.png' /><img class='bindSubstate' ref='" + id.ToString() + "' src='/themes/images/Arrow_Right.png' /></td></tr>\");");

                        }
                        else
                        {
                            context.Response.Write("alert('Get Error in Create new State')");
                        }
                        break;
                    }
                case "InsertSubCategories":
                    {
                        context.Response.ContentType = "application/html";
                        var Name = context.Request.Form["Name"] != null ? context.Request.Form["Name"].Trim().Replace("'", "''") : string.Empty;
                        var CatID = context.Request.Form["CatID"] != null ? context.Request.Form["CatID"].Trim().Replace("'", "''") : string.Empty;
                        var Order = context.Request.Form["Order"] != null ? context.Request.Form["Order"].Trim().Replace("'", "''") : string.Empty;
                        int id = BindingUltilities.AddSubCategory(int.Parse(CatID), Name, int.Parse(Order));
                        if (id > 0)
                        {
                            context.Response.Write("$('table.tbsubcates tbody').html($('table.tbsubcates tbody').html() + \"<tr ref='" + id.ToString() + "'><td><input ref='" + id.ToString() + "' value='" + Name + "'/></td><td><input ref='" + id.ToString() + "' value='" + Order + "'/></td><td><img class='catDel' ref='" + id.ToString() + "' src='/themes/images/delete.png' /></td></tr>\");");

                        }
                        else
                        {
                            context.Response.Write("alert('Get Error in Create new SubCategories')");
                        }
                        break;
                    }
                case "InsertSubState":
                    {
                        context.Response.ContentType = "application/html";
                        var Name = context.Request.Form["Name"] != null ? context.Request.Form["Name"].Trim().Replace("'", "''") : string.Empty;
                        var CatID = context.Request.Form["ID"] != null ? context.Request.Form["ID"].Trim().Replace("'", "''") : string.Empty;
                        var Order = context.Request.Form["Order"] != null ? context.Request.Form["Order"].Trim().Replace("'", "''") : string.Empty;
                        int id = BindingUltilities.AddSubState(int.Parse(CatID), Name, int.Parse(Order));
                        if (id > 0)
                        {
                            context.Response.Write("$('table.tbsubstates tbody').html($('table.tbsubstates tbody').html() + \"<tr ref='" + id.ToString() + "'><td><input ref='" + id.ToString() + "' value='" + Name + "'/></td><td><input ref='" + id.ToString() + "' value='" + Order + "'/></td><td><img class='sDel' ref='" + id.ToString() + "' src='/themes/images/delete.png' /></td></tr>\");");

                        }
                        else
                        {
                            context.Response.Write("alert('Get Error in Create new Zone')");
                        }
                        break;
                    }
                case "CatsDel":
                    {
                        context.Response.ContentType = "application/html";
                        var ID = context.Request.Form["ID"] != null ? context.Request.Form["ID"].Trim().Replace("'", "''") : string.Empty;
                        BindingUltilities.DisableCategoryItem(int.Parse(ID));
                        context.Response.Write("alert('Delete Completed!')");
                        break;
                    }
                case "StateDel":
                    {
                        context.Response.ContentType = "application/html";
                        var ID = context.Request.Form["ID"] != null ? context.Request.Form["ID"].Trim().Replace("'", "''") : string.Empty;
                        BindingUltilities.DisableState(int.Parse(ID));
                        context.Response.Write("alert('Delete Completed!')");
                        break;
                    }
                case "SubCatsDel":
                    {
                        context.Response.ContentType = "application/html";
                        var ID = context.Request.Form["ID"] != null ? context.Request.Form["ID"].Trim().Replace("'", "''") : string.Empty;
                        BindingUltilities.DisableSubCategoryItem(int.Parse(ID));
                        context.Response.Write("alert('Delete Completed!')");
                        break;
                    }
                case "SubStateDel":
                    {
                        context.Response.ContentType = "application/html";
                        var ID = context.Request.Form["ID"] != null ? context.Request.Form["ID"].Trim().Replace("'", "''") : string.Empty;
                        BindingUltilities.DisableSubState(int.Parse(ID));
                        context.Response.Write("alert('Delete Completed!')");
                        break;
                    }
                case "CatsUpdate":
                    {
                        context.Response.ContentType = "application/html";
                        var ID = context.Request.Form["ID"] != null ? context.Request.Form["ID"].Trim().Replace("'", "''") : string.Empty;
                        var Name = context.Request.Form["Name"] != null ? context.Request.Form["Name"].Trim().Replace("'", "''") : string.Empty;
                        var Order = context.Request.Form["Order"] != null ? context.Request.Form["Order"].Trim().Replace("'", "''") : string.Empty;
                        if (BindingUltilities.UpdateCategory(int.Parse(ID), Name, int.Parse(Order)))
                        {
                            context.Response.Write("alert('Update Completed!')");
                        }
                        else
                        {
                            context.Response.Write("alert('Get Error in Update Categories')");
                        }
                        break;
                    }
                case "StateUpdate":
                    {
                        context.Response.ContentType = "application/html";
                        var ID = context.Request.Form["ID"] != null ? context.Request.Form["ID"].Trim().Replace("'", "''") : string.Empty;
                        var Name = context.Request.Form["Name"] != null ? context.Request.Form["Name"].Trim().Replace("'", "''") : string.Empty;
                        var Order = context.Request.Form["Order"] != null ? context.Request.Form["Order"].Trim().Replace("'", "''") : string.Empty;
                        if (BindingUltilities.UpdateState(int.Parse(ID), Name, int.Parse(Order)))
                        {
                            context.Response.Write("alert('Update Completed!')");
                        }
                        else
                        {
                            context.Response.Write("alert('Get Error in Update State')");
                        }
                        break;
                    }
                case "subCatsUpdate":
                    {
                        context.Response.ContentType = "application/html";
                        var ID = context.Request.Form["ID"] != null ? context.Request.Form["ID"].Trim().Replace("'", "''") : string.Empty;
                        var Name = context.Request.Form["Name"] != null ? context.Request.Form["Name"].Trim().Replace("'", "''") : string.Empty;
                        var Order = context.Request.Form["Order"] != null ? context.Request.Form["Order"].Trim().Replace("'", "''") : string.Empty;
                        if (BindingUltilities.UpdateSubCategory(int.Parse(ID), Name, int.Parse(Order)))
                        {
                            context.Response.Write("alert('Update Completed!')");
                        }
                        else
                        {
                            context.Response.Write("alert('Get Error in Update SubCategories')");
                        }
                        break;
                    }
                case "subStateUpdate":
                    {
                        context.Response.ContentType = "application/html";
                        var ID = context.Request.Form["ID"] != null ? context.Request.Form["ID"].Trim().Replace("'", "''") : string.Empty;
                        var Name = context.Request.Form["Name"] != null ? context.Request.Form["Name"].Trim().Replace("'", "''") : string.Empty;
                        var Order = context.Request.Form["Order"] != null ? context.Request.Form["Order"].Trim().Replace("'", "''") : string.Empty;
                        if (BindingUltilities.UpdateSubState(int.Parse(ID), Name, int.Parse(Order)))
                        {
                            context.Response.Write("alert('Update Completed!')");
                        }
                        else
                        {
                            context.Response.Write("alert('Get Error in Update Zone')");
                        }
                        break;
                    }
                case "OutstandProduct":
                    {
                        context.Response.ContentType = "application/html";
                        var ID = context.Request.Form["ID"] != null ? context.Request.Form["ID"].Trim().Replace("'", "''") : string.Empty;
                        var OS = context.Request.Form["OS"] != null ? context.Request.Form["OS"].Trim().Replace("'", "''") : string.Empty;
                        if (ProductManagement.OutstandProduct(int.Parse(ID), bool.Parse(OS)))
                        {
                            context.Response.Write("$('#message').text('Update Successfully!');$('#message').fadeIn().delay(1000).fadeOut();");
                        }
                        else
                        {
                            context.Response.Write("$('#message').text('Update Error!');$('#message').fadeIn().delay(2000).fadeOut();");
                        }
                        break;
                    }
                case "loadOrderInfo":
                    {
                        context.Response.ContentType = "application/html";

                        var orderInfoID = context.Request.Form["orderInfoID"] != null ? context.Request.Form["orderInfoID"].Trim().Replace("'", "''") : string.Empty;

                        if (string.IsNullOrEmpty(orderInfoID) == false)
                        {
                            DataTable orderInfo = ProductManagement.GetOrderInfo(Convert.ToInt32(orderInfoID));

                            if (orderInfo != null && orderInfo.Rows.Count > 0)
                            {
                                ProductManagement.MarkOrderInfoAsRead(Convert.ToInt32(orderInfoID));
                                string jsBindCommand = string.Format("$('#VUEmail').val('{0}');$('#Text1').val('{1}');$('#VUCU').val('{2}');$('#VUClass').val('{3}');$('#VUWishlist').val('{4}');$('#waitloader').hide();", orderInfo.Rows[0]["RecipientsEmail"].ToString(), orderInfo.Rows[0]["Title"].ToString(), orderInfo.Rows[0]["ProductID"].ToString(), orderInfo.Rows[0]["Amount"].ToString(), orderInfo.Rows[0]["MoreDetail"].ToString());
                                context.Response.Write(jsBindCommand);
                            }
                        }
                        else
                        {
                            context.Response.Write("$('#VUEmail').val('');$('#Text1').val('');$('#VUCU').val('');$('#VUClass').val('');$('#VUWishlist').val('');");
                        }
                        break;
                    }
                default:
                    {
                        string a = "aaaa";
                        break;
                    }
            }
        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}