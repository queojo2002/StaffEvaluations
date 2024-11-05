using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using StaffEvaluation.Data;
using StaffEvaluation.Helpers;
using StaffEvaluation.Models;
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


    [HttpGet("getAll")]
    [Authorize]
    public async Task<IActionResult> GetAll()
    {
        var get = await _userRepository.GetAllPagedAsync(0, 0);

        return Ok(get);
    }

    [HttpGet("{id}")]
    [Authorize]
    public async Task<IActionResult> GetById(Guid id)
    {
        var data = await _userRepository.GetByIdAsync(id);

        return Ok(data);
    }

    [HttpPost("insert")]
    [Authorize]
    public async Task<IActionResult> Insert([FromBody] UserModel userModel)
    {
        var insertData = await _userRepository.InsertAsync(userModel);

        return !insertData.IsSuccess ? BadRequest(insertData) : Ok(insertData);
    }

    [HttpPost("update")]
    [Authorize]
    public async Task<IActionResult> Update([FromBody] UserModel userModel)
    {
        var updateData = await _userRepository.UpdateAsync(userModel);

        return !updateData.IsSuccess ? BadRequest(updateData) : Ok(updateData);
    }

    [HttpPost("removeRange")]
    [Authorize]
    public async Task<IActionResult> RemoveRange(List<Guid> ids)
    {
        var delData = await _userRepository.RemoveRangeAsync(ids);

        return !delData.IsSuccess ? BadRequest(delData) : Ok(delData);
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

    [HttpGet("downloadSignature")]
    [Authorize]
    public async Task<IActionResult> DownloadSignature(Guid id)
    {
        try
        {
            var getData = _context.ElectronicSignatures.SingleOrDefault(e => e.UserId == id);

            if (getData == null || string.IsNullOrEmpty(getData.PrivateKey))
            {
                return Ok(new ApiResult().Failure<UserModel>("Chữ ký số của người dùng này chưa có!"));
            }

            var privateKeyBytes = Convert.FromBase64String(getData.PrivateKey);
            var privateKeyPem = "-----BEGIN RSA PRIVATE KEY-----\n" +
                                Convert.ToBase64String(privateKeyBytes, Base64FormattingOptions.InsertLineBreaks) +
                                "\n-----END RSA PRIVATE KEY-----";

            var contentType = "application/x-pem-file";
            var privateKeyPemBytes = System.Text.Encoding.ASCII.GetBytes(privateKeyPem);

            return File(privateKeyPemBytes, contentType, "private.pem");
        }
        catch (Exception ex)
        {
            Console.WriteLine($"Error in DownloadSignature: {ex.Message}");
            Console.WriteLine(ex.StackTrace);
            return StatusCode(500, "An error occurred while processing your request.");
        }
    }





}

