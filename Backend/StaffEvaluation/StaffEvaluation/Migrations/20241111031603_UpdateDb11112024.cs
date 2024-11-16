using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace StaffEvaluation.Migrations
{
    public partial class UpdateDb11112024 : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Evaluation_CategoryTimeType_CategoryTimeTypeId",
                table: "Evaluation");

            migrationBuilder.AlterColumn<Guid>(
                name: "CategoryTimeTypeId",
                table: "Evaluation",
                type: "uniqueidentifier",
                nullable: true,
                oldClrType: typeof(Guid),
                oldType: "uniqueidentifier");

            migrationBuilder.AddForeignKey(
                name: "FK_Evaluation_CategoryTimeType_CategoryTimeTypeId",
                table: "Evaluation",
                column: "CategoryTimeTypeId",
                principalTable: "CategoryTimeType",
                principalColumn: "Id");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Evaluation_CategoryTimeType_CategoryTimeTypeId",
                table: "Evaluation");

            migrationBuilder.AlterColumn<Guid>(
                name: "CategoryTimeTypeId",
                table: "Evaluation",
                type: "uniqueidentifier",
                nullable: false,
                defaultValue: new Guid("00000000-0000-0000-0000-000000000000"),
                oldClrType: typeof(Guid),
                oldType: "uniqueidentifier",
                oldNullable: true);

            migrationBuilder.AddForeignKey(
                name: "FK_Evaluation_CategoryTimeType_CategoryTimeTypeId",
                table: "Evaluation",
                column: "CategoryTimeTypeId",
                principalTable: "CategoryTimeType",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);
        }
    }
}
