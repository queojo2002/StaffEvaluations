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
    private IEvaluationRepository _evaluationRepository;
    private IEvaluationUserRepository _evaluationUserRepository;
    private IEvaluationDetailsPersonalRepository _evaluationDetailsPersonalRepository;
    private IEvaluationDetailsSupervisorRepository _evaluationDetailsSupervisorRepository;


    public DashBoardController(
        DataContext context,
        IMapper mapper,
        IUnitRepository unitRepository,
        IEvaluationRepository evaluationRepository,
        IEvaluationUserRepository evaluationUserRepository,
        IEvaluationDetailsPersonalRepository evaluationDetailsPersonalRepository,
        IEvaluationDetailsSupervisorRepository evaluationDetailsSupervisorRepository
        )
    {
        _context = context;
        _mapper = mapper;
        _unitRepository = unitRepository;
        _evaluationRepository = evaluationRepository;
        _evaluationUserRepository = evaluationUserRepository;
        _evaluationDetailsPersonalRepository = evaluationDetailsPersonalRepository;
        _evaluationDetailsSupervisorRepository = evaluationDetailsSupervisorRepository;
    }

    [HttpGet("getAnalyst")]
    [Authorize]
    public async Task<IActionResult> GetAnalyst()
    {
        var userCurrentId = Guid.Parse(HttpContext.User.FindFirst("Id")!.Value);

        var unitCurrentId = Guid.Parse(HttpContext.User.FindFirst("UnitId")!.Value);

        var units = await _unitRepository.GetAllChildOfUnitAsync(unitCurrentId);

        List<Guid> unitIds = units.DataList!.Select(e => e.Id).ToList();

        List<Guid> userIdsOne = new List<Guid>();
        List<Guid> userIdsTwo = new List<Guid>();


        AnalystDashBoard analyst = new AnalystDashBoard();

        DateTime now = DateTime.Now.Date;


        var data = new Dictionary<string, Dictionary<int, int>>();
        var names = new[] { "HTXSNV", "HTTNV", "HTNV", "KHTNV" };
        foreach (var name in names)
        {
            var monthlyData = new Dictionary<int, int>();

            for (int month = 1; month <= 12; month++)
            {
                monthlyData[month] = 0;
            }
            data[name] = monthlyData;
        }


        var evaluations = await _evaluationRepository.GetEvaluationOfUnit(unitCurrentId);

        if (evaluations.DataList != null)
        {

            foreach (var item in evaluations.DataList.Where(e => e.FromDate.HasValue && e.ToDate.HasValue && e.FromDate.Value.Date <= now && e.ToDate.Value.Date >= now).ToList())
            {
                var supervisor = await _context.EvaluationUsers.Where(e => e.EvaluationId == item.Id && e.Type == 2).OrderByDescending(e => e.Sort).FirstOrDefaultAsync();

                if (supervisor == null) continue;

                var listUserInEvaluation = await _context.EvaluationUsers.Where(e => e.EvaluationId == item.Id && e.Type == 1).ToListAsync();


                foreach (var user in listUserInEvaluation)
                {
                    var edp = await _context.EvaluationDetailsPersonals.Where(e => e.EvaluationId == item.Id && e.UserId == user.UserId && e.Status >= 2).ToListAsync();

                    if (edp == null || edp.Count == 0)
                    {
                        // user chua thuc hien danh gia
                        continue;
                    }

                    var eds = await _context.EvaluationDetailsSupervisors.Where(e => e.EvaluationId == item.Id && e.UserSupervisorId == supervisor.UserId && e.Status >= 2 && edp.Select(e => e.Id).Contains(e.EvaluationDetailsPersonalId)).ToListAsync();

                    if (eds == null || eds.Count == 0)
                    {
                        // supervisor chua thuc hien danh gia
                        continue;
                    }

                    int tongDiem = eds.Sum(e => e.AssessmentValueSupervisor);

                    if (!userIdsOne.Contains(user.UserId))
                    {
                        if (tongDiem >= 90 && tongDiem <= 100)
                        {
                            analyst.TotalNowHTXSNV += 1;
                        }
                        else if (tongDiem >= 70 && tongDiem <= 89)
                        {
                            analyst.TotalNowHTTNV += 1;
                        }
                        else if (tongDiem >= 50 && tongDiem <= 69)
                        {
                            analyst.TotalNowHTNV += 1;
                        }
                        else if (tongDiem >= 0 && tongDiem <= 49)
                        {
                            analyst.TotalNowKHTNV += 1;
                        }
                        userIdsOne.Add(user.UserId);
                    }
                }
            }




            foreach (var item in evaluations.DataList.Where(e => e.FromDate.HasValue && e.ToDate.HasValue && !e.IsDeleted).ToList())
            {
                var supervisor = await _context.EvaluationUsers.Where(e => e.EvaluationId == item.Id && e.Type == 2).OrderByDescending(e => e.Sort).FirstOrDefaultAsync();

                if (supervisor == null) continue;

                var listUserInEvaluation = await _context.EvaluationUsers.Where(e => e.EvaluationId == item.Id && e.Type == 1).ToListAsync();


                foreach (var user in listUserInEvaluation)
                {
                    var edp = await _context.EvaluationDetailsPersonals.Where(e => e.EvaluationId == item.Id && e.UserId == user.UserId && e.Status >= 2).ToListAsync();

                    if (edp == null || edp.Count == 0)
                    {
                        // user chua thuc hien danh gia
                        continue;
                    }

                    var eds = await _context.EvaluationDetailsSupervisors.Where(e => e.EvaluationId == item.Id && e.UserSupervisorId == supervisor.UserId && e.Status >= 2 && edp.Select(e => e.Id).Contains(e.EvaluationDetailsPersonalId)).ToListAsync();

                    if (eds == null || eds.Count == 0)
                    {
                        // supervisor chua thuc hien danh gia
                        continue;
                    }

                    int tongDiem = eds.Sum(e => e.AssessmentValueSupervisor);

                    if (!userIdsTwo.Contains(user.UserId))
                    {

                        if (tongDiem >= 90 && tongDiem <= 100)
                        {
                            data["HTXSNV"][item.ToDate!.Value.Month]++;
                        }
                        else if (tongDiem >= 70 && tongDiem <= 89)
                        {
                            data["HTTNV"][item.ToDate!.Value.Month]++;
                        }
                        else if (tongDiem >= 50 && tongDiem <= 69)
                        {
                            data["HTNV"][item.ToDate!.Value.Month]++;
                        }
                        else if (tongDiem >= 0 && tongDiem <= 49)
                        {
                            data["KHTNV"][item.ToDate!.Value.Month]++;
                        }

                        userIdsTwo.Add(user.UserId);
                    }
                }
            }

        }


        List<AnalystColumn> columns = new List<AnalystColumn>();

        foreach (var name in data.Keys)
        {

            foreach (var month in data[name].Keys)
            {
                AnalystColumn column = new AnalystColumn()
                {
                    Name = name,
                    Month = month,
                    Total = data[name][month]
                };

                columns.Add(column);
            }
        }


        var totalUser = await _context.Users!.Where(e => unitIds.Contains(e.UnitId)).CountAsync();

        var totalEvaluation = await _context.Evaluations!.Where(e => unitIds.Contains(e.UnitId) && !e.IsDeleted).CountAsync();

        analyst.TotalUnit = unitIds.Count();
        analyst.TotalUser = totalUser;
        analyst.TotalEvaluations = totalEvaluation;
        analyst.TotalNowChuaThuchienHoanThanh = totalUser - userIdsOne.Count;
        analyst.AnalystColumns = columns;




        return Ok(analyst);
    }



}

