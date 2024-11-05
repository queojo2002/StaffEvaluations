using AutoMapper;
using Microsoft.EntityFrameworkCore;
using StaffEvaluation.Data;
using StaffEvaluation.Data.Entity;
using StaffEvaluation.Helpers;
using StaffEvaluation.Models;
using StaffEvaluation.Repositories.IRepository;

namespace StaffEvaluation.Repositories.Repository;

public class UserTypeRepository : IUserTypeRepository
{

    private readonly IConfiguration _configuration;
    private DataContext _context;
    private IMapper _mapper;

    public UserTypeRepository(DataContext context, IMapper mapper, IConfiguration configuration)
    {
        _context = context;
        _mapper = mapper;
        _configuration = configuration;
    }

    public async Task<PagedApiResponse<UserTypeModel>> GetAllPagedAsync(int pageNumber, int pageSize)
    {
        var datas = await _context.UserTypes!.Where(e => !e.IsDeleted).OrderByDescending(e => e.UpdatedAt).ToListAsync();

        var map = _mapper.Map<List<UserTypeModel>>(datas);

        return new Pagination().HandleGetAllRespond(
            pageNumber,
            pageSize,
            map,
            datas.Count
        );
    }

    public async Task<PagedApiResponse<UserTypeModel>> GetByIdAsync(Guid id)
    {
        var data = await _context.UserTypes!.Where(e => e.Id == id).SingleOrDefaultAsync();

        var map = _mapper.Map<UserTypeModel>(data);

        return new Pagination().HandleGetByIdRespond(map);
    }

    public async Task<PagedApiResponse<UserTypeModel>> InsertAsync(UserTypeModel entity)
    {
        using var transaction = await _context.Database.BeginTransactionAsync();

        try
        {

            UserType userType = new UserType
            {
                Id = Guid.NewGuid(),
                UserTypeName = entity.UserTypeName!.Trim().ToUpper(),
                IsDeleted = false,
                UpdatedAt = DateTime.Now
            };

            await _context.UserTypes!.AddAsync(userType);

            await _context.SaveChangesAsync();

            await transaction.CommitAsync();

            return new ApiResult().Success<UserTypeModel>("Thêm mới loại người dùng thành công");
        }
        catch (Exception ex)
        {
            await transaction.RollbackAsync();

            return new ApiResult().Failure<UserTypeModel>($"Lỗi khi thêm mới loại người dùng: {ex.Message}");
        }
    }
    public async Task<PagedApiResponse<UserTypeModel>> UpdateAsync(UserTypeModel entity)
    {
        using var transaction = await _context.Database.BeginTransactionAsync();

        try
        {
            var userType = await _context.UserTypes!.FindAsync(entity.Id);

            if (userType == null || userType.IsDeleted)
            {
                return new ApiResult().Failure<UserTypeModel>("Loại người dùng này không tồn tại hoặc đã bị xóa.");
            }

            userType.UserTypeName = entity.UserTypeName!.Trim().ToUpper();
            userType.UpdatedAt = DateTime.Now;

            await _context.SaveChangesAsync();
            await transaction.CommitAsync();

            return new ApiResult().Success<UserTypeModel>("Cập nhật loại người dùng thành công.");
        }
        catch (Exception ex)
        {
            await transaction.RollbackAsync();
            return new ApiResult().Failure<UserTypeModel>($"Lỗi khi cập nhật loại người dùng: {ex.Message}");
        }
    }

    public async Task<PagedApiResponse<UserTypeModel>> RemoveRangeAsync(List<Guid> ids)
    {
        using var transaction = await _context.Database.BeginTransactionAsync();

        try
        {
            var userTypeToDelete = await _context.UserTypes!.Where(rmi => ids.Contains(rmi.Id)).ToListAsync();

            if (userTypeToDelete.Count == 0) return new ApiResult().Failure<UserTypeModel>("Không tìm thấy loại người dùng nào để xóa.");

            userTypeToDelete.ForEach(u => u.IsDeleted = true);

            await _context.SaveChangesAsync();

            await transaction.CommitAsync();

            return new ApiResult().Success<UserTypeModel>("Xoá các loại người dùng thành công.");
        }
        catch (Exception ex)
        {
            await transaction.RollbackAsync();
            return new ApiResult().Failure<UserTypeModel>($"Lỗi khi xoá các loại người dùng: {ex.Message}");
        }
    }
}

