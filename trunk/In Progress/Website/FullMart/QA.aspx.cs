using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using FullMart.Code.DAO;

namespace FullMart
{
    public partial class QA : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnPost_Click(object sender, EventArgs e)
        {
            string content = txtPost.Text.Trim();
            int posterID = 1;
            string type = "";
            if (string.IsNullOrEmpty(content) == false)
            {
                PostQuestion(posterID, content, type);                
                updatePostList.DataBind();                
            }
        }

        protected void btnComment_Click(object sender, EventArgs e)
        {
            string content = txtPost.Text.Trim();
            int posterID = 1;
            string type = "";
            if (string.IsNullOrEmpty(content) == false)
            {
                PostQuestion(posterID, content, type);                
                updatePostList.DataBind();
                updatePostList.Update();
            }
        }

        protected void updatePostList_Load(object sender, EventArgs e)
        {
            if (this.Page.IsPostBack)
            {
                try
                {
                    List<string> eventArgs = ParseEventArgs(Request.Params.Get("__EVENTARGUMENT"));

                    if (eventArgs != null)
                    {
                        string command = eventArgs.First();

                        if (command == "AddComment")
                        {
                            int posterID = Convert.ToInt32(eventArgs.ElementAt(1));
                            int postID = Convert.ToInt32(eventArgs.ElementAt(2));
                            string comment = eventArgs.Last();
                            PostComment(posterID, postID, comment);
                            updatePostList.DataBind();
                            updatePostList.Update();
                        }
                    }
                }
                catch (Exception ex)
                {
                }
            }
        }

        private void PostQuestion(int posterID, string content, string type)
        {
            QAManagement.PostQuestion(posterID, content, type);
        }

        private void PostComment(int posterID, int postID, string comment)
        {
            QAManagement.PostComment(posterID, postID, comment);
        }

        private List<string> ParseEventArgs(string eventArgs)
        {
            if (string.IsNullOrEmpty(eventArgs) == false)
            {
                List<string> eventArgsList = new List<string>();
                List<string> tmp = eventArgs.Split('$').ToList();

                string command = tmp.ElementAt(0);
                string posterID = tmp.ElementAt(1);
                string postID = tmp.ElementAt(2);
                string comment = eventArgs.Substring(command.Length + posterID.Length + postID.Length + 3);

                eventArgsList.Add(command);
                eventArgsList.Add(posterID);
                eventArgsList.Add(postID);
                eventArgsList.Add(comment);

                return eventArgsList;
            }
            
            return null;
        }
        private readonly Random _rng = new Random();
        private const string _chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890";

        public string RandomString()
        {
            char[] buffer = new char[4];

            for (int i = 0; i < 4; i++)
            {
                buffer[i] = _chars[_rng.Next(_chars.Length)];
            }
            return new string(buffer);
        }

    }
}