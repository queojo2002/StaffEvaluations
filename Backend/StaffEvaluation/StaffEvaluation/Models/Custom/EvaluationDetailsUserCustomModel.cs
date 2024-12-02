namespace StaffEvaluation.Models.Custom;

public class EvaluationDetailsModel
{
    public Guid EvaluationId { get; set; }
    public string? EvaluationName { get; set; }
    public List<CriteriaDataModel>? CriteriaData { get; set; } = new List<CriteriaDataModel>();

}

public class CriteriaDataModel
{
    public string? STT { get; set; }
    public Guid Id { get; set; } // Id của tiêu chí đánh giá
    public Guid? ParentId { get; set; } // Id này cho biết tiêu chí này có cha là tiêu chí nào
    public Guid? EvaluationCriteriaId { get; set; } // Id này là của bảng xem tiêu chí đánh giá này thuộc phiếu nào
    public Guid? EvaluationDetailPersonalId { get; set; }
    public string? CriteriaName { get; set; }
    public int Sort { get; set; }
    public int EndValue { get; set; } // Dòng này là điểm tối đa, tiêu chí cha sẽ tính tổng điểm của con
    public int AssessmentValue { get; set; } // Điểm của User
    public List<EvaluationScoreModel> AssessmentResults { get; set; } = new List<EvaluationScoreModel>();
    public List<CriteriaDataModel> Children { get; set; } = new List<CriteriaDataModel>();
}

public class EvaluationScoreModel
{
    public Guid UserId { get; set; }
    public string? FullName { get; set; }
    public string? UserTypeName { get; set; }
    public int Score { get; set; }
}