using CloudinaryDotNet;
using CloudinaryDotNet.Actions;
using ConvertApiDotNet;
using ConvertApiDotNet.Model;
using iText.IO.Font;
using iText.Kernel.Colors;
using iText.Kernel.Font;
using iText.Kernel.Pdf;
using iText.Layout;
using iText.Layout.Properties;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using MiniSoftware;
using OfficeOpenXml;
using OfficeOpenXml.Style;
using StaffEvaluation.Data;
using StaffEvaluation.Helpers;
using StaffEvaluation.Models;
using StaffEvaluation.Models.Custom;
using StaffEvaluation.Repositories.IRepository;
using System.Drawing;
using System.Drawing.Imaging;
using System.Net.Mime;
using System.Security.Cryptography.X509Certificates;
using Cell = iText.Layout.Element.Cell;
using Paragraph = iText.Layout.Element.Paragraph;
using Table = iText.Layout.Element.Table;
using TextAlignment = iText.Layout.Properties.TextAlignment;
namespace StaffEvaluation.Controllers;

[Route("api/v1/analyst")]
[ApiController]
public class AnalystController : Controller
{
    private readonly IEvaluationDetailsPersonalRepository _evaluationDetailsPersonalRepository;
    private readonly IEvaluationCriteriaRepository _evaluationCriteriaRepository;
    private readonly IUnitRepository _unitRepository;
    private readonly DataContext _context;
    private readonly IConfiguration _configuration;

    public AnalystController(IUnitRepository unitRepository, IConfiguration configuration, IEvaluationCriteriaRepository evaluationCriteriaRepository, IEvaluationDetailsPersonalRepository evaluationDetailsPersonalRepository, DataContext context)
    {
        _unitRepository = unitRepository;
        _evaluationCriteriaRepository = evaluationCriteriaRepository;
        _evaluationDetailsPersonalRepository = evaluationDetailsPersonalRepository;
        _context = context;
        _configuration = configuration;
    }

    [HttpGet("exportUserEvaluationDataToExcel")]
    [Authorize]
    public async Task<IActionResult> ExportUserEvaluationDataToExcel(Guid userId)
    {
        //var userCurrentId = Guid.Parse(HttpContext.User.FindFirst("Id")!.Value);

        try
        {
            var user = await _context.Users!.Where(e => e.Id == userId).FirstOrDefaultAsync();

            if (user == null) return Ok();

            var userType = await _context.UserTypes!.Where(e => e.Id == user.UserTypeId).FirstOrDefaultAsync();

            var unit = await _context.Units!.Where(u => u.Id == user.UnitId).FirstOrDefaultAsync();

            if (unit == null || userType == null) return Ok();

            var listEvaluationOfUser = await _context.EvaluationUsers.Where(eu => eu.UserId == userId && eu.Type == 1).Select(eu => eu.EvaluationId).ToListAsync();

            if (listEvaluationOfUser == null || listEvaluationOfUser.Count == 0)
            {
                return Ok();
            }

            using (var stream = new MemoryStream())
            {
                using (var package = new ExcelPackage(stream))
                {
                    int countSheet = 0;

                    foreach (var evaluationId in listEvaluationOfUser)
                    {
                        var evaluationDetailsPersonal = await _context.EvaluationDetailsPersonals.Where(e => e.EvaluationId == evaluationId && e.UserId == userId && e.Status >= 2).FirstOrDefaultAsync();

                        if (evaluationDetailsPersonal == null) continue;

                        var dataOfUser = await _evaluationCriteriaRepository.CriteriaToTreeWithUser(evaluationId, userId);

                        if (dataOfUser != null && (dataOfUser.ListTotal == null || !dataOfUser.ListTotal.Any())) continue;

                        countSheet += 1;

                        string sheetName = "Sheet " + countSheet;

                        var worksheet = package.Workbook.Worksheets.Add(sheetName);

                        // Lấy danh sách tất cả các người dùng từ ListPoints
                        List<PointModel>? allUsers = dataOfUser?.ListCriterias?
                            .SelectMany(c => c.ListPoints)
                            .GroupBy(p => p.Id)
                            .Select(g => g.First())
                            .ToList();

                        int countColumn = 3 + allUsers!.Count;

                        for (int col = 1; col <= countColumn; col++)
                        {
                            worksheet.Column(col).Width = 50;
                            worksheet.Column(col).Style.WrapText = true;
                        }

                        worksheet.Cells["A1:G1000"].Clear();
                        worksheet.Cells["A1:G1000"].Style.Font.Name = "Times New Roman";
                        worksheet.Cells["A1:G1000"].Style.HorizontalAlignment = ExcelHorizontalAlignment.Center;
                        worksheet.Cells["A1:G1000"].Style.VerticalAlignment = ExcelVerticalAlignment.Center;

                        // Thêm tiêu đề cột
                        worksheet.Cells[1, 1].Value = unit.UnitName!; // A1
                        worksheet.Cells[1, 1].Style.Font.Bold = true;
                        worksheet.Cells[4, 1, 4, (4 + allUsers!.Count)].Merge = true;
                        worksheet.Cells[4, 1].Value = dataOfUser!.EvaluationName; // A4
                        worksheet.Cells[4, 1].Style.Font.Bold = true;
                        worksheet.Cells[4, 1].Style.Font.Size = 14;
                        worksheet.Cells[6, 1].Value = "Họ và tên: " + user.FullName; // A6
                        worksheet.Cells[7, 1].Value = "Chức vụ: " + userType!.UserTypeName; // A7
                        worksheet.Cells[1, countColumn].Value = "CỘNG HÒA XÃ HỘI CHỦ NGHĨA VIỆT NAM";
                        worksheet.Cells[1, countColumn].Style.Font.Bold = true;
                        worksheet.Cells[2, countColumn].Value = "Độc lập - Tự do - Hạnh phúc";
                        worksheet.Cells[2, countColumn].Style.Font.Bold = true;
                        worksheet.Cells[2, countColumn].Style.Font.UnderLine = true;


                        worksheet.Cells[9, 1, 10, 1].Merge = true;
                        worksheet.Cells[9, 1].Value = "STT";
                        worksheet.Cells[9, 1].Style.Border.BorderAround(ExcelBorderStyle.Thin);
                        worksheet.Cells[9, 2, 10, 2].Merge = true;
                        worksheet.Cells[9, 2].Value = "Nội dung đánh giá";
                        worksheet.Cells[9, 2].Style.Border.BorderAround(ExcelBorderStyle.Thin);
                        worksheet.Cells[9, 3, 10, 3].Merge = true;
                        worksheet.Cells[9, 3].Value = "Điểm tối đa";
                        worksheet.Cells[9, 3].Style.Border.BorderAround(ExcelBorderStyle.Thin);
                        worksheet.Cells[9, 4, 9, countColumn].Merge = true;
                        worksheet.Cells[9, 4].Value = "Kết quả đánh giá";


                        for (int j = 1; j <= 3; j++)
                        {
                            worksheet.Cells[9, j].Style.Border.BorderAround(ExcelBorderStyle.Thin);
                            worksheet.Cells[9, j].Style.VerticalAlignment = ExcelVerticalAlignment.Center;
                            worksheet.Cells[9, j].Style.Font.Name = "Times New Roman";
                            worksheet.Cells[9, j].Style.Font.Size = 13;
                            worksheet.Cells[9, j].Style.WrapText = true;

                            worksheet.Cells[10, j].Style.Border.BorderAround(ExcelBorderStyle.Thin);
                        }


                        for (int j = 4; j <= countColumn; j++)
                        {
                            worksheet.Cells[9, j].Style.Border.BorderAround(ExcelBorderStyle.Thin);
                            worksheet.Cells[10, j].Style.Border.BorderAround(ExcelBorderStyle.Thin);
                            worksheet.Cells[9, j].Style.VerticalAlignment = ExcelVerticalAlignment.Center;
                            worksheet.Cells[9, j].Style.Font.Name = "Times New Roman";
                            worksheet.Cells[9, j].Style.Font.Size = 13;
                            worksheet.Cells[9, j].Style.WrapText = true;
                        }


                        for (int i = 0; i < allUsers!.Count; i++)
                        {
                            var userGet = await _context.Users!.Where(e => e.Id == allUsers[i].UserId).FirstOrDefaultAsync();

                            if (userGet != null)
                            {
                                worksheet.Cells[10, 4 + i].Value = userGet.FullName;
                            }
                            else
                            {
                                worksheet.Cells[10, 4 + i].Value = "";
                            }

                            worksheet.Cells[10, 4 + i].Style.Border.Top.Style = ExcelBorderStyle.Thin;
                            worksheet.Cells[10, 4 + i].Style.Border.Left.Style = ExcelBorderStyle.Thin;
                            worksheet.Cells[10, 4 + i].Style.Border.Right.Style = ExcelBorderStyle.Thin;
                            worksheet.Cells[10, 4 + i].Style.Border.Bottom.Style = ExcelBorderStyle.Thin;
                            worksheet.Cells[10, 4 + i].Style.VerticalAlignment = ExcelVerticalAlignment.Center;
                            worksheet.Cells[10, 4 + i].Style.Font.Name = "Times New Roman";
                            worksheet.Cells[10, 4 + i].Style.Font.Size = 13;
                            worksheet.Cells[10, 4 + i].Style.WrapText = true;
                        }

                        int row = 11;
                        int columnStart = 4;
                        foreach (var criteria in dataOfUser?.ListCriterias!)
                        {
                            row = FillCriteriaRecursiveExcel(worksheet, criteria, allUsers, columnStart, row);
                        }

                        worksheet.Cells[row, 1, row, 2].Merge = true; // Gộp ô từ A đến B
                        worksheet.Cells[row, 1].Style.Border.BorderAround(ExcelBorderStyle.Thin);
                        worksheet.Cells[row, 2].Style.Border.BorderAround(ExcelBorderStyle.Thin);
                        worksheet.Cells[row, 1].Value = "Tổng điểm";
                        worksheet.Cells[row, 1].Style.HorizontalAlignment = ExcelHorizontalAlignment.Center;
                        worksheet.Cells[row, 3].Value = dataOfUser?.TotalEndValue;
                        worksheet.Cells[row, 3].Style.Border.BorderAround(ExcelBorderStyle.Thin);

                        int rowStart = 4;
                        foreach (var p in dataOfUser?.ListTotal!)
                        {
                            worksheet.Cells[row, rowStart].Value = p;
                            worksheet.Cells[row, rowStart].Style.Border.BorderAround(ExcelBorderStyle.Thin);
                            rowStart++;
                        }
                        /*---------------------------------------------------------------*/
                        row++;
                        rowStart = 4;

                        worksheet.Cells[row, 1, row, 3].Merge = true; // Gộp ô từ A đến B
                        worksheet.Cells[row, 1].Style.Border.BorderAround(ExcelBorderStyle.Thin);
                        worksheet.Cells[row, 2].Style.Border.BorderAround(ExcelBorderStyle.Thin);
                        worksheet.Cells[row, 3].Style.Border.BorderAround(ExcelBorderStyle.Thin);
                        worksheet.Cells[row, 1].Value = "Xếp loại đánh giá";

                        foreach (var p in dataOfUser?.ListTotal!)
                        {
                            worksheet.Cells[row, rowStart].Value = GetGradingName(p);
                            worksheet.Cells[row, rowStart].Style.Border.BorderAround(ExcelBorderStyle.Thin);
                            rowStart++;
                        }


                        /*---------------------------------------------------------------*/
                    }

                    package.SaveAs(stream);

                }

                byte[] excelBytes = stream.ToArray();

                return File(excelBytes, MediaTypeNames.Application.Octet, "Document.xlsx");
            }
        }
        catch (Exception ex)
        {
            return BadRequest(ex.Message);
        }

    }

