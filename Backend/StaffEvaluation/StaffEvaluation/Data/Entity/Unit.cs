using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Diagnostics.CodeAnalysis;

namespace StaffEvaluation.Data.Entity;


[Table("Unit")]
public class Unit
{
    [Required, Key]
    public Guid Id { get; set; }
    [Required]
    public string? UnitName { get; set; }
    [AllowNull]
    public Guid? ParentId { get; set; }
    [Required]
    public bool IsDeleted { get; set; } = false;
    [Required]
    public DateTime UpdatedAt { get; set; }
}

