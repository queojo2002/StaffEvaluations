using AutoMapper;
using Microsoft.EntityFrameworkCore;
using StaffEvaluation.Data;
using StaffEvaluation.Data.Entity;
using StaffEvaluation.Helpers;
using StaffEvaluation.Models;
using StaffEvaluation.Models.Payload;
using StaffEvaluation.Repositories.IRepository;

namespace StaffEvaluation.Repositories.Repository;

public class EvaluationCriteriaRepository : IEvaluationCriteriaRepository
{
    private DataContext _context;
    private IMapper _mapper;

    public EvaluationCriteriaRepository(DataContext context, IMapper mapper)
    {
        _context = context;
        _mapper = mapper;
    }

    public Task<PagedApiResponse<EvaluationCriteriaModel>> GetAllPagedAsync(int pageNumber, int pageSize)
    {
        throw new NotImplementedException();
    }

    public async Task<PagedApiResponse<EvaluationCriteriaModel>> GetByIdAsync(Guid id)
    {
        var evaluationCriterias = await (from ec in _context.EvaluationCriterias
                                         join cc in _context.CategoryCriterias on ec.CategoryCriteriaId equals cc.Id into ccGroup
                                         from cc in ccGroup.DefaultIfEmpty()
                                         where !ec.IsDeleted && ec.EvaluationId == id
                                         select new EvaluationCriteriaModel
                                         {
                                             Id = ec.Id,
                                             EvaluationId = id,
                                             CategoryCriteriaId = cc.Id,
                                             Sort = ec.Sort,
                                             IsDeleted = ec.IsDeleted,
                                             UpdatedAt = ec.UpdatedAt,
                                         }).OrderBy(e => e.Sort).ToListAsync();

        return new Pagination().HandleGetAllRespond(0, 0, evaluationCriterias, evaluationCriterias.Count);
    }

    public async Task<PagedApiResponse<CategoryCriteriaModel>> GetListCriteriaByIdEvaluation(Guid idEvaluation)
    {
        var evaluationCriterias = await (from ec in _context.EvaluationCriterias
                                         join cc in _context.CategoryCriterias on ec.CategoryCriteriaId equals cc.Id into ccGroup
                                         from cc in ccGroup.DefaultIfEmpty()
                                         join u in _context.Units! on cc.UnitId equals u.Id into uGroup
                                         from u in uGroup.DefaultIfEmpty()
                                         join cr in _context.CategoryRatings on cc.CategoryRatingId equals cr.Id into crGroup
                                         from cr in crGroup.DefaultIfEmpty()
                                         where !ec.IsDeleted &&
                                               !cc.IsDeleted &&
                                               !u.IsDeleted &&
                                                ec.EvaluationId == idEvaluation
                                         orderby ec.Sort
                                         select new CategoryCriteriaModel
                                         {
                                             Id = cc.Id,
                                             ParentId = cc.ParentId,
                                             CategoryRatingId = cr != null ? cr.Id : null,
                                             StartValue = cr != null ? cr.StartValue : null,
                                             EndValue = cr != null ? cr.EndValue : null,
                                             RatingName = cr != null ? cr.RatingName : null,
                                             UnitId = u.Id,
                                             UnitName = u.UnitName,
                                             CriteriaName = cc.CriteriaName,
                                             IsDistinct = cc.IsDistinct,
                                             IsDeleted = cc.IsDeleted,
                                             UpdatedAt = cc.UpdatedAt,
                                         }).ToListAsync();


        return new Pagination().HandleGetAllRespond(0, 0, evaluationCriterias, evaluationCriterias.Count);
    }

