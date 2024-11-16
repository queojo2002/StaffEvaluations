namespace StaffEvaluation.Models.Custom;

public class CriteriaOfUserModel
{
    public Guid Id { get; set; }
    public Guid? EvaluationDetailPersonalId { get; set; }
    public Guid? EvaluationCriteriaId { get; set; }
    public string? STT { get; set; }
    public string? CriteriaName { get; set; }
    public Guid? ParentId { get; set; }
    public int? StartValue { get; set; }
    public int? EndValue { get; set; }
    public bool? IsDistinct { get; set; }
    public int Sort { get; set; }
    public int? AssessmentValue { get; set; }
    public int? AssessmentValueSupervisor { get; set; }
    public List<SupervisorEvaluationModel> SupervisorEvaluations { get; set; } = new List<SupervisorEvaluationModel>();
    public List<CriteriaOfUserModel> Children { get; set; } = new List<CriteriaOfUserModel>();
}



