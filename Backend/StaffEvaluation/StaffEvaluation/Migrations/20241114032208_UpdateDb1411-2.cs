using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace StaffEvaluation.Migrations
{
    public partial class UpdateDb14112 : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateTable(
                name: "EvaluationExplaint",
                columns: table => new
                {
                    Id = table.Column<Guid>(type: "uniqueidentifier", nullable: false),
                    EvaluationId = table.Column<Guid>(type: "uniqueidentifier", nullable: true),
                    UserId = table.Column<Guid>(type: "uniqueidentifier", nullable: true),
                    CategoryCriteriaId = table.Column<Guid>(type: "uniqueidentifier", nullable: true),
                    Note = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    FileAttachments = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    IsDeleted = table.Column<bool>(type: "bit", nullable: false),
                    UpdatedAt = table.Column<DateTime>(type: "datetime2", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_EvaluationExplaint", x => x.Id);
                    table.ForeignKey(
                        name: "FK_EvaluationExplaint_CategoryCriteria_CategoryCriteriaId",
                        column: x => x.CategoryCriteriaId,
                        principalTable: "CategoryCriteria",
                        principalColumn: "Id");
                    table.ForeignKey(
                        name: "FK_EvaluationExplaint_Evaluation_EvaluationId",
                        column: x => x.EvaluationId,
                        principalTable: "Evaluation",
                        principalColumn: "Id");
                    table.ForeignKey(
                        name: "FK_EvaluationExplaint_User_UserId",
                        column: x => x.UserId,
                        principalTable: "User",
                        principalColumn: "Id");
                });

            migrationBuilder.CreateIndex(
                name: "IX_EvaluationExplaint_CategoryCriteriaId",
                table: "EvaluationExplaint",
                column: "CategoryCriteriaId");

            migrationBuilder.CreateIndex(
                name: "IX_EvaluationExplaint_EvaluationId",
                table: "EvaluationExplaint",
                column: "EvaluationId");

            migrationBuilder.CreateIndex(
                name: "IX_EvaluationExplaint_UserId",
                table: "EvaluationExplaint",
                column: "UserId");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "EvaluationExplaint");
        }
    }
}
