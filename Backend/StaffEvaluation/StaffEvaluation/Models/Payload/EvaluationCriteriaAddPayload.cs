namespace StaffEvaluation.Models.Payload;

public class EvaluationCriteriaAddPayload
{
    public List<Guid>? EvaluationIds { get; set; }
    public List<Guid>? ListCategoryCriteriaId { get; set; }
}

