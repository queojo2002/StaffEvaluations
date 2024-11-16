using AutoMapper;
using Microsoft.EntityFrameworkCore;
using StaffEvaluation.Data;
using StaffEvaluation.Data.Entity;
using StaffEvaluation.Helpers;
using StaffEvaluation.Models;
using StaffEvaluation.Models.Custom;
using StaffEvaluation.Repositories.IRepository;

namespace StaffEvaluation.Repositories.Repository;

public class EvaluationDetailsPersonalRepository : IEvaluationDetailsPersonalRepository
{
    private readonly DataContext _context;
    private readonly IMapper _mapper;
    private readonly IEvaluationCriteriaRepository _evaluationCriteriaRepository;
    public EvaluationDetailsPersonalRepository(DataContext context, IMapper mapper, IEvaluationCriteriaRepository evaluationCriteriaRepository)
    {
        _context = context;
        _mapper = mapper;
        _evaluationCriteriaRepository = evaluationCriteriaRepository;
    }

    public Task<PagedApiResponse<EvaluationDetailsPersonalModel>> GetAllPagedAsync(int pageNumber, int pageSize)
    {
        throw new NotImplementedException();
    }

    public Task<PagedApiResponse<EvaluationDetailsPersonalModel>> GetByIdAsync(Guid id)
    {
        throw new NotImplementedException();
    }

    public async Task<PagedApiResponse<EvaluationDetailsPersonalModel>> InsertAndUpdateCustomAsync(EvaluationDetailsPersonalCustomModel model, Guid userCurrentId)
    {
        if (model.UserCriteriaEvaluations == null)
        {
            return new ApiResult().Failure<EvaluationDetailsPersonalModel>("Danh sách đánh giá không tồn tại.");
        }

        using var transaction = await _context.Database.BeginTransactionAsync();

        try
        {
            var listCriteriaInEvaluationsOfUser = await _evaluationCriteriaRepository.GetListCriteriaInEvaluationsOfUser(model.EvaluationId, userCurrentId);

            foreach (var item in listCriteriaInEvaluationsOfUser.Data!.CriteriaList!)
            {
                var edp = model.UserCriteriaEvaluations.Where(e => e.EvaluationCriteriaId == item.EvaluationCriteriaId).SingleOrDefault();

                if (edp == null)
                {
                    continue;
                }
                else if (edp.AssessmentValue == null)
                {
                    edp.AssessmentValue = 0;
                }

                var edpExist = await _context.EvaluationDetailsPersonals.Where(e => e.EvaluationCriteriaId == item.EvaluationCriteriaId && e.EvaluationId == model.EvaluationId && e.UserId == userCurrentId).SingleOrDefaultAsync();

                if (edpExist == null)
                {
                    EvaluationDetailsPersonal evaluationDetailsPersonal = new EvaluationDetailsPersonal()
                    {
                        Id = Guid.NewGuid(),
                        EvaluationId = model.EvaluationId,
                        EvaluationCriteriaId = item.EvaluationCriteriaId,
                        UserId = userCurrentId,
                        Status = model.EvaluationStatus,
                        AssessmentValue = edp.AssessmentValue ?? 0,
                        IsDeleted = false,
                        UpdatedAt = DateTime.Now,
                    };

                    await _context.EvaluationDetailsPersonals.AddAsync(evaluationDetailsPersonal);

                }
                else
                {

                    if (edpExist.Status >= 2)
                    {
                        return new ApiResult().Failure<EvaluationDetailsPersonalModel>("Phiếu này đã thực hiện đánh giá.");
                    }

                    edpExist.AssessmentValue = edp.AssessmentValue ?? 0;
                    edpExist.Status = model.EvaluationStatus;
                    edpExist.UpdatedAt = DateTime.Now;
                }

                await _context.SaveChangesAsync();
            }

            if (model.EvaluationStatus == 2)
            {
                var eu = await _context.EvaluationUsers.Where(e => e.UserId == userCurrentId && e.EvaluationId == model.EvaluationId && e.Type == 2).FirstOrDefaultAsync();

                EvaluationAAE evaluationsAAE = new EvaluationAAE()
                {
                    Id = Guid.NewGuid(),
                    EvaluationId = model.EvaluationId,
                    User = _context.Users!.Where(e => e.Id == userCurrentId).FirstOrDefault(),
                    Supervisor = null,
                    Advantages = model.EvaluationDetails?.Advantages,
                    DisAdvantages = model.EvaluationDetails?.DisAdvantages,
                    AddReviews = model.EvaluationDetails?.AddReviews,
                    IsDeleted = false,
                    UpdatedAt = DateTime.Now
                };

                if (eu != null && eu.IsManager == true)
                {
                    evaluationsAAE.KetQuaHoatDongCoQuan = model.EvaluationDetails?.KetQuaHoatDongCoQuan;
                    evaluationsAAE.NangLucLanhDaoQuanLy = model.EvaluationDetails?.NangLucLanhDaoQuanLy;
                    evaluationsAAE.NangLucTapHopDoanKet = model.EvaluationDetails?.NangLucTapHopDoanKet;
                }

                await _context.EvaluationAAE.AddAsync(evaluationsAAE);

                await _context.SaveChangesAsync();
            }

            if (model.EvaluationStatus == 1 || model.EvaluationStatus == 2)
            {
                await transaction.CommitAsync();

                if (model.EvaluationStatus == 1)
                {
                    return new ApiResult().Success<EvaluationDetailsPersonalModel>("Lưu kết quả tự đánh giá của bạn thành công.");
                }
                else
                {
                    return new ApiResult().Success<EvaluationDetailsPersonalModel>("Gửi kết quả tự đánh giá đến cấp trên thành công.");
                }
            }
            else
            {
                await transaction.RollbackAsync();

                return new ApiResult().Failure<EvaluationDetailsPersonalModel>($"Trạng thái tự đánh giá không hợp lệ.");
            }
        }
        catch (Exception ex)
        {
            await transaction.RollbackAsync();

            return new ApiResult().Failure<EvaluationDetailsPersonalModel>($"Có lỗi khi thực hiện đánh giá: {ex.Message}");
        }

    }

    public Task<PagedApiResponse<EvaluationDetailsPersonalModel>> InsertAsync(EvaluationDetailsPersonalModel entity)
    {
        throw new NotImplementedException();
    }

    public Task<PagedApiResponse<EvaluationDetailsPersonalModel>> RemoveRangeAsync(List<Guid> ids)
    {
        throw new NotImplementedException();
    }

    public Task<PagedApiResponse<EvaluationDetailsPersonalModel>> UpdateAsync(EvaluationDetailsPersonalModel entity)
    {
        throw new NotImplementedException();
    }
}

