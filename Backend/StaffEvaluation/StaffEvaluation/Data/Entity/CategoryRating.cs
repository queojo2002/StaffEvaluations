using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace StaffEvaluation.Data.Entity;


[Table("CategoryRating")]
public class CategoryRating
{
    [Key]
    public Guid Id { get; set; }
    [ForeignKey("Unit")]
    public Guid UnitId { get; set; }
    public string? RatingName { get; set; }
    public int StartValue { get; set; }
    public int EndValue { get; set; }
    public bool IsDeleted { get; set; }
    public DateTime UpdatedAt { get; set; }
    public Unit? Unit { get; set; }
}

