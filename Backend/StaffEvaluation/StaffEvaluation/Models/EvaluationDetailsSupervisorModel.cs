namespace StaffEvaluation.Models;

public class EvaluationDetailsSupervisorModel
{
    public Guid Id { get; set; }
    public Guid EvaluationId { get; set; }
    public Guid UserSupervisorId { get; set; }
    public Guid EvaluationDetailsPersonalId { get; set; }
    public int AssessmentValueSupervisor { get; set; }
    public int Status { get; set; }
    public bool IsDeleted { get; set; }
    public DateTime UpdatedAt { get; set; }
}