    [HttpGet("exportEvaluationDocument")]
    [Authorize]
    public async Task<IActionResult> ExportEvaluationDocument(Guid evaluationId, int templateType, int outputFormat, int getLink = 1)
    {
        var userCurrentId = Guid.Parse(HttpContext.User.FindFirst("Id")!.Value);

        try
        {

            var user = await _context.Users!.Where(e => e.Id == userCurrentId).FirstOrDefaultAsync();

            if (user == null) return Ok();

            var userType = await _context.UserTypes!.Where(e => e.Id == user.UserTypeId).FirstOrDefaultAsync();

            var unit = await _context.Units!.Where(u => u.Id == user.UnitId).FirstOrDefaultAsync();

            var unitParent = await _unitRepository.GetAllParentOfUnitAsync(user.UnitId);

            var evaluationDetailsPersonal = await _context.EvaluationDetailsPersonals.Where(e => e.EvaluationId == evaluationId && e.UserId == userCurrentId && e.Status >= 2).FirstOrDefaultAsync();

            if (unit == null || evaluationDetailsPersonal == null && userType == null) return Ok();

            var dataOfUser = await _evaluationCriteriaRepository.CriteriaToTreeWithUser(evaluationId, userCurrentId);

            if (dataOfUser != null && (dataOfUser.ListTotal == null || !dataOfUser.ListTotal.Any())) return Ok();

            var evaluationAAE = await _context.EvaluationAAE.Where(e => e.User!.Id == userCurrentId && e.EvaluationId == evaluationId).FirstOrDefaultAsync();

            string advantages = evaluationAAE?.Advantages ?? "";

            string disadvantages = evaluationAAE?.DisAdvantages ?? "";

            string addReviews = evaluationAAE?.AddReviews ?? "";

            string ketQuaHoatDongCoQuan = evaluationAAE?.KetQuaHoatDongCoQuan ?? "";

            string nangLucLanhDaoQuanLy = evaluationAAE?.NangLucLanhDaoQuanLy ?? "";

            string nangLucTapHopDoanKet = evaluationAAE?.NangLucTapHopDoanKet ?? "";

            string nhanXetUuKhuyetDiem = evaluationAAE?.NhanXetUuKhuyetDiem ?? "";

            string nhanDinhChieuHuongPhatTrien = evaluationAAE?.NhanDinhChieuHuongPhatTrien ?? "";

            string printerWordTemplate = "C:\\SA\\PrinterWordTemplate";

            string originalFilePath = Path.Combine(printerWordTemplate, "Mau-01-can-bo.docx");
            string tempFilePath = Path.Combine(printerWordTemplate + "\\TempWord", "Mau-01-can-boTEMP.docx");
            if (templateType == 2)
            {
                originalFilePath = Path.Combine(printerWordTemplate, "Mau-02-cong-chuc-khong-lanh-dao.docx");
                tempFilePath = Path.Combine(printerWordTemplate + "\\TempWord", "Mau-02-cong-chuc-khong-lanh-daoTEMP.docx");
            }
            if (templateType == 3)
            {
                originalFilePath = Path.Combine(printerWordTemplate, "Mau-02-cong-chuc-lanh-dao.docx");
                tempFilePath = Path.Combine(printerWordTemplate + "\\TempWord", "Mau-02-cong-chuc-lanh-daoTEMP.docx");
            }
            if (templateType == 4)
            {
                originalFilePath = Path.Combine(printerWordTemplate, "Mau-03-vien-chuc-khong-lanh-dao.docx");
                tempFilePath = Path.Combine(printerWordTemplate + "\\TempWord", "Mau-03-vien-chuc-khong-lanh-daoTEMP.docx");
            }
            if (templateType == 5)
            {
                originalFilePath = Path.Combine(printerWordTemplate, "Mau-03-vien-chuc-lanh-dao.docx");
                tempFilePath = Path.Combine(printerWordTemplate + "\\TempWord", "Mau-03-vien-chuc-lanh-daoTEMP.docx");
            }

            if (!System.IO.File.Exists(originalFilePath))
            {
                return Ok(new ApiResult().Failure<EvaluationConsolidationAndTransferDetailsModel>("Không thể lấy đường dẫn tệp OriginalFilePath."));
            }

            if (System.IO.File.Exists(tempFilePath))
            {
                System.IO.File.Delete(tempFilePath);
            }


            string emptyLine = "...............................................................................................................................................";

            var value = new Dictionary<string, object>() { };

            var listCriterias = FlattenCriteriaList(dataOfUser!.ListCriterias!);

            var maxScore = CalculateTotalEndValue(dataOfUser.ListCriterias!);

            var scoreUser = GetGradingName(dataOfUser.ListTotal[0]);

            var scoreSupervisor = GetGradingName(dataOfUser.ListTotal.LastOrDefault());

            // Xử lý nếu người dùng là admin thì lấy đơn vị là admin luôn, ngược lại lấy đơn vị cao nhất dưới admin
            if (unitParent != null && unitParent.Count == 1)
            {
                value.Add("unitParent", unitParent[0].UnitName!);
            }
            else
            {
                value.Add("unitParent", unitParent[1].UnitName!);
            }

            value.Add("unitChildren", unit.UnitName!);

            value.Add("year", DateTime.Now.Year.ToString());

            value.Add("position", userType!.UserTypeName!);

            value.Add("rankMission", scoreUser.ToString());

            value.Add("fullName", user.FullName!);

            value.Add("listTotal", dataOfUser.ListTotal[0].ToString());

            value.Add("totalEndValue", maxScore.ToString());

            value.Add("listCriteria", listCriterias.Select(c => c.Item1.Trim().ToString()).ToArray());


            if (string.IsNullOrEmpty(advantages))
            {
                value.Add("advantages", emptyLine);
            }
            else
            {
                value.Add("advantages", advantages.Trim().Split('\n').ToArray());
            }

            if (string.IsNullOrEmpty(disadvantages))
            {
                value.Add("disadvantages", emptyLine);
            }
            else
            {
                value.Add("disadvantages", disadvantages.Trim().Split('\n').ToArray());
            }

            if (string.IsNullOrEmpty(addReviews))
            {
                value.Add("addReviews", emptyLine);
            }
            else
            {
                value.Add("addReviews", addReviews.Trim().Split('\n').ToArray());
            }

            if (string.IsNullOrEmpty(ketQuaHoatDongCoQuan))
            {
                value.Add("ketQuaHoatDongCoQuan", emptyLine);
            }
            else
            {
                value.Add("ketQuaHoatDongCoQuan", ketQuaHoatDongCoQuan.Trim().Split('\n').ToArray());
            }

            if (string.IsNullOrEmpty(nangLucLanhDaoQuanLy))
            {
                value.Add("nangLucLanhDaoQuanLy", emptyLine);
            }
            else
            {
                value.Add("nangLucLanhDaoQuanLy", nangLucLanhDaoQuanLy.Trim().Split('\n').ToArray());
            }

            if (string.IsNullOrEmpty(nangLucTapHopDoanKet))
            {
                value.Add("nangLucTapHopDoanKet", emptyLine);
            }
            else
            {
                value.Add("nangLucTapHopDoanKet", nangLucTapHopDoanKet.Trim().Split('\n').ToArray());
            }

            if (string.IsNullOrEmpty(nhanXetUuKhuyetDiem))
            {
                value.Add("nhanXetUuKhuyetDiem", emptyLine);
            }
            else
            {
                value.Add("nhanXetUuKhuyetDiem", nhanXetUuKhuyetDiem.Trim().Split('\n').ToArray());
            }

            if (string.IsNullOrEmpty(nhanDinhChieuHuongPhatTrien))
            {
                value.Add("nhanDinhChieuHuongPhatTrien", emptyLine);
            }
            else
            {
                value.Add("nhanDinhChieuHuongPhatTrien", nhanDinhChieuHuongPhatTrien.Trim().Split('\n').ToArray());
            }



            DateTime dateTimeUserApprove = DateTime.Now;

            if (evaluationDetailsPersonal != null)
            {
                dateTimeUserApprove = evaluationDetailsPersonal.UpdatedAt;
            }

            value.Add("day1", dateTimeUserApprove.ToString("dd") ?? "");

            value.Add("month1", dateTimeUserApprove.ToString("MM") ?? "");

            value.Add("year1", dateTimeUserApprove.ToString("yyyy") ?? "");

            string fileName = CreateImageWithText(user.FullName ?? "", dateTimeUserApprove.ToString("dd/MM/yyyy HH:mm"), unit.UnitName!, user.Id.ToString());

            var imagePath = Path.Combine("C:\\SA\\ServerFileUserSign", fileName);

            value.Add("signImage", new MiniWordPicture() { Path = imagePath, Width = 160, Height = 90 });

            value.Add("fullNameSign", user.FullName ?? "");


            var userApprove = await _context.EvaluationUsers.Where(e => e.EvaluationId == evaluationId).OrderByDescending(e => e.Sort).FirstOrDefaultAsync();

            if (userApprove != null)
            {
                DateTime dateTimeSupervisorApprove = DateTime.Now;

                var evaluationDetailsSupervisor = await _context.EvaluationDetailsSupervisors.Where(e => e.UserSupervisorId == userApprove.UserId && e.EvaluationId == evaluationId && e.Status >= 2 && e.EvaluationDetailsPersonalId == evaluationDetailsPersonal!.Id).FirstOrDefaultAsync();

                if (evaluationDetailsSupervisor != null)
                {
                    dateTimeSupervisorApprove = evaluationDetailsSupervisor.UpdatedAt;

                    var infoUserApprove = await _context.Users!.Where(e => e.Id == userApprove.UserId).FirstOrDefaultAsync();

                    var unitApprove = await _context.Units!.Where(e => e.Id == infoUserApprove!.UnitId).FirstOrDefaultAsync();

                    string fileNameApprove = "";

                    if (unitApprove != null)
                    {
                        fileNameApprove = CreateImageWithText(infoUserApprove!.FullName ?? "", dateTimeSupervisorApprove.ToString("dd/MM/yyyy HH:mm"), unitApprove.UnitName!, infoUserApprove.Id.ToString() + "salt");
                    }
                    else
                    {
                        fileNameApprove = CreateImageWithText(infoUserApprove!.FullName ?? "", dateTimeSupervisorApprove.ToString("dd/MM/yyyy HH:mm"), unit.UnitName!, infoUserApprove.Id.ToString() + "salt");
                    }


                    var imagePathApprove = Path.Combine("C:\\SA\\ServerFileUserSign", fileNameApprove);


                    value.Add("signImageSupervisor", new MiniWordPicture() { Path = imagePathApprove, Width = 160, Height = 90 });

                    value.Add("fullNameSupervisor", infoUserApprove!.FullName!.ToString() ?? "");

                    value.Add("rankSupervisor", scoreSupervisor!.ToString());

                    value.Add("day2", dateTimeSupervisorApprove.ToString("dd") ?? "");

                    value.Add("month2", dateTimeSupervisorApprove.ToString("MM") ?? "");

                    value.Add("year2", dateTimeSupervisorApprove.ToString("yyyy") ?? "");

                }
                else
                {
                    value.Add("fullNameSupervisor", "");

                    value.Add("rankSupervisor", "..............................................................................................................................................................................................................................................................................................................(Hoàn thành xuất sắc nhiệm vụ; hoàn thành tốt nhiệm vụ; hoàn thành nhiệm vụ; không hoàn thành nhiệm vụ).");

                    value.Add("signImageSupervisor", "");

                    value.Add("day2", "...");

                    value.Add("month2", "...");

                    value.Add("year2", "...");
                }
            }
            else
            {
                value.Add("fullNameSupervisor", "");

                value.Add("rankSupervisor", "..............................................................................................................................................................................................................................................................................................................(Hoàn thành xuất sắc nhiệm vụ; hoàn thành tốt nhiệm vụ; hoàn thành nhiệm vụ; không hoàn thành nhiệm vụ).");

                value.Add("signImageSupervisor", "");

                value.Add("day2", "...");

                value.Add("month2", "...");

                value.Add("year2", "...");
            }

            MiniWord.SaveAsByTemplate(tempFilePath, originalFilePath, value);

            string docxFilePath = Path.Combine(tempFilePath);

            if (outputFormat == 1)
            {
                byte[] wordBytes = await System.IO.File.ReadAllBytesAsync(docxFilePath);


                if (getLink == 1)
                {
                    var account = new Account(
                    "dvgdcqn5g",
                    "621798912237287",
                    "7FqPAOtqqppKEAdWsxiZmmqx-bs"
                );

                    var cloudinary = new Cloudinary(account);

                    var uploadParams = new RawUploadParams
                    {
                        File = new FileDescription(docxFilePath),
                        PublicId = Guid.NewGuid().ToString(),
                        Folder = "word"
                    };

                    var uploadResult = await cloudinary.UploadAsync(uploadParams);


                    if (uploadResult.StatusCode == System.Net.HttpStatusCode.OK)
                    {
                        return Ok(new ApiResult().Success<EvaluationConsolidationAndTransferDetailsModel>(uploadResult.SecureUrl.ToString()));
                    }
                    else
                    {
                        return Ok(new ApiResult().Failure<EvaluationConsolidationAndTransferDetailsModel>("Không thể lấy đường dẫn tệp."));
                    }
                }

                return File(wordBytes, "application/vnd.openxmlformats-officedocument.wordprocessingml.document", "Document.docx");
            }
            else
            {

                string tempPdfFilePath = Path.Combine("C:\\SA\\PrinterWordTemplate\\TempWord", "pdfTemp.pdf");

                byte[] pdfBytes = await ConvertDocxToPdfAsync(docxFilePath, tempPdfFilePath);

                return File(pdfBytes, "application/pdf", "Document.pdf");
            }
        }
        catch (Exception ex)
        {
            return Ok(new ApiResult().Failure<EvaluationConsolidationAndTransferDetailsModel>("Có lỗi khi xuất biểu mẫu word: " + ex.Message));
        }


    }


