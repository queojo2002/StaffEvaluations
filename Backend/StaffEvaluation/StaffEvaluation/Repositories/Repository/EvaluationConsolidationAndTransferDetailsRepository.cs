using AutoMapper;
using Microsoft.EntityFrameworkCore;
using StaffEvaluation.Data;
using StaffEvaluation.Data.Entity;
using StaffEvaluation.Helpers;
using StaffEvaluation.Models;
using StaffEvaluation.Models.Payload;
using StaffEvaluation.Repositories.IRepository;

namespace StaffEvaluation.Repositories.Repository;

public class EvaluationConsolidationAndTransferDetailsRepository : IEvaluationConsolidationAndTransferDetailsRepository
{
    private DataContext _context;
    private IMapper _mapper;
    private IUnitRepository _unitRepository;

    public EvaluationConsolidationAndTransferDetailsRepository(DataContext context, IMapper mapper, IUnitRepository unitRepository)
    {
        _context = context;
        _mapper = mapper;
        _unitRepository = unitRepository;
    }





    public async Task<PagedApiResponse<EvaluationModel>> GetAllEvaluationAvailable(Guid evaluationConsolidationAndTransferId, Guid unitCurrentId)
    {
        var unitIdsRaw = await _unitRepository.GetAllChildOfUnitAsync(unitCurrentId);

        var unitIds = unitIdsRaw.DataList!.Select(e => e.Id).ToList();

        var evaluations = await _context.Evaluations.Where(e => e.Status == 0 && unitIds.Contains(e.UnitId) && !e.IsDeleted).ToListAsync();

        var listIdsEvaluation = evaluations.Select(e => e.Id).ToList();



        var listIdsIn = await _context.EvaluationConsolidationAndTransferDetails.Where(e => listIdsEvaluation.Contains(e.EvaluationId)).ToListAsync();

        var listIdsEvaluationNotIn = listIdsIn.Select(e => e.EvaluationId).Distinct().ToList();


        var uniqueInListIdsEvaluationIn = listIdsEvaluation.Except(listIdsEvaluationNotIn).ToList();


        var evaluation = await (from e in _context.Evaluations
                                join u in _context.Units! on e.UnitId equals u.Id
                                join ct in _context.CategoryTimeTypes on e.CategoryTimeTypeId equals ct.Id into ctGroup
                                from ct in ctGroup.DefaultIfEmpty()
                                where !u.IsDeleted && !e.IsDeleted && uniqueInListIdsEvaluationIn.Contains(e.Id)
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
                                }).ToListAsync();

