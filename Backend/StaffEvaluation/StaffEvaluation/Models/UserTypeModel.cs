namespace StaffEvaluation.Models;

public class UserTypeModel
{
    public Guid Id { get; set; }
    public string? UserTypeName { get; set; }
    public DateTime UpdatedAt { get; set; }
    public bool IsDeleted { get; set; }
}

