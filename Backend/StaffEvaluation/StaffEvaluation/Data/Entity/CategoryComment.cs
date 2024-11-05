using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace StaffEvaluation.Data.Entity;


[Table("CategoryComment")]
public class CategoryComment
{
    [Key]
    public Guid Id { get; set; }
    public string? Title { get; set; }
    public string? Content { get; set; }
    public int Sort { get; set; }
    public bool IsDeleted { get; set; }
    public DateTime UpdatedAt { get; set; }
}