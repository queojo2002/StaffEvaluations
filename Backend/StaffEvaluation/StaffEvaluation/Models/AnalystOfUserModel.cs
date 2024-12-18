namespace StaffEvaluation.Models
{
    public class AnalystOfUserModel
    {
        public Guid UserId { get; set; }
        public DateTime StartTime { get; set; }
        public DateTime EndTime { get; set; }
    }
}
