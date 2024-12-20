﻿using AutoMapper;
using Microsoft.EntityFrameworkCore;
using StaffEvaluation.Data;
using StaffEvaluation.Data.Entity;
using StaffEvaluation.Helpers;
using StaffEvaluation.Models;
using StaffEvaluation.Models.Payload;
using StaffEvaluation.Repositories.IRepository;
using System.Data;

namespace StaffEvaluation.Repositories.Repository;

public class EvaluationUserRepository : IEvaluationUserRepository
{

    private DataContext _context;
    private IMapper _mapper;
    private IUnitRepository _unitRepository;

    public EvaluationUserRepository(DataContext context, IMapper mapper, IUnitRepository unitRepository)
    {
        _context = context;
        _mapper = mapper;
        _unitRepository = unitRepository;
    }

    public Task<PagedApiResponse<EvaluationUserModel>> GetAllPagedAsync(int pageNumber, int pageSize)
    {
        throw new NotImplementedException();
    }

    public Task<PagedApiResponse<EvaluationUserModel>> GetByIdAsync(Guid id)
    {
        throw new NotImplementedException();
    }

    public async Task<PagedApiResponse<UserModel>> GetAllNonSupervisorUsersAsync(Guid evaluationId, Guid unitCurrentId)
    {
        var evaluation = await _context.Evaluations.Where(e => e.Id == evaluationId && !e.IsDeleted).SingleOrDefaultAsync();

        if (evaluation == null)
        {
            return new ApiResult().Failure<UserModel>("Không tìm thấy thông tin hoặc đã bị xóa.");
        }

        var unitIdsRaw = await _unitRepository.GetAllChildOfUnitAsync(unitCurrentId);

        var unitIds = unitIdsRaw.DataList!.Select(e => e.Id).ToList();

        var allowedUserIds = await _context.EvaluationUsers
            .Where(eu => eu.EvaluationId == evaluationId && eu.Type == 2 && !eu.IsDeleted)
            .Select(eu => eu.UserId)
            .ToListAsync();

        var datas = await _context.Users!
            .Where(user => !allowedUserIds.Contains(user.Id) && unitIds.Contains(user.UnitId) && !user.IsDeleted)
            .Select(user => new UserModel
            {
                Id = user.Id,
                UserTypeId = user.UserTypeId,
                UserTypeName = user.UserType!.UserTypeName,
                UnitName = user.Unit!.UnitName,
                UnitId = user.UnitId,
                FullName = user.FullName,
                Email = user.Email,
                Password = null,
                Phone = user.Phone,
                Address = user.Address,
                Birthday = user.Birthday,
                PositionsName = user.PositionsName,
                IsActive = user.IsActive,
                IsDeleted = user.IsDeleted,
                UpdatedAt = user.UpdatedAt,
            }).OrderBy(e => e.FullName).ToListAsync();

        return new Pagination().HandleGetAllRespond(0, 0, datas, datas.Count);
    }

    public async Task<PagedApiResponse<UserModel>> GetSupervisorsForEvaluation(Guid evaluationId)
    {
        var datas = await (from eu in _context.EvaluationUsers
                           join user in _context.Users! on eu.UserId equals user.Id
                           where !eu.IsDeleted && !user.IsDeleted && eu.Type == 2 && eu.EvaluationId == evaluationId
                           select new UserModel
                           {
                               Id = user.Id,
                               UserTypeId = user.UserTypeId,
                               UserTypeName = user.UserType!.UserTypeName,
                               UnitName = user.Unit!.UnitName,
                               UnitId = user.UnitId,
                               FullName = user.FullName,
                               Email = user.Email,
                               Password = null,
                               Phone = user.Phone,
                               Address = user.Address,
                               Birthday = user.Birthday,
                               PositionsName = user.PositionsName,
                               IsActive = user.IsActive,
                               Sort = eu.Sort,
                               IsManager = eu.IsManager,
                               IsDeleted = user.IsDeleted,
                               UpdatedAt = user.UpdatedAt,
                           }).OrderBy(e => e.Sort).ToListAsync();


        return new Pagination().HandleGetAllRespond(0, 0, datas, datas.Count);
    }

