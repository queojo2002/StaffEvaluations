using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace StaffEvaluation.Migrations
{
    public partial class UpdateDB2311 : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateTable(
                name: "EvaluationSample",
                columns: table => new
                {
                    Id = table.Column<Guid>(type: "uniqueidentifier", nullable: false),
                    EvaluationSampleName = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    IsDeleted = table.Column<bool>(type: "bit", nullable: false),
                    UpdatedAt = table.Column<DateTime>(type: "datetime2", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_EvaluationSample", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "EvaluationCriteriaSample",
                columns: table => new
                {
                    Id = table.Column<Guid>(type: "uniqueidentifier", nullable: false),
                    EvaluationSampleId = table.Column<Guid>(type: "uniqueidentifier", nullable: false),
                    CategoryCriteriaId = table.Column<Guid>(type: "uniqueidentifier", nullable: false),
                    Sort = table.Column<int>(type: "int", nullable: false),
                    IsDeleted = table.Column<bool>(type: "bit", nullable: false),
                    UpdatedAt = table.Column<DateTime>(type: "datetime2", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_EvaluationCriteriaSample", x => x.Id);
                    table.ForeignKey(
                        name: "FK_EvaluationCriteriaSample_CategoryCriteria_CategoryCriteriaId",
                        column: x => x.CategoryCriteriaId,
                        principalTable: "CategoryCriteria",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_EvaluationCriteriaSample_EvaluationSample_EvaluationSampleId",
                        column: x => x.EvaluationSampleId,
                        principalTable: "EvaluationSample",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateIndex(
                name: "IX_EvaluationCriteriaSample_CategoryCriteriaId",
                table: "EvaluationCriteriaSample",
                column: "CategoryCriteriaId");

            migrationBuilder.CreateIndex(
                name: "IX_EvaluationCriteriaSample_EvaluationSampleId",
                table: "EvaluationCriteriaSample",
                column: "EvaluationSampleId");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "EvaluationCriteriaSample");

            migrationBuilder.DropTable(
                name: "EvaluationSample");
        }
    }
}
