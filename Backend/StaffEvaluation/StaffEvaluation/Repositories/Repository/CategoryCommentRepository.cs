using AutoMapper;
using Microsoft.EntityFrameworkCore;
using StaffEvaluation.Data;
using StaffEvaluation.Data.Entity;
using StaffEvaluation.Helpers;
using StaffEvaluation.Models;
using StaffEvaluation.Repositories.IRepository;

namespace StaffEvaluation.Repositories.Repository;

public class CategoryCommentRepository : ICategoryCommentRepository
{
    private DataContext _context;
    private IMapper _mapper;

    public CategoryCommentRepository(DataContext context, IMapper mapper)
    {
        _context = context;
        _mapper = mapper;
    }

    public async Task<PagedApiResponse<CategoryCommentModel>> GetAllPagedAsync(int pageNumber, int pageSize)
    {
        var comments = await _context.CategoryComments.Where(e => !e.IsDeleted).OrderBy(e => e.Sort).ToListAsync();

        var mapComments = _mapper.Map<List<CategoryCommentModel>>(comments);

        return new Pagination().HandleGetAllRespond(
            pageNumber,
            pageSize,
            mapComments,
            comments.Count
        );
    }

    public async Task<PagedApiResponse<CategoryCommentModel>> GetByIdAsync(Guid id)
    {
        var comment = await _context.CategoryComments.FindAsync(id);

        if (comment == null)
        {
            return new ApiResult().Failure<CategoryCommentModel>("Không tìm thấy dữ liệu");
        }

        var mapComment = _mapper.Map<CategoryCommentModel>(comment);

        return new Pagination().HandleGetByIdRespond(mapComment);

    }

    public async Task<PagedApiResponse<CategoryCommentModel>> InsertAsync(CategoryCommentModel entity)
    {
        using var transaction = await _context.Database.BeginTransactionAsync();

        try
        {
            var categoryComment = new CategoryComment
            {
                Id = Guid.NewGuid(),
                Title = entity.Title,
                Content = entity.Content,
                Sort = entity.Sort,
                IsDeleted = false,
                UpdatedAt = DateTime.Now
            };

            await _context.CategoryComments!.AddAsync(categoryComment);
            await _context.SaveChangesAsync();

            await transaction.CommitAsync();

            return new ApiResult().Success<CategoryCommentModel>("Thêm mới nhận xét thành công.");
        }
        catch (Exception ex)
        {
            await transaction.RollbackAsync();
            return new ApiResult().Failure<CategoryCommentModel>($"Lỗi khi thêm mới nhận xét: {ex.Message}");
        }
    }

    public async Task<PagedApiResponse<CategoryCommentModel>> RemoveRangeAsync(List<Guid> ids)
    {
        using var transaction = await _context.Database.BeginTransactionAsync();

        try
        {
            var commentsToRemove = await _context.CategoryComments!
                .Where(cr => ids.Contains(cr.Id) && !cr.IsDeleted)
                .ToListAsync();

            if (!commentsToRemove.Any())
            {
                return new ApiResult().Failure<CategoryCommentModel>("Không tìm thấy nhận xét nào để xóa.");
            }

            foreach (var comment in commentsToRemove)
            {
                comment.IsDeleted = true;
                comment.UpdatedAt = DateTime.Now;
            }

            await _context.SaveChangesAsync();
            await transaction.CommitAsync();

            return new ApiResult().Success<CategoryCommentModel>("Xóa thành công các thang điểm.");
        }
        catch (Exception ex)
        {
            await transaction.RollbackAsync();
            return new ApiResult().Failure<CategoryCommentModel>($"Lỗi khi xóa thang điểm: {ex.Message}");
        }
    }

    public async Task<PagedApiResponse<CategoryCommentModel>> UpdateAsync(CategoryCommentModel entity)
    {
        if (entity.Id == Guid.Empty)
        {
            return new ApiResult().Failure<CategoryCommentModel>("ID nhận xét không hợp lệ.");
        }

        using var transaction = await _context.Database.BeginTransactionAsync();

        try
        {
            var commentToUpdate = await _context.CategoryComments!.FindAsync(entity.Id);

            if (commentToUpdate == null || commentToUpdate.IsDeleted)
            {
                return new ApiResult().Failure<CategoryCommentModel>("Nhận xét không tồn tại hoặc đã bị xóa.");
            }

            commentToUpdate.Title = entity.Title;
            commentToUpdate.Content = entity.Content;
            commentToUpdate.Sort = entity.Sort;
            commentToUpdate.UpdatedAt = DateTime.Now;

            await _context.SaveChangesAsync();
            await transaction.CommitAsync();

            return new ApiResult().Success<CategoryCommentModel>("Cập nhật nhận xét đánh giá thành công.");
        }
        catch (Exception ex)
        {
            await transaction.RollbackAsync();
            return new ApiResult().Failure<CategoryCommentModel>($"Lỗi khi cập nhật nhận xét đánh giá: {ex.Message}");
        }
    }
}

