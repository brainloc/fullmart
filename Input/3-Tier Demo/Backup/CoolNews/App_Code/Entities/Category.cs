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
    public class Category
    {
        public Category()
        {
            id = 0;
            name = "";
            description = "";
            lastModification = DateTime.Now;
            creationTime = DateTime.Now;
        }
        private long id;
        private string name;
        private string description;
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
        public string Name
        {
            get
            {
                return name;
            }
            set
            {
                name = value;
            }
        }
        public string Description
        {
            get
            {
                return description;
            }
            set
            {
                description = value;
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
    }
}