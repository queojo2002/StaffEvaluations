using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace StaffEvaluation.Data.Entity;


[Table("ElectronicSignature")]
public class ElectronicSignature
{
    [Key]
    public Guid Id { get; set; }
    [ForeignKey("User")]
    public Guid UserId { get; set; }
    public int Status { get; set; }
    public string? PublicKey { get; set; }
    public string? PrivateKey { get; set; }
    public DateTime UpdatedAt { get; set; }
    public User? User { get; set; }
}

