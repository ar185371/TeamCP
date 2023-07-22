using Microsoft.EntityFrameworkCore;
using ProductSuggestionAPP.Models;

namespace ProductSuggestionAPP.DataContexts
{
    public class SalesContext : DbContext
    {
        public SalesContext(DbContextOptions<SalesContext> options) : base(options)
        {
        }
        public DbSet<SALES_DATA> SalesData { get; set; }

    }
}
