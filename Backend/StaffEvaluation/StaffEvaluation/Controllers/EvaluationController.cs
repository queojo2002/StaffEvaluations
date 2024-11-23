using MailKit.Net.Smtp;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using MimeKit;
using StaffEvaluation.Data;
using StaffEvaluation.Helpers;
using StaffEvaluation.Models;
using StaffEvaluation.Models.Payload;
using StaffEvaluation.Repositories.IRepository;

namespace StaffEvaluation.Controllers;

[Route("api/v1/evaluation")]
[ApiController]
public class EvaluationController : Controller
{
    private readonly IEvaluationRepository _evaluationRepository;
    private readonly DataContext _context;

    public EvaluationController(IEvaluationRepository evaluationRepository, DataContext context)
    {
        _evaluationRepository = evaluationRepository;
        _context = context;
    }

    [HttpGet("getAll")]
    [Authorize]
    public async Task<IActionResult> GetAll()
    {
        var unitId = Guid.Parse(HttpContext.User.FindFirst("UnitId")!.Value);

        var get = await _evaluationRepository.GetEvaluationOfUnit(unitId);

        return Ok(get);
    }


    [HttpGet("getEvaluationOfUser")]
    [Authorize]
    public async Task<IActionResult> GetEvaluationOfUser()
    {
        var userId = Guid.Parse(HttpContext.User.FindFirst("Id")!.Value);

        var get = await _evaluationRepository.GetEvaluationOfUser(userId);

        return Ok(get);
    }

    [HttpGet("getEvaluationOfSupervisor")]
    [Authorize]
    public async Task<IActionResult> GetEvaluationOfSupervisor()
    {
        var userId = Guid.Parse(HttpContext.User.FindFirst("Id")!.Value);

        var get = await _evaluationRepository.GetEvaluationOfSupervisor(userId);

        return Ok(get);
    }


    [HttpGet("{id}")]
    [Authorize]
    public async Task<IActionResult> GetById(Guid id)
    {
        var data = await _evaluationRepository.GetByIdAsync(id);

        return Ok(data);
    }


    [HttpPost("insert")]
    [Authorize]
    public async Task<IActionResult> Insert([FromBody] EvaluationAddPayload model)
    {
        var insertData = await _evaluationRepository.InsertListAsync(model);

        return !insertData.IsSuccess ? BadRequest(insertData) : Ok(insertData);
    }

    [HttpPost("update")]
    [Authorize]
    public async Task<IActionResult> Update([FromBody] EvaluationModel model)
    {
        var updateData = await _evaluationRepository.UpdateAsync(model);

        return !updateData.IsSuccess ? BadRequest(updateData) : Ok(updateData);
    }

    [HttpPost("updateList")]
    [Authorize]
    public async Task<IActionResult> UpdateList([FromBody] EvaluationUpdatePayload model)
    {
        var updateData = await _evaluationRepository.UpdateListAsync(model);

        return !updateData.IsSuccess ? BadRequest(updateData) : Ok(updateData);
    }


    [HttpPost("removeRange")]
    [Authorize]
    public async Task<IActionResult> RemoveRange(List<Guid> ids)
    {
        var delData = await _evaluationRepository.RemoveRangeAsync(ids);

        return !delData.IsSuccess ? BadRequest(delData) : Ok(delData);
    }


    [HttpGet("sendMail")]
    [Authorize]
    public async Task<IActionResult> SendMail(Guid userId, Guid evaluationId)
    {

        var user = await _context.Users!.Where(e => e.Id == userId).FirstOrDefaultAsync();

        var evaluation = await _context.Evaluations.Where(e => e.Id == evaluationId).FirstOrDefaultAsync();

        if (user == null || evaluation == null)
        {
            return BadRequest(new ApiResult().Failure<EvaluationModel>($"Có lỗi khi gửi email nhắc nhở."));
        }

        var ctt = await _context.CategoryTimeTypes.Where(e => e.Id == evaluation.CategoryTimeTypeId).FirstOrDefaultAsync();

        if (ctt == null)
        {
            return BadRequest(new ApiResult().Failure<EvaluationModel>($"Có lỗi khi gửi email nhắc nhở."));
        }

        try
        {
            var email = new MimeMessage();

            email.From.Add(new MailboxAddress("Hệ thống quản lý đánh giá cán bộ", "narutokun456789@gmail.com"));
            email.To.Add(new MailboxAddress(user.FullName, user.Email));

            email.Subject = "Nhắc nhở hoàn thành phiếu đánh giá";

            email.Body = new TextPart(MimeKit.Text.TextFormat.Html)
            {
                Text = $@"
        <div style='font-family: Arial, sans-serif; max-width: 600px; margin: 0 auto; border: 1px solid #ddd; border-radius: 10px; padding: 20px; background-color: #f9f9f9;'>
            <h2 style='color: #1890ff; text-align: center;'>{evaluation.EvaluationName}</h2>
            <p style='font-size: 16px; color: #333;'>
                Xin chào, {user.FullName}<br><br>
                Bạn có phiếu đánh chưa thực hiện. Vui lòng hoàn thành phiếu đánh giá trước thời hạn để hệ thống của chúng tôi có thể lưu ý kiến đóng góp của bạn.
            </p>
            <p style='font-size: 14px; color: #666;'>
                Thời hạn chót hoàn thành: <strong style='color: #ff4d4f;'>Ngày {ctt.ToDate.Date.ToString("dd/MM/yyyy")}</strong>
            </p>
            <div style='text-align: center; margin-top: 20px;'>
                <a href='http://127.0.0.1:5173/evaluation-forms/self-evaluation' style='display: inline-block; text-decoration: none; padding: 10px 20px; background-color: #1890ff; color: white; border-radius: 5px; font-size: 16px;'>Hoàn thành ngay</a>
            </div>
            <p style='font-size: 14px; color: #666; margin-top: 20px;'>
                Cảm ơn bạn đã hợp tác. Nếu có bất kỳ câu hỏi nào, vui lòng liên hệ với chúng tôi qua email này.
            </p>
            <p style='text-align: center; font-size: 12px; color: #999;'>
                Hệ Thống Quản Lý Đánh Giá Cán Bộ - Công ty ABC<br>
                Hotline: 0326.393.540 | Email: narutokun456789@gmail.com
            </p>
        </div>
        "
            };

            using (var smtp = new SmtpClient())
            {
                smtp.Connect("smtp.gmail.com", 587, false);

                // SMTP server authentication
                smtp.Authenticate("narutokun456789@gmail.com", "qgih isdd zbwc osku");

                smtp.Send(email);
                smtp.Disconnect(true);
            }

            return Ok(new ApiResult().Success<EvaluationModel>($"Gửi email nhắc nhở thành công."));

        }
        catch (Exception ex)
        {
            return BadRequest(new ApiResult().Failure<EvaluationModel>($"Có lỗi khi gửi email nhắc nhở." + ex.Message));
        }
    }



}

