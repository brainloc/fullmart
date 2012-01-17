using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FullMart.Code.Entities
{
    public class Comment
    {
        public Int64 ID { get; set; }
        public Int64? PosterID { get; set; }
        public Int64? ProductID { get; set; }
        public string Content { get; set; }
        public DateTime CreateDate { get; set; }
        public Comment() {
            ID = 0;
            PosterID = null;
            ProductID = null;
            Content = string.Empty;
            CreateDate = DateTime.Now;
        }
    }
}