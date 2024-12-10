namespace StaffEvaluation.Models;




public class AnalystOfUnitResponseModel
{
    public string? EvaluationName { get; set; }
    public string? UnitName { get; set; }
    public string? FullName { get; set; }
    public int AssessmentValue { get; set; }
    public int AssessmentValueSupervisor { get; set; }
    public string? ProsConsContent { get; set; }
}


public class AnalystOfUnitsModel
{
    public int TotalEvaluation { get; set; }
    public int TotalUser { get; set; }
    public int TotalKHTNV { get; set; }
    public int TotalHTNV { get; set; }
    public int TotalHTTNV { get; set; }
    public int TotalHTXSNV { get; set; }
    public List<AnalystOfUnitResponseModel>? AnalystOfUnitsRespons { get; set; }
}
