namespace StaffEvaluation.Models.Payload;

public class EvaluationCriteriaUpdateSortPayload
{
    public Guid EvaluationId { get; set; }
    public List<CriteriaUpdateSortPayload>? ListCategoryCriterias { get; set; }
}

public class CriteriaUpdateSortPayload
{
    public Guid CategoryCriteriaId { get; set; }
    public int Sort { get; set; }
}

