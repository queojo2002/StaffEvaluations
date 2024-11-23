using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using StaffEvaluation.Data;
using StaffEvaluation.Models;
using StaffEvaluation.Repositories.IRepository;

namespace StaffEvaluation.Controllers;

[Route("api/v1/evaluationSample")]
[ApiController]
public class EvaluationSampleController : Controller
{
    private readonly IEvaluationSampleRepository _evaluationSampleRepository;
    private readonly IEvaluationCriteriaSampleRepository _evaluationCriteriaSampleRepository;
    private readonly DataContext _context;

    public EvaluationSampleController(IEvaluationCriteriaSampleRepository evaluationCriteriaSampleRepository, DataContext context, IEvaluationSampleRepository evaluationSampleRepository)
    {
        _context = context;
        _evaluationCriteriaSampleRepository = evaluationCriteriaSampleRepository;
        _evaluationSampleRepository = evaluationSampleRepository;
    }

    [HttpGet("getAll")]
    [Authorize]
    public async Task<IActionResult> GetAll()
    {
        var get = await _evaluationSampleRepository.GetAllPagedAsync(0, 0);

        return Ok(get);
    }

    [HttpGet("{id}")]
    [Authorize]
    public async Task<IActionResult> GetById(Guid id)
    {
        var data = await _evaluationSampleRepository.GetByIdAsync(id);

        return Ok(data);
    }

    [HttpPost("insert")]
    [Authorize]
    public async Task<IActionResult> Insert([FromBody] EvaluationSampleModel model)
    {
        var insertData = await _evaluationSampleRepository.InsertAsync(model);

        return !insertData.IsSuccess ? BadRequest(insertData) : Ok(insertData);
    }

    [HttpPost("update")]
    [Authorize]
    public async Task<IActionResult> Update([FromBody] EvaluationSampleModel model)
    {
        var updateData = await _evaluationSampleRepository.UpdateAsync(model);

        return !updateData.IsSuccess ? BadRequest(updateData) : Ok(updateData);
    }

    [HttpPost("removeRange")]
    [Authorize]
    public async Task<IActionResult> RemoveRange(List<Guid> ids)
    {
        var delData = await _evaluationSampleRepository.RemoveRangeAsync(ids);

        return !delData.IsSuccess ? BadRequest(delData) : Ok(delData);
    }


}

