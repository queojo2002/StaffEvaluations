namespace StaffEvaluation.Models;

public class EvaluationCriteriaModel
{
    public Guid Id { get; set; }
    public Guid EvaluationId { get; set; }
    public Guid CategoryCriteriaId { get; set; }
    public int Sort { get; set; }
    public bool IsDeleted { get; set; }
    public DateTime UpdatedAt { get; set; }
}

