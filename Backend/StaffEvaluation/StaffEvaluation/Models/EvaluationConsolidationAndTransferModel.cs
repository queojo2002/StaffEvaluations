namespace StaffEvaluation.Models;

public class EvaluationConsolidationAndTransferModel
{
    public Guid Id { get; set; }
    public string? FullName { get; set; }
    public Guid? UserId { get; set; }
    public Guid? UnitId { get; set; }
    public string? UnitName { get; set; }
    public string? EvaluationConsolidationAndTransferName { get; set; }
    public int Status { get; set; }
    public DateTime UpdatedAt { get; set; }
}

