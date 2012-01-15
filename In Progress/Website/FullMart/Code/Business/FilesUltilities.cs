using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI.HtmlControls;
using System.Drawing.Imaging;

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