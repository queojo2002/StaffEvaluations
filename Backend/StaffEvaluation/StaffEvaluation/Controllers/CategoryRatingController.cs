using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using StaffEvaluation.Data;
using StaffEvaluation.Models;
using StaffEvaluation.Repositories.IRepository;

namespace StaffEvaluation.Controllers;

[Route("api/v1/categoryRating")]
[ApiController]
public class CategoryRatingController : Controller
{
    private readonly ICategoryRatingRepository _categoryRatingRepository;
    private readonly DataContext _context;

    public CategoryRatingController(ICategoryRatingRepository categoryRatingRepository, DataContext context)
    {
        _categoryRatingRepository = categoryRatingRepository;
        _context = context;
    }

    [HttpGet("getAll")]
    [Authorize]
    public async Task<IActionResult> GetAll()
    {
        var unitCurrentId = Guid.Parse(HttpContext.User.FindFirst("UnitId")!.Value);

        var get = await _categoryRatingRepository.GetAllOfUnit(unitCurrentId);

        return Ok(get);
    }

    [HttpGet("{id}")]
    [Authorize]
    public async Task<IActionResult> GetById(Guid id)
    {
        var data = await _categoryRatingRepository.GetByIdAsync(id);

        return Ok(data);
    }


    [HttpPost("insert")]
    [Authorize]
    public async Task<IActionResult> Insert([FromBody] CategoryRatingModel categoryRatingModel)
    {
        var insertData = await _categoryRatingRepository.InsertAsync(categoryRatingModel);

        return !insertData.IsSuccess ? BadRequest(insertData) : Ok(insertData);
    }

    [HttpPost("update")]
    [Authorize]
    public async Task<IActionResult> Update([FromBody] CategoryRatingModel categoryRatingModel)
    {
        var updateData = await _categoryRatingRepository.UpdateAsync(categoryRatingModel);

        return !updateData.IsSuccess ? BadRequest(updateData) : Ok(updateData);
    }

    [HttpPost("removeRange")]
    [Authorize]
    public async Task<IActionResult> RemoveRange(List<Guid> ids)
    {
        var delData = await _categoryRatingRepository.RemoveRangeAsync(ids);

        return !delData.IsSuccess ? BadRequest(delData) : Ok(delData);
    }


}

