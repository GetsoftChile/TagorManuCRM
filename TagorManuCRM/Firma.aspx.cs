using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;
using System.Drawing.Drawing2D;
using System.Drawing.Imaging;

namespace TagorManuCRM
{
    public partial class Firma : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            
        }
        protected void btnAddImage_Click(object sender, EventArgs e)
        {
            if (ImageFile.HasFile)  //if file uploaded
            {
                if (checkFileType(ImageFile.FileName))  //Check for file types
                {
                    try
                    {
                        //save file
                        //ImageFile.SaveAs(MapPath("~/UploadedFiles/" + ImageFile.FileName));
                        string filename = ImageFile.FileName;
                        // Create a bitmap of the content of the fileUpload control in memory
                        Bitmap originalBMP = new Bitmap(ImageFile.FileContent);
                       
                        // Calculate the new image dimensions
                        int origWidth = originalBMP.Width;
                        int origHeight = originalBMP.Height;
                        int sngRatio = origWidth / origHeight;
                        int newWidth = origWidth / 3;
                        int newHeight = origHeight / 3;//newWidth / sngRatio;

                        // Create a new bitmap which will hold the previous resized bitmap
                        Bitmap newBMP = new Bitmap(originalBMP, newWidth, newHeight);
                        // Create a graphic based on the new bitmap
                        Graphics oGraphics = Graphics.FromImage(newBMP);

                        // Set the properties for the new graphic file
                        oGraphics.SmoothingMode = SmoothingMode.AntiAlias; oGraphics.InterpolationMode = InterpolationMode.HighQualityBicubic;
                        // Draw the new graphic based on the resized bitmap
                        oGraphics.DrawImage(originalBMP, 0, 0, newWidth, newHeight);

                        // Save the new graphic file to the server
                        newBMP.Save(MapPath("UploadedFiles/" + filename));

                        // Once finished with the bitmap objects, we deallocate them.
                        originalBMP.Dispose();
                        newBMP.Dispose();
                        oGraphics.Dispose();
                        //Save()

                        //Response.Write("<script language =Javascript> alert('File Uploaded Successfully, Click Show Images');</script>");
                        System.Threading.Thread.Sleep(8000);
                        Label1.Text = "Upload successfull!";
                    }
                    catch (System.IO.DirectoryNotFoundException)
                    {
                        createDir();
                    }
                }
            }
            else
            {
                Response.Write("<script language =Javascript> alert('Invalid File Format, choose .gif,.png..jpg.jpeg');</script>");
            }
        }
        private bool checkFileType(string fileName)
        {
            string fileExt = Path.GetExtension(ImageFile.FileName);

            switch (fileExt.ToLower())
            {
                case ".gif":
                    return true;
                case ".png":
                    return true;
                case ".jpg":
                    return true;
                case ".jpeg":
                    return true;
                default:
                    return false;
            }

        }
        private void createDir()
        {
            DirectoryInfo myDir = new DirectoryInfo(MapPath("~/UploadedFiles/"));
            myDir.Create();

            //Now save file
            ImageFile.SaveAs(MapPath("~/UploadedFiles/" + ImageFile.FileName));
            Response.Write("<script language =Javascript> alert('File Uploaded Successfully,Click Show Images');</script>");
        }
        protected void btnShowImage_Click(object sender, EventArgs e)
        {
            DirectoryInfo myDir = new DirectoryInfo(MapPath("UploadedFiles/"));
            try
            {

                dlImageList.DataSource = myDir.GetFiles();
                dlImageList.DataBind();

            }
            catch (System.IO.DirectoryNotFoundException)
            {
                Response.Write("<script language =Javascript> alert('Upload File(s) First!');</script>");
            }
        }

        /// <summary>
        /// Method to resize, convert and save the image.
        /// </summary>
        /// <param name="image">Bitmap image.</param>
        /// <param name="maxWidth">resize width.</param>
        /// <param name="maxHeight">resize height.</param>
        /// <param name="quality">quality setting value.</param>
        /// <param name="filePath">file path.</param>      
        public void Save(Bitmap image, int maxWidth, int maxHeight, int quality, string filePath)
        {
            // Get the image's original width and height
            int originalWidth = image.Width;
            int originalHeight = image.Height;

            // To preserve the aspect ratio
            float ratioX = (float)maxWidth / (float)originalWidth;
            float ratioY = (float)maxHeight / (float)originalHeight;
            float ratio = Math.Min(ratioX, ratioY);

            // New width and height based on aspect ratio
            int newWidth = (int)(originalWidth * ratio);
            int newHeight = (int)(originalHeight * ratio);

            // Convert other formats (including CMYK) to RGB.
            Bitmap newImage = new Bitmap(newWidth, newHeight, PixelFormat.Format24bppRgb);

            // Draws the image in the specified size with quality mode set to HighQuality
            using (Graphics graphics = Graphics.FromImage(newImage))
            {
                graphics.CompositingQuality = CompositingQuality.HighQuality;
                graphics.InterpolationMode = InterpolationMode.HighQualityBicubic;
                graphics.SmoothingMode = SmoothingMode.HighQuality;
                graphics.DrawImage(image, 0, 0, newWidth, newHeight);
            }

            // Get an ImageCodecInfo object that represents the JPEG codec.
            ImageCodecInfo imageCodecInfo = this.GetEncoderInfo(ImageFormat.Jpeg);

            // Create an Encoder object for the Quality parameter.
            Encoder encoder = Encoder.Quality;

            // Create an EncoderParameters object. 
            EncoderParameters encoderParameters = new EncoderParameters(1);

            // Save the image as a JPEG file with quality level.
            EncoderParameter encoderParameter = new EncoderParameter(encoder, quality);
            encoderParameters.Param[0] = encoderParameter;
            newImage.Save(filePath, imageCodecInfo, encoderParameters);
        }

        /// <summary>
        /// Method to get encoder infor for given image format.
        /// </summary>
        /// <param name="format">Image format</param>
        /// <returns>image codec info.</returns>
        private ImageCodecInfo GetEncoderInfo(ImageFormat format)
        {
            return ImageCodecInfo.GetImageDecoders().SingleOrDefault(c => c.FormatID == format.Guid);
        }



        private System.Drawing.Image RezizeImage(System.Drawing.Image img, int maxWidth, int maxHeight)
        {
            if (img.Height < maxHeight && img.Width < maxWidth) return img;
            using (img)
            {
                Double xRatio = (double)img.Width / maxWidth;
                Double yRatio = (double)img.Height / maxHeight;
                Double ratio = Math.Max(xRatio, yRatio);
                int nnx = (int)Math.Floor(img.Width / ratio);
                int nny = (int)Math.Floor(img.Height / ratio);
                Bitmap cpy = new Bitmap(nnx, nny, PixelFormat.Format32bppArgb);
                using (Graphics gr = Graphics.FromImage(cpy))
                {
                    gr.Clear(Color.Transparent);

                    // This is said to give best quality when resizing images
                    gr.InterpolationMode = InterpolationMode.HighQualityBicubic;

                    gr.DrawImage(img,
                        new Rectangle(0, 0, nnx, nny),
                        new Rectangle(0, 0, img.Width, img.Height),
                        GraphicsUnit.Pixel);
                }
                return cpy;
            }

        }

        private MemoryStream BytearrayToStream(byte[] arr)
        {
            return new MemoryStream(arr, 0, arr.Length);
        }

        private void HandleImageUpload(byte[] binaryImage)
        {
            System.Drawing.Image img = RezizeImage(System.Drawing.Image.FromStream(BytearrayToStream(binaryImage)), 103, 32);
            img.Save("IMAGELOCATION.png", System.Drawing.Imaging.ImageFormat.Gif);
        }
    }
}