    [HttpGet("exportPdfOfUser")]
    [Authorize]
    public async Task<IActionResult> ExportPdfOfUser(Guid evaluationId)
    {
        var userCurrentId = Guid.Parse(HttpContext.User.FindFirst("Id")!.Value);

        try
        {
            var user = await _context.Users!.Where(e => e.Id == userCurrentId).FirstOrDefaultAsync();

            if (user == null) return Ok();

            var unit = await _context.Units!.Where(u => u.Id == user.UnitId).FirstOrDefaultAsync();

            var evaluationDetailsPersonal = await _context.EvaluationDetailsPersonals.Where(e => e.EvaluationId == evaluationId && e.UserId == userCurrentId && e.Status >= 2).FirstOrDefaultAsync();

            if (unit == null || evaluationDetailsPersonal == null) return Ok();

            var dataOfUser = await _evaluationCriteriaRepository.CriteriaToTreeWithUser(evaluationId, userCurrentId);

            if (dataOfUser != null && (dataOfUser.ListTotal == null || !dataOfUser.ListTotal.Any())) return Ok();



            using (var memoryStream = new MemoryStream())
            {
                PdfWriter writer = new PdfWriter(memoryStream);
                PdfDocument pdf = new PdfDocument(writer);
                Document document = new Document(pdf);
                PdfFont font = PdfFontFactory.CreateFont("C:\\SA\\Font\\NotoSans-Regular.ttf", PdfEncodings.IDENTITY_H);

                // Tiêu đề chính
                Paragraph title = new Paragraph(dataOfUser.EvaluationName)
                    .SetTextAlignment(TextAlignment.CENTER)
                    .SetPaddingTop(20)
                    .SetFontSize(16)
                    .SetFont(font);
                document.Add(title);


                // Thông tin người đánh giá
                Table infoTable = new Table(UnitValue.CreatePercentArray(new float[] { 1, 2 }))
                    .SetPaddingTop(40)
                    .SetWidth(UnitValue.CreatePercentValue(100));

                infoTable.AddCell(new Cell()
                    .SetTextAlignment(TextAlignment.LEFT)
                    .SetFontSize(8)
                    .SetBorder(iText.Layout.Borders.Border.NO_BORDER)
                    .Add(new Paragraph("Tên người đánh giá: " + user.FullName).SetFont(font)));

                infoTable.AddCell(new Cell()
                    .SetTextAlignment(TextAlignment.LEFT)
                    .SetFontSize(8)
                    .SetBorder(iText.Layout.Borders.Border.NO_BORDER)
                    .Add(new Paragraph().SetFont(font)));

                infoTable.AddCell(new Cell()
                    .SetTextAlignment(TextAlignment.LEFT)
                    .SetFontSize(8)
                    .SetBorder(iText.Layout.Borders.Border.NO_BORDER)
                    .Add(new Paragraph("Đơn vị: " + unit.UnitName).SetFont(font)));


                infoTable.AddCell(new Cell()
                    .SetTextAlignment(TextAlignment.LEFT)
                    .SetFontSize(8)
                    .SetBorder(iText.Layout.Borders.Border.NO_BORDER)
                    .Add(new Paragraph().SetFont(font)));

                /* infoTable.AddCell(new Cell()
                     .SetTextAlignment(TextAlignment.LEFT)
                     .SetFontSize(8)
                     .SetBorder(iText.Layout.Borders.Border.NO_BORDER)
                     .Add(new Paragraph("Thời gian đánh giá: " + DateTime.Now.ToString("dd/MM/yyyy")).SetFont(font)));

                 infoTable.AddCell(new Cell()
                     .SetTextAlignment(TextAlignment.LEFT)
                     .SetFontSize(8)
                     .SetBorder(iText.Layout.Borders.Border.NO_BORDER)
                     .Add(new Paragraph().SetFont(font)));*/

                document.Add(infoTable);


                var columnNames = new List<string>
                                        {
                                            "Số thứ tự",
                                            "Nội dung tiêu chí",
                                            "Điểm tối đa"
                                        };

                // Lấy danh sách tất cả các người dùng từ ListPoints
                List<PointModel>? allUsers = dataOfUser?.ListCriterias?
                                .SelectMany(c => c.ListPoints)
                                .GroupBy(p => p.Id) // Nhóm các mục theo Id
                                .Select(g => g.First()) // Chọn mục đầu tiên trong mỗi nhóm
                                .ToList();

                // Tạo cột cho mỗi người dùng
                foreach (var itemUser in allUsers!)
                {
                    var userGet = await _context.Users!.Where(e => e.Id == itemUser.UserId).FirstOrDefaultAsync();

                    if (userGet == null)
                    {
                        columnNames.Add("");
                    }
                    else
                    {
                        columnNames.Add(userGet.FullName!);
                    }
                }


                // Tạo bảng chi tiết đánh giá
                Table table = new Table(UnitValue.CreatePercentArray(columnNames.Count))
                                .SetPaddingTop(100)
                                .SetWidth(UnitValue.CreatePercentValue(100));

                // Tiêu đề cột
                foreach (var name in columnNames)
                {
                    if (name == "Số thứ tự")
                    {
                        table.AddHeaderCell(new Cell()
                            .SetBackgroundColor(ColorConstants.GRAY)
                            .SetTextAlignment(TextAlignment.CENTER)
                            .SetWidth(UnitValue.CreatePercentValue(10)) // Chiều rộng nhỏ cho "Số thứ tự"
                            .Add(new Paragraph(name).SetFont(font)));
                    }
                    else if (name == "Nội dung tiêu chí")
                    {
                        table.AddHeaderCell(new Cell()
                            .SetBackgroundColor(ColorConstants.GRAY)
                            .SetTextAlignment(TextAlignment.CENTER)
                            .SetWidth(UnitValue.CreatePercentValue(50)) // Chiều rộng lớn hơn cho các cột khác
                            .Add(new Paragraph(name).SetFont(font)));
                    }
                    else
                    {
                        table.AddHeaderCell(new Cell()
                            .SetBackgroundColor(ColorConstants.GRAY)
                            .SetTextAlignment(TextAlignment.CENTER)
                            .SetWidth(UnitValue.CreatePercentValue(10)) // Chiều rộng lớn hơn cho các cột khác
                            .Add(new Paragraph(name).SetFont(font)));
                    }
                }

                // Lấy dữ liệu và điền vào bảng
                foreach (var criteria in dataOfUser?.ListCriterias!)
                {
                    FillCriteriaRecursivePDF(table, font, criteria, allUsers);
                }

                table.AddCell(new Cell(0, 2)
                    .SetBackgroundColor(ColorConstants.GRAY)
                    .SetTextAlignment(TextAlignment.CENTER)
                    .SetWidth(UnitValue.CreatePercentValue(10)) // Chiều rộng lớn hơn cho các cột khác
                    .Add(new Paragraph("Tổng điểm").SetFont(font)));

                table.AddCell(new Cell()
                    .SetBackgroundColor(ColorConstants.GRAY)
                    .SetTextAlignment(TextAlignment.CENTER)
                    .SetWidth(UnitValue.CreatePercentValue(10)) // Chiều rộng lớn hơn cho các cột khác
                    .Add(new Paragraph(dataOfUser.TotalEndValue.ToString()).SetFont(font)));


                foreach (var p in dataOfUser?.ListTotal!)
                {
                    table.AddCell(new Cell()
                        .SetBackgroundColor(ColorConstants.GRAY)
                        .SetTextAlignment(TextAlignment.CENTER)
                        .SetWidth(UnitValue.CreatePercentValue(10)) // Chiều rộng lớn hơn cho các cột khác
                        .Add(new Paragraph(p.ToString()).SetFont(font)));
                }

                table.AddCell(new Cell(0, 3)
                    .SetBackgroundColor(ColorConstants.GRAY)
                    .SetTextAlignment(TextAlignment.CENTER)
                    .SetHorizontalAlignment(HorizontalAlignment.CENTER)
                    .SetVerticalAlignment(VerticalAlignment.MIDDLE)
                    .SetWidth(UnitValue.CreatePercentValue(10)) // Chiều rộng lớn hơn cho các cột khác
                    .Add(new Paragraph("Xếp loại đánh giá").SetFont(font)));

                foreach (var p in dataOfUser?.ListTotal!)
                {
                    table.AddCell(new Cell()
                        .SetBackgroundColor(ColorConstants.GRAY)
                        .SetTextAlignment(TextAlignment.CENTER)
                        .SetWidth(UnitValue.CreatePercentValue(10))
                        .Add(new Paragraph(GetGradingName(p)).SetFont(font)));
                }



                document.Add(table);

                document.Close();

                // Tạo chứng chỉ số và ký PDF
                X509Certificate2 userCert = CertificateGenerator.CreateCertificate(
                    user.FullName!,
                    user.Email!,
                    "QLDGCB",
                    unit.UnitName!,
                    "VN",
                    "01656461203Duc@@");

                byte[] pdfBytes = memoryStream.ToArray();
                byte[] signedPdf = PDFSign.SignPdf(pdfBytes, user.Email!, userCert);

                return File(signedPdf, "application/pdf", "Document.pdf");
            }



        }
        catch (Exception ex)
        {
            return BadRequest(ex.Message);
        }


    }


