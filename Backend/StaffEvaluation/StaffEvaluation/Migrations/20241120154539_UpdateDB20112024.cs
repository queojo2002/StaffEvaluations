using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace StaffEvaluation.Migrations
{
    public partial class UpdateDB20112024 : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {


            migrationBuilder.CreateTable(
                name: "EvaluationConsolidationAndTransfer",
                columns: table => new
                {
                    Id = table.Column<Guid>(type: "uniqueidentifier", nullable: false),
                    UserId = table.Column<Guid>(type: "uniqueidentifier", nullable: false),
                    UnitId = table.Column<Guid>(type: "uniqueidentifier", nullable: false),
                    EvaluationConsolidationAndTransferName = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    Status = table.Column<int>(type: "int", nullable: false),
                    UpdatedAt = table.Column<DateTime>(type: "datetime2", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_EvaluationConsolidationAndTransfer", x => x.Id);
                    table.ForeignKey(
                        name: "FK_EvaluationConsolidationAndTransfer_Unit_UnitId",
                        column: x => x.UnitId,
                        principalTable: "Unit",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_EvaluationConsolidationAndTransfer_User_UserId",
                        column: x => x.UserId,
                        principalTable: "User",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateTable(
                name: "EvaluationConsolidationAndTransferDetails",
                columns: table => new
                {
                    Id = table.Column<Guid>(type: "uniqueidentifier", nullable: false),
                    EvaluationConsolidationAndTransferId = table.Column<Guid>(type: "uniqueidentifier", nullable: false),
                    EvaluationId = table.Column<Guid>(type: "uniqueidentifier", nullable: false),
                    UpdatedAt = table.Column<DateTime>(type: "datetime2", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_EvaluationConsolidationAndTransferDetails", x => x.Id);
                    table.ForeignKey(
                        name: "FK_EvaluationConsolidationAndTransferDetails_Evaluation_EvaluationId",
                        column: x => x.EvaluationId,
                        principalTable: "Evaluation",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_EvaluationConsolidationAndTransferDetails_EvaluationConsolidationAndTransfer_EvaluationConsolidationAndTransferId",
                        column: x => x.EvaluationConsolidationAndTransferId,
                        principalTable: "EvaluationConsolidationAndTransfer",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateIndex(
                name: "IX_EvaluationConsolidationAndTransfer_UnitId",
                table: "EvaluationConsolidationAndTransfer",
                column: "UnitId");

            migrationBuilder.CreateIndex(
                name: "IX_EvaluationConsolidationAndTransfer_UserId",
                table: "EvaluationConsolidationAndTransfer",
                column: "UserId");

            migrationBuilder.CreateIndex(
                name: "IX_EvaluationConsolidationAndTransferDetails_EvaluationConsolidationAndTransferId",
                table: "EvaluationConsolidationAndTransferDetails",
                column: "EvaluationConsolidationAndTransferId");

            migrationBuilder.CreateIndex(
                name: "IX_EvaluationConsolidationAndTransferDetails_EvaluationId",
                table: "EvaluationConsolidationAndTransferDetails",
                column: "EvaluationId");

        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {


            migrationBuilder.DropTable(
                name: "EvaluationConsolidationAndTransferDetails");

            migrationBuilder.DropTable(
                name: "EvaluationConsolidationAndTransfer");




        }
    }
}
