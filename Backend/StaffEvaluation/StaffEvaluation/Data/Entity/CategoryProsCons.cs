using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace StaffEvaluation.Data.Entity;

[Table("CategoryProsCons")]
public class CategoryProsCons
{
    [Key]
    public Guid Id { get; set; }
    public string? Content { get; set; }
    public bool IsPros { get; set; }
    public bool IsDeleted { get; set; }
    public DateTime UpdatedAt { get; set; }

}