    [HttpGet("exportExcelOfUser")]
    [Authorize]
    public async Task<IActionResult> ExportExcelOfUser(Guid evaluationId)
    {
        var userCurrentId = Guid.Parse(HttpContext.User.FindFirst("Id")!.Value);

        try
        {
            var user = await _context.Users!.Where(e => e.Id == userCurrentId).FirstOrDefaultAsync();

            if (user == null) return Ok();

            var userType = await _context.UserTypes!.Where(e => e.Id == user.UserTypeId).FirstOrDefaultAsync();

            var unit = await _context.Units!.Where(u => u.Id == user.UnitId).FirstOrDefaultAsync();

            var evaluationDetailsPersonal = await _context.EvaluationDetailsPersonals.Where(e => e.EvaluationId == evaluationId && e.UserId == userCurrentId && e.Status >= 2).FirstOrDefaultAsync();

            if (unit == null || evaluationDetailsPersonal == null || userType == null) return Ok();

            var dataOfUser = await _evaluationCriteriaRepository.CriteriaToTreeWithUser(evaluationId, userCurrentId);

            if (dataOfUser != null && (dataOfUser.ListTotal == null || !dataOfUser.ListTotal.Any())) return Ok();

            using (var stream = new MemoryStream())
            {
                using (var package = new ExcelPackage(stream))
                {

                    ExcelWorksheet worksheet;

                    // Lấy danh sách tất cả các người dùng từ ListPoints
                    List<PointModel>? allUsers = dataOfUser?.ListCriterias?
                        .SelectMany(c => c.ListPoints)
                        .GroupBy(p => p.Id)
                        .Select(g => g.First())
                        .ToList();

                    if (package.Workbook.Worksheets.Count == 0)
                    {
                        worksheet = package.Workbook.Worksheets.Add("Phiếu đánh giá");
                    }
                    else
                    {
                        worksheet = package.Workbook.Worksheets[0];
                    }


                    int countColumn = 3 + allUsers!.Count;

                    for (int col = 1; col <= countColumn; col++)
                    {
                        worksheet.Column(col).Width = 50;
                        worksheet.Column(col).Style.WrapText = true;
                    }

                    worksheet.Cells["A1:G1000"].Clear();
                    worksheet.Cells["A1:G1000"].Style.Font.Name = "Times New Roman";
                    worksheet.Cells["A1:G1000"].Style.HorizontalAlignment = ExcelHorizontalAlignment.Center;
                    worksheet.Cells["A1:G1000"].Style.VerticalAlignment = ExcelVerticalAlignment.Center;

                    // Thêm tiêu đề cột
                    worksheet.Cells[1, 1].Value = unit.UnitName!; // A1
                    worksheet.Cells[1, 1].Style.Font.Bold = true;
                    worksheet.Cells[4, 1, 4, (4 + allUsers!.Count)].Merge = true;
                    worksheet.Cells[4, 1].Value = dataOfUser!.EvaluationName; // A4
                    worksheet.Cells[4, 1].Style.Font.Bold = true;
                    worksheet.Cells[4, 1].Style.Font.Size = 14;
                    worksheet.Cells[6, 1].Value = "Họ và tên: " + user.FullName; // A6
                    worksheet.Cells[7, 1].Value = "Chức vụ: " + userType!.UserTypeName; // A7
                    worksheet.Cells[1, countColumn].Value = "CỘNG HÒA XÃ HỘI CHỦ NGHĨA VIỆT NAM";
                    worksheet.Cells[1, countColumn].Style.Font.Bold = true;
                    worksheet.Cells[2, countColumn].Value = "Độc lập - Tự do - Hạnh phúc";
                    worksheet.Cells[2, countColumn].Style.Font.Bold = true;
                    worksheet.Cells[2, countColumn].Style.Font.UnderLine = true;


                    worksheet.Cells[9, 1, 10, 1].Merge = true;
                    worksheet.Cells[9, 1].Value = "STT";
                    worksheet.Cells[9, 1].Style.Border.BorderAround(ExcelBorderStyle.Thin);
                    worksheet.Cells[9, 2, 10, 2].Merge = true;
                    worksheet.Cells[9, 2].Value = "Nội dung đánh giá";
                    worksheet.Cells[9, 2].Style.Border.BorderAround(ExcelBorderStyle.Thin);
                    worksheet.Cells[9, 3, 10, 3].Merge = true;
                    worksheet.Cells[9, 3].Value = "Điểm tối đa";
                    worksheet.Cells[9, 3].Style.Border.BorderAround(ExcelBorderStyle.Thin);
                    worksheet.Cells[9, 4, 9, countColumn].Merge = true;
                    worksheet.Cells[9, 4].Value = "Kết quả đánh giá";


                    for (int j = 1; j <= 3; j++)
                    {
                        worksheet.Cells[9, j].Style.Border.BorderAround(ExcelBorderStyle.Thin);
                        worksheet.Cells[9, j].Style.VerticalAlignment = ExcelVerticalAlignment.Center;
                        worksheet.Cells[9, j].Style.Font.Name = "Times New Roman";
                        worksheet.Cells[9, j].Style.Font.Size = 13;
                        worksheet.Cells[9, j].Style.WrapText = true;

                        worksheet.Cells[10, j].Style.Border.BorderAround(ExcelBorderStyle.Thin);
                    }


                    for (int j = 4; j <= countColumn; j++)
                    {
                        worksheet.Cells[9, j].Style.Border.BorderAround(ExcelBorderStyle.Thin);
                        worksheet.Cells[10, j].Style.Border.BorderAround(ExcelBorderStyle.Thin);
                        worksheet.Cells[9, j].Style.VerticalAlignment = ExcelVerticalAlignment.Center;
                        worksheet.Cells[9, j].Style.Font.Name = "Times New Roman";
                        worksheet.Cells[9, j].Style.Font.Size = 13;
                        worksheet.Cells[9, j].Style.WrapText = true;
                    }


                    for (int i = 0; i < allUsers!.Count; i++)
                    {
                        var userGet = await _context.Users!.Where(e => e.Id == allUsers[i].UserId).FirstOrDefaultAsync();

                        if (userGet != null)
                        {
                            worksheet.Cells[10, 4 + i].Value = userGet.FullName;
                        }
                        else
                        {
                            worksheet.Cells[10, 4 + i].Value = "";
                        }

                        worksheet.Cells[10, 4 + i].Style.Border.Top.Style = ExcelBorderStyle.Thin;
                        worksheet.Cells[10, 4 + i].Style.Border.Left.Style = ExcelBorderStyle.Thin;
                        worksheet.Cells[10, 4 + i].Style.Border.Right.Style = ExcelBorderStyle.Thin;
                        worksheet.Cells[10, 4 + i].Style.Border.Bottom.Style = ExcelBorderStyle.Thin;
                        worksheet.Cells[10, 4 + i].Style.VerticalAlignment = ExcelVerticalAlignment.Center;
                        worksheet.Cells[10, 4 + i].Style.Font.Name = "Times New Roman";
                        worksheet.Cells[10, 4 + i].Style.Font.Size = 13;
                        worksheet.Cells[10, 4 + i].Style.WrapText = true;
                    }

                    int row = 11;
                    int columnStart = 4;
                    foreach (var criteria in dataOfUser?.ListCriterias!)
                    {
                        row = FillCriteriaRecursiveExcel(worksheet, criteria, allUsers, columnStart, row);
                    }

                    worksheet.Cells[row, 1, row, 2].Merge = true; // Gộp ô từ A đến B
                    worksheet.Cells[row, 1].Style.Border.BorderAround(ExcelBorderStyle.Thin);
                    worksheet.Cells[row, 2].Style.Border.BorderAround(ExcelBorderStyle.Thin);
                    worksheet.Cells[row, 1].Value = "Tổng điểm";
                    worksheet.Cells[row, 1].Style.HorizontalAlignment = ExcelHorizontalAlignment.Center;
                    worksheet.Cells[row, 3].Value = dataOfUser?.TotalEndValue;
                    worksheet.Cells[row, 3].Style.Border.BorderAround(ExcelBorderStyle.Thin);

                    int rowStart = 4;
                    foreach (var p in dataOfUser?.ListTotal!)
                    {
                        worksheet.Cells[row, rowStart].Value = p;
                        worksheet.Cells[row, rowStart].Style.Border.BorderAround(ExcelBorderStyle.Thin);
                        rowStart++;
                    }
                    /*---------------------------------------------------------------*/
                    row++;
                    rowStart = 4;

                    worksheet.Cells[row, 1, row, 3].Merge = true; // Gộp ô từ A đến B
                    worksheet.Cells[row, 1].Style.Border.BorderAround(ExcelBorderStyle.Thin);
                    worksheet.Cells[row, 2].Style.Border.BorderAround(ExcelBorderStyle.Thin);
                    worksheet.Cells[row, 3].Style.Border.BorderAround(ExcelBorderStyle.Thin);
                    worksheet.Cells[row, 1].Value = "Xếp loại đánh giá";

                    foreach (var p in dataOfUser?.ListTotal!)
                    {
                        worksheet.Cells[row, rowStart].Value = GetGradingName(p);
                        worksheet.Cells[row, rowStart].Style.Border.BorderAround(ExcelBorderStyle.Thin);
                        rowStart++;
                    }


                    /*---------------------------------------------------------------*/

                    package.SaveAs(stream);
                }

                byte[] excelBytes = stream.ToArray();

                /*X509Certificate2 userCert = CertificateGenerator.CreateCertificate(
                            user.FullName!,
                            user.Email!,
                            "NoteVN",
                            unit.UnitName!,
                            "VN",
                            "Note@123456");

                byte[] signExcel = ExcelSign.Sign(excelBytes, userCert);*/

                string filePath = @"C:\SA\PrinterWordTemplate\TempExcel\" + userCurrentId + "_" + evaluationId + "_" + DateTime.Now.Millisecond + ".xlsx";

                try
                {
                    using (var fileStream = new FileStream(filePath, FileMode.Create, FileAccess.Write, FileShare.None, 4096, true))
                    {
                        await fileStream.WriteAsync(excelBytes, 0, excelBytes.Length);
                    }
                }
                catch (Exception ex)
                {
                    return Ok(new ApiResult().Failure<EvaluationConsolidationAndTransferDetailsModel>(ex.Message));
                }




                var account = new Account(
                                      "dvgdcqn5g",
                                      "621798912237287",
                                      "7FqPAOtqqppKEAdWsxiZmmqx-bs"
                                    );

                var cloudinary = new Cloudinary(account);

                var uploadParams = new RawUploadParams
                {
                    File = new FileDescription(filePath),
                    PublicId = Guid.NewGuid().ToString(),
                    Folder = "excel"
                };

                var uploadResult = await cloudinary.UploadAsync(uploadParams);


                if (uploadResult.StatusCode == System.Net.HttpStatusCode.OK)
                {
                    return Ok(new ApiResult().Success<EvaluationConsolidationAndTransferDetailsModel>(uploadResult.SecureUrl.ToString()));
                }
                else
                {
                    return Ok(new ApiResult().Failure<EvaluationConsolidationAndTransferDetailsModel>("Không thể lấy đường dẫn tệp."));
                }

            }
        }
        catch (Exception ex)
        {
            return BadRequest(ex.Message);
        }

    }



