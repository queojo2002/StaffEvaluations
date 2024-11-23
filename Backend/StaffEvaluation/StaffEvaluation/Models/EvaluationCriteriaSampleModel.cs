namespace StaffEvaluation.Models;

public class EvaluationCriteriaSampleModel
{
    public Guid Id { get; set; }
    public Guid EvaluationSampleId { get; set; }
    public Guid CategoryCriteriaId { get; set; }
    public int Sort { get; set; }
    public bool IsDeleted { get; set; }
    public DateTime UpdatedAt { get; set; }
}

