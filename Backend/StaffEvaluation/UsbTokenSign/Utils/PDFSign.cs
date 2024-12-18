using Spire.Pdf;
using Spire.Pdf.Graphics;
using Spire.Pdf.Security;
using System;
using System.Drawing;
using System.IO;
using System.Security.Cryptography.X509Certificates;

public class PDFSign
{
    public static byte[] SignPdf(
            byte[] bytes,
            string emailAddress,
            X509Certificate2 cert,
            Rectangle rectangle,
            int pageSign
        )
    {

        string baseDirectory = AppDomain.CurrentDomain.BaseDirectory;

        string fontPath = Path.Combine(baseDirectory, "..", "..", "Font", "NotoSans-Italic.ttf");

        // Tạo đối tượng PdfDocument và nạp tệp PDF
        PdfDocument doc = new PdfDocument();
        doc.LoadFromBytes(bytes);

        // Chọn trang để ký
        PdfPageBase page = doc.Pages[pageSign];
        PdfTrueTypeFont trueTypeFont = new PdfTrueTypeFont(fontPath, 8f);


        // Tạo đối tượng PdfCertificate từ chứng chỉ
        PdfCertificate pdfCert = new PdfCertificate(cert);

        // Tạo đối tượng PdfSignature và cấu hình nó
        PdfSignature signature = new PdfSignature(doc, page, pdfCert, "Sign");


        signature.Bounds = rectangle;
        signature.SignDetailsFont = trueTypeFont;
        PdfStringFormat leftAlignment = new PdfStringFormat(PdfTextAlignment.Left, PdfVerticalAlignment.Top);
        PdfSolidBrush brush = new PdfSolidBrush(Color.FromArgb(10, 0, 0, 255));



        // Thêm thông tin liên hệ vào chữ ký
        signature.ContactInfo = emailAddress;
        signature.Certificated = true;
        signature.DocumentPermissions = PdfCertificationFlags.AllowFormFill;

        // Định dạng chữ ký PDF
        signature.Name = cert.GetNameInfo(X509NameType.SimpleName, false);
        signature.Reason = "Ký duyệt văn bản";
        signature.LocationInfo = "Website";

        signature.NameLabel = "Được ký bởi: ";
        signature.LocationInfoLabel = "Nơi ký: ";
        signature.ReasonLabel = "Lý do: ";
        signature.ContactInfoLabel = "Thông tin liên hệ: ";

        /*signature.GraphicsMode = GraphicMode.SignImageAndSignDetail;
        signature.SignImageSource = PdfImage.FromFile("D:\\logo.jpg");
*/

        // Lưu tài liệu đã ký vào MemoryStream
        using (MemoryStream memoryStream = new MemoryStream())
        {
            doc.SaveToStream(memoryStream);
            return memoryStream.ToArray();
        }
    }
}

