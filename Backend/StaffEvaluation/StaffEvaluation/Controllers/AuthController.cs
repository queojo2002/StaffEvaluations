using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using StaffEvaluation.Models;
using StaffEvaluation.Repositories.IRepository;
using Twilio;
using Twilio.Rest.Api.V2010.Account;

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

    [HttpGet("sendSms")]
    public async Task<IActionResult> SendSMS()
    {
        // Thông tin Twilio (lấy từ Twilio Console)
        const string accountSid = "";
        const string authToken = "";

        // Khởi tạo Twilio client
        TwilioClient.Init(accountSid, authToken);

        try
        {
            // Gửi SMS
            var message = MessageResource.Create(
                body: "Hello! Đây là tin nhắn được gửi từ Twilio qua C#!",
                from: new Twilio.Types.PhoneNumber("+19789179556"),
                to: new Twilio.Types.PhoneNumber("+84963176982")
            );

            System.Diagnostics.Debug.WriteLine($"Tin nhắn đã được gửi thành công với SID: {message.Sid}");
        }
        catch (Exception ex)
        {
            System.Diagnostics.Debug.WriteLine($"Đã xảy ra lỗi: {ex.Message}");
        }

        return Ok();
    }
}

