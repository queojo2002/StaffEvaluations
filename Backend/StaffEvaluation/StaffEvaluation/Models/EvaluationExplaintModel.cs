namespace StaffEvaluation.Models;

public class EvaluationExplaintModel
{
    public Guid? Id { get; set; }
    public Guid EvaluationId { get; set; }
    public Guid UserId { get; set; }
    public Guid? SupervisorId { get; set; }
    public Guid CategoryCriteriaId { get; set; }
    public string? FullName { get; set; }
    public string? Note { get; set; }
    public string? FileAttachments { get; set; }
    public int? Type { get; set; } // 0 là user, 1: supervisor
    public bool? IsDeleted { get; set; }
    public DateTime? UpdatedAt { get; set; }
}

