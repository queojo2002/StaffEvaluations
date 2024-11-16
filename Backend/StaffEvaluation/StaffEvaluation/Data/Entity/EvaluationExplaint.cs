using System.ComponentModel.DataAnnotations.Schema;

namespace StaffEvaluation.Data.Entity;

[Table("EvaluationExplaint")]
public class EvaluationExplaint
{
    public Guid Id { get; set; }
    [ForeignKey("EvaluationId")]
    public Evaluation? Evaluation { get; set; }
    [ForeignKey("UserId")]
    public User? User { get; set; }
    [ForeignKey("CategoryCriteriaId")]
    public CategoryCriteria? CategoryCriteria { get; set; }
    public string? Note { get; set; }
    public string? FileAttachments { get; set; }
    public bool IsDeleted { get; set; }
    public DateTime UpdatedAt { get; set; }
}

