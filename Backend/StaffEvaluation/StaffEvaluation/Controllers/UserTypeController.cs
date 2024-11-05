using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using StaffEvaluation.Data;
using StaffEvaluation.Models;
using StaffEvaluation.Repositories.IRepository;

namespace StaffEvaluation.Controllers;

[Route("api/v1/userType")]
[ApiController]
public class UserTypeController : Controller
{
    private readonly IUserTypeRepository _userTypeRepository;
    private readonly DataContext _context;

    public UserTypeController(DataContext context, IUserTypeRepository userTypeRepository)
    {
        _context = context;
        _userTypeRepository = userTypeRepository;
    }

    [HttpGet("getAll")]
    [Authorize]
    public async Task<IActionResult> GetAll()
    {
        var datas = await _userTypeRepository.GetAllPagedAsync(0, 0);

        return Ok(datas);
    }


    [HttpGet("{id}")]
    [Authorize]
    public async Task<IActionResult> GetById(Guid id)
    {
        var data = await _userTypeRepository.GetByIdAsync(id);

        return Ok(data);
    }

    [HttpPost("insert")]
    [Authorize]
    public async Task<IActionResult> Insert([FromBody] UserTypeModel userTypeModel)
    {
        var insertData = await _userTypeRepository.InsertAsync(userTypeModel);

        return !insertData.IsSuccess ? BadRequest(insertData) : Ok(insertData);
    }

    [HttpPost("update")]
    [Authorize]
    public async Task<IActionResult> Update([FromBody] UserTypeModel userTypeModel)
    {
        var updateData = await _userTypeRepository.UpdateAsync(userTypeModel);

        return !updateData.IsSuccess ? BadRequest(updateData) : Ok(updateData);
    }

    [HttpPost("removeRange")]
    [Authorize]
    public async Task<IActionResult> RemoveRange(List<Guid> ids)
    {
        var delData = await _userTypeRepository.RemoveRangeAsync(ids);

        return !delData.IsSuccess ? BadRequest(delData) : Ok(delData);
    }

}