    [HttpPost("analystOfUnit")]
    [Authorize]
    public async Task<IActionResult> AnalystOfUnit(AnalystOfUnitModel model)
    {
        try
        {
            if (model.UnitId == Guid.Empty)
            {
                return Ok(new ApiResult().Failure<AnalystOfUnitModel>("Vui lòng chọn đơn vị cần thống kê."));
            }

            var units = await _unitRepository.GetAllChildOfUnitAsync(model.UnitId);


            if (units.DataList == null || units.DataList.Length == 0)
            {
                return Ok(new ApiResult().Failure<AnalystOfUnitModel>("Đơn vị cần thống kê không hợp lệ."));
            }

            int totalEvaluation = 0;
            int totalUser = 0;
            int totalKHTNV = 0;
            int totalHTNV = 0;
            int totalHTTNV = 0;
            int totalHTXSNV = 0;


            List<Guid> userIds = new List<Guid>();

            List<AnalystOfUnitResponseModel> analystOfUnits = new List<AnalystOfUnitResponseModel>();

            var evaluations = await _context.Evaluations.Where(e => units.DataList.Select(e => e.Id).Contains(e.UnitId) && !e.IsDeleted).ToListAsync();

            foreach (var evaluation in evaluations)
            {
                if (evaluation.CategoryTimeTypeId == null) continue;

                var ctt = await _context.CategoryTimeTypes.Where(e => e.Id == evaluation.CategoryTimeTypeId).FirstOrDefaultAsync();

                if (ctt == null) continue;

                if (ctt.FromDate.Date >= model.StartTime.Date &&
                    ctt.ToDate.Date <= model.EndTime.Date &&
                    ctt.FromDate.Date >= model.StartTime.Date &&
                    ctt.ToDate.Date <= model.EndTime.Date)
                {

                    var evaluationUser = await _context.EvaluationUsers.Where(e => e.EvaluationId == evaluation.Id && e.Type == 1 && !e.IsDeleted).ToListAsync();

                    var supervisor = await _context.EvaluationUsers.Where(e => e.EvaluationId == evaluation.Id && e.Type == 2 && !e.IsDeleted).OrderByDescending(e => e.Sort).FirstOrDefaultAsync();

                    if (supervisor == null) continue;

                    totalEvaluation += 1;

                    foreach (var user in evaluationUser)
                    {

                        if (!userIds.Contains(user.UserId))
                        {
                            userIds.Add(user.UserId);
                        }

                        var edp = await _context.EvaluationDetailsPersonals.Where(e => e.EvaluationId == evaluation.Id && e.UserId == user.UserId && e.Status >= 2).ToListAsync();

                        if (edp == null || edp.Count == 0) continue;

                        var eds = await _context.EvaluationDetailsSupervisors.Where(e =>
                                                                                    e.EvaluationId == evaluation.Id &&
                                                                                    e.UserSupervisorId == supervisor.UserId &&
                                                                                    edp.Select(e => e.Id).Contains(e.EvaluationDetailsPersonalId) &&
                                                                                    e.Status >= 2).ToListAsync();

                        if (eds == null || eds.Count == 0) continue;

                        int tongDiemUser = edp.Sum(e => e.AssessmentValue);
                        int tongDiemSupervisor = eds.Sum(e => e.AssessmentValueSupervisor);

                        var unit = await _context.Units!.Where(e => e.Id == evaluation.UnitId).FirstOrDefaultAsync();
                        var getUser = await _context.Users!.Where(e => e.Id == user.UserId).FirstOrDefaultAsync();

                        if (tongDiemSupervisor >= 90)
                        {
                            totalHTXSNV += 1;
                        }
                        else if (tongDiemSupervisor >= 70)
                        {
                            totalHTTNV += 1;
                        }
                        else if (tongDiemSupervisor >= 60)
                        {
                            totalHTNV += 1;
                        }
                        else
                        {
                            totalKHTNV += 1;
                        }


                        AnalystOfUnitResponseModel analyst = new AnalystOfUnitResponseModel()
                        {
                            EvaluationName = evaluation.EvaluationName,
                            UnitName = unit!.UnitName,
                            FullName = getUser!.FullName,
                            AssessmentValue = tongDiemUser,
                            AssessmentValueSupervisor = tongDiemSupervisor
                        };
                        analystOfUnits.Add(analyst);
                    }
                }
            }


            totalUser = userIds.Count;


            AnalystOfUnitsModel analystOfUnitsModel = new AnalystOfUnitsModel()
            {

                TotalEvaluation = totalEvaluation,
                TotalUser = totalUser,
                TotalKHTNV = totalKHTNV,
                TotalHTNV = totalHTNV,
                TotalHTTNV = totalHTTNV,
                TotalHTXSNV = totalHTXSNV,
                AnalystOfUnitsRespons = analystOfUnits
            };

            return Ok(new Pagination().HandleGetByIdRespond(analystOfUnitsModel));


        }
        catch (Exception ex)
        {
            return BadRequest(ex.Message);
        }

    }






