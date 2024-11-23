using StaffEvaluation.Helpers;
using StaffEvaluation.Models;

namespace StaffEvaluation.Repositories.IRepository;

public interface ICategoryRatingRepository : IRepository<CategoryRatingModel>
{
    Task<PagedApiResponse<CategoryRatingModel>> GetAllOfUnit(Guid unitCurrentId);
}

