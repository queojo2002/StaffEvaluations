namespace StaffEvaluation.Models;

public class EvaluationExplaintModel
{
    public Guid? Id { get; set; }
    public Guid EvaluationId { get; set; }
    public Guid UserId { get; set; }
    public Guid CategoryCriteriaId { get; set; }
    public string? FullName { get; set; }
    public string? Note { get; set; }
    public string? FileAttachments { get; set; }
    public bool? IsDeleted { get; set; }
    public DateTime? UpdatedAt { get; set; }
}