    private async Task<byte[]> ConvertDocxToPdfAsync(string docxFilePath, string pdfFileTemp)
    {

        if (System.IO.File.Exists(pdfFileTemp))
        {
            System.IO.File.Delete(pdfFileTemp);
        }

        ConvertApi convertApi = new ConvertApi(_configuration["ApiKeyConvertApi"].ToString());

        ConvertApi.ApiBaseUri = "https://v2.convertapi.com";

        ConvertApiResponse result = await convertApi.ConvertAsync("docx", "pdf", new ConvertApiFileParam(docxFilePath));

        await result.SaveFileAsync(pdfFileTemp);

        return System.IO.File.ReadAllBytes(pdfFileTemp);

    }

    private static int FillCriteriaRecursiveExcel(ExcelWorksheet worksheet, CriteriaTreeCustomModel criteria, List<PointModel> allUsers, int columnStart, int row)
    {
        worksheet.Cells[row, 1].Value = criteria.STT;
        worksheet.Cells[row, 1].Style.Border.BorderAround(ExcelBorderStyle.Thin);
        worksheet.Cells[row, 2].Value = criteria.CriteriaName;
        worksheet.Cells[row, 2].Style.Border.BorderAround(ExcelBorderStyle.Thin);
        worksheet.Cells[row, 3].Value = criteria.EndValue;
        worksheet.Cells[row, 3].Style.Border.BorderAround(ExcelBorderStyle.Thin);

        foreach (var point in criteria.ListPoints)
        {
            var userIndex = allUsers.FindIndex(u => u.Id == point.Id);
            int column = columnStart + userIndex;
            worksheet.Cells[row, column].Value = point.AssessmentValue;
            worksheet.Cells[row, column].Style.Border.BorderAround(ExcelBorderStyle.Thin);
        }

        row++;

        // Đệ quy cho tất cả các tiêu chí con
        if (criteria.Children != null)
        {
            foreach (var child in criteria.Children)
            {
                row = FillCriteriaRecursiveExcel(worksheet, child, allUsers, columnStart, row);
            }
        }

        return row;
    }

