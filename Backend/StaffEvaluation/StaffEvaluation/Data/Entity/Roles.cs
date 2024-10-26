using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Diagnostics.CodeAnalysis;

namespace StaffEvaluation.Data.Entity;


[Table("Roles")]
public class Roles
{
    [Key]
    public Guid Id { get; set; }
    [Required]
    public string? RoleName { get; set; }
    public DateTime UpdatedAt { get; set; }
    [AllowNull]
    public bool IsDeleted { get; set; }
}

