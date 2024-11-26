namespace StaffEvaluation.Models.Custom;

public class AnalystDashBoard
{
    public int TotalEvaluations { get; set; }
    public int TotalUser { get; set; }
    public int TotalUnit { get; set; }

    public int TotalNowHTXSNV { get; set; }
    public int TotalNowHTTNV { get; set; }
    public int TotalNowHTNV { get; set; }
    public int TotalNowKHTNV { get; set; }
    public int TotalNowChuaThuchienHoanThanh { get; set; }

    public List<AnalystColumn>? AnalystColumns { get; set; }

}

public class AnalystColumn
{
    public string? Name { get; set; }
    public int Month { get; set; }
    public int Total { get; set; }
}

