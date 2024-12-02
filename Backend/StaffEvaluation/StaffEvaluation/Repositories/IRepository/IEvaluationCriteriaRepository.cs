using StaffEvaluation.Helpers;
using StaffEvaluation.Models;
using StaffEvaluation.Models.Custom;
using StaffEvaluation.Models.Payload;

namespace StaffEvaluation.Repositories.IRepository;

public interface IEvaluationCriteriaRepository : IRepository<EvaluationCriteriaModel>
{
    Task<EvaluationCriteriaResponseModel> CriteriaToTree(EvaluationCriteriaResponseModel model, Guid userCurrentId, int type);
    Task<CriteriaTreeResponseModel> CriteriaToTreeWithUser(Guid evaluationId, Guid userCurrentId);
    Task<PagedApiResponse<CategoryCriteriaModel>> GetListCriteriaByIdEvaluation(Guid idEvaluation);
    Task<PagedApiResponse<EvaluationCriteriaResponseModel>> GetListCriteriaInEvaluationsOfUser(Guid evaluationId, Guid userId);
    Task<PagedApiResponse<EvaluationDetailsModel>> GetListCriteriaInEvaluationsOfUserCustom(Guid evaluationId, Guid userId);
    Task<PagedApiResponse<EvaluationCriteriaResponseModel>> GetListCriteriaInEvaluationsOfSupervisor(Guid evaluationId, Guid userId, Guid userCurrentId);
    Task<PagedApiResponse<EvaluationDetailsModel>> GetListCriteriaInEvaluationsOfSupervisorCustom(Guid evaluationId, Guid userId, Guid userCurrentId);
    Task<PagedApiResponse<EvaluationCriteriaModel>> InsertAndRemoveListAsync(EvaluationCriteriaAddPayload entity);
    Task<PagedApiResponse<CategoryCriteriaModel>> UpdateSortListAsync(EvaluationCriteriaUpdateSortPayload model);
}

