using AutoMapper;
using Microsoft.EntityFrameworkCore;
using StaffEvaluation.Data;
using StaffEvaluation.Data.Entity;
using StaffEvaluation.Helpers;
using StaffEvaluation.Models;
using StaffEvaluation.Repositories.IRepository;

namespace StaffEvaluation.Repositories.Repository;

public class CategoryCriteriaRepository : ICategoryCriteriaRepository
{
    private readonly DataContext _context;
    private readonly IMapper _mapper;
    private readonly IUnitRepository _unitRepository;
    public CategoryCriteriaRepository(DataContext context, IMapper mapper, IUnitRepository unitRepository)
    {
        _context = context;
        _mapper = mapper;
        _unitRepository = unitRepository;
    }

    public async Task<PagedApiResponse<CategoryCriteriaModel>> GetAllPagedAsync(int pageNumber, int pageSize)
    {
        var criteria = await (from cc in _context.CategoryCriterias
                              join u in _context.Units! on cc.UnitId equals u.Id
                              join cr in _context.CategoryRatings on cc.CategoryRatingId equals cr.Id into crGroup
                              from cr in crGroup.DefaultIfEmpty()
                              where !u.IsDeleted && !cc.IsDeleted
                              select new CategoryCriteriaModel
                              {
                                  Id = cc.Id,
                                  ParentId = cc.ParentId,
                                  CategoryRatingId = cr != null ? cr.Id : null,
                                  StartValue = cr.StartValue,
                                  EndValue = cr.EndValue,
                                  RatingName = cr.RatingName ?? null,
                                  UnitId = u.Id,
                                  UnitName = u.UnitName,
                                  CriteriaName = cc.CriteriaName,
                                  IsDistinct = cc.IsDistinct,
                                  IsDeleted = cc.IsDeleted,
                                  UpdatedAt = cc.UpdatedAt,
                              }).OrderByDescending(e => e.UpdatedAt).ToListAsync();


        return new Pagination().HandleGetAllRespond(pageNumber, pageSize, criteria, criteria.Count);
    }

    public async Task<PagedApiResponse<CategoryCriteriaModel>> GetAllOfUnit(Guid unitCurrentId)
    {
        var units = await _unitRepository.GetAllChildOfUnitAsync(unitCurrentId);

        List<Guid> unitIds = units.DataList!.Select(e => e.Id).ToList();

        var criteria = await (from cc in _context.CategoryCriterias
                              join u in _context.Units! on cc.UnitId equals u.Id
                              join cr in _context.CategoryRatings on cc.CategoryRatingId equals cr.Id into crGroup
                              from cr in crGroup.DefaultIfEmpty()
                              where !u.IsDeleted && !cc.IsDeleted && unitIds.Contains(cc.UnitId)
                              select new CategoryCriteriaModel
                              {
                                  Id = cc.Id,
                                  ParentId = cc.ParentId,
                                  CategoryRatingId = cr != null ? cr.Id : null,
                                  StartValue = cr.StartValue,
                                  EndValue = cr.EndValue,
                                  RatingName = cr.RatingName ?? null,
                                  UnitId = u.Id,
                                  UnitName = u.UnitName,
                                  CriteriaName = cc.CriteriaName,
                                  IsDistinct = cc.IsDistinct,
                                  IsDeleted = cc.IsDeleted,
                                  UpdatedAt = cc.UpdatedAt,
                              }).OrderBy(e => e.UnitName).ThenBy(e => e.CriteriaName).ToListAsync();


        return new Pagination().HandleGetAllRespond(0, 0, criteria, criteria.Count);
    }

    public async Task<PagedApiResponse<CategoryCriteriaModel>> GetByIdAsync(Guid id)
    {
        var criterion = await (from cc in _context.CategoryCriterias
                               join u in _context.Units! on cc.UnitId equals u.Id
                               join cr in _context.CategoryRatings on cc.CategoryRatingId equals cr.Id into crGroup
                               from cr in crGroup.DefaultIfEmpty()
                               where !u.IsDeleted && !cc.IsDeleted && cc.Id == id
                               select new CategoryCriteriaModel
                               {
                                   Id = cc.Id,
                                   ParentId = cc.ParentId,
                                   CategoryRatingId = cr != null ? cr.Id : null,
                                   StartValue = cr.StartValue,
                                   EndValue = cr.EndValue,
                                   RatingName = cr.RatingName ?? null,
                                   UnitId = u.Id,
                                   UnitName = u.UnitName,
                                   CriteriaName = cc.CriteriaName,
                                   IsDistinct = cc.IsDistinct,
                                   IsDeleted = cc.IsDeleted,
                                   UpdatedAt = cc.UpdatedAt,
                               }).SingleOrDefaultAsync();

        if (criterion == null)
        {
            return new ApiResult().Failure<CategoryCriteriaModel>("Không tìm thấy tiêu chí hoặc tiêu chí đã bị xóa.");
        }

        return new Pagination().HandleGetByIdRespond(criterion);
    }

