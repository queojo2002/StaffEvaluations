using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using StaffEvaluation.Repositories.IRepository;

namespace StaffEvaluation.Controllers;


[Route("api/v1/unit")]
[ApiController]
public class UnitController : Controller
{
    private readonly IUnitRepository _unitRepository;

    public UnitController(IUnitRepository unitRepository)
    {
        _unitRepository = unitRepository;
    }


    [HttpGet("getAll")]
    [Authorize]
    public async Task<IActionResult> GetAll()
    {
        var get = await _unitRepository.GetAllPagedAsync(0, 0);

        return Ok(get);
    }


}

