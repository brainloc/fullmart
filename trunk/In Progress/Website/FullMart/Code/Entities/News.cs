using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FullMart.Code.Entities
{
    public class News
    {
        public Int64 ID { get; set; }
        public string Thumbnail { get; set; }
        public DateTime CreatedDate { get; set; }
        public Int64? PosterID { get; set; }
        public string title { get; set; }
        public string Content { get; set; }
        public string ShortContent { get; set; }

        public News()
        {
            ID = 0;
            Thumbnail = string.Empty;
            CreatedDate = DateTime.Now;
            PosterID = null;
            title = string.Empty;
            Content = string.Empty;
            ShortContent = string.Empty;
        }
    }
}