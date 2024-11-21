using StaffEvaluation.Helpers;
using StaffEvaluation.Models;

namespace StaffEvaluation.Repositories.IRepository;

public interface IEvaluationConsolidationAndTransferRepository : IRepository<EvaluationConsolidationAndTransferModel>
{
    Task<PagedApiResponse<EvaluationConsolidationAndTransferModel>> GetAllOfUnit(Guid unitCurrentId);
    Task<PagedApiResponse<EvaluationConsolidationAndTransferModel>> InsertCustomAsync(string evaluationConsolidationAndTransferName, Guid userCurrentId, Guid unitCurrentId);
}

