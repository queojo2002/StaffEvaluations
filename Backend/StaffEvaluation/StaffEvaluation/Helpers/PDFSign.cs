using Spire.Pdf;
using Spire.Pdf.Graphics;
using Spire.Pdf.Security;
using System.Drawing;
using System.Security.Cryptography.X509Certificates;

namespace StaffEvaluation.Helpers;

public class PDFSign
{
    public static byte[] SignPdf(
            byte[] bytes,
            string emailAddress,
            X509Certificate2 cert
        )
    {



        // Tạo đối tượng PdfDocument và nạp tệp PDF
        PdfDocument doc = new PdfDocument();
        doc.LoadFromBytes(bytes);

        // Chọn trang để ký
        PdfPageBase page = doc.Pages[0];
        PdfTrueTypeFont trueTypeFont = new PdfTrueTypeFont("C:\\SA\\Font\\NotoSans-Italic.ttf", 8f);


        // Tạo đối tượng PdfCertificate từ chứng chỉ
        PdfCertificate pdfCert = new PdfCertificate(cert);

        // Tạo đối tượng PdfSignature và cấu hình nó
        PdfSignature signature = new PdfSignature(doc, page, pdfCert, "Sign");

        float width = 200;
        float height = 90;


        signature.Bounds = new RectangleF(5, 5, width, height);
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

