using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace StaffEvaluation.Data.Entity;


[Table("Roles")]
public class Roles
{
    [Key]
    public Guid Id { get; set; }
    [Required]
    public string? RoleName { get; set; }
    public DateTime UpdatedAt { get; set; }

}

