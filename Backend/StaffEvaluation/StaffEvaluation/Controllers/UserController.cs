using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using StaffEvaluation.Data;
using StaffEvaluation.Repositories.IRepository;

namespace StaffEvaluation.Controllers;


[Route("api/v1/user")]
[ApiController]
public class UserController : Controller
{
    private readonly IUserRepository _userRepository;
    private readonly IRolesRepository _rolesRepository;
    private readonly DataContext _context;

    public UserController(DataContext context, IUserRepository userRepository, IRolesRepository rolesRepository)
    {
        _userRepository = userRepository;
        _context = context;
        _rolesRepository = rolesRepository;
    }


    [HttpGet("getListMenuOfUser")]
    [Authorize]
    public async Task<IActionResult> GetListMenuOfUser()
    {
        Guid userId = Guid.Parse(HttpContext.User.FindFirst("Id")!.Value);

        var userRole = _context.UserRoles!.SingleOrDefault(x => x.Id == userId);

        var getData = await _rolesRepository.GetListMenuOfUser(userId);

        if (!getData.IsSuccess)
        {
            return BadRequest(getData);
        }

        return Ok(getData);
    }

}