        return new Pagination().HandleGetAllRespond(0, 0, evaluation, evaluation.Count);
    }


    public async Task<PagedApiResponse<EvaluationModel>> GetAllEvaluationsByConsolidationIdAsync(Guid evaluationConsolidationAndTransferId)
    {
        var listData = await _context.EvaluationConsolidationAndTransferDetails.Where(e => e.EvaluationConsolidationAndTransferId == evaluationConsolidationAndTransferId).ToListAsync();

        var evaluation = await (from e in _context.Evaluations
                                join u in _context.Units! on e.UnitId equals u.Id
                                join ct in _context.CategoryTimeTypes on e.CategoryTimeTypeId equals ct.Id into ctGroup
                                from ct in ctGroup.DefaultIfEmpty()
                                where !u.IsDeleted && !e.IsDeleted && listData.Select(e => e.EvaluationId).Contains(e.Id)
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
                                }).ToListAsync();

        return new Pagination().HandleGetAllRespond(0, 0, evaluation, evaluation.Count);
    }

    public async Task<PagedApiResponse<EvaluationConsolidationAndTransferDetails>> InsertEvaluationIntoCATDAsync(EvaluationConsolidationAndTransferDetailsAddPayload model)
    {
        if (model.EvaluationIds == null)
        {
            return new ApiResult().Failure<EvaluationConsolidationAndTransferDetails>("Danh sách phiếu đánh giá không được để trống.");
        }

        using var transaction = await _context.Database.BeginTransactionAsync();

        try
        {

            var checkCAT = await _context.EvaluationConsolidationAndTransfer.Where(e => e.Status != 0 && e.Id == model.EvaluationConsolidationAndTransferId).FirstOrDefaultAsync();

            if (checkCAT != null)
            {
                return new ApiResult().Failure<EvaluationConsolidationAndTransferDetails>("Đợt Tổng hợp và chuyển này đã được Xác nhận nên không thể thao tác được nữa.");
            }

            foreach (var evaluationId in model.EvaluationIds)
            {

                var checkExist = await _context.EvaluationConsolidationAndTransferDetails.Where(e => e.EvaluationId == evaluationId).FirstOrDefaultAsync();


                if (checkExist != null)
                {
                    await transaction.RollbackAsync();

                    return new ApiResult().Failure<EvaluationConsolidationAndTransferDetails>("Đã có phiếu đánh giá tồn tại trong 1 đợt tổng hợp và chuyển khác.");
                }

                EvaluationConsolidationAndTransferDetails ecatd = new EvaluationConsolidationAndTransferDetails
                {
                    Id = Guid.NewGuid(),
                    EvaluationId = evaluationId,
                    EvaluationConsolidationAndTransferId = model.EvaluationConsolidationAndTransferId,
                    UpdatedAt = DateTime.Now,
                };

                await _context.AddAsync(ecatd);

                await _context.SaveChangesAsync();
            }

            await transaction.CommitAsync();

            return new ApiResult().Success<EvaluationConsolidationAndTransferDetails>("Thêm phiếu đánh giá vào đợt tổng hợp và chuyển thành công.");
        }
        catch (Exception ex)
        {
            await transaction.RollbackAsync();

            return new ApiResult().Failure<EvaluationConsolidationAndTransferDetails>($"Lỗi khi thêm phiếu đánh giá vào đợt tổng hợp và chuyển: {ex.Message}");
        }
    }

    public async Task<PagedApiResponse<EvaluationConsolidationAndTransferDetails>> RemoveEvaluationFromCATDAsync(EvaluationConsolidationAndTransferDetailsAddPayload model)
    {
        if (model.EvaluationIds == null)
        {
            return new ApiResult().Failure<EvaluationConsolidationAndTransferDetails>("Danh sách phiếu đánh giá không được để trống.");
        }


        using var transaction = await _context.Database.BeginTransactionAsync();

        try
        {
            var checkCAT = await _context.EvaluationConsolidationAndTransfer.Where(e => e.Status != 0 && e.Id == model.EvaluationConsolidationAndTransferId).FirstOrDefaultAsync();

            if (checkCAT != null)
            {
                return new ApiResult().Failure<EvaluationConsolidationAndTransferDetails>("Đợt Tổng hợp và chuyển này đã được Xác nhận nên không thể thao tác được nữa.");
            }

            var datasDelete = await _context.EvaluationConsolidationAndTransferDetails
                .Where(c => model.EvaluationIds.Contains(c.EvaluationId) &&
                            c.EvaluationConsolidationAndTransferId == model.EvaluationConsolidationAndTransferId)
                .ToListAsync();

            if (!datasDelete.Any())
            {
                return new ApiResult().Failure<EvaluationConsolidationAndTransferDetails>("Không tìm thấy dữ liệu nào để xóa.");
            }

            _context.EvaluationConsolidationAndTransferDetails.RemoveRange(datasDelete);

            await _context.SaveChangesAsync();

            await transaction.CommitAsync();

            return new ApiResult().Success<EvaluationConsolidationAndTransferDetails>("Xóa thành công các người dùng khỏi phiếu đánh giá.");
        }
        catch (Exception ex)
        {
            await transaction.RollbackAsync();

            return new ApiResult().Failure<EvaluationConsolidationAndTransferDetails>($"Lỗi khi xóa người dùng khỏi phiếu đánh giá: {ex.Message}");
        }
    }

    public Task<PagedApiResponse<EvaluationConsolidationAndTransferDetailsModel>> GetAllPagedAsync(int pageNumber, int pageSize)
    {
        throw new NotImplementedException();
    }

    public Task<PagedApiResponse<EvaluationConsolidationAndTransferDetailsModel>> GetByIdAsync(Guid id)
    {
        throw new NotImplementedException();
    }

    public Task<PagedApiResponse<EvaluationConsolidationAndTransferDetailsModel>> InsertAsync(EvaluationConsolidationAndTransferDetailsModel entity)
    {
        throw new NotImplementedException();
    }

    public Task<PagedApiResponse<EvaluationConsolidationAndTransferDetailsModel>> RemoveRangeAsync(List<Guid> ids)
    {
        throw new NotImplementedException();
    }

    public Task<PagedApiResponse<EvaluationConsolidationAndTransferDetailsModel>> UpdateAsync(EvaluationConsolidationAndTransferDetailsModel entity)
    {
        throw new NotImplementedException();
    }


}

