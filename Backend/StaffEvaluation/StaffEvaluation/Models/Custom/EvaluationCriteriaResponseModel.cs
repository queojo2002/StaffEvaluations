namespace StaffEvaluation.Models.Custom;

public class EvaluationCriteriaResponseModel
{
    public Guid EvaluationId { get; set; }
    public string? EvaluationName { get; set; }
    public List<CriteriaOfUserModel>? CriteriaList { get; set; } = new List<CriteriaOfUserModel>();
    public List<SupervisorModel>? SupervisorList { get; set; } = new List<SupervisorModel>();
}

