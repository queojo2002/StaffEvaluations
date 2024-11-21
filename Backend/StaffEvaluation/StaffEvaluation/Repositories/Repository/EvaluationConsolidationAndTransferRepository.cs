using AutoMapper;
using Microsoft.EntityFrameworkCore;
using StaffEvaluation.Data;
using StaffEvaluation.Data.Entity;
using StaffEvaluation.Helpers;
using StaffEvaluation.Models;
using StaffEvaluation.Repositories.IRepository;

namespace StaffEvaluation.Repositories.Repository;

public class EvaluationConsolidationAndTransferRepository : IEvaluationConsolidationAndTransferRepository
{
    private DataContext _context;
    private IMapper _mapper;
    private IUnitRepository _unitRepository;

    public EvaluationConsolidationAndTransferRepository(DataContext context, IMapper mapper, IUnitRepository unitRepository)
    {
        _context = context;
        _mapper = mapper;
        _unitRepository = unitRepository;
    }

    public async Task<PagedApiResponse<EvaluationConsolidationAndTransferModel>> GetAllOfUnit(Guid unitCurrentId)
    {
        var unitIdsRaw = await _unitRepository.GetAllChildOfUnitAsync(unitCurrentId);

        var unitIds = unitIdsRaw.DataList!.Select(e => e.Id).ToList();

        var datas = await _context.EvaluationConsolidationAndTransfer
            .Where(e => unitIds.Contains(e.UnitId))
            .Select(data => new EvaluationConsolidationAndTransferModel()
            {
                Id = data.Id,
                UnitName = _context.Units!.Where(e => e.Id == data.UnitId)!.FirstOrDefault()!.UnitName,
                UnitId = data.UnitId,
                FullName = _context.Users!.Where(e => e.Id == data.UserId).FirstOrDefault()!.FullName,
                UserId = data.UserId,
                EvaluationConsolidationAndTransferName = data.EvaluationConsolidationAndTransferName,
                Status = data.Status,
                UpdatedAt = data.UpdatedAt
            }).ToListAsync();

        return new Pagination().HandleGetAllRespond(0, 0, datas, datas.Count);
    }

    public Task<PagedApiResponse<EvaluationConsolidationAndTransferModel>> GetAllPagedAsync(int pageNumber, int pageSize)
    {
        throw new NotImplementedException();
    }

    public Task<PagedApiResponse<EvaluationConsolidationAndTransferModel>> GetByIdAsync(Guid id)
    {
        throw new NotImplementedException();
    }

    public Task<PagedApiResponse<EvaluationConsolidationAndTransferModel>> InsertAsync(EvaluationConsolidationAndTransferModel entity)
    {
        throw new NotImplementedException();
    }

    public async Task<PagedApiResponse<EvaluationConsolidationAndTransferModel>> InsertCustomAsync(string evaluationConsolidationAndTransferName, Guid userCurrentId, Guid unitCurrentId)
    {
        using var transaction = await _context.Database.BeginTransactionAsync();

        try
        {
            var model = new EvaluationConsolidationAndTransfer()
            {
                Id = Guid.NewGuid(),
                EvaluationConsolidationAndTransferName = evaluationConsolidationAndTransferName,
                UserId = userCurrentId,
                UnitId = unitCurrentId,
                Status = 0,
                UpdatedAt = DateTime.Now
            };

            await _context.EvaluationConsolidationAndTransfer!.AddAsync(model);

            await _context.SaveChangesAsync();

            await transaction.CommitAsync();

            return new ApiResult().Success<EvaluationConsolidationAndTransferModel>("Thêm mới đợt tổng hợp và chuyển thành công.");
        }
        catch (Exception ex)
        {
            await transaction.RollbackAsync();

            return new ApiResult().Failure<EvaluationConsolidationAndTransferModel>($"Lỗi khi thêm đợt tổng hợp và chuyển: {ex.Message}");
        }
    }

    public async Task<PagedApiResponse<EvaluationConsolidationAndTransferModel>> RemoveRangeAsync(List<Guid> ids)
    {
        using var transaction = await _context.Database.BeginTransactionAsync();

        try
        {
            var removesECAT = await _context.EvaluationConsolidationAndTransfer!
                .Where(cr => ids.Contains(cr.Id) && cr.Status == 0)
                .ToListAsync();


            if (!removesECAT.Any())
            {
                return new ApiResult().Failure<EvaluationConsolidationAndTransferModel>("Không tìm thấy đợt tổng hợp và chuyển nào để xóa.");
            }

            var removesECATD = await _context.EvaluationConsolidationAndTransferDetails!
                .Where(cr => removesECAT.Select(e => e.Id).Contains(cr.EvaluationConsolidationAndTransferId))
                .ToListAsync();

            _context.RemoveRange(removesECATD);

            _context.RemoveRange(removesECAT);

            await _context.SaveChangesAsync();

            await transaction.CommitAsync();

            return new ApiResult().Success<EvaluationConsolidationAndTransferModel>("Xóa thành công các đợt tổng hợp và chuyển.");
        }
        catch (Exception ex)
        {
            await transaction.RollbackAsync();
            return new ApiResult().Failure<EvaluationConsolidationAndTransferModel>($"Lỗi khi xóa đợt tổng hợp và chuyển: {ex.Message}");
        }
    }

    public Task<PagedApiResponse<EvaluationConsolidationAndTransferModel>> UpdateAsync(EvaluationConsolidationAndTransferModel entity)
    {
        throw new NotImplementedException();
    }
}

