using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using FullMart.Code.DAO;

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
                case "CreateUser":
                    {
                        context.Response.ContentType = "application/html";
                        var fname = context.Request.Form["ufname"] != null ? context.Request.Form["ufname"].Trim().Replace("'", "''") : string.Empty;
                        var lname = context.Request.Form["ulname"] != null ? context.Request.Form["ulname"].Trim().Replace("'", "''") : string.Empty;
                        var ema = context.Request.Form["uemail"] != null ? context.Request.Form["uemail"].Trim().Replace("'", "''") : string.Empty;
                        var pas = context.Request.Form["upass"] != null ? context.Request.Form["upass"].ToString() : string.Empty;
                        var bday = context.Request.Form["ubirthday"] != null ? context.Request.Form["ubirthday"].Trim().Replace("'", "''") : string.Empty;
                        var state = context.Request.Form["freguserstate"] != null ? context.Request.Form["freguserstate"].Trim().Replace("'", "''") : string.Empty;
                        var CU = context.Request.Form["freguserCU"] != null ? context.Request.Form["freguserCU"].Trim().Replace("'", "''") : string.Empty;
                        var cls = context.Request.Form["freguserclass"] != null ? context.Request.Form["freguserclass"].Trim().Replace("'", "''") : string.Empty;
                        int? roleID = 3;

                        //UserManagement.CreateUser(fname,lname,ema,pas,DateTime.Parse(bday),state,CU,cls,roleID);
                        bool isUserCreated = UserManagement.CreateUser(fname, lname, ema, pas, DateTime.Parse(bday), state, CU, cls, roleID);
                        if (isUserCreated == true)
                        {
                            context.Response.Write("showdialogr(\"<Center><strong>Conguration!</strong><br />you Are register successfull<br/><br/></center>\", 200, 65, \"\", true,\"Default.aspx\");");
                        }
                        else
                        {
                            context.Response.Write("showdialog(\"<Center><strong>Error!</strong><br />This User Already Exist !<br/><br/></center>\", 200, 65, \"\", true);");
                        }
                        break;
                    }
                case "CheckUser":
                    {
                        context.Response.ContentType = "application/html";
                        var ema = context.Request.Form["uemail"] != null ? context.Request.Form["uemail"].Trim().Replace("'", "''") : string.Empty;
                        
                        //UserManagement.CreateUser(fname,lname,ema,pas,DateTime.Parse(bday),state,CU,cls,roleID);
                        if (!UserManagement.CheckUser(ema)) {
                            context.Response.Write("$('#tmpa').val(false);");
                        }
                        break;
                    }
                case "EditUser":
                    {
                        break;
                    }
                case "CreateShop": 
                    {
                        context.Response.ContentType = "text/plain";
                        var shopname = context.Request.Form["shopname"] != null ? context.Request.Form["shopname"].Trim().Replace("'", "''") : string.Empty;
                        var sfname = context.Request.Form["sfname"] != null ? context.Request.Form["sfname"].Trim().Replace("'", "''") : string.Empty;
                        var slname = context.Request.Form["slname"] != null ? context.Request.Form["slname"].Trim().Replace("'", "''") : string.Empty;
                        var spass = context.Request.Form["spass"] != null ? context.Request.Form["spass"].ToString() : string.Empty;
                        var semail = context.Request.Form["semail"] != null ? context.Request.Form["semail"].Trim().Replace("'", "''") : string.Empty;
                        var sweb = context.Request.Form["sweb"] != null ? context.Request.Form["sweb"].Trim().Replace("'", "''") : string.Empty;
                        var fregsstate = context.Request.Form["fregsstate"] != null ? context.Request.Form["fregsstate"].Trim().Replace("'", "''") : string.Empty;
                        int? roleID = 2;

                        //UserManagement.CreateUser(fname,lname,ema,pas,DateTime.Parse(bday),state,CU,cls,roleID);
                        UserManagement.CreateShop(shopname, sfname, slname, spass, semail, sweb, fregsstate,roleID);
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
                default:
                    break;
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