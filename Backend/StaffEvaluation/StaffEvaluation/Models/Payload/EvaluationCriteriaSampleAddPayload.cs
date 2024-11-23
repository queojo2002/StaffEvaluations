namespace StaffEvaluation.Models.Payload;

public class EvaluationCriteriaSampleAddPayload
{
    public Guid EvaluationSampleId { get; set; }
    public List<Guid>? ListCategoryCriteriaId { get; set; }
}

