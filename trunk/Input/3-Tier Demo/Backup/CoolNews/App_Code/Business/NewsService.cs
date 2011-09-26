using System;
using System.Data;
using System.Configuration;
using System.Collections.Generic;
using System.Drawing.Imaging;
using System.Web.UI.HtmlControls;

using CoolNews.Entities;
using CoolNews.Data;

namespace CoolNews.Business
{
    /// <summary>
    /// Summary description for NewsService
    /// </summary>
    public class NewsService
    {
        public NewsService()
        {
            //
            // TODO: Add constructor logic here
            //
        }

        public static bool CheckTitle(News news)
        {
            NewsDAO newsDAO = new NewsDAO();
            return newsDAO.CheckTitle(news);
        }

        public static void CreateNews(News news)
        {           
            NewsDAO newsDAO = new NewsDAO();
            newsDAO.CreateNews(news);
        }

        public static void UpdateNews(News news)
        {
            NewsDAO newsDAO = new NewsDAO();
            newsDAO.UpdateNews(news);
        }

        public static void DeleteNews(News news)
        {
            NewsDAO newsDAO = new NewsDAO();
            newsDAO.DeleteNews(news);
        }

        public static News GetNewsByID(long ID)
        {
            NewsDAO newsDAO = new NewsDAO();
            return newsDAO.GetNewsByID(ID);
        }

        public static List<News> GetNewsOfCategory(long CatID)
        {
            NewsDAO newsDAO = new NewsDAO();
            return newsDAO.GetNewsOfCategory(CatID);
        }

        public static void UpdateTotalViews(long newsID)
        {
            NewsDAO newsDAO = new NewsDAO();           
            newsDAO.UpdateTotalViews(newsID);
        }

        public News GetNewsTopOfCategory(long CatID)
        {
            NewsDAO newsDAO = new NewsDAO();
            return newsDAO.GetNewsTopOfCategory(CatID);
        }

        public static List<News> GetNewsTopNewInCategoryByCatID(long CatID)
        {
            NewsDAO newsDAO = new NewsDAO();
            return newsDAO.GetNewsTopNewInCategoryByCatID(CatID);
        }
        public static string uploadNewsImages(String UploadedFile, HtmlInputFile inputFile, int imageHeight, int imageWidth, string folder)
        {
            DateTime MyDate = DateTime.Now;
            String UploadedFileName = MyDate.ToString("ddMMyyhhmmss") + ".jpg";
            try
            {
                int ExtractPos = UploadedFile.LastIndexOf("\\") + 1;
                //String UploadedFileName = UploadedFile.Substring(ExtractPos, UploadedFile.Length - ExtractPos);
                inputFile.PostedFile.SaveAs(folder + "\\" + UploadedFileName);
                //thumbnail creation starts

                String imageUrl = folder + "\\" + UploadedFileName;
                System.Drawing.Image fullSizeImg = System.Drawing.Image.FromFile(imageUrl);
                System.Drawing.Image.GetThumbnailImageAbort dummyCallBack = new System.Drawing.Image.GetThumbnailImageAbort(ThumbnailCallback);
                System.Drawing.Image thumbNailImg = fullSizeImg.GetThumbnailImage(imageWidth, imageHeight, dummyCallBack, IntPtr.Zero);
                String MyString = UploadedFileName + "_thumb.jpg";
                thumbNailImg.Save(folder + "\\" + MyString, ImageFormat.Jpeg);
                thumbNailImg.Dispose();
            }
            catch (Exception ex)
            {
                ex.ToString();
            }
            return UploadedFileName;
        }

        private static bool ThumbnailCallback()
        {
            return false;
        }

    }
}