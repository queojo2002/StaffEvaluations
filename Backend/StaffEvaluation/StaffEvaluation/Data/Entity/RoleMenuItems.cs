using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace StaffEvaluation.Data.Entity;


[Table("RoleMenuItems")]
public class RoleMenuItems
{
    [Key]
    public Guid Id { get; set; }
    [ForeignKey("Roles")]
    public Guid RoleId { get; set; }
    [ForeignKey("MenuItems")]
    public Guid MenuItemId { get; set; }


    public Roles? Roles { get; set; }
    public MenuItems? MenuItems { get; set; }
}

