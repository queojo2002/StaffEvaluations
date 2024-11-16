using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;
using StaffEvaluation.Data;
using StaffEvaluation.Helpers;
using StaffEvaluation.Models.Custom;
using StaffEvaluation.Repositories.IRepository;

namespace StaffEvaluation.Controllers;



[Route("api/v1/evaluationDetailsPersonal")]
[ApiController]
public class EvaluationDetailsPersonalController : Controller
{

    private readonly IEvaluationDetailsPersonalRepository _evaluationDetailsPersonalRepository;
    private readonly IUserRepository _userRepository;
    private readonly DataContext _context;

    public EvaluationDetailsPersonalController(IEvaluationDetailsPersonalRepository evaluationDetailsPersonalRepository, IUserRepository userRepository, DataContext context)
    {
        _evaluationDetailsPersonalRepository = evaluationDetailsPersonalRepository;
        _userRepository = userRepository;
        _context = context;
    }

    [HttpPost("insertAndUpdateCustom")]
    [Authorize]
    public async Task<IActionResult> InsertAndUpdateCustom([FromForm] string evaluationDetailsPersonalCustom, [FromForm] IFormFile? file)
    {
        var model = JsonConvert.DeserializeObject<EvaluationDetailsPersonalCustomModel>(evaluationDetailsPersonalCustom);

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

        var insertData = await _evaluationDetailsPersonalRepository.InsertAndUpdateCustomAsync(model, userId);

        return !insertData.IsSuccess ? BadRequest(insertData) : Ok(insertData);
    }


}

