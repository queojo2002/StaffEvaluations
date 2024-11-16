using System.Security.Cryptography;
using System.Security.Cryptography.X509Certificates;

namespace StaffEvaluation.Helpers;

public class CertificateGenerator
{
    public static X509Certificate2 CreateCertificate(
        string commonName,
        string emailAddress,
        string organization,
        string organizationUnit,
        string country,
        string password)
    {
        using (RSA rsa = RSA.Create(2048))
        {
            var distinguishedName = new X500DistinguishedName(
                $"CN={commonName}, E={emailAddress}, O={organization}, OU={organizationUnit}, C={country}");

            var certReq = new CertificateRequest(
                distinguishedName,
                rsa,
                HashAlgorithmName.SHA256,
                RSASignaturePadding.Pkcs1);

            certReq.CertificateExtensions.Add(
                new X509KeyUsageExtension(X509KeyUsageFlags.DigitalSignature | X509KeyUsageFlags.KeyEncipherment, false));

            certReq.CertificateExtensions.Add(
                new X509EnhancedKeyUsageExtension(
                    new OidCollection {
                    new Oid("1.3.6.1.5.5.7.3.1"), // Server Authentication
                    new Oid("1.3.6.1.5.5.7.3.2")  // Client Authentication
                    }, false));

            // Tạo chứng chỉ tự ký
            var cert = certReq.CreateSelfSigned(
                DateTimeOffset.Now.AddDays(-1),
                DateTimeOffset.Now.AddYears(5));

            return new X509Certificate2(cert.Export(X509ContentType.Pfx, password), password, X509KeyStorageFlags.Exportable);

        }
    }
}

