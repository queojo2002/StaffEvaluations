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

    public async Task<PagedApiResponse<EvaluationModel>> GetEvaluationOfUser(Guid userId)
    {
        var user = await _context.Users!.Where(e => e.Id == userId).SingleOrDefaultAsync();

        if (user == null)
        {
            return new ApiResult().Failure<EvaluationModel>("Có lỗi khi lấy dữ liệu phiếu đánh giá cho người dùng này.");
        }

        List<EvaluationModel> evaluations = new List<EvaluationModel>();

        var listEvaluation = await _context.EvaluationUsers.Where(e => e.UserId == userId && e.Type == 1).ToListAsync();

        foreach (var itemEU in listEvaluation)
        {
            var evaluation = await _context.Evaluations.Where(e => e.Id == itemEU.EvaluationId && !e.IsDeleted).SingleOrDefaultAsync();

            if (evaluation == null) continue;

            var categoryTimeType = await _context.CategoryTimeTypes.Where(ctt => ctt.Id == evaluation.CategoryTimeTypeId && !ctt.IsDeleted).SingleOrDefaultAsync();

            if (categoryTimeType == null) continue;

            var unit = await _context.Units!.Where(u => u.Id == evaluation.UnitId && !u.IsDeleted).SingleOrDefaultAsync();

            if (unit == null) continue;

            if (categoryTimeType.FromDate.Date <= DateTime.Now.Date && categoryTimeType.ToDate.Date >= DateTime.Now.Date)
            {
                evaluations.Add(new EvaluationModel
                {
                    Id = evaluation.Id,
                    UnitId = unit.Id,
                    UnitName = unit.UnitName,
                    CategoryTimeTypeId = categoryTimeType.Id,
                    FromDate = categoryTimeType.FromDate,
                    ToDate = categoryTimeType.ToDate,
                    EvaluationName = evaluation.EvaluationName,
                    Status = evaluation.Status,
                    IsDeleted = evaluation.IsDeleted,
                    UpdatedAt = evaluation.UpdatedAt,
                });
            }

            foreach (var item in evaluations)
            {
                var edp = await _context.EvaluationDetailsPersonals.Where(e => e.EvaluationId == item.Id && e.UserId == userId).FirstOrDefaultAsync();

                if (edp == null) continue;

                item.Status = edp.Status;

                var listSupervisorInEvaluation = await _context.EvaluationUsers.Where(e => e.EvaluationId == item.Id && e.Type == 2).OrderBy(e => e.Sort).ToListAsync();

                for (int i = 0; i < listSupervisorInEvaluation.Count; i++)
                {
                    var itemCustom = listSupervisorInEvaluation.ElementAt(i);

                    var isSupervisorCompleted = await _context.EvaluationDetailsSupervisors.Where(e => e.Status == 2 && e.EvaluationDetailsPersonalId == edp.Id && e.EvaluationId == item.Id && e.UserSupervisorId == itemCustom.UserId).FirstOrDefaultAsync();

                    if (isSupervisorCompleted == null) continue;

                    if (i == (listSupervisorInEvaluation.Count - 1))
                    {
                        item.Status = 4;
                        item.MessageStatus = "Cấp trên đã thực hiện đánh giá xong";
                    }
                    else
                    {
                        item.Status = 3;
                        item.MessageStatus = "Cấp trên đang thực hiện đánh giá";
                    }
                }
            }
        }

        return new Pagination().HandleGetAllRespond(0, 0, evaluations, evaluations.Count);
    }

    public async Task<PagedApiResponse<EvaluationModel>> GetEvaluationOfSupervisor(Guid userCurrentId)
    {
        List<EvaluationModel> evaluations = new List<EvaluationModel>();

        var listEvaluation = await _context.EvaluationUsers.Where(e => e.UserId == userCurrentId && e.Type == 2).ToListAsync();

        foreach (var item in listEvaluation)
        {
            var evaluationId = item.EvaluationId;

            var listSupervisorInEvaluation = await _context.EvaluationUsers
                                                .Where(e => e.EvaluationId == evaluationId && e.Type == 2)
                                                .OrderBy(e => e.Sort)
                                                .ToListAsync();

            var userCompletedEvaluation = await _context.EvaluationDetailsPersonals
                                                .Where(e => e.EvaluationId == evaluationId && e.Status >= 2)
                                                .GroupBy(e => new { e.EvaluationId, e.UserId })
                                                .Select(g => new
                                                {
                                                    Id = g.Min(e => e.Id),
                                                    EvaluationId = g.Key.EvaluationId,
                                                    UserId = g.Key.UserId
                                                }).ToListAsync();

            foreach (var itemCustom in userCompletedEvaluation)
            {
                var userId = itemCustom.UserId; // User Id đã thực hiện xong đánh giá của phiếu này

                var indexCurrentUser = listSupervisorInEvaluation.FindIndex(u => u.UserId == userCurrentId); // Xác định vị trí của người dùng hiện tại 

                var indexCurrentSupervisor = listSupervisorInEvaluation.FindIndex(u => u.UserId == userId); // Xác định vị trí người đã hoàn thành đánh giá

                if (indexCurrentSupervisor >= indexCurrentUser) continue;

                var evaluationDetailsPersonalId = itemCustom.Id; // lấy ngẫu nhiên 1 idEvaluationsDetailsPersonal để check status - tại vì các idEvaluationsDetailsPersonal đều có status giống nhau

                var user = await _context.Users!.Where(e => e.Id == userId && !e.IsDeleted).FirstOrDefaultAsync();

                var evaluation = await _context.Evaluations!.Where(e => e.Id == evaluationId && !e.IsDeleted).FirstOrDefaultAsync();

                if (evaluation == null || user == null)
                {
                    return new ApiResult().Failure<EvaluationModel>("Có lỗi khi thực hiện lấy dữ liệu.");
                }

                var categoryTimeType = await _context.CategoryTimeTypes!.Where(e => e.Id == evaluation.CategoryTimeTypeId && !e.IsDeleted).FirstOrDefaultAsync();

                var unit = await _context.Units!.Where(u => u.Id == evaluation.UnitId && !u.IsDeleted).SingleOrDefaultAsync();

                if (categoryTimeType == null || unit == null)
                {
                    return new ApiResult().Failure<EvaluationModel>("Có lỗi khi thực hiện lấy dữ liệu.");
                }

                var edsStatus = await _context.EvaluationDetailsSupervisors.Where(e => e.EvaluationDetailsPersonalId == evaluationDetailsPersonalId && e.UserSupervisorId == userCurrentId).FirstOrDefaultAsync();

                if (
                    (indexCurrentUser == 0) ||
                    (indexCurrentSupervisor < indexCurrentUser && indexCurrentSupervisor != -1 && indexCurrentUser != -1)
                    )
                {
                    evaluations.Add(new EvaluationModel
                    {
                        Id = evaluationId,
                        UserId = userId,
                        FullName = user!.FullName,
                        Email = user!.Email,
                        UnitId = unit.Id,
                        UnitName = unit.UnitName,
                        CategoryTimeTypeId = categoryTimeType!.Id,
                        FromDate = categoryTimeType.FromDate,
                        ToDate = categoryTimeType.ToDate,
                        EvaluationName = evaluation!.EvaluationName,
                        Status = edsStatus == null ? 0 : edsStatus.Status,
                        IsDeleted = evaluation.IsDeleted,
                        UpdatedAt = evaluation.UpdatedAt,
                    });

                }
                else
                {
                    if (listSupervisorInEvaluation[indexCurrentUser - 1] != null)
                    {
                        Guid userIdLast = listSupervisorInEvaluation[indexCurrentUser - 1].UserId;

                        var checkExist = await _context.EvaluationDetailsSupervisors.Where(e => e.UserSupervisorId == userIdLast && e.Status == 2 && e.EvaluationDetailsPersonalId == evaluationDetailsPersonalId).FirstOrDefaultAsync();

                        if (checkExist != null)
                        {
                            evaluations.Add(new EvaluationModel
                            {
                                Id = evaluationId,
                                UserId = userId,
                                FullName = user!.FullName,
                                Email = user!.Email,
                                UnitId = unit.Id,
                                UnitName = unit.UnitName,
                                CategoryTimeTypeId = categoryTimeType!.Id,
                                FromDate = categoryTimeType.FromDate,
                                ToDate = categoryTimeType.ToDate,
                                EvaluationName = evaluation!.EvaluationName,
                                Status = edsStatus == null ? 0 : edsStatus.Status,
                                IsDeleted = evaluation.IsDeleted,
                                UpdatedAt = evaluation.UpdatedAt,
                            });
                        }
                    }
                }

            }
        }
        return new Pagination().HandleGetAllRespond(0, 0, evaluations, evaluations.Count);
    }
}

