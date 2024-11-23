using AutoMapper;
using Microsoft.EntityFrameworkCore;
using StaffEvaluation.Data;
using StaffEvaluation.Data.Entity;
using StaffEvaluation.Helpers;
using StaffEvaluation.Models;
using StaffEvaluation.Repositories.IRepository;

namespace StaffEvaluation.Repositories.Repository;

public class CategoryTimeTypeRepository : ICategoryTimeTypeRepository
{
    private readonly DataContext _context;
    private readonly IMapper _mapper;
    private readonly IUnitRepository _unitRepository;

    public CategoryTimeTypeRepository(DataContext context, IMapper mapper, IUnitRepository unitRepository)
    {
        _context = context;
        _mapper = mapper;
        _unitRepository = unitRepository;
    }

    public async Task<PagedApiResponse<CategoryTimeTypeModel>> GetAllPagedAsync(int pageNumber, int pageSize)
    {
        var timeTypes = await (from ctt in _context.CategoryTimeTypes
                               join unit in _context.Units! on ctt.UnitId equals unit.Id
                               where !ctt.IsDeleted
                               select new CategoryTimeTypeModel
                               {
                                   Id = ctt.Id,
                                   UnitId = unit.Id,
                                   UnitName = unit.UnitName,
                                   TimeTypeName = ctt.TimeTypeName,
                                   FromDate = ctt.FromDate,
                                   ToDate = ctt.ToDate,
                                   IsDeleted = ctt.IsDeleted,
                                   UpdatedAt = ctt.UpdatedAt
                               }).OrderByDescending(e => e.UpdatedAt).ToListAsync();

        return new Pagination().HandleGetAllRespond(
            pageNumber,
            pageSize,
            timeTypes,
            timeTypes.Count
        );
    }

    public async Task<PagedApiResponse<CategoryTimeTypeModel>> GetAllOfUnit(Guid unitCurrentId)
    {
        var units = await _unitRepository.GetAllChildOfUnitAsync(unitCurrentId);

        List<Guid> unitIds = units.DataList!.Select(e => e.Id).ToList();

        var timeTypes = await (from ctt in _context.CategoryTimeTypes
                               join unit in _context.Units! on ctt.UnitId equals unit.Id
                               where !ctt.IsDeleted && unitIds.Contains(ctt.UnitId)
                               select new CategoryTimeTypeModel
                               {
                                   Id = ctt.Id,
                                   UnitId = unit.Id,
                                   UnitName = unit.UnitName,
                                   TimeTypeName = ctt.TimeTypeName,
                                   FromDate = ctt.FromDate,
                                   ToDate = ctt.ToDate,
                                   IsDeleted = ctt.IsDeleted,
                                   UpdatedAt = ctt.UpdatedAt
                               }).OrderByDescending(e => e.ToDate).ThenBy(e => e.UnitName).ThenBy(e => e.TimeTypeName).ToListAsync();

        return new Pagination().HandleGetAllRespond(
            0,
            0,
            timeTypes,
            timeTypes.Count
        );
    }



    public async Task<PagedApiResponse<CategoryTimeTypeModel>> GetByIdAsync(Guid id)
    {
        var timeType = await (from ctt in _context.CategoryTimeTypes
                              join unit in _context.Units! on ctt.UnitId equals unit.Id
                              where ctt.Id == id && !ctt.IsDeleted
                              select new CategoryTimeTypeModel
                              {
                                  Id = ctt.Id,
                                  UnitId = unit.Id,
                                  UnitName = unit.UnitName,
                                  TimeTypeName = ctt.TimeTypeName,
                                  FromDate = ctt.FromDate,
                                  ToDate = ctt.ToDate,
                                  IsDeleted = ctt.IsDeleted,
                                  UpdatedAt = ctt.UpdatedAt
                              }).SingleOrDefaultAsync();

        if (timeType == null)
        {
            return new ApiResult().Failure<CategoryTimeTypeModel>("Không tìm thấy dữ liệu hoặc đã bị xóa.");
        }

        return new Pagination().HandleGetByIdRespond(timeType);
    }


