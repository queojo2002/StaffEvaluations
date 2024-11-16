using System.ComponentModel.DataAnnotations.Schema;

namespace StaffEvaluation.Data.Entity;

[Table("EvaluationDetailsSupervisor")]
public class EvaluationDetailsSupervisor
{
    public Guid Id { get; set; }
    [ForeignKey("Evaluation")]
    public Guid EvaluationId { get; set; }
    [ForeignKey("User")]
    public Guid UserSupervisorId { get; set; }
    [ForeignKey("EvaluationDetailsPersonal")]
    public Guid EvaluationDetailsPersonalId { get; set; }
    public int Status { get; set; }
    public int AssessmentValueSupervisor { get; set; }
    public bool IsDeleted { get; set; }
    public DateTime UpdatedAt { get; set; }
    public EvaluationDetailsPersonal? EvaluationDetailsPersonal { get; set; }
    public User? User { get; set; }
    public Evaluation? Evaluation { get; set; }


}

