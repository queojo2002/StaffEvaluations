using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Diagnostics.CodeAnalysis;

namespace StaffEvaluation.Data.Entity;


[Table("EvaluationUser")]
public class EvaluationUser
{
    [Key]
    public Guid Id { get; set; }
    [ForeignKey("Evaluation")]
    public Guid EvaluationId { get; set; }
    [ForeignKey("User")]
    public Guid UserId { get; set; }
    [Display(Name = "Evaluation User Type", Description = "1: Người đánh giá, 2: Giám sát viên")]
    public int Type { get; set; }
    public int Sort { get; set; }
    [AllowNull]
    public bool? IsManager { get; set; }
    public bool IsDeleted { get; set; }
    public DateTime UpdatedAt { get; set; }
    public Evaluation? Evaluation { get; set; }
    public User? User { get; set; }
}

