using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace StaffEvaluation.Migrations
{
    public partial class UpdateDB26112024 : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<Guid>(
                name: "SupervisorId",
                table: "EvaluationExplaint",
                type: "uniqueidentifier",
                nullable: true);

            migrationBuilder.CreateIndex(
                name: "IX_EvaluationExplaint_SupervisorId",
                table: "EvaluationExplaint",
                column: "SupervisorId");

            migrationBuilder.AddForeignKey(
                name: "FK_EvaluationExplaint_User_SupervisorId",
                table: "EvaluationExplaint",
                column: "SupervisorId",
                principalTable: "User",
                principalColumn: "Id");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_EvaluationExplaint_User_SupervisorId",
                table: "EvaluationExplaint");

            migrationBuilder.DropIndex(
                name: "IX_EvaluationExplaint_SupervisorId",
                table: "EvaluationExplaint");

            migrationBuilder.DropColumn(
                name: "SupervisorId",
                table: "EvaluationExplaint");
        }
    }
}
