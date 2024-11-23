using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using StaffEvaluation.Data;
using StaffEvaluation.Models.Payload;
using StaffEvaluation.Repositories.IRepository;

namespace StaffEvaluation.Controllers;

[Route("api/v1/evaluationCriteriaSample")]
[ApiController]
public class EvaluationCriteriaSampleController : Controller
{
    private readonly IEvaluationCriteriaSampleRepository _evaluationCriteriaSampleRepository;
    private readonly DataContext _context;

    public EvaluationCriteriaSampleController(IEvaluationCriteriaSampleRepository evaluationCriteriaSampleRepository, DataContext context)
    {
        _evaluationCriteriaSampleRepository = evaluationCriteriaSampleRepository;
        _context = context;
    }

    [HttpGet("{id}")]
    [Authorize]
    public async Task<IActionResult> GetById(Guid id)
    {
        var data = await _evaluationCriteriaSampleRepository.GetByIdAsync(id);

        return Ok(data);
    }

    [HttpGet("getListCriteria/{id}")]
    [Authorize]
    public async Task<IActionResult> GetListCriteriaByIdEvaluationSample(Guid id)
    {
        var data = await _evaluationCriteriaSampleRepository.GetListCriteriaByIdEvaluationSample(id);

        return Ok(data);
    }

    [HttpPost("insertAndRemoveList")]
    [Authorize]
    public async Task<IActionResult> InsertAndRemoveList([FromBody] EvaluationCriteriaSampleAddPayload model)
    {
        var insertData = await _evaluationCriteriaSampleRepository.InsertCustomAsync(model);

        return !insertData.IsSuccess ? BadRequest(insertData) : Ok(insertData);
    }

    [HttpPost("updateSort")]
    [Authorize]
    public async Task<IActionResult> UpdateSortList([FromBody] EvaluationCriteriaSampleUpdateSortPayload model)
    {
        var updateData = await _evaluationCriteriaSampleRepository.UpdateSortListAsync(model);

        return !updateData.IsSuccess ? BadRequest(updateData) : Ok(updateData);
    }
}

