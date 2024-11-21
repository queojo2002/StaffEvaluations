using ConvertApiDotNet;
using ConvertApiDotNet.Model;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using MiniSoftware;
using OfficeOpenXml;
using OfficeOpenXml.Style;
using StaffEvaluation.Data;
using StaffEvaluation.Helpers;
using StaffEvaluation.Models;
using StaffEvaluation.Models.Payload;
using StaffEvaluation.Repositories.IRepository;
using System.Drawing;
using System.Drawing.Imaging;
using System.Net.Mime;

namespace StaffEvaluation.Controllers;



[Route("api/v1/evaluationConsolidationAndTransfer")]
[ApiController]
public class EvaluationConsolidationAndTransferController : Controller
{
    private readonly IEvaluationConsolidationAndTransferRepository _evaluationConsolidationAndTransferRepository;
    private readonly IEvaluationConsolidationAndTransferDetailsRepository _evaluationConsolidationAndTransferDetailsRepository;
    private readonly IEvaluationDetailsPersonalRepository _evaluationDetailsPersonalRepository;
    private readonly IEvaluationDetailsSupervisorRepository _evaluationDetailsSupervisorRepository;
    private readonly IUnitRepository _unitRepository;
    private readonly IUserRepository _userRepository;
    private readonly IConfiguration _configuration;
    private readonly DataContext _context;


    public EvaluationConsolidationAndTransferController(
        IEvaluationConsolidationAndTransferRepository evaluationConsolidationAndTransferRepository,
        IEvaluationConsolidationAndTransferDetailsRepository evaluationConsolidationAndTransferDetailsRepository,
        IEvaluationDetailsPersonalRepository evaluationDetailsPersonalRepository,
        IEvaluationDetailsSupervisorRepository evaluationDetailsSupervisorRepository,
        IUnitRepository unitRepository,
        DataContext context,
        IUserRepository userRepository,
        IConfiguration configuration)
    {
        _evaluationConsolidationAndTransferRepository = evaluationConsolidationAndTransferRepository;
        _evaluationConsolidationAndTransferDetailsRepository = evaluationConsolidationAndTransferDetailsRepository;
        _evaluationDetailsPersonalRepository = evaluationDetailsPersonalRepository;
        _evaluationDetailsSupervisorRepository = evaluationDetailsSupervisorRepository;
        _unitRepository = unitRepository;
        _context = context;
        _userRepository = userRepository;
        _configuration = configuration;
    }



    [HttpGet("getAll")]
    [Authorize]
    public async Task<IActionResult> GetAll()
    {
        var unitId = Guid.Parse(HttpContext.User.FindFirst("UnitId")!.Value);

        var get = await _evaluationConsolidationAndTransferRepository.GetAllOfUnit(unitId);

        return Ok(get);
    }


    [HttpGet("getAllEvaluationAvailable/{evaluationConsolidationAndTransferId}")]
    [Authorize]
    public async Task<IActionResult> GetAllEvaluationAvailable(Guid evaluationConsolidationAndTransferId)
    {
        var unitId = Guid.Parse(HttpContext.User.FindFirst("UnitId")!.Value);

        var get = await _evaluationConsolidationAndTransferDetailsRepository.GetAllEvaluationAvailable(evaluationConsolidationAndTransferId, unitId);

        return Ok(get);
    }

    [HttpGet("getAllEvaluationsByConsolidationId/{evaluationConsolidationAndTransferId}")]
    [Authorize]
    public async Task<IActionResult> GetAllEvaluationsByConsolidationId(Guid evaluationConsolidationAndTransferId)
    {
        var get = await _evaluationConsolidationAndTransferDetailsRepository.GetAllEvaluationsByConsolidationIdAsync(evaluationConsolidationAndTransferId);

        return Ok(get);
    }



    [HttpPost("insert")]
    [Authorize]
    public async Task<IActionResult> Insert([FromBody] EvaluationConsolidationAndTransferModel model)
    {
        var userId = Guid.Parse(HttpContext.User.FindFirst("Id")!.Value);

        var unitId = Guid.Parse(HttpContext.User.FindFirst("UnitId")!.Value);

        if (model.EvaluationConsolidationAndTransferName == null)
        {
            return BadRequest(new ApiResult().Failure<EvaluationConsolidationAndTransferModel>($"Vui lòng nhập Tên đợt tổng hợp và chuyển."));
        }

        var insertData = await _evaluationConsolidationAndTransferRepository.InsertCustomAsync(model.EvaluationConsolidationAndTransferName, userId, unitId);

        return !insertData.IsSuccess ? BadRequest(insertData) : Ok(insertData);
    }