    private static void FillCriteriaRecursivePDF(Table table, PdfFont font, CriteriaTreeCustomModel criteria, List<PointModel> allUsers)
    {
        // Thêm dữ liệu vào hàng của bảng
        table.AddCell(new Cell().Add(new Paragraph(criteria.STT!.ToString()).SetFont(font))
            .SetTextAlignment(TextAlignment.CENTER));
        table.AddCell(new Cell().Add(new Paragraph(criteria.CriteriaName).SetFont(font))
            .SetTextAlignment(TextAlignment.LEFT));
        table.AddCell(new Cell().Add(new Paragraph(criteria.EndValue.ToString()).SetFont(font))
            .SetTextAlignment(TextAlignment.CENTER));

        foreach (var point in criteria.ListPoints)
        {
            table.AddCell(new Cell().Add(new Paragraph(point.AssessmentValue.ToString()).SetFont(font))
                .SetTextAlignment(TextAlignment.CENTER));
        }

        // Đệ quy cho tất cả các tiêu chí con
        if (criteria.Children != null)
        {
            foreach (var child in criteria.Children)
            {
                FillCriteriaRecursivePDF(table, font, child, allUsers);
            }
        }
    }

    private List<Tuple<string, bool>> FlattenCriteriaList(List<CriteriaTreeCustomModel> criteriaList)
    {
        List<Tuple<string, bool>> flatList = new List<Tuple<string, bool>>();

        foreach (var criteria in criteriaList)
        {
            bool isParent = criteria.Children != null && criteria.Children.Count > 0;

            flatList.Add(new Tuple<string, bool>(criteria.CriteriaName ?? "", isParent));

            if (isParent)
            {
                flatList.AddRange(FlattenCriteriaList(criteria.Children!));
            }
        }

        return flatList;
    }

