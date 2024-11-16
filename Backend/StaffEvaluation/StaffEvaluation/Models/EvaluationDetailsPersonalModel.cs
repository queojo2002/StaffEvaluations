namespace StaffEvaluation.Models;

public class EvaluationDetailsPersonalModel
{
    public Guid Id { get; set; }
    public Guid? EvaluationId { get; set; }
    public Guid? UserId { get; set; }
    public Guid? EvaluationCriteriaId { get; set; }
    public int AssessmentValue { get; set; }
    public bool IsDeleted { get; set; }
    public DateTime UpdatedAt { get; set; }
}

