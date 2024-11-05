using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Diagnostics.CodeAnalysis;

namespace StaffEvaluation.Data.Entity;


[Table("UserType")]
public class UserType
{
    [Key]
    public Guid Id { get; set; }
    [Required]
    public string? UserTypeName { get; set; }
    public DateTime UpdatedAt { get; set; }
    [AllowNull]
    public bool IsDeleted { get; set; }
}

