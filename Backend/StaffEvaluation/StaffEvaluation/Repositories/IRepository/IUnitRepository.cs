using StaffEvaluation.Data.Entity;
using StaffEvaluation.Helpers;
using StaffEvaluation.Models;

namespace StaffEvaluation.Repositories.IRepository;

public interface IUnitRepository : IRepository<UnitModel>
{
    Task<List<Unit>> GetAllParentOfUnitAsync(Guid unitId);
    Task<PagedApiResponse<Unit>> GetAllChildOfUnitAsync(Guid unitId);
}