    public async Task<PagedApiResponse<UserModel>> GetUsersAllowedToEvaluate(Guid evaluationId, Guid unitCurrentId)
    {
        var evaluation = await _context.Evaluations.Where(e => e.Id == evaluationId && !e.IsDeleted).SingleOrDefaultAsync();

        if (evaluation == null)
        {
            return new ApiResult().Failure<UserModel>("Không tìm thấy thông tin hoặc đã bị xóa.");
        }

        var unitIdsRaw = await _unitRepository.GetAllChildOfUnitAsync(unitCurrentId);

        var unitIds = unitIdsRaw.DataList!.Select(e => e.Id).ToList();

        var allowedUserIds = await _context.EvaluationUsers
            .Where(eu => eu.EvaluationId == evaluationId && !eu.IsDeleted && eu.Type == 1)
            .Select(eu => eu.UserId)
            .ToListAsync();

        var datas = await _context.Users!
            .Where(user => allowedUserIds.Contains(user.Id) && unitIds.Contains(user.UnitId) && !user.IsDeleted)
            .Select(user => new UserModel
            {
                Id = user.Id,
                UserTypeId = user.UserTypeId,
                UserTypeName = user.UserType!.UserTypeName,
                UnitName = user.Unit!.UnitName,
                UnitId = user.UnitId,
                FullName = user.FullName,
                Email = user.Email,
                Password = null,
                Phone = user.Phone,
                Address = user.Address,
                Birthday = user.Birthday,
                PositionsName = user.PositionsName,
                Status = false,
                IsActive = user.IsActive,
                IsDeleted = user.IsDeleted,
                UpdatedAt = user.UpdatedAt,
            }).OrderBy(e => e.FullName).ToListAsync();


        foreach (var item in datas)
        {
            var checkEdp = await _context.EvaluationDetailsPersonals.Where(e => e.UserId == item.Id && e.EvaluationId == evaluationId && e.Status >= 2).FirstOrDefaultAsync();

            if (checkEdp == null) continue;

            item.Status = true;
        }


        return new Pagination().HandleGetAllRespond(0, 0, datas, datas.Count);
    }

    public async Task<PagedApiResponse<UserModel>> GetUsersNotAllowedToEvaluate(Guid evaluationId, Guid unitCurrentId)
    {
        var evaluation = await _context.Evaluations.Where(e => e.Id == evaluationId && !e.IsDeleted).SingleOrDefaultAsync();

        if (evaluation == null)
        {
            return new ApiResult().Failure<UserModel>("Không tìm thấy thông tin hoặc đã bị xóa.");
        }

        var unitIdsRaw = await _unitRepository.GetAllChildOfUnitAsync(unitCurrentId);

        var unitIds = unitIdsRaw.DataList!.Select(e => e.Id).ToList();


        var allowedUserIds = await _context.EvaluationUsers
            .Where(eu => eu.EvaluationId == evaluationId && !eu.IsDeleted && eu.Type == 1)
            .Select(eu => eu.UserId)
            .ToListAsync();

        var datas = await _context.Users!
            .Where(user => !allowedUserIds.Contains(user.Id) && unitIds.Contains(user.UnitId) && !user.IsDeleted)
            .Select(user => new UserModel
            {
                Id = user.Id,
                UserTypeId = user.UserTypeId,
                UserTypeName = user.UserType!.UserTypeName,
                UnitName = user.Unit!.UnitName,
                UnitId = user.UnitId,
                FullName = user.FullName,
                Email = user.Email,
                Password = null,
                Phone = user.Phone,
                Address = user.Address,
                Birthday = user.Birthday,
                PositionsName = user.PositionsName,
                IsActive = user.IsActive,
                IsDeleted = user.IsDeleted,
                UpdatedAt = user.UpdatedAt,
            }).OrderBy(e => e.FullName).ToListAsync();

        return new Pagination().HandleGetAllRespond(0, 0, datas, datas.Count);
    }


    public Task<PagedApiResponse<EvaluationUserModel>> InsertAsync(EvaluationUserModel entity)
    {
        throw new NotImplementedException();
    }

