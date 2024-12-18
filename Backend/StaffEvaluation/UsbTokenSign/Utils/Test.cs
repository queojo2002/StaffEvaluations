using PdfiumViewer;
using System.Drawing;
using System.IO;

namespace UsbTokenSign.Utils
{
    public class Test
    {
        public void ConvertPdfToImages(string pdfPath, string outputDirectory)
        {
            // Tạo đối tượng PdfDocument từ file PDF
            using (var document = PdfDocument.Load(pdfPath))  // Sử dụng Load thay vì constructor
            {
                // Đảm bảo thư mục output tồn tại
                if (!Directory.Exists(outputDirectory))
                {
                    Directory.CreateDirectory(outputDirectory);
                }

                // Lặp qua từng trang trong PDF
                for (int pageIndex = 0; pageIndex < document.PageCount; pageIndex++)
                {
                    // Render trang PDF ra hình ảnh với độ phân giải 300 DPI
                    using (Bitmap pageImage = (Bitmap)document.Render(pageIndex, 300, 300, true))  // Cast thành Bitmap
                    {
                        // Đặt tên file output
                        string outputFilePath = Path.Combine(outputDirectory, $"output_page_{pageIndex + 1}.png");

                        // Lưu hình ảnh dưới định dạng PNG
                        pageImage.Save(outputFilePath, System.Drawing.Imaging.ImageFormat.Png);
                    }
                }
            }
        }
    }
}
