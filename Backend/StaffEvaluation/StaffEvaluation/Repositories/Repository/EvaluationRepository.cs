using AutoMapper;
using Microsoft.EntityFrameworkCore;
using StaffEvaluation.Data;
using StaffEvaluation.Data.Entity;
using StaffEvaluation.Helpers;
using StaffEvaluation.Models;
using StaffEvaluation.Models.Payload;
using StaffEvaluation.Repositories.IRepository;

namespace StaffEvaluation.Repositories.Repository;

public class EvaluationRepository : IEvaluationRepository
{
    private DataContext _context;
    private IMapper _mapper;

    public EvaluationRepository(DataContext context, IMapper mapper)
    {
        _context = context;
        _mapper = mapper;
    }

    public async Task<PagedApiResponse<EvaluationModel>> GetAllPagedAsync(int pageNumber, int pageSize)
    {
        var evaluations = await (from e in _context.Evaluations
                                 join u in _context.Units! on e.UnitId equals u.Id
                                 join ct in _context.CategoryTimeTypes on e.CategoryTimeTypeId equals ct.Id into ctGroup
                                 from ct in ctGroup.DefaultIfEmpty()
                                 where !u.IsDeleted && !e.IsDeleted
                                 select new EvaluationModel
                                 {
                                     Id = e.Id,
                                     UnitId = u.Id,
                                     UnitName = u.UnitName,
                                     CategoryTimeTypeId = ct.Id,
                                     FromDate = ct.FromDate,
                                     ToDate = ct.ToDate,
                                     EvaluationName = e.EvaluationName,
                                     Status = e.Status,
                                     IsDeleted = e.IsDeleted,
                                     UpdatedAt = e.UpdatedAt,
                                 }).OrderByDescending(e => e.UpdatedAt).ToListAsync();


        return new Pagination().HandleGetAllRespond(pageNumber, pageSize, evaluations, evaluations.Count);
    }

    public async Task<PagedApiResponse<EvaluationModel>> GetByIdAsync(Guid id)
    {
        var evaluation = await (from e in _context.Evaluations
                                join u in _context.Units! on e.UnitId equals u.Id
                                join ct in _context.CategoryTimeTypes on e.CategoryTimeTypeId equals ct.Id into ctGroup
                                from ct in ctGroup.DefaultIfEmpty()
                                where !u.IsDeleted && !e.IsDeleted && e.Id == id
                                select new EvaluationModel
                                {
                                    Id = e.Id,
                                    UnitId = u.Id,
                                    UnitName = u.UnitName,
                                    CategoryTimeTypeId = ct.Id,
                                    FromDate = ct.FromDate,
                                    ToDate = ct.ToDate,
                                    EvaluationName = e.EvaluationName,
                                    Status = e.Status,
                                    IsDeleted = e.IsDeleted,
                                    UpdatedAt = e.UpdatedAt,
                                }).SingleOrDefaultAsync();

        if (evaluation == null)
        {
            return new ApiResult().Failure<EvaluationModel>("Không tìm thấy phiếu đánh giá hoặc phiếu đánh giá đã bị xóa.");
        }

        return new Pagination().HandleGetByIdRespond(evaluation);
    }

    public async Task<PagedApiResponse<EvaluationModel>> UpdateAsync(EvaluationModel entity)
    {
        using var transaction = await _context.Database.BeginTransactionAsync();

        try
        {
            var evaluationToUpdate = await _context.Evaluations.FindAsync(entity.Id);

            if (evaluationToUpdate == null || evaluationToUpdate.IsDeleted)
            {
                return new ApiResult().Failure<EvaluationModel>("Không tìm thấy phiếu đánh giá hoặc phiếu đánh giá đã bị xóa.");
            }

            evaluationToUpdate.EvaluationName = entity.EvaluationName;
            evaluationToUpdate.UnitId = entity.UnitId;
            evaluationToUpdate.CategoryTimeTypeId = entity.CategoryTimeTypeId;
            evaluationToUpdate.UpdatedAt = DateTime.Now;

            await _context.SaveChangesAsync();
            await transaction.CommitAsync();

            return new ApiResult().Success<EvaluationModel>("Cập nhật phiếu đánh giá thành công.");
        }
        catch (Exception ex)
        {
            await transaction.RollbackAsync();

            return new ApiResult().Failure<EvaluationModel>($"Lỗi khi cập nhật phiếu đánh giá: {ex.Message}");
        }
    }

