using AutoMapper;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using StaffEvaluation.Data;
using StaffEvaluation.Models.Custom;
using StaffEvaluation.Repositories.IRepository;

namespace StaffEvaluation.Controllers;


[Route("api/v1/dashBoard")]
[ApiController]
public class DashBoardController : Controller
{
    private DataContext _context;
    private IMapper _mapper;
    private IUnitRepository _unitRepository;

    public DashBoardController(DataContext context, IMapper mapper, IUnitRepository unitRepository)
    {
        _context = context;
        _mapper = mapper;
        _unitRepository = unitRepository;
    }

    [HttpGet("getAnalyst")]
    [Authorize]
    public async Task<IActionResult> GetAnalyst()
    {
        var userCurrentId = Guid.Parse(HttpContext.User.FindFirst("Id")!.Value);

        var unitCurrentId = Guid.Parse(HttpContext.User.FindFirst("UnitId")!.Value);

        AnalystDashBoard analyst = new AnalystDashBoard();


        var units = await _unitRepository.GetAllChildOfUnitAsync(unitCurrentId);

        List<Guid> unitIds = units.DataList!.Select(e => e.Id).ToList();


        var totalUser = await _context.Users!.Where(e => unitIds.Contains(e.UnitId)).CountAsync();

        var totalEvaluation = await _context.Evaluations!.Where(e => unitIds.Contains(e.UnitId) && !e.IsDeleted).CountAsync();

        analyst.TotalUnit = unitIds.Count();
        analyst.TotalUser = totalUser;
        analyst.TotalEvaluations = totalEvaluation;

        return Ok(analyst);
    }



}

