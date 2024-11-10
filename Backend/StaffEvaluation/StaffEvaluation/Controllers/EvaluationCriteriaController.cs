using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using StaffEvaluation.Data;
using StaffEvaluation.Models.Payload;
using StaffEvaluation.Repositories.IRepository;

namespace StaffEvaluation.Controllers;


[Route("api/v1/evaluationCriteria")]
[ApiController]
public class EvaluationCriteriaController : Controller
{
    private readonly IEvaluationCriteriaRepository _evaluationCriteriaRepository;
    private readonly DataContext _context;

    public EvaluationCriteriaController(IEvaluationCriteriaRepository evaluationCriteriaRepository, DataContext context)
    {
        _evaluationCriteriaRepository = evaluationCriteriaRepository;
        _context = context;
    }

    [HttpGet("{id}")]
    [Authorize]
    public async Task<IActionResult> GetById(Guid id)
    {
        var data = await _evaluationCriteriaRepository.GetByIdAsync(id);

        return Ok(data);
    }

    [HttpGet("getListCriteria/{id}")]
    [Authorize]
    public async Task<IActionResult> GetListCriteriaByIdEvaluation(Guid id)
    {
        var data = await _evaluationCriteriaRepository.GetListCriteriaByIdEvaluation(id);

        return Ok(data);
    }


    [HttpPost("insertAndRemoveList")]
    [Authorize]
    public async Task<IActionResult> InsertAndRemoveList([FromBody] EvaluationCriteriaAddPayload model)
    {
        var insertData = await _evaluationCriteriaRepository.InsertAndRemoveListAsync(model);

        return !insertData.IsSuccess ? BadRequest(insertData) : Ok(insertData);
    }

    [HttpPost("updateSort")]
    [Authorize]
    public async Task<IActionResult> UpdateSortList([FromBody] EvaluationCriteriaUpdateSortPayload model)
    {
        var updateData = await _evaluationCriteriaRepository.UpdateSortListAsync(model);

        return !updateData.IsSuccess ? BadRequest(updateData) : Ok(updateData);
    }
}

