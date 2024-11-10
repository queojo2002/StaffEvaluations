using StaffEvaluation.Helpers;
using StaffEvaluation.Models;
using StaffEvaluation.Models.Payload;

namespace StaffEvaluation.Repositories.IRepository;

public interface IEvaluationCriteriaRepository : IRepository<EvaluationCriteriaModel>
{
    Task<PagedApiResponse<EvaluationCriteriaModel>> InsertAndRemoveListAsync(EvaluationCriteriaAddPayload entity);
    Task<PagedApiResponse<CategoryCriteriaModel>> GetListCriteriaByIdEvaluation(Guid idEvaluation);
    Task<PagedApiResponse<CategoryCriteriaModel>> UpdateSortListAsync(EvaluationCriteriaUpdateSortPayload model);

}

