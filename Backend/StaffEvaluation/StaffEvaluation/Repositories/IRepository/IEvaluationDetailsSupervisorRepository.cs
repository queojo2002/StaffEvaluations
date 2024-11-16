using StaffEvaluation.Helpers;
using StaffEvaluation.Models;
using StaffEvaluation.Models.Custom;

namespace StaffEvaluation.Repositories.IRepository;

public interface IEvaluationDetailsSupervisorRepository : IRepository<EvaluationDetailsSupervisorModel>
{
    Task<PagedApiResponse<EvaluationDetailsSupervisorModel>> InsertAndUpdateCustomAsync(EvaluationDetailsPersonalCustomModel model, Guid userCurrentId);

}

