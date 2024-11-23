using StaffEvaluation.Helpers;
using StaffEvaluation.Models;

namespace StaffEvaluation.Repositories.IRepository;

public interface ICategoryTimeTypeRepository : IRepository<CategoryTimeTypeModel>
{
    Task<PagedApiResponse<CategoryTimeTypeModel>> GetAllOfUnit(Guid unitCurrentId);

}

