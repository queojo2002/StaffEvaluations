namespace StaffEvaluation.Models.Payload;

public class EvaluationUserAddPayload
{
    public Guid EvaluationId { get; set; }
    public List<Guid>? UserIds { get; set; }
}

