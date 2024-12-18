using Newtonsoft.Json;
using PdfSharp.Pdf;
using System;
using System.Collections.Generic;
using System.Drawing;
using System.Drawing.Drawing2D;
using System.IO;
using System.Net;
using System.Security.Cryptography;
using System.Security.Cryptography.X509Certificates;
using System.Text;
using System.Threading;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace UsbTokenSign
{
    public partial class Form1 : Form
    {
        PdfDocument document = new PdfDocument();
        public const string pdfPath = "D:/1.pdf";
        private HttpListener _listener;
        private Thread _listenerThread;
        private static string httpPort = "6999";
        private bool isSelecting = false; // Cờ để kiểm tra đang chọn
        private int currentIndex = 0; // Chỉ số của hình ảnh hiện tại
        private Point selectionStart; // Điểm bắt đầu khi nhấn chuột
        private Rectangle selectionRectangle; // Vùng chọn
        private Rectangle selectionRectangleReturn; // Vùng chọn
        List<Image> images = new List<Image>();
        HttpListenerContext context;


        public Form1()
        {
            InitializeComponent();
        }

        private async void StartHttpServer()
        {
            _listener = new HttpListener();
            _listener.Prefixes.Add($"http://localhost:{httpPort}/");

            if (this.IsHandleCreated)
            {
                this.Invoke(new Action(() =>
                {
                    this.Hide();
                }));
            }

            _listenerThread = new Thread(() =>
            {
                _listener.Start();
                while (true)
                {
                    try
                    {
                        context = _listener.GetContext();

                        HandleRequest();
                    }
                    catch (HttpListenerException ex)
                    {
                        //log.Error("HttpListenerException occurred: ", ex);
                        break;
                    }
                    catch (Exception ex)
                    {
                        MessageBox.Show($"Error: {ex.Message}");
                    }
                }
            });

            _listenerThread.Start();

        }

        private void StopHttpListener()
        {
            try
            {
                if (_listener != null && _listener.IsListening)
                {
                    _listener.Stop();
                    _listener.Close();
                }

                if (_listenerThread != null && _listenerThread.IsAlive)
                {
                    _listenerThread.Join(500);
                }

                if (Application.OpenForms.Count == 0) Application.Exit();

                //log.Info("HTTP Listener stopped");
            }
            catch (Exception ex)
            {
                //log.Error("Error while stopping HttpListener: ", ex);
            }
        }

        private void HandleRequest()
        {
            string path = context.Request.Url.AbsolutePath;
            HttpListenerRequest request = context.Request;
            HttpListenerResponse response = context.Response;

            // Thêm xử lý CORS cho preflight request
            if (request.HttpMethod == "OPTIONS")
            {
                response.AddHeader("Access-Control-Allow-Origin", "*");
                response.AddHeader("Access-Control-Allow-Methods", "GET, POST, PUT, DELETE, OPTIONS");
                response.AddHeader("Access-Control-Allow-Headers", "Content-Type, Authorization");
                response.AddHeader("Access-Control-Max-Age", "86400");
                response.StatusCode = (int)HttpStatusCode.NoContent;
                response.Close();
            }
            if (path == "/signByUsbToken" && context.Request.HttpMethod == "POST")
            {
                string requestBody;

                using (var reader = new StreamReader(request.InputStream, request.ContentEncoding))
                {
                    requestBody = reader.ReadToEnd();
                }

                if (this.IsHandleCreated)
                {
                    this.Invoke(new Action(() =>
                    {
                        this.Show();
                    }));
                }


                System.Diagnostics.Debug.WriteLine("Received Request Body: " + requestBody);


            }
            else
            {
                SendResponse(context, "application/json", 404);
            }
        }

        private async void Form1_Load(object sender, EventArgs e)
        {
            label1.Text = "Đang load dữ liệu";

            try
            {
                // Mở cửa hàng chứng thư số
                X509Store store = new X509Store(StoreName.My, StoreLocation.CurrentUser);
                store.Open(OpenFlags.ReadOnly);

                // Lọc chứng thư số hợp lệ
                X509Certificate2Collection certificates = store.Certificates.Find(X509FindType.FindByTimeValid, DateTime.Now, false);

                // Thêm chứng thư vào ComboBox
                foreach (var cert in certificates)
                {
                    comboBoxSignatures.Items.Add(new CertificateItem
                    {
                        Certificate = cert,
                        DisplayName = $"{cert.Subject} (Hết hạn: {cert.GetExpirationDateString()})"
                    });
                }

                store.Close();

                if (comboBoxSignatures.Items.Count > 0)
                {
                    comboBoxSignatures.SelectedIndex = 0; // Chọn mục đầu tiên mặc định
                }
                else
                {
                    MessageBox.Show("Không tìm thấy chứng thư số hợp lệ.");
                }

                Task.Run(() => StartHttpServer());


                /* document = PdfReader.Open(pdfPath);


                 using (var document = PdfiumViewer.PdfDocument.Load(pdfPath))  // Sử dụng Load thay vì constructor
                 {
                     // Lặp qua từng trang trong PDF
                     for (int pageIndex = 0; pageIndex < document.PageCount; pageIndex++)
                     {
                         // Render trang PDF ra hình ảnh với độ phân giải 300 DPI
                         using (Bitmap pageImage = (Bitmap)document.Render(pageIndex, 300, 300, true))  // Cast thành Bitmap
                         {

                             images.Add((Image)pageImage.Clone());

                         }
                     }
                 }

                 if (images.Count > 0)
                 {
                     label1.Text = $"{currentIndex + 1}/{images.Count}";

                     DisplayImage(images[currentIndex]);
                 }*/

            }
            catch (Exception ex)
            {
                MessageBox.Show($"Lỗi khi tải chứng thư số: {ex.Message}");
            }
        }

        private void Form1_FormClosing_1(object sender, FormClosingEventArgs e)
        {
            StopHttpListener();
        }


        private void btnConfirm_Click(object sender, EventArgs e)
        {

            try
            {





                /*   MessageBox.Show(selectionRectangleReturn.X.ToString() + "/" + selectionRectangleReturn.Y.ToString());

                   XGraphics gfx = XGraphics.FromPdfPage(document.Pages[currentIndex]);

                   gfx.DrawRectangle(XPens.Black, selectionRectangleReturn.X, selectionRectangleReturn.Y, selectionRectangleReturn.Width, selectionRectangleReturn.Height);
   */
                if (comboBoxSignatures.SelectedItem != null)
                {
                    // Lấy chứng thư số đã chọn
                    CertificateItem selectedItem = (CertificateItem)comboBoxSignatures.SelectedItem;

                    X509Certificate2 selectedCert = selectedItem.Certificate;

                    string dataToSign = "Đây là dữ liệu cần ký.";

                    byte[] dataBytes = Encoding.UTF8.GetBytes(dataToSign);

                    byte[] signedData = SignData(dataBytes, selectedCert);

                    SendResponse(context, "application/json", 200,
                    new
                    {
                        status = "success",
                        message = "Ký số thành công!",
                        data = new
                        {
                            serialNumber = selectedCert.SerialNumber,
                            thumbprint = selectedCert.Thumbprint,
                            issuerName = selectedCert.IssuerName.Name,
                            createdAt = DateTime.Now.ToString("yyyy-MM-ddTHH:mm:ss")
                        }
                    }
                );

                    if (this.IsHandleCreated)
                    {
                        this.Invoke(new Action(() =>
                        {
                            this.Hide();
                        }));
                    }

                    /*byte[] fileBytes = File.ReadAllBytes(pdfPath);

                    byte[] fileBytesRT = PDFSign.SignPdf(fileBytes, "ducln339@gmail.com", selectedCert, selectionRectangleReturn, currentIndex);

                    File.WriteAllBytes("D:/copy_of_1.pdf", fileBytesRT);

                    MessageBox.Show($"Chứng thư số được chọn:\n- Chủ sở hữu: {selectedCert.Subject}\n- Hết hạn: {selectedCert.GetExpirationDateString()}");*/
                }
                else
                {
                    MessageBox.Show("Vui lòng chọn một chứng thư số.");
                }


                /*document.Save("D:/output.pdf");

                document.Dispose();

                document = PdfReader.Open(pdfPath);*/

            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine(ex.Message);
                throw;
            }
        }


        private void DisplayImage(Image img)
        {
            // Cập nhật kích thước và chế độ hiển thị của PictureBox
            pictureBox1.SizeMode = PictureBoxSizeMode.Zoom; // Giữ tỷ lệ ảnh

            // Cập nhật lại ảnh vào PictureBox
            pictureBox1.Image = img;

            // Đảm bảo PictureBox sử dụng DockStyle.Fill
            pictureBox1.Dock = DockStyle.Fill;

            pictureBox1.BorderStyle = BorderStyle.FixedSingle; // Thêm border một đường viền đơn

            pictureBox1.Padding = new Padding(0);
        }

        private byte[] SignData(byte[] data, X509Certificate2 certificate)
        {
            using (RSA rsa = certificate.GetRSAPrivateKey())
            {
                if (rsa == null) throw new InvalidOperationException("Không thể truy cập private key từ chứng thư số.");

                return rsa.SignData(data, HashAlgorithmName.SHA256, RSASignaturePadding.Pkcs1);
            }
        }

        private void button1_Click(object sender, EventArgs e)
        {
            if (images.Count > 0 && currentIndex > 0)
            {
                currentIndex--; // Giảm chỉ số để quay lại hình ảnh trước
                DisplayImage(images[currentIndex]);
                label1.Text = $"{currentIndex + 1}/{images.Count}";
            }
        }

        private void button2_Click_1(object sender, EventArgs e)
        {
            if (images.Count > 0 && currentIndex < images.Count - 1)
            {
                currentIndex++; // Tăng chỉ số để chuyển sang hình ảnh tiếp theo
                DisplayImage(images[currentIndex]);
                label1.Text = $"{currentIndex + 1}/{images.Count}";
            }
        }

        private void pictureBox1_MouseDown(object sender, MouseEventArgs e)
        {
            isSelecting = true;
            selectionStart = e.Location; // Lưu tọa độ bắt đầu
            selectionRectangle = new Rectangle(e.Location, new Size(0, 0));
            pictureBox1.Invalidate(); // Vẽ lại để xóa vùng cũ (nếu có)
        }

        private void pictureBox1_MouseMove(object sender, MouseEventArgs e)
        {
            if (isSelecting)
            {
                // Cập nhật vùng chọn
                selectionRectangle = new Rectangle(
                    Math.Min(selectionStart.X, e.X),
                    Math.Min(selectionStart.Y, e.Y),
                    Math.Abs(e.X - selectionStart.X),
                    Math.Abs(e.Y - selectionStart.Y)
                );
                pictureBox1.Invalidate(); // Vẽ lại hình chữ nhật
            }
        }

        private void pictureBox1_MouseUp(object sender, MouseEventArgs e)
        {
            isSelecting = false;

            var pdfCoordinates = CalculatePdfCoordinates(selectionRectangle);

            selectionRectangleReturn = pdfCoordinates;

            MessageBox.Show($"X: {pdfCoordinates.X}, Y: {pdfCoordinates.Y}, Width: {pdfCoordinates.Width}, Height: {pdfCoordinates.Height}");
        }

        private void pictureBox1_Paint(object sender, PaintEventArgs e)
        {
            if (isSelecting || selectionRectangle.Width > 0 || selectionRectangle.Height > 0)
            {
                using (Pen pen = new Pen(Color.Black, 2))
                {
                    pen.DashStyle = DashStyle.Dash;
                    e.Graphics.DrawRectangle(pen, selectionRectangle);
                }
            }
        }


        private Rectangle CalculatePdfCoordinates(Rectangle selectionRectangle)
        {
            // Kích thước của trang PDF
            var pdfWidth = document.Pages[currentIndex].Width;
            var pdfHeight = document.Pages[currentIndex].Height;

            // Kích thước của PictureBox
            var boxWidth = pictureBox1.ClientSize.Width;
            var boxHeight = pictureBox1.ClientSize.Height;

            // Tính tỷ lệ phóng ảnh
            float ratioX = (float)(boxWidth / pdfWidth);
            float ratioY = (float)(boxHeight / pdfHeight);
            float ratio = Math.Min(ratioX, ratioY); // Lấy tỷ lệ nhỏ nhất để giữ đúng tỷ lệ ảnh

            // Tính toán kích thước ảnh hiển thị trong PictureBox
            int displayedWidth = (int)(pdfWidth * ratio);
            int displayedHeight = (int)(pdfHeight * ratio);

            // Tính toán offset (khoảng cách từ góc trên bên trái của PictureBox đến ảnh)
            int offsetX = (boxWidth - displayedWidth) / 2;
            int offsetY = (boxHeight - displayedHeight) / 2;

            // Chuyển tọa độ vùng ký từ PictureBox về tọa độ gốc của PDF
            float pdfX = (selectionRectangle.X - offsetX) / ratio;
            float pdfY = (selectionRectangle.Y - offsetY) / ratio;
            float pdfWidthSelection = selectionRectangle.Width / ratio;
            float pdfHeightSelection = selectionRectangle.Height / ratio;

            // Trả về tọa độ vùng ký tính toán trong PDF
            return new Rectangle((int)pdfX, (int)pdfY, (int)pdfWidthSelection, (int)pdfHeightSelection);
        }


        private void SendResponse(HttpListenerContext context, string contentType = "application/json", int statusCode = 200, object sampleData = null)
        {
            try
            {
                // Chuyển đổi dữ liệu mẫu thành JSON
                string jsonResponse = JsonConvert.SerializeObject(sampleData, Formatting.Indented);

                // Tạo buffer từ JSON
                byte[] buffer = Encoding.UTF8.GetBytes(jsonResponse);

                // Cấu hình HttpListenerResponse
                HttpListenerResponse response = context.Response;
                response.ContentType = contentType;
                response.StatusCode = statusCode;
                response.ContentLength64 = buffer.Length;

                // Thêm header CORS nếu cần
                response.AddHeader("Access-Control-Allow-Origin", "*");

                // Gửi dữ liệu
                using (var output = response.OutputStream)
                {
                    output.Write(buffer, 0, buffer.Length);
                }

                Console.WriteLine("Response sent successfully!");
            }
            catch (Exception ex)
            {
                // Ghi log lỗi nếu xảy ra
                Console.WriteLine($"Error while sending response: {ex.Message}");
            }
        }


        private class CertificateItem
        {
            public X509Certificate2 Certificate { get; set; } // Lưu chứng thư số
            public string DisplayName { get; set; }           // Tên hiển thị trong ComboBox

            // Ghi đè phương thức ToString để hiển thị tên trong ComboBox
            public override string ToString()
            {
                return DisplayName;
            }
        }


    }
}
