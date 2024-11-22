using StaffEvaluation.Helpers;
using StaffEvaluation.Models;

namespace StaffEvaluation.Repositories.IRepository;

public interface IUserRepository : IRepository<UserModel>
{
    Task<PagedApiResponse<TokenModel>> Login(string email, string password);
    Task<PagedApiResponse<TokenModel>> RenewToken(TokenModel tokenModel);
    Task<PagedApiResponse<MenuItemsModel>> GetRoles(Guid userId);
    Task<bool> CheckElectronicSignature(IFormFile? file, Guid userId);
    Task<PagedApiResponse<UserModel>> GetAllOfUnit(Guid unitCurrentId);

}

