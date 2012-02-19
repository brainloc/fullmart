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
        #region Private Methos

        /// <summary>
        /// 
        /// </summary>
        /// <param name="posterID"></param>
        /// <param name="content"></param>
        /// <param name="type"></param>
        private void PostQuestion(int posterID, string content, string type)
        {
            QAManagement.PostQuestion(posterID, content, type);
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="posterID"></param>
        /// <param name="postID"></param>
        /// <param name="comment"></param>
        private void AddSubQA(int posterID, int postID, string comment)
        {
            QAManagement.AddSubQA(posterID, postID, comment);
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="eventArgs"></param>
        /// <returns></returns>
        private List<string> ParseEventArgs(string eventArgs)
        {
            if (string.IsNullOrEmpty(eventArgs) == false)
            {
                List<string> eventArgsList = new List<string>();
                List<string> tmp = eventArgs.Split('$').ToList();

                string command = tmp.ElementAt(0);
                string posterID = tmp.ElementAt(1);

                string postID = string.Empty;
                if (tmp.Count > 2)
                {
                    postID = tmp.ElementAt(2);
                }
                string comment = string.Empty;
                if (tmp.Count > 3)
                {
                    comment = eventArgs.Substring(command.Length + posterID.Length + postID.Length + 3);
                }

                eventArgsList.Add(command);
                eventArgsList.Add(posterID);
                eventArgsList.Add(postID);
                eventArgsList.Add(comment);

                return eventArgsList;
            }

            return null;
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="QAID"></param>
        /// <param name="subQAID"></param>
        private void DeleteSubQA(int subQAID)
        {
            QAManagement.DeleteSubQA(subQAID);
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="QAID"></param>
        private void DeleteQA(int QAID)
        {
            QAManagement.DeleteQA(QAID);
        }

        /// <summary>
        /// 
        /// </summary>

        private static readonly Random _rng = new Random();
        #endregion

        #region Protected Methos

        /// <summary>
        /// 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnPost_Click(object sender, EventArgs e)
        {
            string content = txtPost.Text.Trim();
            int posterID = Convert.ToInt32(Session["ID"]);
            string type = string.Empty;
            if (string.IsNullOrEmpty(content) == false)
            {
                PostQuestion(posterID, content, type);
                updatePostList.DataBind();
            }
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnComment_Click(object sender, EventArgs e)
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

        /// <summary>
        /// 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
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

                        switch (command)
                        {
                            case "AddSubQA":
                                {
                                    int posterID = Convert.ToInt32(eventArgs.ElementAt(1));
                                    int postID = Convert.ToInt32(eventArgs.ElementAt(2));
                                    string comment = eventArgs.Last();
                                    AddSubQA(posterID, postID, comment);                                    
                                    break;
                                }
                            case "DeleteSubQA":
                                {
                                    int SubQAID = Convert.ToInt32(eventArgs.ElementAt(1));
                                    DeleteSubQA(SubQAID);                                   
                                    break; 
                                }
                            case "DeleteQA":
                                {
                                    int QAID = Convert.ToInt32(eventArgs.ElementAt(1));                                    
                                    DeleteQA(QAID);
                                    break; 
                                }                                
                        }

                        if (string.IsNullOrEmpty(command) == false)
                        {
                            updatePostList.DataBind();                            
                        }                        
                    }
                }
                catch (Exception ex)
                {
                }
            }
        }

        #endregion
        

        public static string RandomString()
        {
            string _chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890";
            char[] buffer = new char[4];

            for (int i = 0; i < 4; i++)
            {
                buffer[i] = _chars[_rng.Next(_chars.Length)];
            }
            return new string(buffer);
        }
    }
}