namespace StaffEvaluation.Models;

public class EvaluationConsolidationAndTransferDetailsModel
{
    public Guid Id { get; set; }
    public Guid EvaluationConsolidationAndTransferId { get; set; }
    public Guid EvaluationId { get; set; }
    public DateTime UpdatedAt { get; set; }
}

