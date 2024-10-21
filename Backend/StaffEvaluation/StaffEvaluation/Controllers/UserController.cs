using Microsoft.AspNetCore.Mvc;
using StaffEvaluation.Repositories.IRepository;

namespace StaffEvaluation.Controllers;


[Route("api/v1/user")]
[ApiController]
public class UserController : Controller
{
    private readonly IUserRepository _userRepository;

    public UserController(IUserRepository userRepository)
    {
        _userRepository = userRepository;
    }





}

