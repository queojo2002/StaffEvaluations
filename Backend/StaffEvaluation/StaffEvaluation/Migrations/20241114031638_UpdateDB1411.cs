using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace StaffEvaluation.Migrations
{
    public partial class UpdateDB1411 : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<bool>(
                name: "IsManager",
                table: "EvaluationUser",
                type: "bit",
                nullable: true);

            migrationBuilder.CreateTable(
                name: "EvaluationAAE",
                columns: table => new
                {
                    Id = table.Column<Guid>(type: "uniqueidentifier", nullable: false),
                    EvaluationId = table.Column<Guid>(type: "uniqueidentifier", nullable: false),
                    UserId = table.Column<Guid>(type: "uniqueidentifier", nullable: true),
                    SupervisorId = table.Column<Guid>(type: "uniqueidentifier", nullable: true),
                    Advantages = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    DisAdvantages = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    AddReviews = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    KetQuaHoatDongCoQuan = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    NangLucLanhDaoQuanLy = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    NangLucTapHopDoanKet = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    NhanXetUuKhuyetDiem = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    NhanDinhChieuHuongPhatTrien = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    IsDeleted = table.Column<bool>(type: "bit", nullable: false),
                    UpdatedAt = table.Column<DateTime>(type: "datetime2", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_EvaluationAAE", x => x.Id);
                    table.ForeignKey(
                        name: "FK_EvaluationAAE_Evaluation_EvaluationId",
                        column: x => x.EvaluationId,
                        principalTable: "Evaluation",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_EvaluationAAE_User_SupervisorId",
                        column: x => x.SupervisorId,
                        principalTable: "User",
                        principalColumn: "Id");
                    table.ForeignKey(
                        name: "FK_EvaluationAAE_User_UserId",
                        column: x => x.UserId,
                        principalTable: "User",
                        principalColumn: "Id");
                });

            migrationBuilder.CreateIndex(
                name: "IX_EvaluationAAE_EvaluationId",
                table: "EvaluationAAE",
                column: "EvaluationId");

            migrationBuilder.CreateIndex(
                name: "IX_EvaluationAAE_SupervisorId",
                table: "EvaluationAAE",
                column: "SupervisorId");

            migrationBuilder.CreateIndex(
                name: "IX_EvaluationAAE_UserId",
                table: "EvaluationAAE",
                column: "UserId");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "EvaluationAAE");

            migrationBuilder.DropColumn(
                name: "IsManager",
                table: "EvaluationUser");
        }
    }
}
