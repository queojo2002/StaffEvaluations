using AutoMapper;
using Microsoft.EntityFrameworkCore;
using StaffEvaluation.Data;
using StaffEvaluation.Data.Entity;
using StaffEvaluation.Helpers;
using StaffEvaluation.Models;
using StaffEvaluation.Models.Custom;
using StaffEvaluation.Repositories.IRepository;
using System.Data;

namespace StaffEvaluation.Repositories.Repository;

public class EvaluationDetailsSupervisorRepository : IEvaluationDetailsSupervisorRepository
{
    private readonly DataContext _context;
    private readonly IMapper _mapper;
    private readonly IEvaluationCriteriaRepository _evaluationCriteriaRepository;


    public EvaluationDetailsSupervisorRepository(DataContext context, IMapper mapper, IEvaluationCriteriaRepository evaluationCriteriaRepository)
    {
        _context = context;
        _mapper = mapper;
        _evaluationCriteriaRepository = evaluationCriteriaRepository;
    }

    public Task<PagedApiResponse<EvaluationDetailsSupervisorModel>> GetAllPagedAsync(int pageNumber, int pageSize)
    {
        throw new NotImplementedException();
    }

    public Task<PagedApiResponse<EvaluationDetailsSupervisorModel>> GetByIdAsync(Guid id)
    {
        throw new NotImplementedException();
    }

    public async Task<PagedApiResponse<EvaluationDetailsSupervisorModel>> InsertAndUpdateCustomAsync(EvaluationDetailsPersonalCustomModel model, Guid userCurrentId)
    {
        if (model.UserCriteriaEvaluations == null)
        {
            return new ApiResult().Failure<EvaluationDetailsSupervisorModel>("Danh sách đánh giá không tồn tại.");
        }
        else if (model.UserId == null)
        {
            return new ApiResult().Failure<EvaluationDetailsSupervisorModel>("Người dùng không hợp lệ.");
        }


        using var transaction = await _context.Database.BeginTransactionAsync();

        try
        {
            Guid userId = model.UserId ?? Guid.Empty;

            Guid evaluationId = model.EvaluationId;

            var listCriteriaInEvaluationsOfSupervisor = await _evaluationCriteriaRepository.GetListCriteriaInEvaluationsOfSupervisor(evaluationId, userId, userCurrentId);

            foreach (var item in listCriteriaInEvaluationsOfSupervisor.Data!.CriteriaList!)
            {
                if (item.EvaluationDetailPersonalId == null) continue;

                var assessmentValueSupervisor = item.StartValue; // mặc định là thang điểm tối thiểu

                var assessmentValueSupervisorClient = model.UserCriteriaEvaluations.FirstOrDefault(e => e.EvaluationDetailPersonalId == item.EvaluationDetailPersonalId);

                if (assessmentValueSupervisorClient != null)
                {
                    assessmentValueSupervisor = assessmentValueSupervisorClient.AssessmentValueSupervisor;
                }

                var eds = await _context.EvaluationDetailsSupervisors.FirstOrDefaultAsync(e => e.EvaluationDetailsPersonalId == item.EvaluationDetailPersonalId && e.UserSupervisorId == userCurrentId && e.EvaluationId == evaluationId);

                if (eds == null)
                {
                    EvaluationDetailsSupervisor evaluationDetailsSupervisor = new EvaluationDetailsSupervisor()
                    {
                        Id = Guid.NewGuid(),
                        EvaluationId = evaluationId,
                        UserSupervisorId = userCurrentId,
                        EvaluationDetailsPersonalId = item.EvaluationDetailPersonalId ?? Guid.Empty,
                        Status = model.EvaluationStatus,
                        AssessmentValueSupervisor = assessmentValueSupervisor ?? 0,
                        IsDeleted = false,
                        UpdatedAt = DateTime.Now
                    };

                    await _context.EvaluationDetailsSupervisors.AddAsync(evaluationDetailsSupervisor);
                }
                else
                {
                    if (eds.Status >= 2)
                    {
                        return new ApiResult().Failure<EvaluationDetailsSupervisorModel>("Phiếu này đã thực hiện đánh giá.");
                    }

                    eds.AssessmentValueSupervisor = assessmentValueSupervisor ?? 0;

                    eds.Status = model.EvaluationStatus;

                    eds.UpdatedAt = DateTime.Now;
                }
                await _context.SaveChangesAsync();
            }

            if (model.EvaluationStatus == 2)
            {
                var evaluationAAE = await _context.EvaluationAAE.Where(e => e.User!.Id == model.UserId && e.EvaluationId == model.EvaluationId).FirstOrDefaultAsync();

                var eu = await _context.EvaluationUsers.Where(e => e.UserId == userCurrentId && e.Type == 2 && e.EvaluationId == model.EvaluationId).FirstOrDefaultAsync();

                if (evaluationAAE != null && eu != null)
                {
                    if (eu.IsManager == true)
                    {
                        evaluationAAE.NhanXetUuKhuyetDiem = model.EvaluationDetails?.NhanXetUuKhuyetDiem ?? null;

                        evaluationAAE.NhanDinhChieuHuongPhatTrien = model.EvaluationDetails?.NhanDinhChieuHuongPhatTrien ?? null;

                        evaluationAAE.Supervisor = _context.Users!.Where(e => e.Id == userCurrentId).FirstOrDefault();
                    }
                }

                await _context.SaveChangesAsync();
            }


            if (model.EvaluationStatus == 1 || model.EvaluationStatus == 2)
            {
                await transaction.CommitAsync();

                if (model.EvaluationStatus == 1)
                {
                    return new ApiResult().Success<EvaluationDetailsSupervisorModel>("Lưu kết quả đánh giá của bạn thành công.");
                }
                else
                {
                    return new ApiResult().Success<EvaluationDetailsSupervisorModel>("Ký duyệt đánh giá thành công.");
                }
            }
            else
            {
                await transaction.RollbackAsync();

                return new ApiResult().Failure<EvaluationDetailsSupervisorModel>($"Trạng thái đánh giá không hợp lệ.");
            }

        }
        catch (Exception ex)
        {
            await transaction.RollbackAsync();

            return new ApiResult().Failure<EvaluationDetailsSupervisorModel>($"Có lỗi khi thực hiện đánh giá: {ex.Message}");
        }
    }

    public Task<PagedApiResponse<EvaluationDetailsSupervisorModel>> InsertAsync(EvaluationDetailsSupervisorModel entity)
    {
        throw new NotImplementedException();
    }

    public Task<PagedApiResponse<EvaluationDetailsSupervisorModel>> RemoveRangeAsync(List<Guid> ids)
    {
        throw new NotImplementedException();
    }

    public Task<PagedApiResponse<EvaluationDetailsSupervisorModel>> UpdateAsync(EvaluationDetailsSupervisorModel entity)
    {
        throw new NotImplementedException();
    }






}

