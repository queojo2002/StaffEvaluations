namespace StaffEvaluation.Models.Custom;

public class EvaluationExplaintGetPayload
{
    public Guid? EvaluationId { get; set; }
    public Guid? CategoryCriteriaId { get; set; }

    public List<Guid>? UserIds { get; set; }
}