    public async Task<PagedApiResponse<CategoryCriteriaModel>> InsertAsync(CategoryCriteriaModel model)
    {
        using var transaction = await _context.Database.BeginTransactionAsync();

        try
        {
            if (model.Id == Guid.Empty)
            {
                model.Id = Guid.NewGuid();
            }

            var newCriterion = new CategoryCriteria
            {
                Id = model.Id,
                ParentId = model.ParentId,
                CategoryRatingId = model.CategoryRatingId,
                UnitId = model.UnitId,
                CriteriaName = model.CriteriaName,
                IsDistinct = model.IsDistinct,
                IsDeleted = false,
                UpdatedAt = DateTime.Now
            };

            await _context.CategoryCriterias.AddAsync(newCriterion);
            await _context.SaveChangesAsync();
            await transaction.CommitAsync();

            return new ApiResult().Success<CategoryCriteriaModel>("Thêm mới tiêu chí thành công.");
        }
        catch (Exception ex)
        {
            await transaction.RollbackAsync();

            return new ApiResult().Failure<CategoryCriteriaModel>($"Lỗi khi thêm tiêu chí: {ex.Message}");
        }
    }

    public async Task<PagedApiResponse<CategoryCriteriaModel>> UpdateAsync(CategoryCriteriaModel model)
    {
        using var transaction = await _context.Database.BeginTransactionAsync();

        try
        {
            var criterionToUpdate = await _context.CategoryCriterias.FindAsync(model.Id);

            if (criterionToUpdate == null || criterionToUpdate.IsDeleted)
            {
                return new ApiResult().Failure<CategoryCriteriaModel>("Không tìm thấy tiêu chí hoặc tiêu chí đã bị xóa.");
            }

            criterionToUpdate.CriteriaName = model.CriteriaName;
            criterionToUpdate.ParentId = model.ParentId;
            criterionToUpdate.IsDistinct = model.IsDistinct;
            criterionToUpdate.UnitId = model.UnitId;
            criterionToUpdate.CategoryRatingId = model.CategoryRatingId;
            criterionToUpdate.UpdatedAt = DateTime.Now;

            await _context.SaveChangesAsync();
            await transaction.CommitAsync();

            return new ApiResult().Success<CategoryCriteriaModel>("Cập nhật tiêu chí thành công.");
        }
        catch (Exception ex)
        {
            await transaction.RollbackAsync();

            return new ApiResult().Failure<CategoryCriteriaModel>($"Lỗi khi cập nhật tiêu chí: {ex.Message}");
        }
    }

    public async Task<PagedApiResponse<CategoryCriteriaModel>> RemoveRangeAsync(List<Guid> ids)
    {
        using var transaction = await _context.Database.BeginTransactionAsync();

        try
        {
            var criteriaToDelete = await _context.CategoryCriterias
                .Where(c => ids.Contains(c.Id) && !c.IsDeleted)
                .ToListAsync();

            if (!criteriaToDelete.Any())
            {
                return new ApiResult().Failure<CategoryCriteriaModel>("Không tìm thấy tiêu chí nào để xóa.");
            }

            foreach (var criterion in criteriaToDelete)
            {
                criterion.IsDeleted = true;
                criterion.UpdatedAt = DateTime.Now;
            }

            await _context.SaveChangesAsync();
            await transaction.CommitAsync();

            return new ApiResult().Success<CategoryCriteriaModel>("Xóa thành công các tiêu chí.");
        }
        catch (Exception ex)
        {
            await transaction.RollbackAsync();

            return new ApiResult().Failure<CategoryCriteriaModel>($"Lỗi khi xóa tiêu chí: {ex.Message}");
        }
    }

}

