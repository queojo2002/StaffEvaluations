using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using StaffEvaluation.Data;
using StaffEvaluation.Models;
using StaffEvaluation.Repositories.IRepository;

namespace StaffEvaluation.Controllers;


[Route("api/v1/categoryTimeType")]
[ApiController]
public class CategoryTimeTypeController : Controller
{
    private readonly ICategoryTimeTypeRepository _categoryTimeTypeRepository;
    private readonly DataContext _context;

    public CategoryTimeTypeController(ICategoryTimeTypeRepository categoryTimeTypeRepository, DataContext context)
    {
        _categoryTimeTypeRepository = categoryTimeTypeRepository;
        _context = context;
    }

    [HttpGet("getAll")]
    [Authorize]
    public async Task<IActionResult> GetAll()
    {
        var get = await _categoryTimeTypeRepository.GetAllPagedAsync(0, 0);

        return Ok(get);
    }

    [HttpGet("{id}")]
    [Authorize]
    public async Task<IActionResult> GetById(Guid id)
    {
        var data = await _categoryTimeTypeRepository.GetByIdAsync(id);

        return Ok(data);
    }


    [HttpPost("insert")]
    [Authorize]
    public async Task<IActionResult> Insert([FromBody] CategoryTimeTypeModel model)
    {
        var insertData = await _categoryTimeTypeRepository.InsertAsync(model);

        return !insertData.IsSuccess ? BadRequest(insertData) : Ok(insertData);
    }

    [HttpPost("update")]
    [Authorize]
    public async Task<IActionResult> Update([FromBody] CategoryTimeTypeModel model)
    {
        var updateData = await _categoryTimeTypeRepository.UpdateAsync(model);

        return !updateData.IsSuccess ? BadRequest(updateData) : Ok(updateData);
    }

    [HttpPost("removeRange")]
    [Authorize]
    public async Task<IActionResult> RemoveRange(List<Guid> ids)
    {
        var delData = await _categoryTimeTypeRepository.RemoveRangeAsync(ids);

        return !delData.IsSuccess ? BadRequest(delData) : Ok(delData);
    }


}

