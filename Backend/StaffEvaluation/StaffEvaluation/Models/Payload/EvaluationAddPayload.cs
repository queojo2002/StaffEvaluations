namespace StaffEvaluation.Models.Payload;

public class EvaluationAddPayload
{
    public Guid? EvaluationSampleId { get; set; }
    public string? EvaluationName { get; set; }
    public bool? IsCopy { get; set; }
    public List<Guid>? ListUnitId { get; set; }
}

