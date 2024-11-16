using StaffEvaluation.Helpers;
using StaffEvaluation.Models;
using StaffEvaluation.Models.Custom;

namespace StaffEvaluation.Repositories.IRepository;

public interface IEvaluationDetailsPersonalRepository : IRepository<EvaluationDetailsPersonalModel>
{
    Task<PagedApiResponse<EvaluationDetailsPersonalModel>> InsertAndUpdateCustomAsync(EvaluationDetailsPersonalCustomModel model, Guid userCurrentId);

}