    public async Task<PagedApiResponse<EvaluationUserModel>> InsertUserIntoEvaluationAsync(EvaluationUserAddPayload model)
    {
        if (model.UserIds == null)
        {
            return new ApiResult().Failure<EvaluationUserModel>("Danh sách người dùng không được để trống.");
        }

        using var transaction = await _context.Database.BeginTransactionAsync();

        try
        {
            var checkE = await _context.Evaluations.Where(e => e.Status != 0 && e.Id == model.EvaluationId).FirstOrDefaultAsync();

            if (checkE != null)
            {
                return new ApiResult().Failure<EvaluationUserModel>("Phiếu đánh giá này đã được tổng hợp và chuyển nên không thể thao tác được nữa.");
            }

            foreach (var userId in model.UserIds)
            {
                EvaluationUser eu = new EvaluationUser
                {
                    Id = Guid.NewGuid(),
                    UserId = userId,
                    EvaluationId = model.EvaluationId,
                    Type = 1,
                    Sort = 0,
                    IsDeleted = false,
                    UpdatedAt = DateTime.Now,
                };

                await _context.AddAsync(eu);

                await _context.SaveChangesAsync();
            }

            await transaction.CommitAsync();

            return new ApiResult().Success<EvaluationUserModel>("Thêm mới người dùng vào phiếu đánh giá thành công.");
        }
        catch (Exception ex)
        {
            await transaction.RollbackAsync();

            return new ApiResult().Failure<EvaluationUserModel>($"Lỗi khi thêm người dùng vào phiếu đánh: {ex.Message}");
        }
    }

    public Task<PagedApiResponse<EvaluationUserModel>> RemoveRangeAsync(List<Guid> ids)
    {
        throw new NotImplementedException();
    }

    public async Task<PagedApiResponse<EvaluationUserModel>> RemoveUserFromEvaluationAsync(EvaluationUserAddPayload model)
    {
        if (model.UserIds == null)
        {
            return new ApiResult().Failure<EvaluationUserModel>("Danh sách người dùng không được để trống.");
        }


        using var transaction = await _context.Database.BeginTransactionAsync();

        try
        {
            var checkE = await _context.Evaluations.Where(e => e.Status != 0 && e.Id == model.EvaluationId).FirstOrDefaultAsync();

            if (checkE != null)
            {
                return new ApiResult().Failure<EvaluationUserModel>("Phiếu đánh giá này đã được tổng hợp và chuyển nên không thể thao tác được nữa.");
            }

            var evaluationUserToDelete = await _context.EvaluationUsers
                .Where(c => model.UserIds.Contains(c.UserId) && c.EvaluationId == model.EvaluationId && c.Type == 1)
                .ToListAsync();

            if (!evaluationUserToDelete.Any())
            {
                return new ApiResult().Failure<EvaluationUserModel>("Không tìm thấy dữ liệu nào để xóa.");
            }

            _context.EvaluationUsers.RemoveRange(evaluationUserToDelete);

            await _context.SaveChangesAsync();
            await transaction.CommitAsync();

            return new ApiResult().Success<EvaluationUserModel>("Xóa thành công các người dùng khỏi phiếu đánh giá.");
        }
        catch (Exception ex)
        {
            await transaction.RollbackAsync();

            return new ApiResult().Failure<EvaluationUserModel>($"Lỗi khi xóa người dùng khỏi phiếu đánh giá: {ex.Message}");
        }
    }

    public Task<PagedApiResponse<EvaluationUserModel>> UpdateAsync(EvaluationUserModel entity)
    {
        throw new NotImplementedException();
    }



