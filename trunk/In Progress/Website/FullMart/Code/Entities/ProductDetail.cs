using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FullMart.Code.Entities
{
    public class ProductDetail
    {
        public Int64 ID { get; set; }
        public Int64? ProductID { get; set; }
        public string Content { get; set; }
        public ProductDetail()
        {
            ID = 0;
            ProductID = null;
            Content = string.Empty;
        }
    }
}