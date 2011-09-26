using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

namespace CoolNews.Entities
{
    public class News
    {
        public News()
        {
            id = 0;
            catid = 0;
            title = "";
            excerpt = "";
            body = "";
            picture = "";
            authors = "";
            keywords = "";
            totalViews = 0;
            lastModification = DateTime.Now;
            creationTime = DateTime.Now;
        }
        private long id;
        private long catid;
        private string title;
        private string excerpt;
        private string body;
        private string picture;
        private string authors;
        private string keywords;
        private long totalViews;
        private DateTime lastModification;
        private DateTime creationTime;

        public long ID
        {
            get
            {
                return id;
            }
            set
            {
                id = value;
            }
        }
        public long CatID
        {
            get
            {
                return catid;
            }
            set
            {
                catid = value;
            }
        }
        public string Title
        {
            get
            {
                return title;
            }
            set
            {
                title = value;
            }
        }
        public string Excerpt
        {
            get
            {
                return excerpt;
            }
            set
            {
                excerpt = value;
            }
        }
        public string Body
        {
            get
            {
                return body;
            }
            set
            {
                body = value;
            }
        }
        public string Picture
        {
            get
            {
                return picture;
            }
            set
            {
                picture = value;
            }
        }
        public string Authors
        {
            get
            {
                return authors;
            }
            set
            {
                authors = value;
            }
        }
        public string Keywords
        {
            get
            {
                return keywords;
            }
            set
            {
                keywords = value;
            }
        }
        public long TotalViews
        {
            get
            {
                return totalViews;
            }
            set
            {
                totalViews = value;
            }
        }
        public DateTime CreationTime
        {
            get
            {
                return creationTime;
            }
            set
            {
                creationTime = value;
            }
        }
        public DateTime LastModification
        {
            get
            {
                return lastModification;
            }
            set
            {
                lastModification = value;
            }
        }
    }
}