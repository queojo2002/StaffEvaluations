using AutoMapper;
using Microsoft.EntityFrameworkCore;
using StaffEvaluation.Data;
using StaffEvaluation.Data.Entity;
using StaffEvaluation.Helpers;
using StaffEvaluation.Models;
using StaffEvaluation.Repositories.IRepository;

namespace StaffEvaluation.Repositories.Repository;

public class EvaluationSampleRepository : IEvaluationSampleRepository
{
    private IUnitRepository _unitRepository;
    private DataContext _context;
    private IMapper _mapper;

    public EvaluationSampleRepository(DataContext context, IMapper mapper, IUnitRepository unitRepository)
    {
        _context = context;
        _mapper = mapper;
        _unitRepository = unitRepository;
    }

    public async Task<PagedApiResponse<EvaluationSampleModel>> GetAllPagedAsync(int pageNumber, int pageSize)
    {
        var datas = await _context.EvaluationSamples.Where(e => !e.IsDeleted).OrderBy(e => e.EvaluationSampleName).ToListAsync();

        var mapDatas = _mapper.Map<List<EvaluationSampleModel>>(datas);

        return new Pagination().HandleGetAllRespond(
            pageNumber,
            pageSize,
            mapDatas,
            datas.Count
        );
    }

    public async Task<PagedApiResponse<EvaluationSampleModel>> GetByIdAsync(Guid id)
    {
        var evaluationSample = await _context.EvaluationSamples.Where(e => e.Id == id && !e.IsDeleted).FirstOrDefaultAsync();

        if (evaluationSample == null)
        {
            return new ApiResult().Failure<EvaluationSampleModel>("Không tìm thấy mẫu phiếu đánh giá hoặc mẫu phiếu đánh giá đã bị xóa.");
        }

        var map = _mapper.Map<EvaluationSampleModel>(evaluationSample);


        return new Pagination().HandleGetByIdRespond(map);
    }

    public async Task<PagedApiResponse<EvaluationSampleModel>> InsertAsync(EvaluationSampleModel entity)
    {
        using var transaction = await _context.Database.BeginTransactionAsync();

        try
        {

            EvaluationSample evaluationSample = new EvaluationSample()
            {
                Id = Guid.NewGuid(),
                EvaluationSampleName = entity.EvaluationSampleName,
                IsDeleted = false,
                UpdatedAt = DateTime.Now,
            };

            await _context.AddAsync(evaluationSample);

            await _context.SaveChangesAsync();

            await transaction.CommitAsync();

            return new ApiResult().Success<EvaluationSampleModel>("Thêm mới mẫu phiếu đánh giá thành công.");
        }
        catch (Exception ex)
        {
            await transaction.RollbackAsync();

            return new ApiResult().Failure<EvaluationSampleModel>($"Lỗi khi thêm mẫu phiếu đánh giá: {ex.Message}");
        }
    }

    public async Task<PagedApiResponse<EvaluationSampleModel>> RemoveRangeAsync(List<Guid> ids)
    {
        using var transaction = await _context.Database.BeginTransactionAsync();

        try
        {
            var evaluationToDelete = await _context.EvaluationSamples
                .Where(c => ids.Contains(c.Id) && !c.IsDeleted)
                .ToListAsync();

            if (!evaluationToDelete.Any())
            {
                return new ApiResult().Failure<EvaluationSampleModel>("Không tìm thấy mẫu phiếu đánh giá nào để xóa.");
            }

            var evaluationCriteriaSampleDelete = await _context.EvaluationCriteriaSamples.Where(e => evaluationToDelete.Select(e => e.Id).Contains(e.EvaluationSampleId)).ToListAsync();

            _context.RemoveRange(evaluationCriteriaSampleDelete);

            _context.RemoveRange(evaluationToDelete);

            await _context.SaveChangesAsync();

            await transaction.CommitAsync();

            return new ApiResult().Success<EvaluationSampleModel>("Xóa thành công các mẫu phiếu đánh giá.");
        }
        catch (Exception ex)
        {
            await transaction.RollbackAsync();

            return new ApiResult().Failure<EvaluationSampleModel>($"Lỗi khi xóa mẫu phiếu đánh giá: {ex.Message}");
        }
    }

    public async Task<PagedApiResponse<EvaluationSampleModel>> UpdateAsync(EvaluationSampleModel entity)
    {

        using var transaction = await _context.Database.BeginTransactionAsync();

        try
        {
            var evaluationToUpdate = await _context.EvaluationSamples.FindAsync(entity.Id);

            if (evaluationToUpdate == null || evaluationToUpdate.IsDeleted)
            {
                return new ApiResult().Failure<EvaluationSampleModel>("Không tìm thấy mẫu phiếu đánh giá hoặc mẫu phiếu đánh giá đã bị xóa.");
            }

            evaluationToUpdate.EvaluationSampleName = entity.EvaluationSampleName;

            evaluationToUpdate.UpdatedAt = DateTime.Now;

            await _context.SaveChangesAsync();

            await transaction.CommitAsync();

            return new ApiResult().Success<EvaluationSampleModel>("Cập nhật mẫu phiếu đánh giá thành công.");
        }
        catch (Exception ex)
        {
            await transaction.RollbackAsync();

            return new ApiResult().Failure<EvaluationSampleModel>($"Lỗi khi cập nhật mẫu phiếu đánh giá: {ex.Message}");
        }
    }
}

