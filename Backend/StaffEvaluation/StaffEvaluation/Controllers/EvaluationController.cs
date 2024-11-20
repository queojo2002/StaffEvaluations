using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using StaffEvaluation.Data;
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
}

