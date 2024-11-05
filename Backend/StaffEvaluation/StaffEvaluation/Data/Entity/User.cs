using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace StaffEvaluation.Data.Entity;


[Table("User")]
public class User
{
    [Key, Required]
    public Guid Id { get; set; }
    [ForeignKey("UserType")]
    public Guid UserTypeId { get; set; }
    [ForeignKey("Unit")]
    public Guid UnitId { get; set; }
    [Required]
    public string? FullName { get; set; }
    [Required]
    public string? Email { get; set; }
    [Required]
    public string? Password { get; set; }
    public string? Phone { get; set; }
    public string? Address { get; set; }
    [Required]
    public DateTime Birthday { get; set; }
    [Required]
    public string? PositionsName { get; set; }
    [Required]
    public bool IsActive { get; set; } = true;
    [Required]
    public bool IsDeleted { get; set; } = false;
    [Required]
    public DateTime UpdatedAt { get; set; }
    public Unit? Unit { get; set; }
    public UserType? UserType { get; set; }

}

