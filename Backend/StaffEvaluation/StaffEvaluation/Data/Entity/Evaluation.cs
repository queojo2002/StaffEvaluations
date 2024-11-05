using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Diagnostics.CodeAnalysis;

namespace StaffEvaluation.Data.Entity;


[Table("Evaluation")]
public class Evaluation
{
    [Key]
    public Guid Id { get; set; }
    [ForeignKey("Unit")]
    public Guid UnitId { get; set; }
    [ForeignKey("CategoryTimeType"), AllowNull]
    public Guid? CategoryTimeTypeId { get; set; }
    public string? EvaluationName { get; set; }
    public int Status { get; set; }
    public bool IsDeleted { get; set; }
    public DateTime UpdatedAt { get; set; }
    public CategoryTimeType? CategoryTimeType { get; set; }
    public Unit? Unit { get; set; }
}

