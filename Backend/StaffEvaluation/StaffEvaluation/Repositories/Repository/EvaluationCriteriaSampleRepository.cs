using AutoMapper;
using Microsoft.EntityFrameworkCore;
using StaffEvaluation.Data;
using StaffEvaluation.Data.Entity;
using StaffEvaluation.Helpers;
using StaffEvaluation.Models;
using StaffEvaluation.Models.Payload;
using StaffEvaluation.Repositories.IRepository;

namespace StaffEvaluation.Repositories.Repository;

public class EvaluationCriteriaSampleRepository : IEvaluationCriteriaSampleRepository
{

    private DataContext _context;
    private IMapper _mapper;

    public EvaluationCriteriaSampleRepository(DataContext context, IMapper mapper)
    {
        _context = context;
        _mapper = mapper;
    }

    public Task<PagedApiResponse<EvaluationCriteriaSampleModel>> GetAllPagedAsync(int pageNumber, int pageSize)
    {
        throw new NotImplementedException();
    }

    public async Task<PagedApiResponse<EvaluationCriteriaSampleModel>> GetByIdAsync(Guid id)
    {
        var evaluationCriterias = await (from ec in _context.EvaluationCriteriaSamples
                                         join cc in _context.CategoryCriterias on ec.CategoryCriteriaId equals cc.Id into ccGroup
                                         from cc in ccGroup.DefaultIfEmpty()
                                         where !ec.IsDeleted && ec.EvaluationSampleId == id
                                         select new EvaluationCriteriaSampleModel
                                         {
                                             Id = ec.Id,
                                             EvaluationSampleId = id,
                                             CategoryCriteriaId = cc.Id,
                                             Sort = ec.Sort,
                                             IsDeleted = ec.IsDeleted,
                                             UpdatedAt = ec.UpdatedAt,
                                         }).OrderBy(e => e.Sort).ToListAsync();

        return new Pagination().HandleGetAllRespond(0, 0, evaluationCriterias, evaluationCriterias.Count);
    }

    public async Task<PagedApiResponse<CategoryCriteriaModel>> GetListCriteriaByIdEvaluationSample(Guid evaluationSampleId)
    {
        var evaluationCriterias = await (from ec in _context.EvaluationCriteriaSamples
                                         join cc in _context.CategoryCriterias on ec.CategoryCriteriaId equals cc.Id into ccGroup
                                         from cc in ccGroup.DefaultIfEmpty()
                                         join cr in _context.CategoryRatings on cc.CategoryRatingId equals cr.Id into crGroup
                                         from cr in crGroup.DefaultIfEmpty()
                                         where !ec.IsDeleted &&
                                               !cc.IsDeleted &&
                                                ec.EvaluationSampleId == evaluationSampleId
                                         orderby ec.Sort
                                         select new CategoryCriteriaModel
                                         {
                                             Id = cc.Id,
                                             ParentId = cc.ParentId,
                                             CategoryRatingId = cr != null ? cr.Id : null,
                                             StartValue = cr != null ? cr.StartValue : null,
                                             EndValue = cr != null ? cr.EndValue : null,
                                             RatingName = cr != null ? cr.RatingName : null,
                                             CriteriaName = cc.CriteriaName,
                                             IsDistinct = cc.IsDistinct,
                                             IsDeleted = cc.IsDeleted,
                                             UpdatedAt = cc.UpdatedAt,
                                         }).ToListAsync();


        return new Pagination().HandleGetAllRespond(0, 0, evaluationCriterias, evaluationCriterias.Count);
    }

    public Task<PagedApiResponse<EvaluationCriteriaSampleModel>> InsertAsync(EvaluationCriteriaSampleModel entity)
    {
        throw new NotImplementedException();
    }

    public async Task<PagedApiResponse<EvaluationCriteriaSampleModel>> InsertCustomAsync(EvaluationCriteriaSampleAddPayload entity)
    {


        var evaluationSample = await _context.EvaluationSamples
            .Where(e => e.Id == entity.EvaluationSampleId && !e.IsDeleted)
            .FirstOrDefaultAsync();

        if (evaluationSample == null)
        {
            return new ApiResult().Failure<EvaluationCriteriaSampleModel>("Không tìm thấy mẫu phiếu đánh giá hoặc mẫu phiếu đánh giá đã bị xóa.");
        }

        using var transaction = await _context.Database.BeginTransactionAsync();

        try
        {
            var evaluationCriteriaToUpdate = await _context.EvaluationCriteriaSamples.Where(ec => ec.EvaluationSampleId == entity.EvaluationSampleId).ToListAsync();

            _context.RemoveRange(evaluationCriteriaToUpdate);

            await _context.SaveChangesAsync();

            if (entity.ListCategoryCriteriaId != null)
            {
                foreach (var categoryCriteriaId in entity.ListCategoryCriteriaId)
                {
                    EvaluationCriteriaSample ecs = new EvaluationCriteriaSample()
                    {
                        Id = Guid.NewGuid(),
                        EvaluationSampleId = evaluationSample.Id,
                        CategoryCriteriaId = categoryCriteriaId,
                        Sort = 1,
                        IsDeleted = false,
                        UpdatedAt = DateTime.Now,
                    };

                    await _context.AddAsync(ecs);

                    await _context.SaveChangesAsync();
                }

            }

            await _context.SaveChangesAsync();

            await transaction.CommitAsync();

            return new ApiResult().Success<EvaluationCriteriaSampleModel>("Thao tác thêm tiêu chí vào mẫu phiếu đánh giá thành công.");
        }
        catch (Exception ex)
        {
            await transaction.RollbackAsync();

            return new ApiResult().Failure<EvaluationCriteriaSampleModel>($"Lỗi khi thao tác thêm tiêu chí vào mẫu phiếu đánh giá: {ex.Message}");
        }
    }

    public Task<PagedApiResponse<EvaluationCriteriaSampleModel>> RemoveRangeAsync(List<Guid> ids)
    {
        throw new NotImplementedException();
    }

    public Task<PagedApiResponse<EvaluationCriteriaSampleModel>> UpdateAsync(EvaluationCriteriaSampleModel entity)
    {
        throw new NotImplementedException();
    }

    public async Task<PagedApiResponse<EvaluationCriteriaSampleModel>> UpdateSortListAsync(EvaluationCriteriaSampleUpdateSortPayload model)
    {
        using var transaction = await _context.Database.BeginTransactionAsync();

        try
        {
            foreach (var item in model.ListCategoryCriterias!)
            {
                var evaluationCriteriaToUpdate = await _context.EvaluationCriteriaSamples.Where(e => e.EvaluationSampleId == model.EvaluationSampleId && e.CategoryCriteriaId == item.CategoryCriteriaId).SingleOrDefaultAsync();

                if (evaluationCriteriaToUpdate != null)
                {
                    evaluationCriteriaToUpdate.Sort = item.Sort;

                    evaluationCriteriaToUpdate.UpdatedAt = DateTime.Now;

                    await _context.SaveChangesAsync();
                }

            }

            await transaction.CommitAsync();

            return new ApiResult().Success<EvaluationCriteriaSampleModel>("Cập nhật thứ tự cho các tiêu chí thành công.");
        }
        catch (Exception ex)
        {
            await transaction.RollbackAsync();

            return new ApiResult().Failure<EvaluationCriteriaSampleModel>($"Lỗi khi cập nhật thứ tự cho các tiêu chí: {ex.Message}");
        }
    }
}

