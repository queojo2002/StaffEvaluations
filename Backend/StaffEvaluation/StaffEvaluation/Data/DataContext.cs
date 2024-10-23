using Microsoft.EntityFrameworkCore;
using StaffEvaluation.Data.Entity;

namespace StaffEvaluation.Data;

public class DataContext : DbContext
{
    public DataContext(DbContextOptions<DataContext> options) : base(options)
    {

    }

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        base.OnModelCreating(modelBuilder);
    }

    #region DBSET

    public DbSet<User>? Users { get; set; }
    public DbSet<Unit>? Units { get; set; }
    public DbSet<RefreshToken>? RefreshTokens { get; set; }
    public DbSet<MenuItems>? MenuItems { get; set; }
    public DbSet<Roles>? Roles { get; set; }
    public DbSet<UserRoles>? UserRoles { get; set; }
    public DbSet<RoleMenuItems>? RoleMenuItems { get; set; }

    #endregion

}

