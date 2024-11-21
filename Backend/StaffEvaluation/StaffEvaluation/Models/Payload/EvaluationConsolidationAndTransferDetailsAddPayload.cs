namespace StaffEvaluation.Models.Payload;

public class EvaluationConsolidationAndTransferDetailsAddPayload
{
    public Guid EvaluationConsolidationAndTransferId { get; set; }
    public List<Guid>? EvaluationIds { get; set; }
}

