using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace StaffEvaluation.Migrations
{
    public partial class UpdateDb1311 : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<int>(
                name: "Status",
                table: "EvaluationDetailsSupervisor",
                type: "int",
                nullable: false,
                defaultValue: 0);

            migrationBuilder.AddColumn<int>(
                name: "Status",
                table: "EvaluationDetailsPersonal",
                type: "int",
                nullable: false,
                defaultValue: 0);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "Status",
                table: "EvaluationDetailsSupervisor");

            migrationBuilder.DropColumn(
                name: "Status",
                table: "EvaluationDetailsPersonal");
        }
    }
}
