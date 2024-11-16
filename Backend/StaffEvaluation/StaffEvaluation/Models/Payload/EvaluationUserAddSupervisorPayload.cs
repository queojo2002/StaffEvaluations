namespace StaffEvaluation.Models.Payload;

public class EvaluationUserAddSupervisorPayload
{
    public Guid EvaluationId { get; set; }
    public Guid UserId { get; set; }
    public int? Sort { get; set; }
    public bool IsManager { get; set; }
}

