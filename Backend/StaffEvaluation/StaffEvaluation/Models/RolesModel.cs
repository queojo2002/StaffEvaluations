namespace StaffEvaluation.Models;

public class RolesModel
{
    public Guid Id { get; set; }
    public string? RoleName { get; set; }
    public DateTime UpdatedAt { get; set; }
    public bool IsDeleted { get; set; }
}

