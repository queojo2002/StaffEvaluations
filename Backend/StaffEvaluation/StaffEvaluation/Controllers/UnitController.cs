using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using StaffEvaluation.Data;
using StaffEvaluation.Helpers;
using StaffEvaluation.Models;
using StaffEvaluation.Models.Payload;
using StaffEvaluation.Repositories.IRepository;

namespace StaffEvaluation.Controllers;


[Route("api/v1/unit")]
[ApiController]
public class UnitController : Controller
{
    private readonly IUnitRepository _unitRepository;
    private readonly DataContext _context;

    public UnitController(IUnitRepository unitRepository, DataContext context)
    {
        _unitRepository = unitRepository;
        _context = context;
    }


    [HttpGet("getAll")]
    [Authorize]
    public async Task<IActionResult> GetAll()
    {
        var unitId = Guid.Parse(HttpContext.User.FindFirst("UnitId")!.Value);


        var get = await _unitRepository.GetAllChildOfUnitAsync(unitId);

        return Ok(get);
    }

    [HttpPost("insertListUnit")]
    [Authorize]
    public async Task<IActionResult> InsertListUnit(AddNewListUnitPayload unitRequest)
    {
        if (unitRequest == null)
        {
            return BadRequest(new ApiResult().Failure<UnitModel>("Dữ liệu đầu vào không hợp lệ."));
        }
        else if (string.IsNullOrEmpty(unitRequest.UnitName))
        {
            return BadRequest(new ApiResult().Failure<UnitModel>("Vui lòng điền đầy đủ thông tin cần thêm mới."));
        }

        var isExistedParentId = _context.Units!.Any(u => u.Id == unitRequest.ParentId);

        if (!isExistedParentId && (unitRequest.ParentId.HasValue && unitRequest.ParentId != Guid.Empty))
        {
            return BadRequest(new ApiResult().Failure<UnitModel>("Đơn vị cha không hợp lệ."));
        }

        string[] splitUnitNames = unitRequest.UnitName.Split(new[] { '\n' }, StringSplitOptions.RemoveEmptyEntries);

        if (splitUnitNames.Length == 0)
        {
            return BadRequest(new ApiResult().Failure<UnitModel>("Danh sách tên đơn vị không được để trống!"));
        }

        var processedUnitNames = splitUnitNames
            .Select(name => name.Trim().ToLower())
            .Distinct()
            .Select(name => splitUnitNames.First(original => original.Trim().ToLower() == name))
            .ToList();

        foreach (var item in processedUnitNames)
        {
            UnitModel unitModel = new UnitModel()
            {
                Id = Guid.NewGuid(),
                UnitName = item,
                ParentId = unitRequest.ParentId,
                UpdatedAt = DateTime.Now,
                IsDeleted = false
            };

            await _unitRepository.InsertAsync(unitModel);
        }


        return Ok(new ApiResult().Success<UnitModel>("Thêm mới đơn vị thành công."));
    }



    [HttpPost("deleteListUnit")]
    [Authorize]
    public async Task<IActionResult> DeleteListUnit(List<Guid> ids)
    {
        var del = await _unitRepository.RemoveRangeAsync(ids);

        return Ok(del);
    }


}

