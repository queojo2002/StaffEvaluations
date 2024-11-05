using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using StaffEvaluation.Data;
using StaffEvaluation.Models;
using StaffEvaluation.Repositories.IRepository;

namespace StaffEvaluation.Controllers;

[Route("api/v1/categoryProsCons")]
[ApiController]
public class CategoryProsConsController : Controller
{
    private readonly ICategoryProsConsRepository _categoryProsConsRepository;
    private readonly DataContext _context;

    public CategoryProsConsController(ICategoryProsConsRepository categoryProsConsRepository, DataContext context)
    {
        _categoryProsConsRepository = categoryProsConsRepository;
        _context = context;
    }

    [HttpGet("getAll")]
    [Authorize]
    public async Task<IActionResult> GetAll()
    {
        var get = await _categoryProsConsRepository.GetAllPagedAsync(0, 0);

        return Ok(get);
    }

    [HttpGet("{id}")]
    [Authorize]
    public async Task<IActionResult> GetById(Guid id)
    {
        var data = await _categoryProsConsRepository.GetByIdAsync(id);

        return Ok(data);
    }


    [HttpPost("insert")]
    [Authorize]
    public async Task<IActionResult> Insert([FromBody] CategoryProsConsModel model)
    {
        var insertData = await _categoryProsConsRepository.InsertAsync(model);

        return !insertData.IsSuccess ? BadRequest(insertData) : Ok(insertData);
    }

    [HttpPost("update")]
    [Authorize]
    public async Task<IActionResult> Update([FromBody] CategoryProsConsModel model)
    {
        var updateData = await _categoryProsConsRepository.UpdateAsync(model);

        return !updateData.IsSuccess ? BadRequest(updateData) : Ok(updateData);
    }

    [HttpPost("removeRange")]
    [Authorize]
    public async Task<IActionResult> RemoveRange(List<Guid> ids)
    {
        var delData = await _categoryProsConsRepository.RemoveRangeAsync(ids);

        return !delData.IsSuccess ? BadRequest(delData) : Ok(delData);
    }
}

