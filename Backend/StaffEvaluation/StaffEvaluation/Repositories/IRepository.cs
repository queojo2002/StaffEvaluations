using StaffEvaluation.Helpers;

namespace StaffEvaluation.Repositories;

public interface IRepository<T> where T : class
{
    Task<PagedApiResponse<T>> GetAllPagedAsync(int pageNumber, int pageSize);
    Task<PagedApiResponse<T>> GetByIdAsync(Guid id);
    Task<PagedApiResponse<T>> UpdateAsync(T entity);
    Task<PagedApiResponse<T>> InsertAsync(T entity);
    Task<PagedApiResponse<T>> RemoveRangeAsync(List<Guid> ids);
}

