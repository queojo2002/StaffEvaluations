namespace StaffEvaluation.Models.Payload;

public class EvaluationUpdatePayload
{
    public List<Guid>? EvaluationIds { set; get; }
    public Guid CategoryTimeTypeId { set; get; }
}

