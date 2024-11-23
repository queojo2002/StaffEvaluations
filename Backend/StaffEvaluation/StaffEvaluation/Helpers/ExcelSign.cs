using Spire.Xls;
using Spire.Xls.Core.MergeSpreadsheet.Interfaces;
using System.Security.Cryptography.X509Certificates;

namespace StaffEvaluation.Helpers;

public class ExcelSign
{
    public static byte[] Sign(byte[] fileByte, X509Certificate2 x509Certificate2)
    {
        try
        {
            Workbook workbook = new Workbook();
            workbook.LoadFromStream(new MemoryStream(fileByte));

            IDigitalSignatures signature = workbook.AddDigitalSignature(x509Certificate2, "noteSign", DateTime.Now);

            // Lưu tài liệu đã ký vào MemoryStream
            using (MemoryStream memoryStream = new MemoryStream())
            {
                workbook.SaveToStream(memoryStream);
                return memoryStream.ToArray();
            }

        }
        catch (Exception ex)
        {
            System.Diagnostics.Debug.WriteLine(ex.Message);

            return null;
        }
    }
}

