using Microsoft.EntityFrameworkCore.Migrations;

namespace ProductSuggestionAPP.Migrations
{
    public partial class InitialCreate : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateTable(
                name: "SalesData",
                columns: table => new
                {
                    SD_ID = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    SD_CUST_NO = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    SD_PROD_ID = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    SD_PRODUCT_NAME = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    SD_PRODUCT_PRICE = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    SD_STORE_ID = table.Column<string>(type: "nvarchar(max)", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_SalesData", x => x.SD_ID);
                });
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "SalesData");
        }
    }
}