    [HttpPost("removeRange")]
    [Authorize]
    public async Task<IActionResult> RemoveRange(List<Guid> ids)
    {
        var delData = await _evaluationConsolidationAndTransferRepository.RemoveRangeAsync(ids);

        return !delData.IsSuccess ? BadRequest(delData) : Ok(delData);
    }

    [HttpPost("insertEvaluationIntoCATD")]
    [Authorize]
    public async Task<IActionResult> InsertEvaluationIntoCATD([FromBody] EvaluationConsolidationAndTransferDetailsAddPayload model)
    {
        var insertData = await _evaluationConsolidationAndTransferDetailsRepository.InsertEvaluationIntoCATDAsync(model);

        return !insertData.IsSuccess ? BadRequest(insertData) : Ok(insertData);
    }

    [HttpPost("removeEvaluationFromCATD")]
    [Authorize]
    public async Task<IActionResult> RemoveEvaluationFromCATD([FromBody] EvaluationConsolidationAndTransferDetailsAddPayload model)
    {
        var removeData = await _evaluationConsolidationAndTransferDetailsRepository.RemoveEvaluationFromCATDAsync(model);

        return !removeData.IsSuccess ? BadRequest(removeData) : Ok(removeData);
    }


    [HttpPost("confirmConsolidationAndTransferEvaluations")]
    [Authorize]
    public async Task<IActionResult> ConfirmConsolidationAndTransferEvaluations([FromForm] Guid evaluationConsolidationAndTransferId, [FromForm] List<IFormFile> files)
    {
        var userCurrentId = Guid.Parse(HttpContext.User.FindFirst("Id")!.Value);

        try
        {
            if (files == null || files.Count < 2)
            {
                return BadRequest(new ApiResult().Failure<EvaluationConsolidationAndTransferDetailsModel>($"Vui lòng tải lên đầy đủ các file."));
            }


            IFormFile? fileWord = files.FirstOrDefault(f => f.FileName.EndsWith(".docx"));

            IFormFile? fileES = files.FirstOrDefault(f => f.FileName.EndsWith(".pem"));

            if (fileWord == null)
            {
                return Ok(new ApiResult().Failure<EvaluationConsolidationAndTransferDetailsModel>($"Vui lòng tải lên file word báo cáo."));
            }

            if (fileES == null)
            {
                return Ok(new ApiResult().Failure<EvaluationConsolidationAndTransferDetailsModel>($"Vui lòng tải lên file chữ ký số."));
            }


            var checkSignature = await _userRepository.CheckElectronicSignature(fileES, userCurrentId);

            if (checkSignature == false)
            {
                return Ok(new ApiResult().Failure<EvaluationConsolidationAndTransferDetailsModel>($"Chữ ký số bạn tải lên không hợp lệ."));
            }


            var user = await _context.Users!.Where(e => e.Id == userCurrentId).FirstOrDefaultAsync();

            if (user == null) return Ok();

            var userType = await _context.UserTypes!.Where(e => e.Id == user.UserTypeId).FirstOrDefaultAsync();

            var unit = await _context.Units!.Where(u => u.Id == user.UnitId).FirstOrDefaultAsync();

            var unitParent = await _unitRepository.GetAllParentOfUnitAsync(user.UnitId);

            var evaluationsCat = await _context.EvaluationConsolidationAndTransfer.Where(e => e.Id == evaluationConsolidationAndTransferId).FirstOrDefaultAsync();

            if (evaluationsCat == null)
            {
                return Ok(new ApiResult().Failure<EvaluationConsolidationAndTransferDetailsModel>($"Không tồn tại đợt Tổng hợp và chuyển này."));
            }
            else if (evaluationsCat.Status != 0)
            {
                return Ok(new ApiResult().Failure<EvaluationConsolidationAndTransferDetailsModel>($"Đợt Tổng hợp và chuyển này đã được Xác nhận rồi."));

            }

            string fileWordSavePath = string.Concat("C:\\SA\\ConsolidationAndTransfer", "\\TempWord\\", evaluationConsolidationAndTransferId + "_TEMP.docx");

            string fileWordSavePath1 = Path.Combine("C:\\SA\\ConsolidationAndTransfer", evaluationConsolidationAndTransferId + ".docx");


            using (var stream = new FileStream(fileWordSavePath, FileMode.Create))
            {
                await fileWord.CopyToAsync(stream);
            }

            var value = new Dictionary<string, object>() { };

            string fileName = CreateImageWithText(user.FullName!, DateTime.Now.ToString(), unit.UnitName!, user.Id.ToString());

            var imagePath = Path.Combine("C:\\SA\\ServerFileUserSign", fileName);

            value.Add("signImage", new MiniWordPicture() { Path = imagePath, Width = 160, Height = 90 });

            value.Add("fullName", user.FullName!);

            MiniWord.SaveAsByTemplate(fileWordSavePath1, fileWordSavePath, value);


            var path = string.Concat("C:\\SA\\PrinterWordTemplate", "\\", "BaoCaoTongHop.xlsx");

            var tempFilePath = string.Concat("C:\\SA\\ConsolidationAndTransfer", "\\", evaluationConsolidationAndTransferId + ".xlsx");

            System.IO.File.Copy(path, tempFilePath, true);

            var fi = new FileInfo(tempFilePath);



            List<Guid> evaluations = await _context.EvaluationConsolidationAndTransferDetails.Where(e => e.EvaluationConsolidationAndTransferId == evaluationConsolidationAndTransferId).Select(e => e.EvaluationId).ToListAsync();


            using (var excelPackage = new ExcelPackage(fi))
            {
                var namedWorksheet = excelPackage.Workbook.Worksheets[0];

                int rowStart = 12;

                int STT = 1;

                if (unitParent != null && unitParent.Count == 1)
                {
                    namedWorksheet.Cells[2, 1].Value = unitParent[0].UnitName!.ToUpper();
                }
                else
                {
                    namedWorksheet.Cells[2, 1].Value = unitParent![1].UnitName!.ToUpper();
                }

                namedWorksheet.Cells[3, 1].Value = unit.UnitName!.ToUpper();


                foreach (var evaluationId in evaluations)
                {
                    var evaluation = await _context.Evaluations.Where(e => e.Id == evaluationId).FirstOrDefaultAsync();

                    if (evaluation == null)
                    {
                        return Ok(new ApiResult().Failure<EvaluationConsolidationAndTransferDetailsModel>($"Có phiếu đánh giá không hợp lệ."));
                    }

                    var supervisor = await _context.EvaluationUsers.Where(e => e.EvaluationId == evaluationId && e.Type == 2).OrderByDescending(e => e.Sort).FirstOrDefaultAsync();

                    if (supervisor == null)
                    {
                        return Ok();
                    }

                    Guid supervisorId = supervisor.UserId;


                    var listUserInUnit = await _context.EvaluationUsers.Where(e => e.EvaluationId == evaluationId && e.Type == 1).ToListAsync();

                    if (listUserInUnit == null || listUserInUnit.Count <= 0)
                    {
                        return Ok();
                    }

                    foreach (var item in listUserInUnit)
                    {
                        var getUser = await _context.Users!.Where(e => e.Id == item.UserId).FirstOrDefaultAsync();

                        if (getUser == null)
                        {
                            return Ok(new ApiResult().Failure<EvaluationConsolidationAndTransferDetailsModel>($"Có người dùng thực hiện đánh giá không hợp lệ."));
                        }

                        var getUserType = await _context.UserTypes!.Where(e => e.Id == getUser!.UserTypeId).FirstOrDefaultAsync();

                        if (getUserType == null)
                        {
                            return Ok(new ApiResult().Failure<EvaluationConsolidationAndTransferDetailsModel>($"Có lỗi trong quá trình tổng hợp và chuyển."));
                        }

                        var edpIds = await _context.EvaluationDetailsPersonals.Where(e => e.EvaluationId == evaluationId && e.UserId == item.UserId && e.Status >= 2).Select(e => e.Id).ToListAsync();

                        if (edpIds == null || edpIds.Count == 0) continue;

                        var checkSupervisorCompeleted = await _context.EvaluationDetailsSupervisors.Where(e => e.UserSupervisorId == supervisorId && e.EvaluationId == evaluationId && e.Status >= 2 && e.EvaluationDetailsPersonalId == edpIds.FirstOrDefault()).FirstOrDefaultAsync();

                        if (checkSupervisorCompeleted == null) continue;

                        int tongDiem = await _context.EvaluationDetailsSupervisors.Where(e => e.UserSupervisorId == supervisorId && e.EvaluationId == evaluationId && e.Status >= 2 && edpIds.Contains(e.EvaluationDetailsPersonalId)).SumAsync(e => e.AssessmentValueSupervisor);


                        var evaluationAAE = await _context.EvaluationAAE.Where(e => e.UserId == item.UserId).FirstOrDefaultAsync();

                        string advantages = evaluationAAE?.Advantages ?? "";

                        string disadvantages = evaluationAAE?.DisAdvantages ?? "";

                        namedWorksheet.Cells[rowStart, 1].Value = STT.ToString();

                        namedWorksheet.Cells[rowStart, 1].Style.Border.BorderAround(ExcelBorderStyle.Thin);

                        namedWorksheet.Cells[rowStart, 2].Value = user.FullName!.ToString();

                        namedWorksheet.Cells[rowStart, 2].Style.Border.BorderAround(ExcelBorderStyle.Thin);

                        namedWorksheet.Cells[rowStart, 3].Value = advantages.Trim();

                        namedWorksheet.Cells[rowStart, 3].Style.Border.BorderAround(ExcelBorderStyle.Thin);

                        namedWorksheet.Cells[rowStart, 4].Value = disadvantages.Trim();

                        namedWorksheet.Cells[rowStart, 4].Style.Border.BorderAround(ExcelBorderStyle.Thin);

                        if (tongDiem >= 90 && tongDiem <= 100)
                        {
                            namedWorksheet.Cells[rowStart, 5].Value = "HTXSNV";
                        }
                        else if (tongDiem >= 70 && tongDiem <= 89)
                        {
                            namedWorksheet.Cells[rowStart, 5].Value = "HTTNV";
                        }
                        else if (tongDiem >= 50 && tongDiem <= 69)
                        {
                            namedWorksheet.Cells[rowStart, 5].Value = "HTNV";
                        }
                        else if (tongDiem >= 0 && tongDiem <= 49)
                        {
                            namedWorksheet.Cells[rowStart, 5].Value = "KHTNV";
                        }
                        else
                        {
                            namedWorksheet.Cells[rowStart, 5].Value = "KXĐ";
                        }

                        namedWorksheet.Cells[rowStart, 5].Style.Border.BorderAround(ExcelBorderStyle.Thin);


                        for (int i = 6; i < 11; i++)
                        {
                            namedWorksheet.Cells[rowStart, i].Value = "";
                            namedWorksheet.Cells[rowStart, i].Style.Border.BorderAround(ExcelBorderStyle.Thin);
                        }

                        rowStart++;

                        STT++;
                    }

                    evaluation.Status = 1;

                    await _context.SaveChangesAsync();
                }

                var fiToSave = new FileInfo(tempFilePath);

                excelPackage.SaveAs(fiToSave);
            }


            evaluationsCat.Status = 1;

            await _context.SaveChangesAsync();

            return Ok(new ApiResult().Success<EvaluationConsolidationAndTransferDetailsModel>($"Tổng hợp và chuyển thành công."));

        }
        catch (Exception ex)
        {
            return Ok(new ApiResult().Failure<EvaluationConsolidationAndTransferDetailsModel>($"Có lỗi trong quá trình tổng hợp và chuyển: " + ex.Message));
        }

    }



