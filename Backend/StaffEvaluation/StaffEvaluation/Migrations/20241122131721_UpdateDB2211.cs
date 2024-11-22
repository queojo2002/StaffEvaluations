using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace StaffEvaluation.Migrations
{
    public partial class UpdateDB2211 : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<string>(
                name: "ActivationCode",
                table: "User",
                type: "nvarchar(max)",
                nullable: true);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "ActivationCode",
                table: "User");
        }
    }
}
