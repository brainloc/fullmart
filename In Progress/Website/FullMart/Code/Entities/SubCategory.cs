using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FullMart.Code.Entities
{
    public class SubCategory
    {
        public int ID { get; set; }
        public string Name { get; set; }
        public int? CaregoryID { get; set; }
        public int Order { get; set; }
        public SubCategory()
        {
            ID = 0;
            Name = string.Empty;
            CaregoryID = null;
            Order = 0;
        }
    }
}