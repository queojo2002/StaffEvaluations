using AutoMapper;
using Microsoft.EntityFrameworkCore;
using StaffEvaluation.Data;
using StaffEvaluation.Data.Entity;
using StaffEvaluation.Helpers;
using StaffEvaluation.Models;
using StaffEvaluation.Repositories.IRepository;
using System.Data;

namespace StaffEvaluation.Repositories.Repository;

public class RolesRepository : IRolesRepository
{
    private DataContext _context;
    private IMapper _mapper;

    public RolesRepository(DataContext context, IMapper mapper)
    {
        _context = context;
        _mapper = mapper;
    }

    public async Task<PagedApiResponse<MenuItemsModel>> GetAllMenuItems(int pageNumber, int pageSize)
    {
        var menuItems = await _context.MenuItems!.OrderBy(e => e.Sort).ToListAsync();

        var mappedMenuItems = _mapper.Map<List<MenuItemsModel>>(menuItems);

        return new Pagination().HandleGetAllRespond(
            pageNumber,
            pageSize,
            mappedMenuItems,
            menuItems.Count
        );
    }

    public async Task<PagedApiResponse<RolesModel>> GetAllPagedAsync(int pageNumber, int pageSize)
    {
        var roles = await _context.Roles!.Where(e => !e.IsDeleted).OrderBy(e => e.UpdatedAt).ToListAsync();

        var mappedRoles = _mapper.Map<List<RolesModel>>(roles);

        return new Pagination().HandleGetAllRespond(
            pageNumber,
            pageSize,
            mappedRoles,
            roles.Count
        );
    }

    public Task<PagedApiResponse<RolesModel>> GetByIdAsync(Guid id)
    {
        throw new NotImplementedException();
    }

    public async Task<PagedApiResponse<RoleAndMenuItemsModel>> GetListMenuByRoleId(Guid roleId)
    {
        var roles = await _context.Roles!.SingleOrDefaultAsync(r => r.Id == roleId && !r.IsDeleted);

        if (roles == null)
        {
            return new ApiResult().Failure<RoleAndMenuItemsModel>("Vai trò không tồn tại.");
        }

        var menuItems = await _context.RoleMenuItems!
            .Where(rmi => rmi.RoleId == roles.Id)
            .Select(rmi => new MenuItemsModel
            {
                Id = rmi.MenuItems!.Id,
                Key = rmi.MenuItems.Key,
                Name = rmi.MenuItems.Name,
                ParentId = rmi.MenuItems.ParentId,
                Route = rmi.MenuItems.Route,
                Icon = rmi.MenuItems.Icon,
                Sort = rmi.MenuItems.Sort
            }).OrderBy(e => e.Sort).ToListAsync();

        RoleAndMenuItemsModel result = new RoleAndMenuItemsModel()
        {
            RoleName = roles.RoleName,
            MenuItems = menuItems.Select(e => e.Id).ToList(),
        };

        return new Pagination().HandleGetByIdRespond(result);
    }

    public async Task<PagedApiResponse<MenuItemsModel>> GetListMenuOfUser(Guid userId)
    {
        var userRoles = await _context.UserRoles!.SingleOrDefaultAsync(ur => ur.UserId == userId);

        if (userRoles == null)
        {
            return new ApiResult().Failure<MenuItemsModel>("Người dùng này chưa có chức năng.");
        }

        var menuItems = await _context.RoleMenuItems!
            .Where(rmi => rmi.RoleId == userRoles.RoleId)
            .Select(rmi => new MenuItemsModel
            {
                Id = rmi.MenuItems!.Id,
                Key = rmi.MenuItems.Key,
                Name = rmi.MenuItems.Name,
                ParentId = rmi.MenuItems.ParentId,
                Route = rmi.MenuItems.Route,
                Icon = rmi.MenuItems.Icon,
                Sort = rmi.MenuItems.Sort
            }).OrderBy(e => e.Sort).ToListAsync();

        if (menuItems.Count == 0)
        {
            return new ApiResult().Failure<MenuItemsModel>("Người dùng này chưa có chức năng.");
        }

        var mappedMIM = _mapper.Map<List<MenuItemsModel>>(menuItems);

        return new Pagination().HandleGetAllRespond(0, 0, mappedMIM, menuItems.Count);
    }



