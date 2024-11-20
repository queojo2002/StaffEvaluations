using StaffEvaluation.Helpers;
using StaffEvaluation.Models;
using StaffEvaluation.Models.Payload;

namespace StaffEvaluation.Repositories.IRepository;

public interface IEvaluationRepository : IRepository<EvaluationModel>
{
    Task<PagedApiResponse<EvaluationModel>> InsertListAsync(EvaluationAddPayload entity);
    Task<PagedApiResponse<EvaluationModel>> UpdateListAsync(EvaluationUpdatePayload entity);
    Task<PagedApiResponse<EvaluationModel>> GetEvaluationOfUser(Guid userId);
    Task<PagedApiResponse<EvaluationModel>> GetEvaluationOfSupervisor(Guid userCurrentId);
    Task<PagedApiResponse<EvaluationModel>> GetEvaluationOfUnit(Guid unitId);

}

