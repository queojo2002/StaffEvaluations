namespace StaffEvaluation.Models.Custom;

public class EvaluationDetailsPersonalCustomModel
{
    public Guid EvaluationId { get; set; }
    public int EvaluationStatus { get; set; }
    public Guid? UserId { get; set; }
    public List<CriteriaInEvaluationModel>? UserCriteriaEvaluations { get; set; }
    public EvaluationAAECustomModel? EvaluationDetails { get; set; }
}

public class CriteriaInEvaluationModel
{
    public Guid? Id { get; set; } // CategoryCriteriaId
    public Guid? EvaluationCriteriaId { get; set; }
    public Guid? EvaluationDetailPersonalId { get; set; }
    public int? AssessmentValue { get; set; }
    public int? AssessmentValueSupervisor { get; set; }
}

public class EvaluationAAECustomModel
{
    public string? Advantages { get; set; }
    public string? DisAdvantages { get; set; }
    public string? AddReviews { get; set; }
    public string? KetQuaHoatDongCoQuan { get; set; }
    public string? NangLucLanhDaoQuanLy { get; set; }
    public string? NangLucTapHopDoanKet { get; set; }
    public string? NhanXetUuKhuyetDiem { get; set; }
    public string? NhanDinhChieuHuongPhatTrien { get; set; }
}