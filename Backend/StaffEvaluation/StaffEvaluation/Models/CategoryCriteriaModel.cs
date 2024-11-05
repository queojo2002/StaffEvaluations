namespace StaffEvaluation.Models;

public class CategoryCriteriaModel
{
    public Guid Id { get; set; }
    public Guid? ParentId { get; set; }
    public int? StartValue { get; set; }
    public int? EndValue { get; set; }
    public string? RatingName { get; set; }
    public Guid? CategoryRatingId { get; set; }
    public string? UnitName { get; set; }
    public Guid UnitId { get; set; }
    public string? CriteriaName { get; set; }
    public bool IsDistinct { get; set; }
    public bool IsDeleted { get; set; }
    public DateTime UpdatedAt { get; set; }
}