    public async Task<PagedApiResponse<EvaluationModel>> UpdateListAsync(EvaluationUpdatePayload entity)
    {

        if (entity.EvaluationIds == null)
        {
            return new ApiResult().Failure<EvaluationModel>("Danh sách phiếu đánh giá không được để trống.");
        }
        else if (entity.CategoryTimeTypeId == Guid.Empty)
        {
            return new ApiResult().Failure<EvaluationModel>("Vui lòng chọn kỳ đánh giá.");
        }



        using var transaction = await _context.Database.BeginTransactionAsync();

        try
        {
            var evaluationToUpdate = await _context.Evaluations
                .Where(c => entity.EvaluationIds.Contains(c.Id) && !c.IsDeleted)
                .ToListAsync();

            if (!evaluationToUpdate.Any())
            {
                return new ApiResult().Failure<EvaluationModel>("Không tìm thấy phiếu đánh giá nào để cập nhật.");
            }

            foreach (var criterion in evaluationToUpdate)
            {
                criterion.CategoryTimeTypeId = entity.CategoryTimeTypeId;

                criterion.UpdatedAt = DateTime.Now;
            }

            await _context.SaveChangesAsync();
            await transaction.CommitAsync();

            return new ApiResult().Success<EvaluationModel>("Cập nhật các phiếu đánh giá.");
        }
        catch (Exception ex)
        {
            await transaction.RollbackAsync();

            return new ApiResult().Failure<EvaluationModel>($"Lỗi khi cập nhật phiếu đánh giá: {ex.Message}");
        }
    }

    public async Task<PagedApiResponse<EvaluationModel>> InsertListAsync(EvaluationAddPayload entity)
    {

        if (entity.ListUnitId == null)
        {
            return new ApiResult().Failure<EvaluationModel>("Vui lòng chọn ít nhất 1 đơn vị sử dụng cho Phiếu đánh giá");
        }

        using var transaction = await _context.Database.BeginTransactionAsync();

        try
        {
            foreach (var unitId in entity.ListUnitId)
            {
                Evaluation evaluation = new Evaluation()
                {
                    Id = Guid.NewGuid(),
                    UnitId = unitId,
                    CategoryTimeTypeId = null,
                    EvaluationName = entity.EvaluationName,
                    Status = 0,
                    IsDeleted = false,
                    UpdatedAt = DateTime.Now,
                };

                await _context.AddAsync(evaluation);

                await _context.SaveChangesAsync();
            }

            await transaction.CommitAsync();

            return new ApiResult().Success<EvaluationModel>("Thêm mới phiếu đánh giá thành công.");
        }
        catch (Exception ex)
        {
            await transaction.RollbackAsync();

            return new ApiResult().Failure<EvaluationModel>($"Lỗi khi thêm phiếu đánh giá: {ex.InnerException.Message}");
        }
    }

    public async Task<PagedApiResponse<EvaluationModel>> RemoveRangeAsync(List<Guid> ids)
    {
        using var transaction = await _context.Database.BeginTransactionAsync();

        try
        {
            var evaluationToDelete = await _context.Evaluations
                .Where(c => ids.Contains(c.Id) && !c.IsDeleted)
                .ToListAsync();

            if (!evaluationToDelete.Any())
            {
                return new ApiResult().Failure<EvaluationModel>("Không tìm thấy phiếu đánh giá nào để xóa.");
            }

            foreach (var criterion in evaluationToDelete)
            {
                criterion.IsDeleted = true;
                criterion.UpdatedAt = DateTime.Now;
            }

            await _context.SaveChangesAsync();
            await transaction.CommitAsync();

            return new ApiResult().Success<EvaluationModel>("Xóa thành công các phiếu đánh giá.");
        }
        catch (Exception ex)
        {
            await transaction.RollbackAsync();

            return new ApiResult().Failure<EvaluationModel>($"Lỗi khi xóa phiếu đánh giá: {ex.Message}");
        }
    }

    public Task<PagedApiResponse<EvaluationModel>> InsertAsync(EvaluationModel entity)
    {
        throw new NotImplementedException();
    }


}

