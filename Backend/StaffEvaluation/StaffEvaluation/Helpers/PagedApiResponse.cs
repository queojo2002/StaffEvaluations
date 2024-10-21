namespace StaffEvaluation.Helpers;

public class PagedApiResponse<T>
{
    public T? Data { get; set; }
    public T[]? DataList { get; set; }
    public string Message { get; set; }
    public bool IsSuccess { get; set; }
    public int PageNumber { get; set; }
    public int PageSize { get; set; }
    public int TotalElements { get; set; }
    public int TotalPages { get; set; }

    public PagedApiResponse(T? data, T[]? dataList, string message, bool isSuccess, int pageNumber, int pageSize, int totalElements, int totalPages)
    {
        Data = data;
        DataList = dataList;
        Message = message;
        IsSuccess = isSuccess;
        PageNumber = pageNumber;
        PageSize = pageSize;
        TotalElements = totalElements;
        TotalPages = totalPages;
    }

    public PagedApiResponse() { }
}

