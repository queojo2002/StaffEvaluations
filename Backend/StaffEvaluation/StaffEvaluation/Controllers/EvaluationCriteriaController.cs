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

    [HttpGet("getListCriteriaInEvaluationsOfUser/{id}")]
    [Authorize]
    public async Task<IActionResult> GetListCriteriaInEvaluationsOfUser(Guid id)
    {

        var userId = Guid.Parse(HttpContext.User.FindFirst("Id")!.Value);

        var data = await _evaluationCriteriaRepository.GetListCriteriaInEvaluationsOfUser(id, userId);

        if (data.Data != null)
        {
            var dataTree = await _evaluationCriteriaRepository.CriteriaToTree(data.Data, userId, 1);

            data.Data.CriteriaList = dataTree.CriteriaList;
        }


        return Ok(data);
    }

    [HttpGet("getListCriteriaInEvaluationsOfUserCustom/{id}")]
    [Authorize]
    public async Task<IActionResult> GetListCriteriaInEvaluationsOfUserCustom(Guid id)
    {

        var userId = Guid.Parse(HttpContext.User.FindFirst("Id")!.Value);

        var data = await _evaluationCriteriaRepository.GetListCriteriaInEvaluationsOfUserCustom(id, userId);

        return Ok(data);
    }





    [HttpGet("getListCriteriaInEvaluationsOfSupervisor")]
    [Authorize]
    public async Task<IActionResult> GetListCriteriaInEvaluationsOfSupervisor(Guid evaluationId, Guid idUser)
    {
        var userId = Guid.Parse(HttpContext.User.FindFirst("Id")!.Value);

        var data = await _evaluationCriteriaRepository.GetListCriteriaInEvaluationsOfSupervisor(evaluationId, idUser, userId);

        if (data.Data != null)
        {
            var dataTree = await _evaluationCriteriaRepository.CriteriaToTree(data.Data, userId, 2);

            data.Data.CriteriaList = dataTree.CriteriaList;
        }

        return Ok(data);
    }


    [HttpGet("getListCriteriaInEvaluationsOfSupervisorCustom")]
    [Authorize]
    public async Task<IActionResult> GetListCriteriaInEvaluationsOfSupervisorCustom(Guid evaluationId, Guid idUser)
    {
        var userId = Guid.Parse(HttpContext.User.FindFirst("Id")!.Value);

        var data = await _evaluationCriteriaRepository.GetListCriteriaInEvaluationsOfSupervisorCustom(evaluationId, idUser, userId);

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

