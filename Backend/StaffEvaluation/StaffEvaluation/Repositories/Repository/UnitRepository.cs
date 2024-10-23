using AutoMapper;
using Microsoft.EntityFrameworkCore;
using StaffEvaluation.Data;
using StaffEvaluation.Data.Entity;
using StaffEvaluation.Helpers;
using StaffEvaluation.Models;
using StaffEvaluation.Repositories.IRepository;

namespace StaffEvaluation.Repositories.Repository;

public class UnitRepository : IUnitRepository
{
    private DataContext _context;
    private IMapper _mapper;

    public UnitRepository(DataContext context, IMapper mapper)
    {
        _context = context;
        _mapper = mapper;
    }

    public async Task<PagedApiResponse<UnitModel>> GetAllPagedAsync(int pageNumber, int pageSize)
    {
        var units = await _context.Units!.Where(e => !e.IsDeleted).ToListAsync();

        var mappedUnits = _mapper.Map<List<UnitModel>>(units);

        return new Pagination().HandleGetAllRespond(
            pageNumber,
            pageSize,
            mappedUnits,
            units.Count
        );
    }

    public async Task<PagedApiResponse<UnitModel>> GetByIdAsync(Guid id)
    {
        var units = await _context.Units!.FindAsync(id);

        var mappedUnit = _mapper.Map<UnitModel>(units);

        return new Pagination().HandleGetByIdRespond(mappedUnit);
    }

    public async Task<PagedApiResponse<UnitModel>> InsertAsync(UnitModel model)
    {
        using var transaction = await _context.Database.BeginTransactionAsync();

        try
        {
            var unit = new Unit
            {
                Id = Guid.NewGuid(),
                UnitName = model.UnitName,
                ParentId = model.ParentId ?? null,
                IsDeleted = false,
                UpdatedAt = DateTime.UtcNow
            };

            await _context.Units!.AddAsync(unit);
            await _context.SaveChangesAsync();

            await transaction.CommitAsync();

            return new ApiResult().Success<UnitModel>("Thêm mới thành công");
        }
        catch (Exception ex)
        {
            await transaction.RollbackAsync();

            return new ApiResult().Failure<UnitModel>($"Lỗi khi thêm mới: {ex.Message}");
        }
    }

    public async Task<PagedApiResponse<UnitModel>> RemoveRangeAsync(List<Guid> ids)
    {
        using var transaction = await _context.Database.BeginTransactionAsync();

        try
        {
            var unitsToRemove = await _context.Units!
                .Where(u => ids.Contains(u.Id) && !u.IsDeleted)
                .ToListAsync();

            if (!unitsToRemove.Any())
            {
                return new ApiResult().Failure<UnitModel>("Không tìm thấy đơn vị nào để xóa.");
            }

            foreach (var unit in unitsToRemove)
            {
                unit.IsDeleted = true;
                unit.UpdatedAt = DateTime.UtcNow;
            }

            await _context.SaveChangesAsync();
            await transaction.CommitAsync();

            return new ApiResult().Success<UnitModel>("Xóa đơn vị thành công.");
        }
        catch (Exception ex)
        {
            await transaction.RollbackAsync();
            return new ApiResult().Failure<UnitModel>($"Lỗi khi xóa đơn vị: {ex.Message}");
        }
    }


    public async Task<PagedApiResponse<UnitModel>> UpdateAsync(UnitModel model)
    {
        using var transaction = await _context.Database.BeginTransactionAsync();

        try
        {
            var unitToUpdate = await _context.Units!.FindAsync(model.Id);

            if (unitToUpdate == null || unitToUpdate.IsDeleted)
            {
                return new ApiResult().Failure<UnitModel>("Đơn vị không tồn tại hoặc đã bị xóa.");
            }

            // Cập nhật thông tin
            unitToUpdate.UnitName = model.UnitName;
            unitToUpdate.ParentId = model.ParentId;
            unitToUpdate.UpdatedAt = DateTime.UtcNow;

            await _context.SaveChangesAsync();
            await transaction.CommitAsync();

            return new ApiResult().Success<UnitModel>("Cập nhật thành công.");
        }
        catch (Exception ex)
        {
            await transaction.RollbackAsync();
            return new ApiResult().Failure<UnitModel>($"Lỗi khi cập nhật: {ex.Message}");
        }
    }

}

