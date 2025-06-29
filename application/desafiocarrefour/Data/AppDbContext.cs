using Microsoft.EntityFrameworkCore;
using desafiocarrefour.Models;

namespace desafiocarrefour.Data
{
    public class AppDbContext : DbContext
    {
        public AppDbContext(DbContextOptions<AppDbContext> options)
            : base(options) { }

        public DbSet<Lancamento> Lancamentos { get; set; }
    }
}