    [HttpGet("exportWordAnalystSample")]
    [Authorize]
    public async Task<IActionResult> ExportWordAnalystSample(Guid evaluationConsolidationAndTransferId)
    {
        var userCurrentId = Guid.Parse(HttpContext.User.FindFirst("Id")!.Value);

        var unitId = Guid.Parse(HttpContext.User.FindFirst("UnitId")!.Value);
        try
        {
            var user = await _context.Users!.Where(e => e.Id == userCurrentId).FirstOrDefaultAsync();

            if (user == null) return Ok();

            var userType = await _context.UserTypes!.Where(e => e.Id == user.UserTypeId).FirstOrDefaultAsync();

            var unit = await _context.Units!.Where(u => u.Id == user.UnitId).FirstOrDefaultAsync();

            var unitParent = await _unitRepository.GetAllParentOfUnitAsync(user.UnitId);

            string originalFilePath = Path.Combine("C:\\SA\\PrinterWordTemplate", "BaoCaoMau.docx");

            string tempFilePath = Path.Combine("C:\\SA\\PrinterWordTemplate\\TempWord", "BaoCaoMau_TEMP.docx");

            if (!System.IO.File.Exists(originalFilePath))
            {
                return BadRequest();
            }

            if (System.IO.File.Exists(tempFilePath))
            {
                System.IO.File.Delete(tempFilePath);
            }

            System.IO.File.Copy(originalFilePath, tempFilePath, true);

            string[] arrayVC = new string[] { "VCQL", "VCGV", "VCNV", "LDHD" };


            int[,] arrayData = new int[4, 8];

            int[,] arrayDataAnalyst = new int[2, 4];

            var value = new Dictionary<string, object>()
            {
                ["listVc"] = new List<Dictionary<string, object>>(),
                ["listLdhd"] = new List<Dictionary<string, object>>()
            };

            var valueTableVC = value["listVc"] as List<Dictionary<string, object>>;

            var valueTableLDHD = value["listLdhd"] as List<Dictionary<string, object>>;

            for (int i = 0; i < arrayData.GetLength(0); i++)
            {
                for (int j = 0; j < arrayData.GetLength(1); j++)
                {
                    arrayData[i, j] = 0;
                }
            }

            for (int i = 0; i < arrayDataAnalyst.GetLength(0); i++)
            {
                for (int j = 0; j < arrayDataAnalyst.GetLength(1); j++)
                {
                    arrayDataAnalyst[i, j] = 0;
                }
            }

            int tongSoNguoiCoTrongPhieuDanhGia = 0;

            int tongSoNguoiDaDanhGia = 0;

            int countVC = 1;

            int countLDHD = 1;

            List<Guid> evaluations = await _context.EvaluationConsolidationAndTransferDetails.Where(e => e.EvaluationConsolidationAndTransferId == evaluationConsolidationAndTransferId).Select(e => e.EvaluationId).ToListAsync();

            foreach (var evaluationId in evaluations)
            {
                var evaluation = await _context.Evaluations.Where(e => e.Id == evaluationId).FirstOrDefaultAsync();

                if (evaluation == null)
                {
                    return Ok();
                }
                else if (evaluation.Status == 1) // Phiếu này đã tổng hợp và chuyển rồi nên không thể tổng hợp được nữa
                {
                    return Ok();
                }

                var supervisor = await _context.EvaluationUsers.Where(e => e.EvaluationId == evaluationId && e.Type == 2).OrderByDescending(e => e.Sort).FirstOrDefaultAsync();

                if (supervisor == null)
                {
                    return Ok();
                }

                Guid supervisorId = supervisor.UserId;


                var listUserInUnit = await _context.EvaluationUsers.Where(e => e.EvaluationId == evaluationId && e.Type == 1).ToListAsync();

                if (listUserInUnit == null || listUserInUnit.Count <= 0)
                {
                    return Ok();
                }

                foreach (var item in listUserInUnit)
                {
                    var getUser = await _context.Users!.Where(e => e.Id == item.UserId).FirstOrDefaultAsync();

                    if (getUser == null)
                    {
                        return Ok();
                    }

                    var getUserType = await _context.UserTypes!.Where(e => e.Id == getUser!.UserTypeId).FirstOrDefaultAsync();

                    if (getUserType == null)
                    {
                        return Ok();
                    }

                    tongSoNguoiCoTrongPhieuDanhGia += 1;

                    var edpIds = await _context.EvaluationDetailsPersonals.Where(e => e.EvaluationId == evaluationId && e.UserId == item.UserId && e.Status >= 2).Select(e => e.Id).ToListAsync();

                    if (edpIds == null || edpIds.Count == 0) continue;

                    var checkSupervisorCompeleted = await _context.EvaluationDetailsSupervisors.Where(e => e.UserSupervisorId == supervisorId && e.EvaluationId == evaluationId && e.Status >= 2 && e.EvaluationDetailsPersonalId == edpIds.FirstOrDefault()).FirstOrDefaultAsync();

                    if (checkSupervisorCompeleted == null) continue;

                    int tongDiem = await _context.EvaluationDetailsSupervisors.Where(e => e.UserSupervisorId == supervisorId && e.EvaluationId == evaluationId && e.Status >= 2 && edpIds.Contains(e.EvaluationDetailsPersonalId)).SumAsync(e => e.AssessmentValueSupervisor);

                    tongSoNguoiDaDanhGia += 1;

                    int flag = 0;

                    foreach (var itemVC in arrayVC)
                    {
                        if (getUser.PositionsName == itemVC && tongDiem >= 90 && tongDiem <= 100)
                        {
                            if (itemVC != arrayVC[3])
                            {
                                arrayDataAnalyst[0, 0]++;
                            }
                            else
                            {
                                arrayDataAnalyst[1, 0]++;
                            }
                            arrayData[0, flag]++;
                        }
                        else if (getUser.PositionsName == itemVC && tongDiem >= 70 && tongDiem <= 89)
                        {
                            if (itemVC != arrayVC[3])
                            {
                                arrayDataAnalyst[0, 1]++;
                            }
                            else
                            {
                                arrayDataAnalyst[1, 1]++;
                            }
                            arrayData[1, flag]++;
                        }
                        else if (getUser.PositionsName == itemVC && tongDiem >= 50 && tongDiem <= 69)
                        {
                            if (itemVC != arrayVC[3])
                            {
                                arrayDataAnalyst[0, 2]++;
                            }
                            else
                            {
                                arrayDataAnalyst[1, 2]++;
                            }
                            arrayData[2, flag]++;
                        }
                        else if (getUser.PositionsName == itemVC && tongDiem >= 0 && tongDiem <= 49)
                        {
                            if (itemVC != arrayVC[3])
                            {
                                arrayDataAnalyst[0, 3]++;
                            }
                            else
                            {
                                arrayDataAnalyst[1, 3]++;
                            }
                            arrayData[3, flag]++;
                        }

                        flag += 2;
                    }

                    if (getUser.PositionsName == arrayVC[3])
                    {
                        valueTableLDHD?.Add(new Dictionary<string, object>
                            {
                                { "stt", countLDHD },
                                { "hovaten", getUser.FullName ?? "" },
                                { "chucvu", getUserType.UserTypeName ?? "" },
                                { "htxsnv",  tongDiem >= 90 && tongDiem <= 100 ? "X" : "" },
                                { "httnv", tongDiem >= 70 && tongDiem <= 89 ? "X" : "" },
                                { "htnv", tongDiem >= 50 && tongDiem <= 69 ? "X":"" },
                                { "khtnv", tongDiem >= 0 && tongDiem <= 49 ? "X":"" }
                            });
                        countLDHD++;
                    }
                    else
                    {
                        valueTableVC?.Add(new Dictionary<string, object>
                            {
                                { "stt", countVC },
                                { "hovaten", getUser.FullName ?? "" },
                                { "chucvu", getUserType.UserTypeName ?? "" },
                                { "htxsnv",  tongDiem >= 90 && tongDiem <= 100 ? "X" : "" },
                                { "httnv", tongDiem >= 70 && tongDiem <= 89 ? "X" : "" },
                                { "htnv", tongDiem >= 50 && tongDiem <= 69 ? "X":"" },
                                { "khtnv", tongDiem >= 0 && tongDiem <= 49 ? "X":"" }
                            });
                        countVC++;
                    }
                }
            }


            for (int i = 0; i < arrayData.GetLength(0); i++)
            {
                for (int j = 0; j < arrayData.GetLength(1); j++)
                {

                    if (j == 1 || j == 3 || j == 5 || j == 7)
                    {
                        if (arrayData[i, j - 1] > 0)
                        {
                            double tyle = (arrayData[i, j - 1] / (double)tongSoNguoiDaDanhGia) * 100;

                            int roundedTyle = (int)Math.Round(tyle);

                            value.Add((i + "," + j), roundedTyle.ToString() + "%");
                        }
                        else
                        {
                            value.Add((i + "," + j), "0");
                        }
                    }
                    else
                    {
                        if (arrayData[i, j] > 0)
                        {
                            value.Add((i + "," + j), arrayData[i, j].ToString() + "/" + tongSoNguoiDaDanhGia.ToString());
                        }
                        else
                        {
                            value.Add((i + "," + j), arrayData[i, j].ToString());
                        }

                    }


                }
            }

            if (unitParent != null && unitParent.Count == 1)
            {
                value.Add("unitParent", unitParent[0].UnitName!);
            }
            else
            {
                value.Add("unitParent", unitParent[1].UnitName!);
            }

            value.Add("unitChildren", unit.UnitName!);

            value.Add("daDanhGia", tongSoNguoiDaDanhGia.ToString() + "/" + tongSoNguoiCoTrongPhieuDanhGia);

            value.Add("chuaDanhGia", (tongSoNguoiCoTrongPhieuDanhGia - tongSoNguoiDaDanhGia).ToString());

            value.Add("day1", DateTime.Now.ToString("dd"));

            value.Add("month1", DateTime.Now.ToString("MM"));

            value.Add("year1", DateTime.Now.ToString("yyyy"));


            value.Add("HTSXNV_VC", arrayDataAnalyst[0, 0].ToString());
            value.Add("HTTNV_VC", arrayDataAnalyst[0, 1].ToString());
            value.Add("HTNV_VC", arrayDataAnalyst[0, 2].ToString());
            value.Add("KHTNV_VC", arrayDataAnalyst[0, 3].ToString());

            value.Add("HTSXNV_LDHD", arrayDataAnalyst[1, 0].ToString());
            value.Add("HTTNV_LDHD", arrayDataAnalyst[1, 1].ToString());
            value.Add("HTNV_LDHD", arrayDataAnalyst[1, 2].ToString());
            value.Add("KHTNV_LDHD", arrayDataAnalyst[1, 3].ToString());

            MiniWord.SaveAsByTemplate(tempFilePath, originalFilePath, value);

            string docxFilePath = Path.Combine(tempFilePath);


            byte[] wordBytes = await System.IO.File.ReadAllBytesAsync(docxFilePath);

            return File(wordBytes, "application/vnd.openxmlformats-officedocument.wordprocessingml.document", "Document.docx");

        }
        catch (Exception ex)
        {
            return BadRequest(ex.Message);
        }
    }


