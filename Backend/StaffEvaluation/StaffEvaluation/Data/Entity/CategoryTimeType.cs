using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace StaffEvaluation.Data.Entity;

[Table("CategoryTimeType")]
public class CategoryTimeType
{
    [Key]
    public Guid Id { get; set; }
    [ForeignKey("Unit")]
    public Guid UnitId { get; set; }
    public string? TimeTypeName { get; set; }
    public DateTime FromDate { get; set; }
    public DateTime ToDate { get; set; }
    public bool IsDeleted { get; set; }
    public DateTime UpdatedAt { get; set; }
    public Unit? Unit { get; set; }
}

