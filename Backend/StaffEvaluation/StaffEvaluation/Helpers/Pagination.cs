namespace StaffEvaluation.Helpers;

public class Pagination
{
    /// <summary>
    /// This function handles pagination when the client retrieves values from the database.
    /// </summary>
    /// <param name="pageNumber">Current page number.</param>
    /// <param name="pageSize">Number of records per page.</param>
    /// <param name="lstObject">List of data retrieved from the database table.</param>
    /// <param name="countRecord">Total number of records from the database table.</param>
    /// <typeparam name="T">Generic type representing the data model.</typeparam>
    /// <returns>Returns a ApiResult response containing paginated data.</returns>
    public PagedApiResponse<T> HandleGetAllRespond<T>(int pageNumber, int pageSize, IEnumerable<T> lstObject, int countRecord)
    {
        var enumerable = lstObject as T[] ?? lstObject.ToArray();

        if (!enumerable.Any())
        {
            return new PagedApiResponse<T>(
                default,
                Array.Empty<T>(),
                "Không tìm thấy dữ liệu!",
                false,
                0,
                0,
                0,
                0
            );
        }

        if (pageNumber != 0 && pageSize != 0)
        {
            if (pageNumber < 1)
            {
                pageNumber = 1;
            }

            lstObject = enumerable.Skip((pageNumber - 1) * pageSize).Take(pageSize);
        }

        var numPageSize = pageSize == 0 ? 1 : pageSize;

        return new PagedApiResponse<T>(
            default,
            lstObject?.ToArray(),
            "Lấy danh sách thành công!",
            true,
            pageNumber,
            pageSize,
            countRecord,
            (int)Math.Ceiling((double)countRecord / numPageSize)
        );
    }

    /// <summary>
    /// This service handles the retrieval of data by id.
    /// </summary>
    /// <param name="lstObject">The object retrieved by id.</param>
    /// <typeparam name="T">Generic type representing the data model.</typeparam>
    /// <returns>Returns a TemplateApi response with the retrieved data.</returns>
    public PagedApiResponse<T> HandleGetByIdRespond<T>(T lstObject)
    {
        if (lstObject is null)
        {
            return new PagedApiResponse<T>(
                lstObject,
                null,
                "Không tìm thấy dữ liệu!",
                false,
                0,
                0,
                0,
                0
            );
        }

        return new PagedApiResponse<T>(
            lstObject,
            null,
            "Lấy thông tin thành công!",
            true,
            0,
            0,
            1,
            0
        );
    }
}

