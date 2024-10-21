namespace StaffEvaluation.Models;

public class UserModel
{
    public Guid Id { get; set; }
    public Guid UnitId { get; set; }
    public string? FullName { get; set; }
    public string? Email { get; set; }
    public string? Password { get; set; }
    public string? Phone { get; set; }
    public string? Address { get; set; }
    public string? RefreshToken { get; set; }
    public DateTime Birthday { get; set; }
    public bool IsActive { get; set; }
    public bool IsDeleted { get; set; }
    public DateTime UpdatedAt { get; set; }
}

