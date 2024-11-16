using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;
using StaffEvaluation.Data;
using StaffEvaluation.Helpers;
using StaffEvaluation.Models.Custom;
using StaffEvaluation.Repositories.IRepository;

namespace StaffEvaluation.Controllers;

[Route("api/v1/evaluationDetailsSupervisor")]
[ApiController]
public class EvaluationDetailsSupervisorController : Controller
{
    private readonly IEvaluationDetailsSupervisorRepository _evaluationDetailsSupervisorRepository;
    private readonly IUserRepository _userRepository;
    private readonly DataContext _context;

    public EvaluationDetailsSupervisorController(IEvaluationDetailsSupervisorRepository evaluationDetailsSupervisorRepository, IUserRepository userRepository, DataContext context)
    {
        _evaluationDetailsSupervisorRepository = evaluationDetailsSupervisorRepository;
        _userRepository = userRepository;
        _context = context;
    }

    [HttpPost("insertAndUpdateCustom")]
    [Authorize]
    public async Task<IActionResult> InsertAndUpdateCustom([FromForm] string evaluationDetailsSupervisorCustom, [FromForm] IFormFile? file)
    {
        var model = JsonConvert.DeserializeObject<EvaluationDetailsPersonalCustomModel>(evaluationDetailsSupervisorCustom);

        if (model == null)
        {
            return BadRequest(new ApiResult().Failure<EvaluationDetailsPersonalCustomModel>($"Danh sách đánh giá không hợp lệ."));
        }

        var userId = Guid.Parse(HttpContext.User.FindFirst("Id")!.Value);

        if (model.EvaluationStatus == 2)
        {
            var checkSignature = await _userRepository.CheckElectronicSignature(file, userId);

            if (checkSignature == false)
            {
                return BadRequest(new ApiResult().Failure<EvaluationDetailsPersonalCustomModel>($"Chữ ký số bạn tải lên không hợp lệ."));
            }
        }

        var insertData = await _evaluationDetailsSupervisorRepository.InsertAndUpdateCustomAsync(model, userId);

        return !insertData.IsSuccess ? BadRequest(insertData) : Ok(insertData);
    }
}

