using StaffEvaluation.Helpers;
using StaffEvaluation.Models;
using StaffEvaluation.Models.Payload;

namespace StaffEvaluation.Repositories.IRepository;

public interface IEvaluationRepository : IRepository<EvaluationModel>
{
    Task<PagedApiResponse<EvaluationModel>> InsertListAsync(EvaluationAddPayload entity);

    Task<PagedApiResponse<EvaluationModel>> UpdateListAsync(EvaluationUpdatePayload entity);
}

