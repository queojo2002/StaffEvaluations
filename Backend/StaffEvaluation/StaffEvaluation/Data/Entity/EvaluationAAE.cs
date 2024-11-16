using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace StaffEvaluation.Data.Entity;


[Table("EvaluationAAE")]
public class EvaluationAAE
{
    [Key]
    public Guid Id { get; set; }
    [ForeignKey("Evaluation")]
    public Guid EvaluationId { get; set; }
    [ForeignKey("UserId")]
    public User? User { get; set; }
    [ForeignKey("SupervisorId")]
    public User? Supervisor { get; set; }
    public string? Advantages { get; set; }
    public string? DisAdvantages { get; set; }
    public string? AddReviews { get; set; }
    public string? KetQuaHoatDongCoQuan { get; set; }
    public string? NangLucLanhDaoQuanLy { get; set; }
    public string? NangLucTapHopDoanKet { get; set; }
    public string? NhanXetUuKhuyetDiem { get; set; }
    public string? NhanDinhChieuHuongPhatTrien { get; set; }
    public bool IsDeleted { get; set; }
    public DateTime UpdatedAt { get; set; }
    public Evaluation? Evaluation { get; set; }
}

