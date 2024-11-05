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
    public DbSet<UserType>? UserTypes { get; set; }
    public DbSet<ElectronicSignature> ElectronicSignatures { get; set; }
    public DbSet<CategoryRating> CategoryRatings { get; set; }
    public DbSet<CategoryCriteria> CategoryCriterias { get; set; }
    public DbSet<CategoryTimeType> CategoryTimeTypes { get; set; }
    public DbSet<CategoryComment> CategoryComments { get; set; }
    public DbSet<CategoryProsCons> CategoryProsCons { get; set; }
    public DbSet<Evaluation> Evaluations { get; set; }
    public DbSet<EvaluationCriteria> EvaluationCriterias { get; set; }

    #endregion

}

