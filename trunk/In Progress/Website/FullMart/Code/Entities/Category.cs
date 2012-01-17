using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FullMart.Code.Entities
{
    public class Category
    {
        public int ID { get; set; }
        public string Name { get; set; }
        public int Order { get; set; }
        public Category() {
            ID = 0;
            Name = string.Empty;
            Order = 0;
        }
    }
}