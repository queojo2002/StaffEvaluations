using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace StaffEvaluation.Data.Entity;



[Table("EvaluationConsolidationAndTransfer")]
public class EvaluationConsolidationAndTransfer
{
    [Key]
    public Guid Id { get; set; }
    [ForeignKey("User"), Display(Name = "User Id", Description = "Ai là người tổng hợp và chuyển")]
    public Guid UserId { get; set; }
    [ForeignKey("Unit"), Display(Name = "Unit Id", Description = "Tổng hợp và chuyển này thuộc đơn vị nào")]
    public Guid UnitId { get; set; }
    public string? EvaluationConsolidationAndTransferName { get; set; }
    [Display(Name = "Status CAT", Description = "1: Chưa tổng hợp và chuyển, 2: Đã tổng hợp và chuyển")]
    public int Status { get; set; }
    public DateTime UpdatedAt { get; set; }
    public Unit? Unit { get; set; }
    public User? User { get; set; }

}

