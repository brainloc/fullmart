using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FullMart.Code.Entities
{
    public class User
    {
        public Int64 ID { get; set; }
        public string username { get; set; }
        public string fname { get; set; }
        public string lname { get; set; }
        public string email { get; set; }
        public string pass { get; set; }
        public DateTime birthday { get; set; }
        public string state { get; set; }
        public string CU { get; set; }
        public string cls { get; set; }
        public string yahoo { get; set; }
        public string mobile { get; set; }
        public string shopName { get; set; }
        public string website { get; set; }
        public string wishtlist { get; set; }
        public DateTime createdate { get; set; }
        public int rID { get; set; }
        public bool isActive { get; set; }
        public User() {
            ID = 0;
            username = string.Empty;
            fname = string.Empty;
            lname = string.Empty;
            email = string.Empty;
            pass = string.Empty;
            birthday = new DateTime();
            state = string.Empty;
            CU = string.Empty;
            cls = string.Empty;
            yahoo = string.Empty;
            mobile = string.Empty;
            shopName = string.Empty;
            website = string.Empty;
            wishtlist = string.Empty;
            createdate = DateTime.Now;
            rID = 3;
            isActive = true;
        }
    }
}