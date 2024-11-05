using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Diagnostics.CodeAnalysis;

namespace StaffEvaluation.Data.Entity;


[Table("CategoryCriteria")]
public class CategoryCriteria
{
    [Key]
    public Guid Id { get; set; }
    [AllowNull]
    public Guid? ParentId { get; set; }
    [ForeignKey("CategoryRating"), AllowNull]
    public Guid? CategoryRatingId { get; set; }
    [ForeignKey("Unit")]
    public Guid UnitId { get; set; }
    public string? CriteriaName { get; set; }
    public bool IsDistinct { get; set; }
    public bool IsDeleted { get; set; }
    public DateTime UpdatedAt { get; set; }
    public Unit? Unit { get; set; }
    public CategoryRating? CategoryRating { get; set; }
}

