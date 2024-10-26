namespace StaffEvaluation.Models;

public class RoleAndMenuItemsModel
{
    public Guid? RoleId { get; set; }
    public string? RoleName { get; set; }
    public List<Guid>? MenuItems { get; set; }
}

