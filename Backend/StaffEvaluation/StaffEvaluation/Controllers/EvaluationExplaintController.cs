using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
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


    [HttpPut("getAllCustom")]
    [Authorize]
    public async Task<IActionResult> GetAllCustom(EvaluationExplaintGetPayload model)
    {
        var userId = Guid.Parse(HttpContext.User.FindFirst("Id")!.Value);

        var get = await _evaluationExplaintRepository.GetAllCustomAsync(model, userId);

        return Ok(get);
    }

    [HttpPost("insert")]
    [Authorize]
    public async Task<IActionResult> Insert([FromForm] EvaluationExplaintModel modelPayload, [FromForm] IFormFile? fileAttachments)
    {
        var userId = Guid.Parse(HttpContext.User.FindFirst("Id")!.Value);

        string currentTimeWithMilliseconds = DateTime.Now.ToString("yyyyMMddHHmmssfff");


        EvaluationExplaintModel model = new EvaluationExplaintModel()
        {
            UserId = userId,
            EvaluationId = modelPayload.EvaluationId,
            CategoryCriteriaId = modelPayload.CategoryCriteriaId,
            Note = modelPayload.Note,
            FileAttachments = fileAttachments != null ? currentTimeWithMilliseconds : null
        };


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

