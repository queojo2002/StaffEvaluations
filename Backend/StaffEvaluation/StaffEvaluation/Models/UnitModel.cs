namespace StaffEvaluation.Models;

public class UnitModel
{
    public Guid Id { get; set; }
    public string? UnitName { get; set; }
    public Guid? ParentId { get; set; }
    public int? Level { get; set; }
    public bool? IsDeleted { get; set; }
    public DateTime? UpdatedAt { get; set; }
}