    public async Task<PagedApiResponse<CategoryTimeTypeModel>> InsertAsync(CategoryTimeTypeModel entity)
    {
        if (entity.FromDate > entity.ToDate)
        {
            return new ApiResult().Failure<CategoryTimeTypeModel>("Ngày bắt đầu không được sau ngày kết thúc.");
        }

        using var transaction = await _context.Database.BeginTransactionAsync();

        try
        {
            var timeType = new CategoryTimeType
            {
                Id = Guid.NewGuid(),
                UnitId = entity.UnitId,
                TimeTypeName = entity.TimeTypeName,
                FromDate = entity.FromDate,
                ToDate = entity.ToDate,
                IsDeleted = false,
                UpdatedAt = DateTime.Now
            };

            await _context.CategoryTimeTypes.AddAsync(timeType);
            await _context.SaveChangesAsync();
            await transaction.CommitAsync();

            return new ApiResult().Success<CategoryTimeTypeModel>("Thêm mới kỳ đánh giá thành công");
        }
        catch (Exception ex)
        {
            await transaction.RollbackAsync();
            return new ApiResult().Failure<CategoryTimeTypeModel>($"Lỗi khi thêm mới kỳ đánh giá: {ex.Message}");
        }
    }

    public async Task<PagedApiResponse<CategoryTimeTypeModel>> RemoveRangeAsync(List<Guid> ids)
    {
        using var transaction = await _context.Database.BeginTransactionAsync();

        try
        {
            var timeTypesToRemove = await _context.CategoryTimeTypes
                .Where(ctt => ids.Contains(ctt.Id) && !ctt.IsDeleted)
                .ToListAsync();

            if (!timeTypesToRemove.Any())
            {
                return new ApiResult().Failure<CategoryTimeTypeModel>("Không tìm thấy dữ liệu nào để xóa.");
            }

            foreach (var timeType in timeTypesToRemove)
            {
                timeType.IsDeleted = true;
                timeType.UpdatedAt = DateTime.Now;
            }

            await _context.SaveChangesAsync();
            await transaction.CommitAsync();

            return new ApiResult().Success<CategoryTimeTypeModel>("Xóa kỳ đánh giá thành công.");
        }
        catch (Exception ex)
        {
            await transaction.RollbackAsync();
            return new ApiResult().Failure<CategoryTimeTypeModel>($"Lỗi khi xóa kỳ đánh giá: {ex.Message}");
        }
    }

    public async Task<PagedApiResponse<CategoryTimeTypeModel>> UpdateAsync(CategoryTimeTypeModel entity)
    {
        if (entity.Id == Guid.Empty)
        {
            return new ApiResult().Failure<CategoryTimeTypeModel>("ID không hợp lệ.");
        }

        if (entity.FromDate > entity.ToDate)
        {
            return new ApiResult().Failure<CategoryTimeTypeModel>("Ngày bắt đầu không được sau ngày kết thúc.");
        }


        using var transaction = await _context.Database.BeginTransactionAsync();

        try
        {
            var timeTypeToUpdate = await _context.CategoryTimeTypes.FindAsync(entity.Id);

            if (timeTypeToUpdate == null || timeTypeToUpdate.IsDeleted)
            {
                return new ApiResult().Failure<CategoryTimeTypeModel>("Dữ liệu không tồn tại hoặc đã bị xóa.");
            }

            timeTypeToUpdate.TimeTypeName = entity.TimeTypeName;
            timeTypeToUpdate.FromDate = entity.FromDate;
            timeTypeToUpdate.ToDate = entity.ToDate;
            timeTypeToUpdate.UpdatedAt = DateTime.Now;

            await _context.SaveChangesAsync();
            await transaction.CommitAsync();

            return new ApiResult().Success<CategoryTimeTypeModel>("Cập nhật kỳ đánh giá thành công.");
        }
        catch (Exception ex)
        {
            await transaction.RollbackAsync();
            return new ApiResult().Failure<CategoryTimeTypeModel>($"Lỗi khi cập nhật kỳ đánh giá: {ex.Message}");
        }
    }
}