    public async Task<PagedApiResponse<EvaluationUserModel>> InsertSupervisorIntoEvaluationAsync(EvaluationUserAddSupervisorPayload model)
    {

        var checkExist = await _context.EvaluationUsers.Where(e => e.UserId == model.UserId && e.EvaluationId == model.EvaluationId && e.Type == 2).SingleOrDefaultAsync();

        if (checkExist != null)
        {
            return new ApiResult().Success<EvaluationUserModel>("Người dùng này đã là giám sát viên rồi.");
        }

        if (model.IsManager == true)
        {
            var check = await _context.EvaluationUsers.Where(e => e.EvaluationId == model.EvaluationId && e.Type == 2 && e.IsManager == true).FirstOrDefaultAsync();

            if (check != null)
            {
                return new ApiResult().Failure<EvaluationUserModel>("Phiếu đánh giá này đã có trưởng đợt đánh giá rồi!");
            }
        }

        var checkIsEvaluation = await _context.EvaluationDetailsPersonals.Where(e => e.EvaluationId == model.EvaluationId).FirstOrDefaultAsync();

        if (checkIsEvaluation != null)
        {
            return new ApiResult().Failure<EvaluationUserModel>("Phiếu này đã có dữ liệu đánh giá nên không thể chỉnh sửa giám sát viên được nữa!");
        }


        var checkE = await _context.Evaluations.Where(e => e.Status != 0 && e.Id == model.EvaluationId).FirstOrDefaultAsync();

        if (checkE != null)
        {
            return new ApiResult().Failure<EvaluationUserModel>("Phiếu đánh giá này đã được tổng hợp và chuyển nên không thể thao tác được nữa.");
        }


        using var transaction = await _context.Database.BeginTransactionAsync();

        try
        {

            EvaluationUser eu = new EvaluationUser
            {
                Id = Guid.NewGuid(),
                UserId = model.UserId,
                EvaluationId = model.EvaluationId,
                Type = 2,
                Sort = model.Sort ?? 1,
                IsManager = model.IsManager,
                IsDeleted = false,
                UpdatedAt = DateTime.Now,
            };

            await _context.AddAsync(eu);

            await _context.SaveChangesAsync();


            await transaction.CommitAsync();

            return new ApiResult().Success<EvaluationUserModel>("Thêm mới giám sát viên vào phiếu đánh giá thành công.");
        }
        catch (Exception ex)
        {
            await transaction.RollbackAsync();

            return new ApiResult().Failure<EvaluationUserModel>($"Lỗi khi thêm giám sát viên vào phiếu đánh: {ex.Message}");
        }
    }

    public async Task<PagedApiResponse<EvaluationUserModel>> RemoveSupervisorFromEvaluationAsync(EvaluationUserAddSupervisorPayload model)
    {

        var checkIsEvaluation = await _context.EvaluationDetailsPersonals.Where(e => e.EvaluationId == model.EvaluationId).FirstOrDefaultAsync();

        if (checkIsEvaluation != null)
        {
            return new ApiResult().Failure<EvaluationUserModel>("Phiếu này đã có dữ liệu đánh giá nên không thể chỉnh sửa giám sát viên được nữa!");
        }

        var checkE = await _context.Evaluations.Where(e => e.Status != 0 && e.Id == model.EvaluationId).FirstOrDefaultAsync();

        if (checkE != null)
        {
            return new ApiResult().Failure<EvaluationUserModel>("Phiếu đánh giá này đã được tổng hợp và chuyển nên không thể thao tác được nữa.");
        }


        using var transaction = await _context.Database.BeginTransactionAsync();

        try
        {
            var evaluationUserToDelete = await _context.EvaluationUsers
                .Where(eu => eu.EvaluationId == model.EvaluationId && eu.UserId == model.UserId && eu.Type == 2)
                .SingleOrDefaultAsync();

            if (evaluationUserToDelete == null)
            {
                return new ApiResult().Failure<EvaluationUserModel>("Không tìm thấy dữ liệu nào để xóa.");
            }

            _context.EvaluationUsers.Remove(evaluationUserToDelete);

            await _context.SaveChangesAsync();

            await transaction.CommitAsync();

            return new ApiResult().Success<EvaluationUserModel>("Xóa giám sát viên khỏi phiếu đánh giá.");
        }
        catch (Exception ex)
        {
            await transaction.RollbackAsync();

            return new ApiResult().Failure<EvaluationUserModel>($"Lỗi khi xóa giám sát viên khỏi phiếu đánh giá: {ex.Message}");
        }
    }


}

