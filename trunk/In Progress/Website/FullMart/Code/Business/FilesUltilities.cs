using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI.HtmlControls;
using System.Drawing.Imaging;
using System.Configuration;

namespace FullMart.Code.Business
{
    public class FilesUltilities
    {
        public static string UploadImages(String UploadedFile, HtmlInputFile inputFile, int imageHeight, int imageWidth, string folder)
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
                String MyString = UploadedFileName.LastIndexOf(".jpg") != -1 ? UploadedFileName.Substring(0, UploadedFileName.LastIndexOf(".jpg")) + "_thumb.jpg" : UploadedFileName + "_thumb.jpg";
                thumbNailImg.Save(folder + "\\" + MyString, ImageFormat.Jpeg);
                thumbNailImg.Dispose();
            }
            catch (Exception ex)
            {
                ex.ToString();
                return null;
            }
            return UploadedFileName;
        }

        private static bool ThumbnailCallback()
        {
            return false;
        }

        public static void SetTopSectionMaxItems(int value)
        {
            Configuration MaxItemsTopSection = System.Web.Configuration.WebConfigurationManager.OpenWebConfiguration("~");
            MaxItemsTopSection.AppSettings.Settings["MaxItemsTopSection"].Value = "2";
            MaxItemsTopSection.Save();            
        }

        public static void SetNewSectionMaxItems(int value)
        {
            Configuration MaxItemsNewSection = System.Web.Configuration.WebConfigurationManager.OpenWebConfiguration("~");
            MaxItemsNewSection.AppSettings.Settings["MaxItemsNewSection"].Value = "2";
            MaxItemsNewSection.Save();
        }
    }
}