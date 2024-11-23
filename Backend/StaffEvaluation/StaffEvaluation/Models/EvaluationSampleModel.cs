namespace StaffEvaluation.Models;

public class EvaluationSampleModel
{
    public Guid Id { get; set; }
    public string? EvaluationSampleName { get; set; }
    public bool IsDeleted { get; set; }
    public DateTime UpdatedAt { get; set; }
}