    public async Task<PagedApiResponse<CategoryCriteriaModel>> UpdateSortListAsync(EvaluationCriteriaUpdateSortPayload model)
    {
        using var transaction = await _context.Database.BeginTransactionAsync();

        try
        {

            foreach (var item in model.ListCategoryCriterias!)
            {
                var evaluationCriteriaToUpdate = await _context.EvaluationCriterias.Where(e => e.EvaluationId == model.EvaluationId && e.CategoryCriteriaId == item.CategoryCriteriaId).SingleOrDefaultAsync();

                if (evaluationCriteriaToUpdate != null)
                {
                    evaluationCriteriaToUpdate.Sort = item.Sort;

                    evaluationCriteriaToUpdate.UpdatedAt = DateTime.Now;

                    await _context.SaveChangesAsync();
                }

            }

            await transaction.CommitAsync();

            return new ApiResult().Success<CategoryCriteriaModel>("Cập nhật thứ tự cho các tiêu chí thành công.");
        }
        catch (Exception ex)
        {
            await transaction.RollbackAsync();

            return new ApiResult().Failure<CategoryCriteriaModel>($"Lỗi khi cập nhật thứ tự cho các tiêu chí: {ex.Message}");
        }
    }


    public async Task<PagedApiResponse<EvaluationCriteriaModel>> InsertAndRemoveListAsync(EvaluationCriteriaAddPayload entity)
    {

        if (entity?.EvaluationIds == null || !entity.EvaluationIds.Any())
        {
            return new ApiResult().Failure<EvaluationCriteriaModel>("Danh sách ID phiếu đánh giá trống.");
        }

        var evaluations = await _context.Evaluations
            .Where(e => entity.EvaluationIds.Contains(e.Id) && !e.IsDeleted)
            .ToListAsync();

        if (evaluations.Count == 0)
        {
            return new ApiResult().Failure<EvaluationCriteriaModel>("Không tìm thấy phiếu đánh giá hoặc phiếu đánh giá đã bị xóa.");
        }


        using var transaction = await _context.Database.BeginTransactionAsync();

        try
        {
            var evaluationCriteriaToUpdate = await _context.EvaluationCriterias.Where(ec => entity.EvaluationIds.Contains(ec.EvaluationId) && ec.IsDeleted == false).ToListAsync();

            foreach (var evaluationCriterion in evaluationCriteriaToUpdate)
            {
                evaluationCriterion.IsDeleted = true;

                evaluationCriterion.UpdatedAt = DateTime.Now;
            }

            if (entity.ListCategoryCriteriaId != null)
            {
                foreach (var evaluationId in entity.EvaluationIds)
                {
                    foreach (var categoryCriteriaId in entity.ListCategoryCriteriaId)
                    {
                        EvaluationCriteria evaluationCriteria = new EvaluationCriteria()
                        {
                            Id = Guid.NewGuid(),
                            EvaluationId = evaluationId,
                            CategoryCriteriaId = categoryCriteriaId,
                            Sort = 1,
                            IsDeleted = false,
                            UpdatedAt = DateTime.Now,
                        };

                        await _context.AddAsync(evaluationCriteria);

                        await _context.SaveChangesAsync();
                    }
                }
            }

            await _context.SaveChangesAsync();

            await transaction.CommitAsync();

            return new ApiResult().Success<EvaluationCriteriaModel>("Thao tác thêm tiêu chí vào phiếu đánh giá thành công.");
        }
        catch (Exception ex)
        {
            await transaction.RollbackAsync();

            return new ApiResult().Failure<EvaluationCriteriaModel>($"Lỗi khi thao tác thêm tiêu chí vào phiếu đánh giá: {ex.Message}");
        }
    }

    public Task<PagedApiResponse<EvaluationCriteriaModel>> InsertAsync(EvaluationCriteriaModel entity)
    {
        throw new NotImplementedException();
    }

    public Task<PagedApiResponse<EvaluationCriteriaModel>> RemoveRangeAsync(List<Guid> ids)
    {
        throw new NotImplementedException();
    }

    public Task<PagedApiResponse<EvaluationCriteriaModel>> UpdateAsync(EvaluationCriteriaModel entity)
    {
        throw new NotImplementedException();
    }
}

