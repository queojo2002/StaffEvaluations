using StaffEvaluation.Helpers;
using StaffEvaluation.Models;

namespace StaffEvaluation.Repositories.IRepository
{
    public interface IUserRepository : IRepository<UserModel>
    {
        Task<PagedApiResponse<TokenModel>> Login(string email, string password);

        Task<PagedApiResponse<TokenModel>> RenewToken(TokenModel tokenModel);

    }
}
