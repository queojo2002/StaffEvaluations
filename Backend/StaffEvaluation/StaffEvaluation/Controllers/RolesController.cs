using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using StaffEvaluation.Data;
using StaffEvaluation.Models;
using StaffEvaluation.Repositories.IRepository;

namespace StaffEvaluation.Controllers;



[Route("api/v1/roles")]
[ApiController]
public class RolesController : Controller
{
    private readonly IUserRepository _userRepository;
    private readonly IRolesRepository _rolesRepository;
    private readonly DataContext _context;

    public RolesController(DataContext context, IUserRepository userRepository, IRolesRepository rolesRepository)
    {
        _context = context;
        _userRepository = userRepository;
        _rolesRepository = rolesRepository;
    }

    [HttpGet("getAllRoles")]
    [Authorize]
    public async Task<IActionResult> GetAllRoles()
    {
        var roles = await _rolesRepository.GetAllPagedAsync(0, 0);

        return Ok(roles);
    }

    [HttpGet("getAllMenuItems")]
    [Authorize]
    public async Task<IActionResult> GetAllMenuItems()
    {
        var menuItems = await _rolesRepository.GetAllMenuItems(0, 0);

        return Ok(menuItems);
    }

    [HttpGet("getAllMenuItemsByRoleId")]
    [Authorize]
    public async Task<IActionResult> GetAllMenuItemsByRoleId(Guid roleId)
    {
        var menuItems = await _rolesRepository.GetListMenuByRoleId(roleId);

        return Ok(menuItems);
    }

    [HttpPost("insertRoleAndMenuItems")]
    [Authorize]
    public async Task<IActionResult> InsertRoleAndMenuItems([FromBody] RoleAndMenuItemsModel roleAndMenu)
    {
        var insertData = await _rolesRepository.InsertRoleAndMenuItemsAsync(roleAndMenu);

        if (!insertData.IsSuccess)
        {
            return BadRequest(insertData);
        }

        return Ok(insertData);
    }

    [HttpPost("updateRoleAndMenuItems")]
    [Authorize]
    public async Task<IActionResult> UpdateRoleAndMenuItems([FromBody] RoleAndMenuItemsModel roleAndMenu)
    {
        var insertData = await _rolesRepository.UpdateRoleAndMenuItemsAsync(roleAndMenu);

        if (!insertData.IsSuccess)
        {
            return BadRequest(insertData);
        }

        return Ok(insertData);
    }

    [HttpPost("removeRangeRoleAndMenuItems")]
    [Authorize]
    public async Task<IActionResult> RemoveRangeRoleAndMenuItems(List<Guid> roleIds)
    {
        var insertData = await _rolesRepository.RemoveRangeRoleAndMenuItemsAsync(roleIds);

        if (!insertData.IsSuccess)
        {
            return BadRequest(insertData);
        }

        return Ok(insertData);
    }


}

