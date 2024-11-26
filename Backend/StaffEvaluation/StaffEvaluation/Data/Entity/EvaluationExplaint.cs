using System.ComponentModel.DataAnnotations.Schema;

namespace StaffEvaluation.Data.Entity;

[Table("EvaluationExplaint")]
public class EvaluationExplaint
{
    public Guid Id { get; set; }


    [ForeignKey("Evaluation")]
    public Guid? EvaluationId { get; set; }
    public Evaluation? Evaluation { get; set; }


    [ForeignKey("User")]
    public Guid? UserId { get; set; }
    public User? User { get; set; }


    [ForeignKey("Supervisor")]
    public Guid? SupervisorId { get; set; }
    public User? Supervisor { get; set; }


    [ForeignKey("CategoryCriteria")]
    public Guid? CategoryCriteriaId { get; set; }
    public CategoryCriteria? CategoryCriteria { get; set; }


    public string? Note { get; set; }
    public string? FileAttachments { get; set; }
    public bool IsDeleted { get; set; }
    public DateTime UpdatedAt { get; set; }
}

