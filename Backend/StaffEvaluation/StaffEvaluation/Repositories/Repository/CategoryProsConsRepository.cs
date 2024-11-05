using AutoMapper;
using Microsoft.EntityFrameworkCore;
using StaffEvaluation.Data;
using StaffEvaluation.Data.Entity;
using StaffEvaluation.Helpers;
using StaffEvaluation.Models;
using StaffEvaluation.Repositories.IRepository;

namespace StaffEvaluation.Repositories.Repository;

public class CategoryProsConsRepository : ICategoryProsConsRepository
{
    private readonly DataContext _context;
    private readonly IMapper _mapper;

    public CategoryProsConsRepository(DataContext context, IMapper mapper)
    {
        _context = context;
        _mapper = mapper;
    }

    public async Task<PagedApiResponse<CategoryProsConsModel>> GetAllPagedAsync(int pageNumber, int pageSize)
    {
        var prosConsList = await _context.CategoryProsCons
            .Where(pc => !pc.IsDeleted)
            .Select(pc => new CategoryProsConsModel
            {
                Id = pc.Id,
                Content = pc.Content,
                IsPros = pc.IsPros,
                IsDeleted = pc.IsDeleted,
                UpdatedAt = pc.UpdatedAt
            }).OrderByDescending(e => e.UpdatedAt).ToListAsync();

        return new Pagination().HandleGetAllRespond(
            pageNumber,
            pageSize,
            prosConsList,
            prosConsList.Count
        );
    }

    public async Task<PagedApiResponse<CategoryProsConsModel>> GetByIdAsync(Guid id)
    {
        var prosCons = await _context.CategoryProsCons
            .Where(pc => pc.Id == id && !pc.IsDeleted)
            .Select(pc => new CategoryProsConsModel
            {
                Id = pc.Id,
                Content = pc.Content,
                IsPros = pc.IsPros,
                IsDeleted = pc.IsDeleted,
                UpdatedAt = pc.UpdatedAt
            }).SingleOrDefaultAsync();

        if (prosCons == null)
        {
            return new ApiResult().Failure<CategoryProsConsModel>("Không tìm thấy thông tin hoặc đã bị xóa.");
        }

        return new Pagination().HandleGetByIdRespond(prosCons);
    }

    public async Task<PagedApiResponse<CategoryProsConsModel>> InsertAsync(CategoryProsConsModel entity)
    {
        using var transaction = await _context.Database.BeginTransactionAsync();

        try
        {
            var prosCons = new CategoryProsCons
            {
                Id = Guid.NewGuid(),
                Content = entity.Content,
                IsPros = entity.IsPros,
                IsDeleted = false,
                UpdatedAt = DateTime.Now
            };

            await _context.CategoryProsCons.AddAsync(prosCons);
            await _context.SaveChangesAsync();

            await transaction.CommitAsync();

            return new ApiResult().Success<CategoryProsConsModel>("Thêm mới thành công.");
        }
        catch (Exception ex)
        {
            await transaction.RollbackAsync();
            return new ApiResult().Failure<CategoryProsConsModel>($"Lỗi khi thêm mới: {ex.Message}");
        }
    }

    public async Task<PagedApiResponse<CategoryProsConsModel>> RemoveRangeAsync(List<Guid> ids)
    {
        using var transaction = await _context.Database.BeginTransactionAsync();

        try
        {
            var prosConsToRemove = await _context.CategoryProsCons
                .Where(pc => ids.Contains(pc.Id) && !pc.IsDeleted)
                .ToListAsync();

            if (!prosConsToRemove.Any())
            {
                return new ApiResult().Failure<CategoryProsConsModel>("Không tìm thấy thông tin để xóa.");
            }

            foreach (var prosCons in prosConsToRemove)
            {
                prosCons.IsDeleted = true;
                prosCons.UpdatedAt = DateTime.Now;
            }

            await _context.SaveChangesAsync();
            await transaction.CommitAsync();

            return new ApiResult().Success<CategoryProsConsModel>("Xóa thành công.");
        }
        catch (Exception ex)
        {
            await transaction.RollbackAsync();
            return new ApiResult().Failure<CategoryProsConsModel>($"Lỗi khi xóa: {ex.Message}");
        }
    }

    public async Task<PagedApiResponse<CategoryProsConsModel>> UpdateAsync(CategoryProsConsModel entity)
    {
        if (entity.Id == Guid.Empty)
        {
            return new ApiResult().Failure<CategoryProsConsModel>("ID không hợp lệ.");
        }

        using var transaction = await _context.Database.BeginTransactionAsync();

        try
        {
            var prosConsToUpdate = await _context.CategoryProsCons.FindAsync(entity.Id);

            if (prosConsToUpdate == null || prosConsToUpdate.IsDeleted)
            {
                return new ApiResult().Failure<CategoryProsConsModel>("Thông tin không tồn tại hoặc đã bị xóa.");
            }

            prosConsToUpdate.Content = entity.Content;
            prosConsToUpdate.IsPros = entity.IsPros;
            prosConsToUpdate.UpdatedAt = DateTime.Now;

            await _context.SaveChangesAsync();
            await transaction.CommitAsync();

            return new ApiResult().Success<CategoryProsConsModel>("Cập nhật thành công.");
        }
        catch (Exception ex)
        {
            await transaction.RollbackAsync();
            return new ApiResult().Failure<CategoryProsConsModel>($"Lỗi khi cập nhật: {ex.Message}");
        }
    }
}

