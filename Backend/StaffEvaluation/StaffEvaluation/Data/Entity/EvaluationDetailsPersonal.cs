using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace StaffEvaluation.Data.Entity;


[Table("EvaluationDetailsPersonal")]
public class EvaluationDetailsPersonal
{
    [Key]
    public Guid Id { get; set; }
    [ForeignKey("Evaluation")]
    public Guid? EvaluationId { get; set; }
    [ForeignKey("User")]
    public Guid? UserId { get; set; }
    [ForeignKey("EvaluationCriteria")]
    public Guid? EvaluationCriteriaId { get; set; }
    public int Status { get; set; }
    public int AssessmentValue { get; set; }
    public bool IsDeleted { get; set; }
    public DateTime UpdatedAt { get; set; }
    public EvaluationCriteria? EvaluationCriteria { get; set; }
    public User? User { get; set; }
    public Evaluation? Evaluation { get; set; }
}