    public async Task<PagedApiResponse<RoleAndMenuItemsModel>> InsertRoleAndMenuItemsAsync(RoleAndMenuItemsModel roleAndMenu)
    {
        using var transaction = await _context.Database.BeginTransactionAsync();

        try
        {

            Guid roleId = Guid.NewGuid();

            if (roleAndMenu.MenuItems == null || !roleAndMenu.MenuItems.Any())
            {
                return new ApiResult().Failure<RoleAndMenuItemsModel>("Danh sách các quyền cho vai trò không được để trống.");
            }


            Roles role = new Roles
            {
                Id = roleId,
                RoleName = roleAndMenu.RoleName!.Trim().ToUpper(),
                IsDeleted = false,
                UpdatedAt = DateTime.Now
            };

            await _context.Roles!.AddAsync(role);


            if (roleAndMenu.MenuItems != null && roleAndMenu.MenuItems.Any())
            {
                var newRoleMenuItems = roleAndMenu.MenuItems.Select(item => new RoleMenuItems
                {
                    Id = Guid.NewGuid(),
                    RoleId = roleId,
                    MenuItemId = item
                }).ToList();

                await _context.RoleMenuItems!.AddRangeAsync(newRoleMenuItems);
            }

            await _context.SaveChangesAsync();

            await transaction.CommitAsync();

            return new ApiResult().Success<RoleAndMenuItemsModel>("Thêm mới vai trò thành công");
        }
        catch (Exception ex)
        {
            await transaction.RollbackAsync();

            return new ApiResult().Failure<RoleAndMenuItemsModel>($"Lỗi khi thêm mới vai trò: {ex.Message}");
        }
    }


    public async Task<PagedApiResponse<RoleAndMenuItemsModel>> RemoveRangeRoleAndMenuItemsAsync(List<Guid> roleIds)
    {
        using var transaction = await _context.Database.BeginTransactionAsync();

        try
        {
            var roleToDelete = await _context.Roles!.Where(rmi => roleIds.Contains(rmi.Id)).ToListAsync();

            if (roleToDelete.Count == 0) return new ApiResult().Failure<RoleAndMenuItemsModel>("Không tìm thấy vai trò nào để xóa.");

            roleToDelete.ForEach(role => role.IsDeleted = true);

            var roleMenuItemsToDelete = await _context.RoleMenuItems!.Where(rmi => roleToDelete.Select(r => r.Id).Contains(rmi.RoleId)).ToListAsync();

            if (roleMenuItemsToDelete.Any()) _context.RoleMenuItems!.RemoveRange(roleMenuItemsToDelete);

            await _context.SaveChangesAsync();

            await transaction.CommitAsync();

            return new ApiResult().Success<RoleAndMenuItemsModel>("Xoá các vai trò thành công.");
        }
        catch (Exception ex)
        {
            await transaction.RollbackAsync();
            return new ApiResult().Failure<RoleAndMenuItemsModel>($"Lỗi khi xoá các vai trò: {ex.Message}");
        }
    }

    public async Task<PagedApiResponse<RoleAndMenuItemsModel>> UpdateRoleAndMenuItemsAsync(RoleAndMenuItemsModel roleAndMenu)
    {
        using var transaction = await _context.Database.BeginTransactionAsync();

        try
        {
            var roles = await _context.Roles!.FindAsync(roleAndMenu.RoleId);

            if (roles == null || roles.IsDeleted)
            {
                return new ApiResult().Failure<RoleAndMenuItemsModel>("Vai trò này không tồn tại hoặc đã bị xóa.");
            }

            roles.RoleName = roleAndMenu.RoleName;
            roles.UpdatedAt = DateTime.Now;

            var roleMenuItems = await _context.RoleMenuItems!.Where(e => e.RoleId == roleAndMenu.RoleId).ToListAsync();
            _context.RoleMenuItems!.RemoveRange(roleMenuItems);


            if (roleAndMenu.MenuItems != null && roleAndMenu.MenuItems.Any())
            {
                var newRoleMenuItems = roleAndMenu.MenuItems.Select(item => new RoleMenuItems
                {
                    Id = Guid.NewGuid(),
                    RoleId = roles.Id,
                    MenuItemId = item
                }).ToList();

                await _context.RoleMenuItems.AddRangeAsync(newRoleMenuItems);
            }


            await _context.SaveChangesAsync();
            await transaction.CommitAsync();

            return new ApiResult().Success<RoleAndMenuItemsModel>("Cập nhật vai trò thành công.");
        }
        catch (Exception ex)
        {
            await transaction.RollbackAsync();
            return new ApiResult().Failure<RoleAndMenuItemsModel>($"Lỗi khi cập nhật vai trò: {ex.Message}");
        }
    }

    public Task<PagedApiResponse<RolesModel>> InsertAsync(RolesModel entity)
    {
        throw new NotImplementedException();
    }
    public Task<PagedApiResponse<RolesModel>> RemoveRangeAsync(List<Guid> ids)
    {
        throw new NotImplementedException();
    }

    public Task<PagedApiResponse<RolesModel>> UpdateAsync(RolesModel entity)
    {
        throw new NotImplementedException();
    }
}

