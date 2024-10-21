namespace StaffEvaluation.Helpers;

public class ApiResult
{
    public PagedApiResponse<T> Success<T>(string message)
    {
        return new PagedApiResponse<T>(
                default,
                Array.Empty<T>(),
                message,
                true,
                0,
                0,
                0,
                0
        );
    }

    public PagedApiResponse<T> Failure<T>(string message)
    {
        return new PagedApiResponse<T>(
                default,
                Array.Empty<T>(),
                message,
                false,
                0,
                0,
                0,
                0
        );
    }
}

