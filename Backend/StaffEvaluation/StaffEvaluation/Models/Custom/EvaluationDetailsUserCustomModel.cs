namespace StaffEvaluation.Models.Custom;

public class EvaluationDetailsUserCustomModel
{
    public Guid EvaluationId { get; set; }
    public string? EvaluationName { get; set; }
    public List<CriteriaUserDataModel>? CriteriaUserData { get; set; } = new List<CriteriaUserDataModel>();

}

public class CriteriaUserDataModel
{
    public string? STT { get; set; }
    public Guid? CategoryCriteriaId { get; set; } // Id của tiêu chí đánh giá
    public Guid? ParentId { get; set; } // Id này cho biết tiêu chí này có cha là tiêu chí nào
    public Guid? EvaluationCriteriaId { get; set; } // Id này là của bảng xem tiêu chí đánh giá này thuộc phiếu nào
    public string? CriteriaName { get; set; }
    public int EndValue { get; set; } // Dòng này là điểm tối đa, tiêu chí cha sẽ tính tổng điểm của con
    public int AssessmentValue { get; set; } // Điểm của User
    public List<SupervisorsScoreOfUserModel> Supervisors { get; set; } = new List<SupervisorsScoreOfUserModel>();
    public List<CriteriaUserDataModel> Children { get; set; } = new List<CriteriaUserDataModel>();
}

public class SupervisorsScoreOfUserModel
{
    public Guid EvaluationSupervisorId { get; set; }
    public string? FullName { get; set; }
    public string? UnitName { get; set; }
    public string? UserTypeName { get; set; }
    public string? PositionsName { get; set; }
    public int AssessmentValueSupervisor { get; set; }
}