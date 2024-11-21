using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace StaffEvaluation.Data.Entity;


[Table("EvaluationConsolidationAndTransferDetails")]
public class EvaluationConsolidationAndTransferDetails
{
    [Key]
    public Guid Id { get; set; }
    [ForeignKey("EvaluationConsolidationAndTransfer")]
    public Guid EvaluationConsolidationAndTransferId { get; set; }
    [ForeignKey("Evaluation")]
    public Guid EvaluationId { get; set; }
    public DateTime UpdatedAt { get; set; }
    public EvaluationConsolidationAndTransfer? EvaluationConsolidationAndTransfer { get; set; }
    public Evaluation? Evaluation { get; set; }
}

