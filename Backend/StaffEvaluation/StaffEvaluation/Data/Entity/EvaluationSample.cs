using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace StaffEvaluation.Data.Entity;

[Table("EvaluationSample")]
public class EvaluationSample
{
    [Key]
    public Guid Id { get; set; }
    public string? EvaluationSampleName { get; set; }
    public bool IsDeleted { get; set; }
    public DateTime UpdatedAt { get; set; }
}

