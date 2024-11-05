namespace StaffEvaluation.Models;

public class CategoryProsConsModel
{
    public Guid Id { get; set; }
    public string? Content { get; set; }
    public bool IsPros { get; set; }
    public bool IsDeleted { get; set; }
    public DateTime UpdatedAt { get; set; }
}