    [HttpGet("exportAnalystConsolidationAndTransfer")]
    [Authorize]
    public async Task<IActionResult> ExportAnalystConsolidationAndTransfer(Guid evaluationConsolidationAndTransferId, int numberTemplate = 1)
    {
        var evaluationCat = await _context.EvaluationConsolidationAndTransfer.Where(e => e.Id == evaluationConsolidationAndTransferId).FirstOrDefaultAsync();

        if (evaluationCat == null)
        {
            return Ok();
        }
        else if (evaluationCat.Status != 1)
        {
            return Ok();
        }

        string wordFile = Path.Combine("C:\\SA\\ConsolidationAndTransfer", evaluationConsolidationAndTransferId + ".docx");

        string pdfFileTemp = Path.Combine("C:\\SA\\ConsolidationAndTransfer\\TempWord", evaluationConsolidationAndTransferId + ".pdf");

        string excelFile = Path.Combine("C:\\SA\\ConsolidationAndTransfer", evaluationConsolidationAndTransferId + ".xlsx");


        if (!System.IO.File.Exists(wordFile) || !System.IO.File.Exists(excelFile))
        {
            return Ok();
        }

        if (numberTemplate == 1)
        {
            byte[] wordBytes = await System.IO.File.ReadAllBytesAsync(wordFile);

            return File(wordBytes, "application/vnd.openxmlformats-officedocument.wordprocessingml.document", "Report.docx");
        }
        else if (numberTemplate == 2)
        {
            byte[] pdfBytes = await ConvertDocxToPdfAsync(wordFile, pdfFileTemp);

            return File(pdfBytes, "application/pdf", "Document.pdf");
        }
        else if (numberTemplate == 3)
        {
            byte[] excelBytes = await System.IO.File.ReadAllBytesAsync(excelFile);

            return File(excelBytes, MediaTypeNames.Application.Octet, "Report.xlsx");
        }
        else
        {
            return Ok();
        }


    }




    private string CreateImageWithText(string PersonSign, string DateSign, string Unit, string IdPersonSign)
    {
        // Khởi tạo ảnh với kích thước cụ thể
        int width = 350;
        int height = 200;
        using (Bitmap bitmap = new Bitmap(width, height))
        {
            using (Graphics graphics = Graphics.FromImage(bitmap))
            {
                graphics.Clear(Color.White);

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

}

