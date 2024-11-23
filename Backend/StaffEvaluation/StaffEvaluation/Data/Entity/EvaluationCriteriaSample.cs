using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace StaffEvaluation.Data.Entity;

[Table("EvaluationCriteriaSample")]
public class EvaluationCriteriaSample
{
    [Key]
    public Guid Id { get; set; }
    [ForeignKey("EvaluationSample")]
    public Guid EvaluationSampleId { get; set; }
    [ForeignKey("CategoryCriteria")]
    public Guid CategoryCriteriaId { get; set; }
    public int Sort { get; set; }
    public bool IsDeleted { get; set; }
    public DateTime UpdatedAt { get; set; }
    public EvaluationSample? EvaluationSample { get; set; }
    public CategoryCriteria? CategoryCriteria { get; set; }
}

