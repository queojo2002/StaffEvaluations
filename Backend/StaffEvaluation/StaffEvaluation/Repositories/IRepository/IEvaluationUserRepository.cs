using StaffEvaluation.Helpers;
using StaffEvaluation.Models;
using StaffEvaluation.Models.Payload;

namespace StaffEvaluation.Repositories.IRepository;

public interface IEvaluationUserRepository : IRepository<EvaluationUserModel>
{
    Task<PagedApiResponse<UserModel>> GetUsersNotAllowedToEvaluate(Guid evaluationId);
    Task<PagedApiResponse<UserModel>> GetUsersAllowedToEvaluate(Guid evaluationId);
    Task<PagedApiResponse<UserModel>> GetSupervisorsForEvaluation(Guid evaluationId);
    Task<PagedApiResponse<UserModel>> GetAllNonSupervisorUsersAsync(Guid evaluationId);
    Task<PagedApiResponse<EvaluationUserModel>> InsertUserIntoEvaluationAsync(EvaluationUserAddPayload model);
    Task<PagedApiResponse<EvaluationUserModel>> RemoveUserFromEvaluationAsync(EvaluationUserAddPayload model);

    Task<PagedApiResponse<EvaluationUserModel>> InsertSupervisorIntoEvaluationAsync(EvaluationUserAddSupervisorPayload model);

    Task<PagedApiResponse<EvaluationUserModel>> RemoveSupervisorFromEvaluationAsync(EvaluationUserAddSupervisorPayload model);


}

