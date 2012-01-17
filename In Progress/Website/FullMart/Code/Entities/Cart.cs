using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FullMart.Code.Entities
{
    public class Cart
    {
        public Int64 ID { get; set; }
        public Int64? ProductID { get; set; }
        public int Amuont { get; set; }
        public Int64? BuyerID { get; set; }
        public string MoreDetail { get; set; }
        public DateTime Createdate { get; set; }
        public bool isRead { get; set; }
        public Cart() {
            ID = 0;
            ProductID = null;
            Amuont = 0;
            BuyerID = null;
            MoreDetail = string.Empty;
            Createdate = DateTime.Now;
            isRead = false;
        }
    }
}