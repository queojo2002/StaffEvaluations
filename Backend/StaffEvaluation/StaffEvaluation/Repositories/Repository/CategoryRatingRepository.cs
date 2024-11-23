using AutoMapper;
using Microsoft.EntityFrameworkCore;
using StaffEvaluation.Data;
using StaffEvaluation.Data.Entity;
using StaffEvaluation.Helpers;
using StaffEvaluation.Models;
using StaffEvaluation.Repositories.IRepository;

namespace StaffEvaluation.Repositories.Repository;

public class CategoryRatingRepository : ICategoryRatingRepository
{
    private DataContext _context;
    private IMapper _mapper;
    private IUnitRepository _unitRepository;
    public CategoryRatingRepository(DataContext context, IMapper mapper, IUnitRepository unitRepository)
    {
        _context = context;
        _mapper = mapper;
        _unitRepository = unitRepository;
    }

    public async Task<PagedApiResponse<CategoryRatingModel>> GetAllPagedAsync(int pageNumber, int pageSize)
    {
        var ratings = await (from cr in _context.CategoryRatings
                             join unit in _context.Units! on cr.UnitId equals unit.Id
                             where !cr.IsDeleted
                             select new CategoryRatingModel
                             {
                                 Id = cr.Id,
                                 UnitId = unit.Id,
                                 UnitName = unit.UnitName,
                                 RatingName = cr.RatingName,
                                 StartValue = cr.StartValue,
                                 EndValue = cr.EndValue,
                                 IsDeleted = cr.IsDeleted,
                                 UpdatedAt = cr.UpdatedAt
                             }).ToListAsync();

        return new Pagination().HandleGetAllRespond(
            pageNumber,
            pageSize,
            ratings,
            ratings.Count
        );
    }

    public async Task<PagedApiResponse<CategoryRatingModel>> GetAllOfUnit(Guid unitCurrentId)
    {
        var units = await _unitRepository.GetAllChildOfUnitAsync(unitCurrentId);

        List<Guid> unitIds = units.DataList!.Select(e => e.Id).ToList();


        var ratings = await (from cr in _context.CategoryRatings
                             join unit in _context.Units! on cr.UnitId equals unit.Id
                             where !cr.IsDeleted && unitIds.Contains(cr.UnitId)
                             select new CategoryRatingModel
                             {
                                 Id = cr.Id,
                                 UnitId = unit.Id,
                                 UnitName = unit.UnitName,
                                 RatingName = cr.RatingName,
                                 StartValue = cr.StartValue,
                                 EndValue = cr.EndValue,
                                 IsDeleted = cr.IsDeleted,
                                 UpdatedAt = cr.UpdatedAt
                             }).OrderBy(e => e.UnitName).ThenBy(e => e.EndValue).ThenBy(e => e.RatingName).ToListAsync();

        return new Pagination().HandleGetAllRespond(
            0,
            0,
            ratings,
            ratings.Count
        );
    }


    public async Task<PagedApiResponse<CategoryRatingModel>> GetByIdAsync(Guid id)
    {
        var rating = await (from cr in _context.CategoryRatings
                            join unit in _context.Units! on cr.UnitId equals unit.Id
                            where !cr.IsDeleted && cr.Id == id
                            select new CategoryRatingModel
                            {
                                Id = cr.Id,
                                UnitId = unit.Id,
                                UnitName = unit.UnitName,
                                RatingName = cr.RatingName,
                                StartValue = cr.StartValue,
                                EndValue = cr.EndValue,
                                IsDeleted = cr.IsDeleted,
                                UpdatedAt = cr.UpdatedAt
                            }).SingleOrDefaultAsync();

        if (rating == null || rating.IsDeleted)
        {
            return new ApiResult().Failure<CategoryRatingModel>("Không tìm thấy đánh giá hoặc đánh giá đã bị xóa.");
        }

        var mappedRating = _mapper.Map<CategoryRatingModel>(rating);

        return new Pagination().HandleGetByIdRespond(mappedRating);
    }

    public async Task<PagedApiResponse<CategoryRatingModel>> InsertAsync(CategoryRatingModel entity)
    {
        using var transaction = await _context.Database.BeginTransactionAsync();

        try
        {
            var categoryRating = new CategoryRating
            {
                Id = Guid.NewGuid(),
                UnitId = entity.UnitId,
                RatingName = entity.RatingName,
                StartValue = entity.StartValue,
                EndValue = entity.EndValue,
                IsDeleted = false,
                UpdatedAt = DateTime.Now
            };

            await _context.CategoryRatings!.AddAsync(categoryRating);
            await _context.SaveChangesAsync();

            await transaction.CommitAsync();

            return new ApiResult().Success<CategoryRatingModel>("Thêm mới thang điểm thành công.");
        }
        catch (Exception ex)
        {
            await transaction.RollbackAsync();
            return new ApiResult().Failure<CategoryRatingModel>($"Lỗi khi thêm mới thang điểm: {ex.Message}");
        }
    }

    public async Task<PagedApiResponse<CategoryRatingModel>> RemoveRangeAsync(List<Guid> ids)
    {
        using var transaction = await _context.Database.BeginTransactionAsync();

        try
        {
            var ratingsToRemove = await _context.CategoryRatings!
                .Where(cr => ids.Contains(cr.Id) && !cr.IsDeleted)
                .ToListAsync();

            if (!ratingsToRemove.Any())
            {
                return new ApiResult().Failure<CategoryRatingModel>("Không tìm thấy đánh giá nào để xóa.");
            }

            foreach (var rating in ratingsToRemove)
            {
                rating.IsDeleted = true;
                rating.UpdatedAt = DateTime.Now;
            }

            await _context.SaveChangesAsync();
            await transaction.CommitAsync();

            return new ApiResult().Success<CategoryRatingModel>("Xóa thành công các thang điểm.");
        }
        catch (Exception ex)
        {
            await transaction.RollbackAsync();
            return new ApiResult().Failure<CategoryRatingModel>($"Lỗi khi xóa thang điểm: {ex.Message}");
        }
    }

    public async Task<PagedApiResponse<CategoryRatingModel>> UpdateAsync(CategoryRatingModel entity)
    {
        if (entity.Id == Guid.Empty)
        {
            return new ApiResult().Failure<CategoryRatingModel>("ID thang điểm không hợp lệ.");
        }

        using var transaction = await _context.Database.BeginTransactionAsync();

        try
        {
            var ratingToUpdate = await _context.CategoryRatings!.FindAsync(entity.Id);

            if (ratingToUpdate == null || ratingToUpdate.IsDeleted)
            {
                return new ApiResult().Failure<CategoryRatingModel>("Thang điểm không tồn tại hoặc đã bị xóa.");
            }

            ratingToUpdate.UnitId = entity.UnitId;
            ratingToUpdate.RatingName = entity.RatingName;
            ratingToUpdate.StartValue = entity.StartValue;
            ratingToUpdate.EndValue = entity.EndValue;
            ratingToUpdate.UpdatedAt = DateTime.Now;

            await _context.SaveChangesAsync();
            await transaction.CommitAsync();

            return new ApiResult().Success<CategoryRatingModel>("Cập nhật thang điểm thành công.");
        }
        catch (Exception ex)
        {
            await transaction.RollbackAsync();
            return new ApiResult().Failure<CategoryRatingModel>($"Lỗi khi cập nhật thang điểm: {ex.Message}");
        }
    }
}

