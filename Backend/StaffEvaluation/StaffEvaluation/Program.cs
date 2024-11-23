using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.EntityFrameworkCore;
using Microsoft.IdentityModel.Tokens;
using StaffEvaluation.Data;
using StaffEvaluation.Repositories.IRepository;
using StaffEvaluation.Repositories.Repository;
using System.Text;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.

builder.Services.AddControllers();
// Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();

builder.Services.AddCors(options =>
{
    options.AddPolicy("AllowAllOrigins",
        builder =>
        {
            builder.AllowAnyOrigin()
                   .AllowAnyMethod()
                   .AllowAnyHeader();
        });
});


builder.Services.AddDbContext<DataContext>(options =>
{
    options.UseSqlServer(builder.Configuration.GetConnectionString("MyConnectString"));
});

builder.Services.AddAutoMapper(typeof(Program));

builder.Services.AddScoped<IUnitRepository, UnitRepository>();
builder.Services.AddScoped<IUserRepository, UserRepository>();
builder.Services.AddScoped<IRolesRepository, RolesRepository>();
builder.Services.AddScoped<IUserTypeRepository, UserTypeRepository>();
builder.Services.AddScoped<ICategoryRatingRepository, CategoryRatingRepository>();
builder.Services.AddScoped<ICategoryTimeTypeRepository, CategoryTimeTypeRepository>();
builder.Services.AddScoped<ICategoryCriteriaRepository, CategoryCriteriaRepository>();
builder.Services.AddScoped<ICategoryCommentRepository, CategoryCommentRepository>();
builder.Services.AddScoped<ICategoryProsConsRepository, CategoryProsConsRepository>();
builder.Services.AddScoped<IEvaluationRepository, EvaluationRepository>();
builder.Services.AddScoped<IEvaluationCriteriaRepository, EvaluationCriteriaRepository>();
builder.Services.AddScoped<IEvaluationUserRepository, EvaluationUserRepository>();
builder.Services.AddScoped<IEvaluationExplaintRepository, EvaluationExplaintRepository>();
builder.Services.AddScoped<IEvaluationDetailsPersonalRepository, EvaluationDetailsPersonalRepository>();
builder.Services.AddScoped<IEvaluationDetailsSupervisorRepository, EvaluationDetailsSupervisorRepository>();
builder.Services.AddScoped<IEvaluationConsolidationAndTransferRepository, EvaluationConsolidationAndTransferRepository>();
builder.Services.AddScoped<IEvaluationConsolidationAndTransferDetailsRepository, EvaluationConsolidationAndTransferDetailsRepository>();
builder.Services.AddScoped<IEvaluationSampleRepository, EvaluationSampleRepository>();
builder.Services.AddScoped<IEvaluationCriteriaSampleRepository, EvaluationCriteriaSampleRepository>();


var key = Encoding.UTF8.GetBytes(builder.Configuration["Jwt:Key"]);


builder.Services.AddAuthentication(x =>
{
    x.DefaultAuthenticateScheme = JwtBearerDefaults.AuthenticationScheme;
    x.DefaultChallengeScheme = JwtBearerDefaults.AuthenticationScheme;
    x.DefaultScheme = JwtBearerDefaults.AuthenticationScheme;
}).AddJwtBearer(x =>
{
    x.RequireHttpsMetadata = true;
    x.SaveToken = true;
    x.TokenValidationParameters = new Microsoft.IdentityModel.Tokens.TokenValidationParameters
    {
        ValidateIssuer = true,
        ValidateAudience = true,
        ValidateLifetime = true,
        ValidateIssuerSigningKey = true,
        ValidIssuer = builder.Configuration["Jwt:Issuer"],
        ValidAudience = builder.Configuration["Jwt:Audience"],
        IssuerSigningKey = new SymmetricSecurityKey(key),
        ClockSkew = TimeSpan.Zero
    };

});






var app = builder.Build();

// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}

app.UseHttpsRedirection();

app.UseCors("AllowAllOrigins");

app.UseAuthentication();

app.UseAuthorization();

app.MapControllers();

app.Run();
