using StaffEvaluation.Helpers;
using StaffEvaluation.Models;
using StaffEvaluation.Models.Custom;

namespace StaffEvaluation.Repositories.IRepository;

public interface IEvaluationExplaintRepository : IRepository<EvaluationExplaintModel>
{
    Task<PagedApiResponse<EvaluationExplaintModel>> GetAllCustomAsync(EvaluationExplaintGetPayload model, Guid userCurrentId);

}

