using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using StaffEvaluation.Models;
using StaffEvaluation.Repositories.IRepository;

namespace StaffEvaluation.Controllers;

[Route("api/v1")]
[ApiController]
public class AuthController : Controller
{
    private readonly IUserRepository _userRepository;

    public AuthController(IUserRepository userRepository)
    {
        _userRepository = userRepository;
    }

    [HttpPut("login")]
    public async Task<IActionResult> Login(LoginModel loginModel)
    {

        var user = await _userRepository.Login(loginModel.Email, loginModel.Password);

        if (!user.IsSuccess)
        {
            return BadRequest(user);
        }

        return Ok(user);
    }

    [HttpPut("renewToken")]
    public async Task<IActionResult> RenewToken(TokenModel tokenModel)
    {
        var renewToken = await _userRepository.RenewToken(tokenModel);

        if (!renewToken.IsSuccess)
        {
            return BadRequest(renewToken);
        }

        return Ok(renewToken);
    }

    [HttpGet("profile")]
    [Authorize]
    public async Task<IActionResult> Profile(Guid id)
    {
        var userIdClaim = HttpContext.User.FindFirst("Id");

        var userId = Guid.Parse(userIdClaim!.Value);

        var user = await _userRepository.GetByIdAsync(userId);

        if (user == null)
        {
            return NotFound("User not found.");
        }

        return Ok(user);
    }
}

