using StaffEvaluation.Helpers;
using StaffEvaluation.Models;
using StaffEvaluation.Models.Payload;

namespace StaffEvaluation.Repositories.IRepository;

public interface IEvaluationCriteriaSampleRepository : IRepository<EvaluationCriteriaSampleModel>
{
    Task<PagedApiResponse<EvaluationCriteriaSampleModel>> InsertCustomAsync(EvaluationCriteriaSampleAddPayload entity);
    Task<PagedApiResponse<EvaluationCriteriaSampleModel>> UpdateSortListAsync(EvaluationCriteriaSampleUpdateSortPayload model);
    Task<PagedApiResponse<CategoryCriteriaModel>> GetListCriteriaByIdEvaluationSample(Guid evaluationSampleId);

}

