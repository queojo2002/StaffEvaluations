namespace StaffEvaluation.Models.Payload;

public class EvaluationAddPayload
{
    public string? EvaluationName { get; set; }
    public List<Guid>? ListUnitId { get; set; }
}

