using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FullMart.Code.Entities
{
    public class AnswerAndQuestion
    {
        public Int64 ID { get; set; }
        public Int64? PosterID { get; set; }
        public string type { get; set; }
        public string Content { get; set; }
        public DateTime CreateDate { get; set; }
        public bool isActive { get; set; }
        public AnswerAndQuestion() {
            ID = 0;
            PosterID = null;
            type = string.Empty;
            Content = string.Empty;
            CreateDate = DateTime.Now;
        }
    }
}