using StaffEvaluation.Helpers;
using StaffEvaluation.Models;

namespace StaffEvaluation.Repositories.IRepository;

public interface ICategoryCriteriaRepository : IRepository<CategoryCriteriaModel>
{
    Task<PagedApiResponse<CategoryCriteriaModel>> GetAllOfUnit(Guid unitCurrentId);
}

