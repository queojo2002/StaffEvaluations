using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using StaffEvaluation.Data;
using StaffEvaluation.Models;
using StaffEvaluation.Repositories.IRepository;

namespace StaffEvaluation.Controllers;

[Route("api/v1/categoryCriteria")]
[ApiController]
public class CategoryCriteriaController : Controller
{
    private readonly ICategoryCriteriaRepository _categoryCriteriaRepository;
    private readonly DataContext _context;

    public CategoryCriteriaController(ICategoryCriteriaRepository categoryCriteriaRepository, DataContext context)
    {
        _categoryCriteriaRepository = categoryCriteriaRepository;
        _context = context;
    }


    [HttpGet("getAll")]
    [Authorize]
    public async Task<IActionResult> GetAll()
    {
        var unitCurrentId = Guid.Parse(HttpContext.User.FindFirst("UnitId")!.Value);

        var get = await _categoryCriteriaRepository.GetAllOfUnit(unitCurrentId);

        return Ok(get);
    }

    [HttpGet("{id}")]
    [Authorize]
    public async Task<IActionResult> GetById(Guid id)
    {
        var data = await _categoryCriteriaRepository.GetByIdAsync(id);

        return Ok(data);
    }


    [HttpPost("insert")]
    [Authorize]
    public async Task<IActionResult> Insert([FromBody] CategoryCriteriaModel model)
    {
        var insertData = await _categoryCriteriaRepository.InsertAsync(model);

        return !insertData.IsSuccess ? BadRequest(insertData) : Ok(insertData);
    }

    [HttpPost("update")]
    [Authorize]
    public async Task<IActionResult> Update([FromBody] CategoryCriteriaModel model)
    {
        var updateData = await _categoryCriteriaRepository.UpdateAsync(model);

        return !updateData.IsSuccess ? BadRequest(updateData) : Ok(updateData);
    }

    [HttpPost("removeRange")]
    [Authorize]
    public async Task<IActionResult> RemoveRange(List<Guid> ids)
    {
        var delData = await _categoryCriteriaRepository.RemoveRangeAsync(ids);

        return !delData.IsSuccess ? BadRequest(delData) : Ok(delData);
    }


}

