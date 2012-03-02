using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FullMart.Code.Entities
{
    public class Product
    {
        public Int64 ID { get; set; }
        public Int64 SubCategoryID { get; set; }
        public string Price { get; set; }
        public string Picture { get; set; }
        public string Thumbnail { get; set; }
        public string CreatedDate { get; set; }
        public int? PosterID { get; set; }
        public bool Outstanding { get; set; }
        public Int64? ContentID { get; set; }
        public string Title { get; set; }
        public string Content { get; set; }
        public int? State { get; set; }
        public string image1 { get; set; }
        public string image2 { get; set; }
        public string image3 { get; set; }
        public Product()
        {
            ID = 0;
            SubCategoryID = 0;
            Price = string.Empty;
            Picture = string.Empty;
            Thumbnail = string.Empty;
            CreatedDate = string.Empty;
            PosterID = null;
            Outstanding = false;
            Title = string.Empty;
            State = null;
            ContentID = null;
            Content = string.Empty;
            State = null;
            image1 = string.Empty;
            image2 = string.Empty;
            image3 = string.Empty;
        }
    }
}