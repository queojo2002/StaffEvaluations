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

    [HttpPost("login")]
    public async Task<IActionResult> Login(LoginModel loginModel)
    {

        var user = await _userRepository.Login(loginModel.Email, loginModel.Password);

        return Ok(user);
    }

    [HttpPost("renewToken")]
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

        if (userIdClaim == null)
        {
            return Unauthorized("User ID claim not found.");
        }

        var userId = Guid.Parse(userIdClaim.Value);

        var user = await _userRepository.GetByIdAsync(userId);

        if (user == null)
        {
            return NotFound("User not found.");
        }

        return Ok(user);
    }
}

