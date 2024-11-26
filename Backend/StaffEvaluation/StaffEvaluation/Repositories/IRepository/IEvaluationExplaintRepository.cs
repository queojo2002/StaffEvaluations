using StaffEvaluation.Helpers;
using StaffEvaluation.Models;
using StaffEvaluation.Models.Custom;

namespace StaffEvaluation.Repositories.IRepository;

public interface IEvaluationExplaintRepository : IRepository<EvaluationExplaintModel>
{
    Task<PagedApiResponse<EvaluationExplaintModel>> GetAllWithUserAsync(EvaluationExplaintGetPayload model, Guid userCurrentId);

    Task<PagedApiResponse<EvaluationExplaintModel>> GetAllWithSupervisorAsync(EvaluationExplaintGetPayload model, Guid userId, Guid userCurrentId);


}

