using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FullMart.Code.Entities
{
    public class roleID
    {
        public int ID { get; set; }
        public string Name { get; set; }
        public roleID() {
            ID = 0;
            Name = string.Empty;
        }
    }
}