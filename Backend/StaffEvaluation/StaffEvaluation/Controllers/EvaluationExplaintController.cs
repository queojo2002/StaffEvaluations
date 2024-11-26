using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using StaffEvaluation.Data;
using StaffEvaluation.Helpers;
using StaffEvaluation.Models;
using StaffEvaluation.Models.Custom;
using StaffEvaluation.Repositories.IRepository;

namespace StaffEvaluation.Controllers;

[Route("api/v1/evaluationExplaint")]
[ApiController]
public class EvaluationExplaintController : Controller
{
    private readonly IEvaluationExplaintRepository _evaluationExplaintRepository;
    private readonly DataContext _context;

    public EvaluationExplaintController(IEvaluationExplaintRepository evaluationExplaintRepository, DataContext context)
    {
        _evaluationExplaintRepository = evaluationExplaintRepository;
        _context = context;
    }


    [HttpPut("getAllWithUser")]
    [Authorize]
    public async Task<IActionResult> GetAllWithUser(EvaluationExplaintGetPayload model)
    {
        var userId = Guid.Parse(HttpContext.User.FindFirst("Id")!.Value);

        var get = await _evaluationExplaintRepository.GetAllWithUserAsync(model, userId);

        return Ok(get);
    }


    [HttpPut("getAllWithSupervisor")]
    [Authorize]
    public async Task<IActionResult> GetAllWithSupervisor(EvaluationExplaintGetPayload model)
    {
        var userCurrentId = Guid.Parse(HttpContext.User.FindFirst("Id")!.Value);

        if (model.UserId == null)
        {
            return BadRequest(new ApiResult().Failure<EvaluationExplaintModel>($"Có lỗi khi lấy giải trình."));
        }

        var get = await _evaluationExplaintRepository.GetAllWithSupervisorAsync(model, model.UserId ?? Guid.Empty, userCurrentId);

        return Ok(get);
    }


    [HttpGet("getFileAttachments")]
    [Authorize]
    public async Task<IActionResult> GetFileAttachments(Guid id)
    {
        var evaluationExplaint = await _context.EvaluationExplaints
            .Where(e => e.Id == id)
            .FirstOrDefaultAsync();

        if (evaluationExplaint == null)
        {
            return Ok(new ApiResult().Failure<EvaluationExplaintModel>($"Có lỗi khi lấy tệp giải trình."));
        }
        else if (evaluationExplaint.FileAttachments == null)
        {
            return Ok(new ApiResult().Failure<EvaluationExplaintModel>($"Giải trình này không tồn tại tệp."));
        }

        string filePath = Path.Combine("C:\\SA\\ServerFileExplaint\\", evaluationExplaint.FileAttachments + ".pdf");

        if (!System.IO.File.Exists(filePath))
        {
            return Ok(new ApiResult().Failure<EvaluationExplaintModel>($"Giải trình này không tồn tại tệp."));
        }

        byte[] fileBytes = await System.IO.File.ReadAllBytesAsync(filePath);

        return File(fileBytes, "application/pdf", evaluationExplaint.FileAttachments + ".pdf");
    }


    [HttpPost("insert")]
    [Authorize]
    public async Task<IActionResult> Insert([FromForm] EvaluationExplaintModel modelPayload, [FromForm] IFormFile? fileAttachments)
    {
        var userId = Guid.Parse(HttpContext.User.FindFirst("Id")!.Value);

        string currentTimeWithMilliseconds = DateTime.Now.ToString("yyyyMMddHHmmssfff");

        EvaluationExplaintModel model = new EvaluationExplaintModel();

        if (modelPayload.Type == 2)
        {
            model.UserId = modelPayload.UserId;
            model.SupervisorId = userId;
            model.EvaluationId = modelPayload.EvaluationId;
            model.CategoryCriteriaId = modelPayload.CategoryCriteriaId;
            model.Note = modelPayload.Note;
            model.FileAttachments = fileAttachments != null ? currentTimeWithMilliseconds : null;
        }
        else
        {
            model.UserId = userId;
            model.EvaluationId = modelPayload.EvaluationId;
            model.CategoryCriteriaId = modelPayload.CategoryCriteriaId;
            model.Note = modelPayload.Note;
            model.FileAttachments = fileAttachments != null ? currentTimeWithMilliseconds : null;
        }



        if (fileAttachments != null)
        {
            var fileAttachment = new FileInfo(fileAttachments.FileName);

            string fileExtension = Path.GetExtension(fileAttachment.Name);

            if (fileExtension != ".pdf")
            {
                return BadRequest(new ApiResult().Failure<EvaluationExplaintModel>($"Chỉ được tải tệp minh chứng dạng PDF."));
            }

            if (Request.Form.Files.Count > 0)
            {
                foreach (var file in Request.Form.Files)
                {
                    var filename = Path.Combine("C:\\SA\\ServerFileExplaint", Path.GetFileName(model.FileAttachments! + ".pdf"));

                    await using (var stream = System.IO.File.Create(filename))
                    {
                        await file.CopyToAsync(stream);
                    }
                }
            }
        }

        var insertData = await _evaluationExplaintRepository.InsertAsync(model);

        return !insertData.IsSuccess ? BadRequest(insertData) : Ok(insertData);
    }
}

