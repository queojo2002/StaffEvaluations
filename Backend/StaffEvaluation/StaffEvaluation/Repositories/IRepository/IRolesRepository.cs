using StaffEvaluation.Helpers;
using StaffEvaluation.Models;

namespace StaffEvaluation.Repositories.IRepository
{
    public interface IRolesRepository : IRepository<RolesModel>
    {
        Task<PagedApiResponse<MenuItemsModel>> GetListMenuOfUser(Guid userId);
        Task<PagedApiResponse<RoleAndMenuItemsModel>> GetListMenuByRoleId(Guid roleId);
        Task<PagedApiResponse<MenuItemsModel>> GetAllMenuItems(int pageNumber, int pageSize);
        Task<PagedApiResponse<RoleAndMenuItemsModel>> InsertRoleAndMenuItemsAsync(RoleAndMenuItemsModel roleAndMenu);
        Task<PagedApiResponse<RoleAndMenuItemsModel>> UpdateRoleAndMenuItemsAsync(RoleAndMenuItemsModel roleAndMenu);
        Task<PagedApiResponse<RoleAndMenuItemsModel>> RemoveRangeRoleAndMenuItemsAsync(List<Guid> roleIds);
    }
}
