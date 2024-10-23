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
    private readonly DataContext _context;

    public UserController(IUserRepository userRepository, DataContext context)
    {
        _userRepository = userRepository;
        _context = context;
    }


    [HttpGet("getListMenu")]
    [Authorize]
    public async Task<IActionResult> GetListMenu()
    {
        Guid userId = Guid.Parse(HttpContext.User.FindFirst("Id")!.Value);

        var userRole = _context.UserRoles!.SingleOrDefault(x => x.Id == userId);

        var getData = await _userRepository.GetRoles(userId);

        if (!getData.IsSuccess)
        {
            return BadRequest(getData);
        }

        return Ok(getData);
    }


}

