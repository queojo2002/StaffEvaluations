using AutoMapper;
using DocumentFormat.OpenXml;
using Microsoft.EntityFrameworkCore;
using StaffEvaluation.Data;
using StaffEvaluation.Data.Entity;
using StaffEvaluation.Helpers;
using StaffEvaluation.Models;
using StaffEvaluation.Models.Custom;
using StaffEvaluation.Models.Payload;
using StaffEvaluation.Repositories.IRepository;
using System.Data;

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

    public async Task<PagedApiResponse<EvaluationCriteriaResponseModel>> GetListCriteriaInEvaluationsOfUser(Guid evaluationId, Guid userId)
    {
        var evaluation = await _context.Evaluations.Where(e => e.Id == evaluationId && !e.IsDeleted).SingleOrDefaultAsync();

        if (evaluation == null)
        {
            return new ApiResult().Failure<EvaluationCriteriaResponseModel>("Phiếu đánh giá không tồn tại trên hệ thống.");
        }

        var query = await _context.EvaluationCriterias
                    .Where(ec => ec.EvaluationId == evaluationId && !ec.IsDeleted)
                    .OrderBy(ec => ec.Sort)
                    .Select(ec => new CriteriaOfUserModel
                    {
                        Id = ec.CategoryCriteriaId,
                        EvaluationDetailPersonalId = null,
                        EvaluationCriteriaId = ec.Id,
                        STT = null,
                        CriteriaName = ec.CategoryCriteria!.CriteriaName,
                        ParentId = ec.CategoryCriteria.ParentId,
                        StartValue = ec.CategoryCriteria!.CategoryRating!.StartValue,
                        EndValue = ec.CategoryCriteria.CategoryRating.EndValue,
                        IsDistinct = ec.CategoryCriteria.IsDistinct,
                        Sort = ec.Sort,
                        AssessmentValue = _context.EvaluationDetailsPersonals
                            .Where(eds => eds.UserId == userId && eds.EvaluationId == evaluationId && eds.EvaluationCriteriaId == ec.Id)
                            .Select(eds => eds.AssessmentValue)
                            .FirstOrDefault()
                    }).ToListAsync();

        var result = new EvaluationCriteriaResponseModel
        {
            EvaluationId = evaluation.Id,
            EvaluationName = evaluation.EvaluationName,
            CriteriaList = query,
            SupervisorList = null
        };

        return new Pagination().HandleGetByIdRespond(result);
    }

    public async Task<PagedApiResponse<EvaluationCriteriaResponseModel>> GetListCriteriaInEvaluationsOfSupervisor(Guid evaluationId, Guid userId, Guid userCurrentId)
    {
        var datas = await GetListCriteriaInEvaluationsOfUser(evaluationId, userId);

        foreach (var item in datas.Data!.CriteriaList!.ToList())
        {
            var edpCheck = await _context.EvaluationDetailsPersonals.FirstOrDefaultAsync(e => e.EvaluationCriteriaId == item.EvaluationCriteriaId && e.UserId == userId && e.EvaluationId == evaluationId);

            if (edpCheck != null)
            {
                item.EvaluationDetailPersonalId = edpCheck.Id;

                item.AssessmentValue = edpCheck.AssessmentValue;

                var edsCheck = await _context.EvaluationDetailsSupervisors.FirstOrDefaultAsync(e => e.EvaluationDetailsPersonalId == edpCheck.Id && e.UserSupervisorId == userCurrentId);

                if (edsCheck != null)
                {
                    item.AssessmentValueSupervisor = edsCheck.AssessmentValueSupervisor;
                }
            }
        }

        var result = new EvaluationCriteriaResponseModel
        {
            EvaluationId = evaluationId,
            EvaluationName = datas.Data.EvaluationName,
            CriteriaList = datas.Data.CriteriaList,
        };

        return new Pagination().HandleGetByIdRespond(result);

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

    public async Task<EvaluationCriteriaResponseModel> CriteriaToTree(EvaluationCriteriaResponseModel model, Guid userCurrentId, int evaluationType)
    {
        if (model.SupervisorList == null)
        {
            model.SupervisorList = new List<SupervisorModel>();
        }

        if (model.CriteriaList == null)
        {
            model.CriteriaList = new List<CriteriaOfUserModel>();
        }

        var map = new Dictionary<string, CriteriaOfUserModel>();

        var menuTree = new List<CriteriaOfUserModel>();

        var evaluationPersonalDetailsList = await _context.EvaluationDetailsPersonals.Where(edp => edp.EvaluationId == model.EvaluationId).ToListAsync();

        var evaluationSupervisorDetailsList = await _context.EvaluationDetailsSupervisors.Where(eds => eds.EvaluationId == model.EvaluationId).ToListAsync();

        var sortedSupervisorsInEvaluation = await _context.EvaluationUsers.Where(eu => eu.EvaluationId == model.EvaluationId && eu.Type == 2 && !eu.IsDeleted).OrderBy(eu => eu.Sort).ToListAsync();

        if (evaluationType == 1)
        {
            var completedPersonalEvaluation = evaluationPersonalDetailsList.FirstOrDefault(detail => detail.UserId == userCurrentId && detail.Status >= 2);

            if (completedPersonalEvaluation != null)
            {
                for (int i = 0; sortedSupervisorsInEvaluation != null && i < sortedSupervisorsInEvaluation.Count; i++)
                {
                    var supervisor = sortedSupervisorsInEvaluation[i];

                    var existingSupervisorEvaluation = evaluationSupervisorDetailsList.FirstOrDefault(x =>
                            x.EvaluationDetailsPersonalId == completedPersonalEvaluation.Id &&
                            x.UserSupervisorId == supervisor.UserId &&
                            x.Status == 2);

                    if (existingSupervisorEvaluation != null)
                    {
                        var user = await _context.Users!.Where(e => e.Id == supervisor.UserId && !e.IsDeleted).FirstOrDefaultAsync();

                        model.SupervisorList.Add(new SupervisorModel
                        {
                            UserId = supervisor.UserId,
                            FullName = user!.FullName
                        });
                    }
                }
            }
        }
        else if (evaluationType == 2)
        {
            var currentUserIndex = sortedSupervisorsInEvaluation.FindIndex(supervisor => supervisor.UserId == userCurrentId);

            for (int i = 0; i < sortedSupervisorsInEvaluation.Count; i++)
            {
                if (i > currentUserIndex)
                {
                    break;
                }
                else if (i == currentUserIndex)
                {
                    continue;
                }


                var user = await _context.Users!.Where(e => e.Id == sortedSupervisorsInEvaluation[i].UserId && !e.IsDeleted).FirstOrDefaultAsync();

                if (user != null)
                {
                    model.SupervisorList.Add(new SupervisorModel
                    {
                        UserId = sortedSupervisorsInEvaluation[i].UserId,
                        FullName = user.FullName
                    });
                }
            }
        }

        foreach (var item in model.CriteriaList!)
        {
            var key = item.Id.ToString() ?? string.Empty;

            map[key] = item;
        }

        foreach (var item in model.CriteriaList)
        {
            var parentId = item.ParentId?.ToString();

            if (string.IsNullOrEmpty(parentId) || !map.ContainsKey(parentId))
            {
                menuTree.Add(item);
            }
            else
            {
                var parentItem = map[parentId];

                parentItem.Children.Add(item);
            }
        }

        for (int i = 0; i < menuTree.Count; i++)
        {
            AssignSTT(menuTree[i], (i + 1).ToString());
        }

        foreach (var criteria in model.CriteriaList)
        {
            ProcessSupervisorEvaluations(criteria, model.SupervisorList, evaluationPersonalDetailsList, evaluationSupervisorDetailsList, userCurrentId);
        }

        model.CriteriaList = menuTree;

        return await Task.FromResult(model);
    }
    public async Task<CriteriaTreeResponseModel> CriteriaToTreeWithUser(Guid evaluationId, Guid userCurrentId)
    {

        var response = new CriteriaTreeResponseModel();

        var evaluations = await _context.Evaluations.Where(e => e.Id == evaluationId).FirstOrDefaultAsync();

        if (evaluations == null)
        {
            return response;
        }
        else
        {
            response.EvaluationId = evaluations.Id;
            response.EvaluationName = evaluations.EvaluationName;
        }

        var datas = await (from ec in _context.EvaluationCriterias
                           join cc in _context.CategoryCriterias on ec.CategoryCriteriaId equals cc.Id into ccGroup
                           from cc in ccGroup.DefaultIfEmpty()
                           join u in _context.Units! on cc.UnitId equals u.Id into uGroup
                           from u in uGroup.DefaultIfEmpty()
                           join cr in _context.CategoryRatings on cc.CategoryRatingId equals cr.Id into crGroup
                           from cr in crGroup.DefaultIfEmpty()
                           where !ec.IsDeleted &&
                                 !cc.IsDeleted &&
                                 !u.IsDeleted &&
                                  ec.EvaluationId == evaluationId
                           orderby ec.Sort
                           select new CriteriaTreeCustomModel
                           {
                               CategoryCriteriaId = cc.Id,
                               EvaluationDetailPersonalId = null,
                               EvaluationCriteriaId = ec.Id,
                               ParentId = cc.ParentId,
                               STT = null,
                               CriteriaName = cc.CriteriaName,
                               IsDistinct = cc.IsDistinct,
                               EndValue = cr != null ? cr.EndValue : 0
                           }).ToListAsync();


        var map = new Dictionary<string, CriteriaTreeCustomModel>();

        // Tạo map với Id là khóa
        foreach (var item in datas)
        {
            var key = item.CategoryCriteriaId.ToString() ?? string.Empty;
            map[key] = item;
        }

        // Tạo danh sách cho cây menu
        var menuTree = new List<CriteriaTreeCustomModel>();

        // Duyệt qua các phần tử để xây dựng cây
        foreach (var item in datas)
        {
            var parentId = item.ParentId?.ToString();

            if (string.IsNullOrEmpty(parentId) || !map.ContainsKey(parentId))
            {
                // Phần tử cấp cao nhất hoặc không có cha hợp lệ
                menuTree.Add(item);
            }
            else
            {
                // Phần tử con
                var parentItem = map[parentId];
                parentItem.Children.Add(item);
            }
        }

        // Xử lý điểm cho từng tiêu chí

        var getEvaluationsDetailsPersonal = await _context.EvaluationDetailsPersonals.Where(e => e.EvaluationId == evaluationId).ToListAsync();

        var getEvaluationsDetailsSupervisor = await _context.EvaluationDetailsSupervisors.Where(e => e.EvaluationId == evaluationId).ToListAsync();

        var getEvaluationsSupervisor = await _context.EvaluationUsers.Where(e => e.EvaluationId == evaluationId && e.Type == 2).OrderBy(e => e.Sort).ToListAsync();

        var totalPoints = new Dictionary<string, int?>();

        var endValueTotals = new Dictionary<Guid, int>();


        for (int i = 0; i < menuTree.Count; i++)
        {
            // Gán STT cho các phần tử trong cây
            AssignSTTNew(menuTree[i], (i + 1).ToString());

            // Xử lý điểm cho từng tiêu chí
            ProcessPointUser(menuTree[i], userCurrentId, getEvaluationsDetailsPersonal, getEvaluationsDetailsSupervisor, getEvaluationsSupervisor);

            // Cộng dồn điểm cho các nút lá
            AggregateLeafPoints(menuTree[i], totalPoints);

        }

        response.ListCriterias = menuTree;

        response.TotalEndValue = CalculateTotalEndValue(menuTree);

        foreach (var item in totalPoints)
        {
            response.ListTotal.Add(item.Value ?? 0);
        }


        return response;
    }

    public async Task<CriteriaTreeResponseModel> CriteriaToTreeWithSupervisor(Guid evaluationId, Guid userCurrentId, Guid userId)
    {

        var response = new CriteriaTreeResponseModel();

        var evaluations = await _context.Evaluations.Where(e => e.Id == evaluationId).FirstOrDefaultAsync();

        if (evaluations == null)
        {
            return response;
        }
        else
        {
            response.EvaluationId = evaluations.Id;
            response.EvaluationName = evaluations.EvaluationName;
        }

        var datas = await (from ec in _context.EvaluationCriterias
                           join cc in _context.CategoryCriterias on ec.CategoryCriteriaId equals cc.Id into ccGroup
                           from cc in ccGroup.DefaultIfEmpty()
                           join u in _context.Units! on cc.UnitId equals u.Id into uGroup
                           from u in uGroup.DefaultIfEmpty()
                           join cr in _context.CategoryRatings on cc.CategoryRatingId equals cr.Id into crGroup
                           from cr in crGroup.DefaultIfEmpty()
                           where !ec.IsDeleted &&
                                 !cc.IsDeleted &&
                                 !u.IsDeleted &&
                                  ec.EvaluationId == evaluationId
                           orderby ec.Sort
                           select new CriteriaTreeCustomModel
                           {
                               CategoryCriteriaId = cc.Id,
                               EvaluationDetailPersonalId = null,
                               EvaluationCriteriaId = ec.Id,
                               ParentId = cc.ParentId,
                               STT = null,
                               CriteriaName = cc.CriteriaName,
                               IsDistinct = cc.IsDistinct,
                               EndValue = cr != null ? cr.EndValue : 0
                           }).ToListAsync();

        var map = new Dictionary<string, CriteriaTreeCustomModel>();

        // Tạo map với Id là khóa
        foreach (var item in datas)
        {
            var key = item.CategoryCriteriaId?.ToString() ?? string.Empty;
            map[key] = item;
        }

        // Tạo danh sách cho cây menu
        var menuTree = new List<CriteriaTreeCustomModel>();

        // Duyệt qua các phần tử để xây dựng cây
        foreach (var item in datas)
        {
            var parentId = item.ParentId?.ToString();

            if (string.IsNullOrEmpty(parentId) || !map.ContainsKey(parentId))
            {
                // Phần tử cấp cao nhất hoặc không có cha hợp lệ
                menuTree.Add(item);
            }
            else
            {
                // Phần tử con
                var parentItem = map[parentId];
                parentItem.Children.Add(item);
            }
        }

        // Xử lý điểm cho từng tiêu chí

        var getEvaluationsDetailsPersonal = await _context.EvaluationDetailsPersonals.Where(e => e.EvaluationId == evaluationId).ToListAsync();

        var getEvaluationsDetailsSupervisor = await _context.EvaluationDetailsSupervisors.Where(e => e.EvaluationId == evaluationId).ToListAsync();

        var getEvaluationsSupervisor = await _context.EvaluationUsers.Where(e => e.EvaluationId == evaluationId && e.Type == 2).OrderBy(e => e.Sort).ToListAsync();

        var totalPoints = new Dictionary<string, int?>();

        var endValueTotals = new Dictionary<Guid, int>();


        for (int i = 0; i < menuTree.Count; i++)
        {
            // Gán STT cho các phần tử trong cây
            AssignSTTNew(menuTree[i], (i + 1).ToString());

            // Xử lý điểm cho từng tiêu chí
            ProcessPointSupervisor(menuTree[i], userCurrentId, userId, getEvaluationsDetailsPersonal, getEvaluationsDetailsSupervisor, getEvaluationsSupervisor);

            // Cộng dồn điểm cho các nút lá
            AggregateLeafPoints(menuTree[i], totalPoints);

        }

        response.ListCriterias = menuTree;

        response.TotalEndValue = CalculateTotalEndValue(menuTree);

        foreach (var item in totalPoints)
        {
            response.ListTotal.Add(item.Value ?? 0);
        }

        return response;
    }



    private void AssignSTT(CriteriaOfUserModel model, string parentSTT)
    {
        model.STT = parentSTT;

        for (int i = 0; i < model.Children.Count; i++)
        {
            var childSTT = $"{parentSTT}.{i + 1}";
            AssignSTT(model.Children[i], childSTT);
        }
    }
    private void ProcessSupervisorEvaluations(CriteriaOfUserModel criteriaModel, List<SupervisorModel> supervisors, List<EvaluationDetailsPersonal> personalEvaluations, List<EvaluationDetailsSupervisor> supervisorEvaluations, Guid currentUserId)
    {
        if (criteriaModel.Children != null && criteriaModel.Children.Count > 0)
        {
            return;
        }
        else if (supervisors == null)
        {
            return;
        }

        Guid personalEvaluationId = criteriaModel.EvaluationDetailPersonalId ?? Guid.Empty;

        if (personalEvaluationId == Guid.Empty)
        {
            personalEvaluationId = personalEvaluations.FirstOrDefault(pe =>
                                    pe.EvaluationCriteriaId == criteriaModel.EvaluationCriteriaId &&
                                    pe.UserId == currentUserId)?.Id ?? Guid.Empty;
        }

        foreach (var supervisor in supervisors)
        {
            var supervisorEvaluation = supervisorEvaluations
                .FirstOrDefault(se => se.EvaluationDetailsPersonalId == personalEvaluationId
                                      && se.UserSupervisorId == supervisor.UserId
                                      && se.Status == 2);

            criteriaModel.SupervisorEvaluations.Add(new SupervisorEvaluationModel
            {
                EvaluationSupervisorId = supervisorEvaluation?.Id ?? Guid.Empty,
                AssessmentValueSupervisor = supervisorEvaluation?.AssessmentValueSupervisor ?? 0
            });
        }
    }
    private void ProcessPointUser(CriteriaTreeCustomModel listCriteriaTree, Guid userCurrentId, List<EvaluationDetailsPersonal> getEvaluationsDetailsPersonal, List<EvaluationDetailsSupervisor> getEvaluationsDetailsSupervisor, List<EvaluationUser> getEvaluationsSupervisor)
    {
        if (listCriteriaTree.Children == null || listCriteriaTree.Children.Count == 0)
        {
            var listPoint = new List<PointModel>();

            var evaluationsDetailsPersonal = getEvaluationsDetailsPersonal.FirstOrDefault(x => x.EvaluationCriteriaId == listCriteriaTree.EvaluationCriteriaId && x.UserId == userCurrentId && x.Status >= 1);

            if (evaluationsDetailsPersonal == null)
            {
                return;
            }

            listPoint.Add(new PointModel
            {
                Id = userCurrentId + "_User",
                UserId = userCurrentId,
                AssessmentValue = evaluationsDetailsPersonal?.AssessmentValue ?? 0
            }); // Lấy điểm cá nhân của từng tiêu chí

            foreach (var supervisor in getEvaluationsSupervisor)
            {
                var evaluationsDetailsSupervisor = getEvaluationsDetailsSupervisor.FirstOrDefault(x => x.EvaluationDetailsPersonalId == evaluationsDetailsPersonal!.Id && x.UserSupervisorId == supervisor.UserId && x.Status == 2);

                if (evaluationsDetailsSupervisor != null)
                {
                    listPoint.Add(new PointModel
                    {
                        Id = supervisor.UserId + "_Supervisor",
                        UserId = supervisor.UserId,
                        AssessmentValue = evaluationsDetailsSupervisor.AssessmentValueSupervisor
                    }); // Lấy điểm của từng người giám sát
                }
            }

            listCriteriaTree.ListPoints = listPoint;

        }
        else
        {
            int totalEndValue = 0;

            foreach (var item in listCriteriaTree.Children)
            {

                ProcessPointUser(item, userCurrentId, getEvaluationsDetailsPersonal, getEvaluationsDetailsSupervisor, getEvaluationsSupervisor);

                totalEndValue += item.EndValue;

            }

            // Tổng hợp điểm từ các con
            var aggregatedPoints = new List<PointModel>();
            foreach (var child in listCriteriaTree.Children)
            {
                if (child.ListPoints != null)
                {
                    foreach (var point in child.ListPoints)
                    {
                        var existingPoint = aggregatedPoints.FirstOrDefault(ap => ap.Id == point.Id);

                        if (existingPoint != null)
                        {
                            existingPoint.AssessmentValue += point.AssessmentValue;
                        }
                        else
                        {
                            aggregatedPoints.Add(new PointModel
                            {
                                Id = point.Id,
                                UserId = point.UserId,
                                AssessmentValue = point.AssessmentValue
                            });
                        }
                    }
                }
            }

            listCriteriaTree.ListPoints = aggregatedPoints;

            listCriteriaTree.EndValue = totalEndValue;

        }
    }
    private void ProcessPointSupervisor(CriteriaTreeCustomModel listCriteriaTree, Guid userCurrentId, Guid userId, List<EvaluationDetailsPersonal> getEvaluationsDetailsPersonal, List<EvaluationDetailsSupervisor> getEvaluationsDetailsSupervisor, List<EvaluationUser> getEvaluationsSupervisor)
    {

        if (listCriteriaTree.Children == null || listCriteriaTree.Children.Count == 0)
        {

            var listPoint = new List<PointModel>();

            var evaluationsDetailsPersonal = getEvaluationsDetailsPersonal.FirstOrDefault(x => x.EvaluationCriteriaId == listCriteriaTree.EvaluationCriteriaId && x.UserId == userId && x.Status >= 1);

            if (evaluationsDetailsPersonal == null)
            {
                return;
            }

            listPoint.Add(new PointModel
            {
                Id = userId + "_User",
                UserId = userId,
                AssessmentValue = evaluationsDetailsPersonal?.AssessmentValue ?? 0
            }); // Lấy điểm cá nhân của từng tiêu chí

            var indexCurrentUserId = getEvaluationsSupervisor.FindIndex(u => u.UserId == userCurrentId);

            int i = 0;

            foreach (var supervisor in getEvaluationsSupervisor)
            {
                var evaluationsDetailsSupervisor = getEvaluationsDetailsSupervisor.FirstOrDefault(x => x.EvaluationDetailsPersonalId == evaluationsDetailsPersonal!.Id && x.UserSupervisorId == supervisor.UserId && x.Status == 2);

                if (i > indexCurrentUserId)
                {
                    break;
                }

                if (evaluationsDetailsSupervisor != null)
                {
                    listPoint.Add(new PointModel
                    {
                        Id = supervisor.UserId + "_Supervisor",
                        UserId = supervisor.UserId,
                        AssessmentValue = evaluationsDetailsSupervisor.AssessmentValueSupervisor
                    }); // Lấy điểm của từng người giám sát
                }
                i++;
            }

            listCriteriaTree.ListPoints = listPoint;

        }
        else
        {
            int totalEndValue = 0;

            foreach (var item in listCriteriaTree.Children)
            {
                ProcessPointSupervisor(item, userCurrentId, userId, getEvaluationsDetailsPersonal, getEvaluationsDetailsSupervisor, getEvaluationsSupervisor);
                totalEndValue += item.EndValue;

            }


            // Tổng hợp điểm từ các con
            var aggregatedPoints = new List<PointModel>();
            foreach (var child in listCriteriaTree.Children)
            {
                if (child.ListPoints != null)
                {
                    foreach (var point in child.ListPoints)
                    {
                        var existingPoint = aggregatedPoints.FirstOrDefault(ap => ap.Id == point.Id);

                        if (existingPoint != null)
                        {
                            existingPoint.AssessmentValue += point.AssessmentValue;
                        }
                        else
                        {
                            aggregatedPoints.Add(new PointModel
                            {
                                Id = point.Id,
                                UserId = point.UserId,
                                AssessmentValue = point.AssessmentValue
                            });
                        }
                    }
                }
            }

            listCriteriaTree.ListPoints = aggregatedPoints;

            listCriteriaTree.EndValue = totalEndValue;

        }
    }
    private void AggregateLeafPoints(CriteriaTreeCustomModel node, Dictionary<string, int?> totalPoints)
    {
        if (node.Children == null || node.Children.Count == 0)
        {
            if (node.ListPoints != null)
            {
                foreach (var point in node.ListPoints)
                {
                    if (totalPoints.ContainsKey(point.Id))
                    {
                        totalPoints[point.Id] += point.AssessmentValue;
                    }
                    else
                    {
                        totalPoints[point.Id] = point.AssessmentValue;
                    }
                }
            }
        }
        else
        {
            foreach (var child in node.Children)
            {
                AggregateLeafPoints(child, totalPoints);
            }
        }
    }
    private void AssignSTTNew(CriteriaTreeCustomModel listCriteriaTree, string parentSTT)
    {
        listCriteriaTree.STT = parentSTT;

        for (int i = 0; i < listCriteriaTree.Children.Count; i++)
        {
            var childSTT = $"{parentSTT}.{i + 1}";
            AssignSTTNew(listCriteriaTree.Children[i], childSTT);
        }
    }
    private int CalculateTotalEndValue(List<CriteriaTreeCustomModel> criteriaList)
    {
        int totalEndValue = 0;

        foreach (var criteria in criteriaList)
        {
            if (criteria.Children != null && criteria.Children.Count > 0)
            {
                if (criteria.IsDistinct == true)
                {
                    int maxEndValue = criteria.Children.Max(child => child.EndValue);
                    totalEndValue += maxEndValue;
                }
                else
                {
                    totalEndValue += CalculateTotalEndValue(criteria.Children);
                }
            }
            else
            {
                totalEndValue += criteria.EndValue;
            }
        }

        return totalEndValue;
    }

}

