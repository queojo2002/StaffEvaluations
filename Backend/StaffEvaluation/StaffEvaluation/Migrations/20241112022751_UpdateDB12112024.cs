using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace StaffEvaluation.Migrations
{
    public partial class UpdateDB12112024 : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateTable(
                name: "EvaluationDetailsPersonal",
                columns: table => new
                {
                    Id = table.Column<Guid>(type: "uniqueidentifier", nullable: false),
                    EvaluationId = table.Column<Guid>(type: "uniqueidentifier", nullable: true),
                    UserId = table.Column<Guid>(type: "uniqueidentifier", nullable: true),
                    EvaluationCriteriaId = table.Column<Guid>(type: "uniqueidentifier", nullable: true),
                    AssessmentValue = table.Column<int>(type: "int", nullable: false),
                    IsDeleted = table.Column<bool>(type: "bit", nullable: false),
                    UpdatedAt = table.Column<DateTime>(type: "datetime2", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_EvaluationDetailsPersonal", x => x.Id);
                    table.ForeignKey(
                        name: "FK_EvaluationDetailsPersonal_Evaluation_EvaluationId",
                        column: x => x.EvaluationId,
                        principalTable: "Evaluation",
                        principalColumn: "Id");
                    table.ForeignKey(
                        name: "FK_EvaluationDetailsPersonal_EvaluationCriteria_EvaluationCriteriaId",
                        column: x => x.EvaluationCriteriaId,
                        principalTable: "EvaluationCriteria",
                        principalColumn: "Id");
                    table.ForeignKey(
                        name: "FK_EvaluationDetailsPersonal_User_UserId",
                        column: x => x.UserId,
                        principalTable: "User",
                        principalColumn: "Id");
                });

            migrationBuilder.CreateTable(
                name: "EvaluationDetailsSupervisor",
                columns: table => new
                {
                    Id = table.Column<Guid>(type: "uniqueidentifier", nullable: false),
                    EvaluationId = table.Column<Guid>(type: "uniqueidentifier", nullable: false),
                    UserSupervisorId = table.Column<Guid>(type: "uniqueidentifier", nullable: false),
                    EvaluationDetailsPersonalId = table.Column<Guid>(type: "uniqueidentifier", nullable: false),
                    AssessmentValueSupervisor = table.Column<int>(type: "int", nullable: false),
                    IsDeleted = table.Column<bool>(type: "bit", nullable: false),
                    UpdatedAt = table.Column<DateTime>(type: "datetime2", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_EvaluationDetailsSupervisor", x => x.Id);
                    table.ForeignKey(
                        name: "FK_EvaluationDetailsSupervisor_Evaluation_EvaluationId",
                        column: x => x.EvaluationId,
                        principalTable: "Evaluation",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_EvaluationDetailsSupervisor_EvaluationDetailsPersonal_EvaluationDetailsPersonalId",
                        column: x => x.EvaluationDetailsPersonalId,
                        principalTable: "EvaluationDetailsPersonal",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_EvaluationDetailsSupervisor_User_UserSupervisorId",
                        column: x => x.UserSupervisorId,
                        principalTable: "User",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateIndex(
                name: "IX_EvaluationDetailsPersonal_EvaluationCriteriaId",
                table: "EvaluationDetailsPersonal",
                column: "EvaluationCriteriaId");

            migrationBuilder.CreateIndex(
                name: "IX_EvaluationDetailsPersonal_EvaluationId",
                table: "EvaluationDetailsPersonal",
                column: "EvaluationId");

            migrationBuilder.CreateIndex(
                name: "IX_EvaluationDetailsPersonal_UserId",
                table: "EvaluationDetailsPersonal",
                column: "UserId");

            migrationBuilder.CreateIndex(
                name: "IX_EvaluationDetailsSupervisor_EvaluationDetailsPersonalId",
                table: "EvaluationDetailsSupervisor",
                column: "EvaluationDetailsPersonalId");

            migrationBuilder.CreateIndex(
                name: "IX_EvaluationDetailsSupervisor_EvaluationId",
                table: "EvaluationDetailsSupervisor",
                column: "EvaluationId");

            migrationBuilder.CreateIndex(
                name: "IX_EvaluationDetailsSupervisor_UserSupervisorId",
                table: "EvaluationDetailsSupervisor",
                column: "UserSupervisorId");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "EvaluationDetailsSupervisor");

            migrationBuilder.DropTable(
                name: "EvaluationDetailsPersonal");
        }
    }
}
