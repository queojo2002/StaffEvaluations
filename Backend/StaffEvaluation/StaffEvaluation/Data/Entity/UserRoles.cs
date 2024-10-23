using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace StaffEvaluation.Data.Entity;

public class UserRoles
{
    [Key]
    public Guid Id { get; set; }
    [ForeignKey("Roles")]
    public Guid RoleId { get; set; }
    [ForeignKey("User")]
    public Guid UserId { get; set; }


    public User? User { get; set; }
    public Roles? Roles { get; set; }
}

