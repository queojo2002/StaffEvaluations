namespace StaffEvaluation.Models;

public class EvaluationModel
{
    public Guid Id { get; set; }
    public Guid UnitId { get; set; }
    public string? UnitName { get; set; }
    public Guid? CategoryTimeTypeId { get; set; }
    public DateTime? FromDate { get; set; }
    public DateTime? ToDate { get; set; }
    public string? EvaluationName { get; set; }
    public int Status { get; set; }
    public bool IsDeleted { get; set; }
    public DateTime UpdatedAt { get; set; }
}

