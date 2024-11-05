namespace StaffEvaluation.Models;

public class CategoryRatingModel
{
    public Guid Id { get; set; }
    public Guid UnitId { get; set; }
    public string? UnitName { get; set; }
    public string? RatingName { get; set; }
    public int StartValue { get; set; }
    public int EndValue { get; set; }
    public bool IsDeleted { get; set; }
    public DateTime UpdatedAt { get; set; }
}

