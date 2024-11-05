using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace StaffEvaluation.Data.Entity;

[Table("EvaluationCriteria")]
public class EvaluationCriteria
{
    [Key]
    public Guid Id { get; set; }
    [ForeignKey("Evaluation")]
    public Guid EvaluationId { get; set; }
    [ForeignKey("CategoryCriteria")]
    public Guid CategoryCriteriaId { get; set; }
    public int Sort { get; set; }
    public bool IsDeleted { get; set; }
    public DateTime UpdatedAt { get; set; }
    public Evaluation? Evaluation { get; set; }
    public CategoryCriteria? CategoryCriteria { get; set; }
}

