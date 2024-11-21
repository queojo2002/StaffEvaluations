using StaffEvaluation.Data.Entity;
using StaffEvaluation.Helpers;
using StaffEvaluation.Models;
using StaffEvaluation.Models.Payload;

namespace StaffEvaluation.Repositories.IRepository;

public interface IEvaluationConsolidationAndTransferDetailsRepository : IRepository<EvaluationConsolidationAndTransferDetailsModel>
{
    Task<PagedApiResponse<EvaluationModel>> GetAllEvaluationAvailable(Guid evaluationConsolidationAndTransferId, Guid unitCurrentId);

    Task<PagedApiResponse<EvaluationModel>> GetAllEvaluationsByConsolidationIdAsync(Guid evaluationConsolidationAndTransferId);

    Task<PagedApiResponse<EvaluationConsolidationAndTransferDetails>> InsertEvaluationIntoCATDAsync(EvaluationConsolidationAndTransferDetailsAddPayload model);

    Task<PagedApiResponse<EvaluationConsolidationAndTransferDetails>> RemoveEvaluationFromCATDAsync(EvaluationConsolidationAndTransferDetailsAddPayload model);


}

