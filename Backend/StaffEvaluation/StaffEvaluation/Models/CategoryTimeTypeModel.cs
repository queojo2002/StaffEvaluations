namespace StaffEvaluation.Models;

public class CategoryTimeTypeModel
{
    public Guid Id { get; set; }
    public string? UnitName { get; set; }
    public Guid UnitId { get; set; }
    public string? TimeTypeName { get; set; }
    public DateTime FromDate { get; set; }
    public DateTime ToDate { get; set; }
    public bool IsDeleted { get; set; }
    public DateTime UpdatedAt { get; set; }
}

