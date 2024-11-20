using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using StaffEvaluation.Data;
using StaffEvaluation.Helpers;
using StaffEvaluation.Models.Payload;
using StaffEvaluation.Repositories.IRepository;

namespace StaffEvaluation.Controllers;


[Route("api/v1/evaluationUser")]
[ApiController]
public class EvaluationUserController : Controller
{
    private readonly IEvaluationUserRepository _evaluationUserRepository;
    private readonly DataContext _context;

    public EvaluationUserController(IEvaluationUserRepository evaluationUserRepository, DataContext context)
    {
        _evaluationUserRepository = evaluationUserRepository;
        _context = context;
    }

    [HttpGet("getUsersAllowedToEvaluate/{evaluationId}")]
    [Authorize]
    public async Task<IActionResult> GetUsersAllowedToEvaluate(Guid evaluationId)
    {
        var unitId = Guid.Parse(HttpContext.User.FindFirst("UnitId")!.Value);

        var get = await _evaluationUserRepository.GetUsersAllowedToEvaluate(evaluationId, unitId);

        return Ok(get);
    }

    [HttpGet("getUsersNotAllowedToEvaluate/{evaluationId}")]
    [Authorize]
    public async Task<IActionResult> GetUsersNotAllowedToEvaluate(Guid evaluationId)
    {
        var unitId = Guid.Parse(HttpContext.User.FindFirst("UnitId")!.Value);

        var get = await _evaluationUserRepository.GetUsersNotAllowedToEvaluate(evaluationId, unitId);

        return Ok(get);
    }

    [HttpGet("getAllNonSupervisorUsers/{evaluationId}")]
    [Authorize]
    public async Task<IActionResult> GetAllNonSupervisorUsers(Guid evaluationId)
    {
        var unitId = Guid.Parse(HttpContext.User.FindFirst("UnitId")!.Value);

        var get = await _evaluationUserRepository.GetAllNonSupervisorUsersAsync(evaluationId, unitId);

        return Ok(get);
    }

    [HttpGet("getSupervisorsForEvaluation/{evaluationId}")]
    [Authorize]
    public async Task<IActionResult> GetSupervisorsForEvaluation(Guid evaluationId)
    {
        var get = await _evaluationUserRepository.GetSupervisorsForEvaluation(evaluationId);

        return Ok(get);
    }

    [HttpGet("checkIsManager/{evaluationId}")]
    [Authorize]
    public async Task<IActionResult> CheckIsManager(Guid evaluationId)
    {
        var userId = Guid.Parse(HttpContext.User.FindFirst("Id")!.Value);

        var check = await _context.EvaluationUsers.Where(e => e.EvaluationId == evaluationId && e.UserId == userId && e.Type == 2 && e.IsManager == true).FirstOrDefaultAsync();

        return Ok(new Pagination().HandleGetByIdRespond(check));
    }


    [HttpPost("insertUserIntoEvaluation")]
    [Authorize]
    public async Task<IActionResult> InsertUserIntoEvaluation([FromBody] EvaluationUserAddPayload model)
    {
        var insertData = await _evaluationUserRepository.InsertUserIntoEvaluationAsync(model);

        return !insertData.IsSuccess ? BadRequest(insertData) : Ok(insertData);
    }

    [HttpPost("removeUserFromEvaluation")]
    [Authorize]
    public async Task<IActionResult> RemoveUserFromEvaluation([FromBody] EvaluationUserAddPayload model)
    {
        var insertData = await _evaluationUserRepository.RemoveUserFromEvaluationAsync(model);

        return !insertData.IsSuccess ? BadRequest(insertData) : Ok(insertData);
    }

    [HttpPost("insertSupervisorIntoEvaluation")]
    [Authorize]
    public async Task<IActionResult> InsertSupervisorIntoEvaluation([FromBody] EvaluationUserAddSupervisorPayload model)
    {
        var insertData = await _evaluationUserRepository.InsertSupervisorIntoEvaluationAsync(model);

        return !insertData.IsSuccess ? BadRequest(insertData) : Ok(insertData);
    }

    [HttpPost("removeSupervisorFromEvaluation")]
    [Authorize]
    public async Task<IActionResult> RemoveSupervisorFromEvaluation([FromBody] EvaluationUserAddSupervisorPayload model)
    {
        var insertData = await _evaluationUserRepository.RemoveSupervisorFromEvaluationAsync(model);

        return !insertData.IsSuccess ? BadRequest(insertData) : Ok(insertData);
    }

}