    private int CalculateTotalEndValue(List<CriteriaTreeCustomModel> criteriaList)
    {
        int totalEndValue = 0;

        foreach (var criteria in criteriaList)
        {
            if (criteria.Children != null && criteria.Children.Count > 0)
            {
                if (criteria.IsDistinct == true)
                {
                    int maxEndValue = criteria.Children.Max(child => child.EndValue);
                    totalEndValue += maxEndValue;
                }
                else
                {
                    totalEndValue += CalculateTotalEndValue(criteria.Children);
                }
            }
            else
            {
                totalEndValue += criteria.EndValue;
            }
        }

        return totalEndValue;
    }

    private static string GetGradingName(int score)
    {
        if (score >= 90) return "HTXSNV";
        if (score >= 70) return "HTTNV";
        if (score >= 60) return "HTNV";
        return "KHTNV";
    }

    private static string CreateImageWithText(string PersonSign, string DateSign, string Unit, string IdPersonSign)
    {
        int width = 350;
        int height = 200;
        using (Bitmap bitmap = new Bitmap(width, height))
        {
            using (Graphics graphics = Graphics.FromImage(bitmap))
            {
                graphics.Clear(System.Drawing.Color.White);

                Font font = new Font("Arial", 48, FontStyle.Regular);
                Brush brush = Brushes.Black;

                string[] lines = new string[]
                {
                                "Người kí: " + PersonSign,
                                "Ngày kí: "  + DateSign,
                                "Đơn vị: "   + Unit
                };

                int columnSpacing = 0;

                Font checkmarkFont = new Font("Arial", 72, FontStyle.Bold);
                Brush checkmarkBrush = Brushes.Green;
                string checkmark = "✔";

                float checkmarkXPosition = columnSpacing;
                float checkmarkYPosition = 20;

                graphics.DrawString(checkmark, checkmarkFont, checkmarkBrush, new PointF(checkmarkXPosition, checkmarkYPosition));

                Font textFont = new Font("Arial", 16, FontStyle.Regular);
                Brush textBrush = Brushes.Black;

                graphics.DrawString("Người kí: " + PersonSign, textFont, textBrush, new PointF(checkmarkXPosition + 10, checkmarkYPosition + 30));
                graphics.DrawString("Ngày kí: " + DateSign, textFont, textBrush, new PointF(checkmarkXPosition + 10, checkmarkYPosition + 60));
                graphics.DrawString("Đơn vị: " + Unit, textFont, textBrush, new PointF(checkmarkXPosition + 10, checkmarkYPosition + 90));
            }

            string fileName = IdPersonSign + ".png";
            string imagePath = Path.Combine("C:\\SA\\ServerFileUserSign", fileName);
            bitmap.Save(imagePath, ImageFormat.Png);

            return fileName;
        }
    }
}

