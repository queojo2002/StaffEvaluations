﻿using AutoMapper;
using Microsoft.EntityFrameworkCore;
using StaffEvaluation.Data;
using StaffEvaluation.Data.Entity;
using StaffEvaluation.Helpers;
using StaffEvaluation.Models;
using StaffEvaluation.Models.Custom;
using StaffEvaluation.Repositories.IRepository;

namespace StaffEvaluation.Repositories.Repository;

public class EvaluationExplaintRepository : IEvaluationExplaintRepository
{
    private readonly DataContext _context;
    private readonly IMapper _mapper;

    public EvaluationExplaintRepository(DataContext context, IMapper mapper)
    {
        _context = context;
        _mapper = mapper;
    }



    public Task<PagedApiResponse<EvaluationExplaintModel>> GetAllPagedAsync(int pageNumber, int pageSize)
    {
        throw new NotImplementedException();
    }

    public async Task<PagedApiResponse<EvaluationExplaintModel>> GetAllCustomAsync(EvaluationExplaintGetPayload model, Guid userCurrentId)
    {
        if (model.UserIds == null)
        {
            model.UserIds = new List<Guid> { userCurrentId };
        }
        else
        {
            model.UserIds.Add(userCurrentId);
        }


        var datas = await _context.EvaluationExplaints
            .Where(ee => !ee.Evaluation!.IsDeleted &&
                         !ee.CategoryCriteria!.IsDeleted &&
                          ee.Evaluation!.Id == model.EvaluationId &&
                          ee.CategoryCriteria!.Id == model.CategoryCriteriaId &&
                          model.UserIds!.Contains(ee.User!.Id)
                          )
            .Select(ees => new EvaluationExplaintModel
            {
                Id = ees.Id,
                CategoryCriteriaId = ees.CategoryCriteria!.Id,
                EvaluationId = ees.Evaluation!.Id,
                UserId = ees.User!.Id,
                FullName = ees.User!.FullName,
                Note = ees.Note,
                FileAttachments = ees.FileAttachments,
                IsDeleted = ees.IsDeleted,
                UpdatedAt = ees.UpdatedAt
            }).OrderByDescending(e => e.UpdatedAt).ToListAsync();



        return new Pagination().HandleGetAllRespond(
            0,
            0,
            datas,
            datas.Count
        );
    }

    public Task<PagedApiResponse<EvaluationExplaintModel>> GetByIdAsync(Guid id)
    {
        throw new NotImplementedException();
    }

    public async Task<PagedApiResponse<EvaluationExplaintModel>> InsertAsync(EvaluationExplaintModel entity)
    {
        using var transaction = await _context.Database.BeginTransactionAsync();

        try
        {

            var evaluation = await _context.Evaluations.Where(e => e.Id == entity.EvaluationId && !e.IsDeleted).SingleOrDefaultAsync();

            var user = await _context.Users!.Where(u => u.Id == entity.UserId && !u.IsDeleted).SingleOrDefaultAsync();

            var categoryCriteria = await _context.CategoryCriterias!.Where(cc => cc.Id == entity.CategoryCriteriaId && !cc.IsDeleted).SingleOrDefaultAsync();

            if (evaluation == null || user == null || categoryCriteria == null)
            {
                return new ApiResult().Failure<EvaluationExplaintModel>($"Có lỗi khi thêm mới giải trình. Vui lòng liên hệ Quản trị viên.");
            }

            var ee = new EvaluationExplaint
            {
                Id = Guid.NewGuid(),
                Evaluation = evaluation,
                User = user,
                CategoryCriteria = categoryCriteria,
                Note = entity.Note,
                FileAttachments = entity.FileAttachments,
                IsDeleted = false,
                UpdatedAt = DateTime.Now
            };

            await _context.EvaluationExplaints.AddAsync(ee);

            await _context.SaveChangesAsync();

            await transaction.CommitAsync();

            return new ApiResult().Success<EvaluationExplaintModel>("Thêm giải trình thành công.");
        }
        catch (Exception ex)
        {
            await transaction.RollbackAsync();
            return new ApiResult().Failure<EvaluationExplaintModel>($"Lỗi khi thêm mới: {ex.Message}");
        }
    }

    public Task<PagedApiResponse<EvaluationExplaintModel>> RemoveRangeAsync(List<Guid> ids)
    {
        throw new NotImplementedException();
    }

    public Task<PagedApiResponse<EvaluationExplaintModel>> UpdateAsync(EvaluationExplaintModel entity)
    {
        throw new NotImplementedException();
    }
}
