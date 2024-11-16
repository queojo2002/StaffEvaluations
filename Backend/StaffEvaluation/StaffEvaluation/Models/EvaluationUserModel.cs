namespace StaffEvaluation.Models;

public class EvaluationUserModel
{
    public Guid Id { get; set; }
    public Guid EvaluationId { get; set; }
    public Guid UserId { get; set; }
    public int Type { get; set; }
    public int Sort { get; set; }
    public bool IsDeleted { get; set; }
    public DateTime UpdatedAt { get; set; }
}

