namespace StaffEvaluation.Models;

public class MenuItemsModel
{
    public Guid Id { get; set; }
    public string? Key { get; set; }
    public string? Name { get; set; }
    public Guid? ParentId { get; set; }
    public string? Route { get; set; }
    public string? Icon { get; set; }
    public int Sort { get; set; }
}

