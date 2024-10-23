using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace StaffEvaluation.Data.Entity;


[Table("MenuItems")]
public class MenuItems
{
    [Key]
    public Guid Id { get; set; }
    public string? Key { get; set; }
    public string? Name { get; set; }
    public Guid? ParentId { get; set; }
    public string? Route { get; set; }
    public string? Icon { get; set; }
    [DefaultValue(1)]
    public int Sort { get; set; }
}

