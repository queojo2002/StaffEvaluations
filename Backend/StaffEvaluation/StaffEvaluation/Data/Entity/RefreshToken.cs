using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace StaffEvaluation.Data.Entity;

[Table("RefreshToken")]
public class RefreshToken
{
    [Key]
    public Guid Id { get; set; }
    [ForeignKey("User")]
    public Guid UserId { get; set; }
    public string? Token { get; set; }
    public string? JwtId { get; set; }
    public bool IsUsed { get; set; } = false;
    public bool IsRevoked { get; set; } = false;
    public DateTime IssuedAt { get; set; }
    public DateTime ExpiredAt { get; set; }

    public User? User { get; set; }

}

