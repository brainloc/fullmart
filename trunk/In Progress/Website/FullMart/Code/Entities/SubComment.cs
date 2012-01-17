using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FullMart.Code.Entities
{
    public class SubComment
    {
        public Int64 ID { get; set; }
        public Int64? PosterID { get; set; }
        public Int64? CommentID { get; set; }
        public string Content { get; set; }
        public DateTime CreateDate { get; set; }
        public SubComment() {
            ID = 0;
            PosterID = null;
            CommentID = null;
            Content = string.Empty;
            CreateDate = DateTime.Now;
        }
    }
}