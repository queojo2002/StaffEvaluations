namespace StaffEvaluation.Models.Custom;

public class CriteriaTreeResponseModel
{
    public Guid EvaluationId { get; set; }
    public string? EvaluationName { get; set; }
    public int TotalEndValue { get; set; } // Tổng điểm của cột điểm tối đa
    public List<int> ListTotal { get; set; } = new List<int>(); // Tổng điểm của từng cột dựa vào ListCriterias
    public List<CriteriaTreeCustomModel>? ListCriterias { get; set; } = new List<CriteriaTreeCustomModel>();
}


public class CriteriaTreeCustomModel
{
    public Guid? CategoryCriteriaId { get; set; }
    public Guid? EvaluationDetailPersonalId { get; set; }
    public Guid? EvaluationCriteriaId { get; set; }
    public Guid? ParentId { get; set; }
    public string? STT { get; set; }
    public string? CriteriaName { get; set; }
    public bool? IsDistinct { get; set; }
    public int EndValue { get; set; } // Dòng này là điểm tối đa, tiêu chí cha sẽ tính tổng điểm của con
    public List<PointModel> ListPoints { get; set; } = new List<PointModel>();
    public List<CriteriaTreeCustomModel> Children { get; set; } = new List<CriteriaTreeCustomModel>();

}


public class PointModel
{
    public string Id { get; set; } = string.Empty;
    public Guid UserId { get; set; } // Có thể là user hoặc là cấp trên
    public int? AssessmentValue { get; set; } // Sẽ không có điểm nếu nó là cha, nếu là cha và không có con thì sẽ có điểm
    public int? AssessmentSum { get; set; } // Tính toàn bộ điểm của con của nó nếu nó là cha
}