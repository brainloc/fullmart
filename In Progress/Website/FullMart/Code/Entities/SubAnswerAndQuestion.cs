using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FullMart.Code.Entities
{
    public class SubAnswerAndQuestion
    {
        public Int64 ID { get; set; }
        public Int64? PosterID { get; set; }
        public Int64? AAQID { get; set; }
        public string Content { get; set; }
        public DateTime CreateDate { get; set; }
        public SubAnswerAndQuestion()
        {
            ID = 0;
            PosterID = null;
            AAQID = null;
            Content = string.Empty;
            CreateDate = DateTime.Now;
        }
    }
}