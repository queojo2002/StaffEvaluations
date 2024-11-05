﻿using AutoMapper;
using Microsoft.EntityFrameworkCore;
using Microsoft.IdentityModel.Tokens;
using StaffEvaluation.Data;
using StaffEvaluation.Data.Entity;
using StaffEvaluation.Helpers;
using StaffEvaluation.Models;
using StaffEvaluation.Repositories.IRepository;
using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using System.Security.Cryptography;
using System.Text;

namespace StaffEvaluation.Repositories.Repository;

public class UserRepository : IUserRepository
{
    private readonly IConfiguration _configuration;
    private DataContext _context;
    private IMapper _mapper;

    public UserRepository(DataContext context, IMapper mapper, IConfiguration configuration)
    {
        _context = context;
        _mapper = mapper;
        _configuration = configuration;
    }

    public async Task<PagedApiResponse<UserModel>> GetAllPagedAsync(int pageNumber, int pageSize)
    {
        var userModels = await (
                                    from user in _context.Users
                                    join unit in _context.Units! on user.UnitId equals unit.Id
                                    join ut in _context.UserTypes! on user.UserTypeId equals ut.Id
                                    where !user.IsDeleted
                                    select new UserModel
                                    {
                                        Id = user.Id,
                                        UserTypeId = user.UserTypeId,
                                        UserTypeName = ut.UserTypeName,
                                        UnitName = unit.UnitName,
                                        UnitId = user.UnitId,
                                        FullName = user.FullName,
                                        Email = user.Email,
                                        Password = user.Password,
                                        Phone = user.Phone,
                                        Address = user.Address,
                                        Birthday = user.Birthday,
                                        PositionsName = user.PositionsName,
                                        IsActive = user.IsActive,
                                        IsDeleted = user.IsDeleted,
                                        UpdatedAt = user.UpdatedAt
                                    }
                                ).ToListAsync();

        return new Pagination().HandleGetAllRespond(
            pageNumber,
            pageSize,
            userModels,
            userModels.Count
        );
    }

    public async Task<PagedApiResponse<UserModel>> GetByIdAsync(Guid id)
    {
        var userModel = await (
                                    from user in _context.Users
                                    join unit in _context.Units! on user.UnitId equals unit.Id
                                    join ut in _context.UserTypes! on user.UserTypeId equals ut.Id
                                    join ur in _context.UserRoles! on user.Id equals ur.UserId
                                    where !user.IsDeleted && user.Id == id
                                    select new UserModel
                                    {
                                        Id = user.Id,
                                        RoleId = ur.RoleId,
                                        UserTypeId = user.UserTypeId,
                                        UserTypeName = ut.UserTypeName,
                                        UnitName = unit.UnitName,
                                        UnitId = user.UnitId,
                                        FullName = user.FullName,
                                        Email = user.Email,
                                        Password = user.Password,
                                        Phone = user.Phone,
                                        Address = user.Address,
                                        Birthday = user.Birthday,
                                        PositionsName = user.PositionsName,
                                        IsActive = user.IsActive,
                                        IsDeleted = user.IsDeleted,
                                        UpdatedAt = user.UpdatedAt
                                    }
                                ).SingleOrDefaultAsync();

        var mappedUser = _mapper.Map<UserModel>(userModel);

        return new Pagination().HandleGetByIdRespond(mappedUser);
    }



    public async Task<PagedApiResponse<TokenModel>> Login(string email, string password)
    {
        var user = await _context.Users!.FirstOrDefaultAsync(u => u.Email == email && u.Password == password);

        if (user == null)
        {
            return new ApiResult().Failure<TokenModel>("Đăng nhập thất bại!");
        }

        var refreshTokens = await _context.RefreshTokens!
            .Where(e => e.UserId == user.Id)
            .ToListAsync();

        _context.RefreshTokens!.RemoveRange(refreshTokens);

        await _context.SaveChangesAsync();

        var jwtTokenHandler = new JwtSecurityTokenHandler();

        var key = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(_configuration["Jwt:Key"]));

        var expires = DateTime.Now.AddMinutes(Convert.ToDouble(_configuration["Jwt:ExpiresInMinutes"]));

        var token = new JwtSecurityToken(
            issuer: _configuration["Jwt:Issuer"],
            audience: _configuration["Jwt:Audience"],
            claims: new[]
            {
                new Claim("Id", user.Id.ToString()),
                new Claim("Email", user.Email!.ToString()),
                new Claim("FullName", user.FullName!.ToString()),
                new Claim("UnitId", user.UnitId!.ToString()),
                new Claim(JwtRegisteredClaimNames.Jti, Guid.NewGuid().ToString()),
            },
            expires: expires,
            //expires: DateTime.Now.AddSeconds(5),
            signingCredentials: new SigningCredentials(key, SecurityAlgorithms.HmacSha512Signature)
        );

        var refreshToken = GenerateRefreshToken();

        //Lưu database
        var refreshTokenEntity = new RefreshToken
        {
            Id = Guid.NewGuid(),
            JwtId = token.Id,
            UserId = user.Id,
            Token = refreshToken,
            IsUsed = false,
            IsRevoked = false,
            IssuedAt = DateTime.Now,
            ExpiredAt = DateTime.Now.AddDays(7)
        };
        await _context.AddAsync(refreshTokenEntity);

        await _context.SaveChangesAsync();


        TokenModel tokenModel = new TokenModel()
        {
            AccessToken = new JwtSecurityTokenHandler().WriteToken(token),
            RefreshToken = refreshToken
        };


        return new Pagination().HandleGetByIdRespond(tokenModel, "Đăng nhập thành công!");
    }

    public async Task<PagedApiResponse<TokenModel>> RenewToken(TokenModel tokenModel)
    {
        var jwtTokenHandler = new JwtSecurityTokenHandler();

        var secretKeyBytes = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(_configuration["Jwt:Key"]));

        var tokenValidateParam = new TokenValidationParameters
        {
            //tự cấp token
            ValidateIssuer = false,
            ValidateAudience = false,

            //ký vào token
            ValidateIssuerSigningKey = true,
            IssuerSigningKey = secretKeyBytes,

            ClockSkew = TimeSpan.Zero,

            ValidateLifetime = false // không kiểm tra token hết hạn
        };

        try
        {
            var tokenInVerification = jwtTokenHandler.ValidateToken(tokenModel.AccessToken, tokenValidateParam, out var validatedToken);

            if (validatedToken is JwtSecurityToken jwtSecurityToken)
            {
                var result = jwtSecurityToken.Header.Alg.Equals(SecurityAlgorithms.HmacSha512Signature, StringComparison.InvariantCultureIgnoreCase);
                if (!result)
                {
                    return new ApiResult().Failure<TokenModel>("Access Token không hợp lệ!");
                }
            }

            var expireDate = long.Parse(tokenInVerification.Claims.FirstOrDefault(x => x.Type == JwtRegisteredClaimNames.Exp)!.Value);

            var expirationDate = ConvertUnixTimeToDateTime(expireDate);

            if (expirationDate > DateTime.Now)
            {
                return new ApiResult().Failure<TokenModel>("Access Token đang còn hạn sử dụng, không thể yêu cầu lấy 1 access token mới.");
            }

            var storedToken = _context.RefreshTokens!.SingleOrDefault(x => x.Token == tokenModel.RefreshToken);

            if (storedToken == null)
            {
                return new ApiResult().Failure<TokenModel>("Refresh Token không tồn tại.");
            }
            else if (storedToken.IsUsed)
            {
                return new ApiResult().Failure<TokenModel>("Refresh Token đã được sử dụng.");
            }
            else if (storedToken.IsRevoked)
            {
                return new ApiResult().Failure<TokenModel>("Refresh Token đã bị thu hồi.");
            }
            else if (storedToken.ExpiredAt < DateTime.Now)
            {
                return new ApiResult().Failure<TokenModel>("Refresh Token đã hết hạn.");
            }

            var jti = tokenInVerification.Claims.FirstOrDefault(x => x.Type == JwtRegisteredClaimNames.Jti)!.Value;

            if (storedToken.JwtId != jti)
            {
                return new ApiResult().Failure<TokenModel>("Refresh Token không hợp lệ.");
            }

            storedToken.IsRevoked = true;

            storedToken.IsUsed = true;

            _context.Update(storedToken);

            await _context.SaveChangesAsync();

            var user = await _context.Users!.SingleOrDefaultAsync(nd => nd.Id == storedToken.UserId && nd.IsDeleted == false);

            if (user == null)
            {
                return new ApiResult().Failure<TokenModel>("Người dùng không tồn tại.");
            }

            var token = await Login(user?.Email!, user?.Password!);

            return token;
        }
        catch (Exception ex)
        {
            return new ApiResult().Failure<TokenModel>("Có lỗi xảy ra." + ex.Message);
        }

    }




    private string GenerateRefreshToken()
    {
        var random = new byte[32];
        using (var rng = RandomNumberGenerator.Create())
        {
            rng.GetBytes(random);

            return Convert.ToBase64String(random);
        }
    }

    private DateTime ConvertUnixTimeToDateTime(long utcExpireDate)
    {
        var dateTimeInterval = new DateTime(1970, 1, 1, 0, 0, 0, 0, DateTimeKind.Utc);

        var dateTime = dateTimeInterval.AddSeconds(utcExpireDate).ToLocalTime();

        return dateTime;
    }

    public async Task<PagedApiResponse<MenuItemsModel>> GetRoles(Guid userId)
    {
        var userRoles = await _context.UserRoles!.SingleOrDefaultAsync(ur => ur.UserId == userId);

        if (userRoles == null)
        {
            return new ApiResult().Failure<MenuItemsModel>("Người dùng này chưa có chức năng.");
        }

        var menuItems = await _context.RoleMenuItems!
            .Where(rmi => rmi.RoleId == userRoles.RoleId)
            .Select(rmi => new MenuItemsModel
            {
                Id = rmi.MenuItems!.Id,
                Key = rmi.MenuItems.Key,
                Name = rmi.MenuItems.Name,
                ParentId = rmi.MenuItems.ParentId,
                Route = rmi.MenuItems.Route,
                Icon = rmi.MenuItems.Icon,
                Sort = rmi.MenuItems.Sort
            }).OrderBy(e => e.Sort).ToListAsync();

        if (menuItems.Count == 0)
        {
            return new ApiResult().Failure<MenuItemsModel>("Người dùng này chưa có chức năng.");
        }

        var mappedMIM = _mapper.Map<List<MenuItemsModel>>(menuItems);

        return new Pagination().HandleGetAllRespond(0, 0, mappedMIM, menuItems.Count);
    }

    public async Task<PagedApiResponse<UserModel>> InsertAsync(UserModel entity)
    {
        using var transaction = await _context.Database.BeginTransactionAsync();

        try
        {
            bool emailExists = await _context.Users!.AnyAsync(u => u.Email == entity.Email && !u.IsDeleted);
            bool phoneExists = await _context.Users!.AnyAsync(u => u.Phone == entity.Phone && !u.IsDeleted);

            if (emailExists)
            {
                return new ApiResult().Failure<UserModel>("Email này đã tồn tại.");
            }

            if (phoneExists)
            {
                return new ApiResult().Failure<UserModel>("Số điện thoại này đã tồn tại.");
            }

            Guid userId = Guid.NewGuid();

            User user = new User
            {
                Id = userId,
                UserTypeId = entity.UserTypeId,
                UnitId = entity.UnitId,
                FullName = entity.FullName,
                Email = entity.Email,
                Password = entity.Password,
                Phone = entity.Phone,
                Address = entity.Address,
                Birthday = entity.Birthday,
                PositionsName = entity.PositionsName,
                IsActive = true,
                IsDeleted = false,
                UpdatedAt = DateTime.Now
            };

            UserRoles userRoles = new UserRoles
            {
                Id = Guid.NewGuid(),
                RoleId = entity.RoleId,
                UserId = userId
            };



            RSA rsa = RSA.Create();
            ElectronicSignature signature = new ElectronicSignature
            {
                Id = Guid.NewGuid(),
                UserId = userId,
                Status = 0,
                PublicKey = Convert.ToBase64String(rsa.ExportRSAPrivateKey()),
                PrivateKey = Convert.ToBase64String(rsa.ExportRSAPublicKey()),
                UpdatedAt = DateTime.Now
            };


            await _context.Users!.AddAsync(user);

            await _context.UserRoles!.AddAsync(userRoles);

            await _context.ElectronicSignatures!.AddAsync(signature);

            await _context.SaveChangesAsync();

            await transaction.CommitAsync();

            return new ApiResult().Success<UserModel>("Thêm mới người dùng thành công");
        }
        catch (Exception ex)
        {
            await transaction.RollbackAsync();

            return new ApiResult().Failure<UserModel>($"Lỗi khi thêm mới người dùng: {ex.Message}");
        }
    }

    public async Task<PagedApiResponse<UserModel>> UpdateAsync(UserModel entity)
    {
        using var transaction = await _context.Database.BeginTransactionAsync();

        try
        {
            var user = await _context.Users!.FindAsync(entity.Id);

            var userRole = await _context.UserRoles!.Where(e => e.UserId == entity.Id).FirstOrDefaultAsync();

            if (user == null || user.IsDeleted)
            {
                return new ApiResult().Failure<UserModel>("Người dùng này không tồn tại hoặc đã bị xóa.");
            }
            else if (userRole == null)
            {
                return new ApiResult().Failure<UserModel>("Không tìm thấy vai trò của người dùng này.");
            }

            bool phoneExists = await _context.Users!.AnyAsync(u => u.Phone == entity.Phone && u.Id != entity.Id && !u.IsDeleted);

            if (phoneExists)
            {
                return new ApiResult().Failure<UserModel>("Số điện thoại này đã tồn tại với người dùng khác.");
            }

            user.UserTypeId = entity.UserTypeId;
            user.UnitId = entity.UnitId;
            user.FullName = entity.FullName;
            user.Phone = entity.Phone;
            user.Address = entity.Address;
            user.Birthday = entity.Birthday;
            user.PositionsName = entity.PositionsName;
            user.UpdatedAt = DateTime.Now;

            userRole.RoleId = entity.RoleId;

            await _context.SaveChangesAsync();

            await transaction.CommitAsync();

            return new ApiResult().Success<UserModel>("Cập nhật người dùng thành công.");
        }
        catch (Exception ex)
        {
            await transaction.RollbackAsync();
            return new ApiResult().Failure<UserModel>($"Lỗi khi cập nhật người dùng: {ex.Message}");
        }
    }

    public async Task<PagedApiResponse<UserModel>> RemoveRangeAsync(List<Guid> ids)
    {
        using var transaction = await _context.Database.BeginTransactionAsync();

        try
        {
            var userToDelete = await _context.Users!.Where(rmi => ids.Contains(rmi.Id)).ToListAsync();

            if (userToDelete.Count == 0) return new ApiResult().Failure<UserModel>("Không tìm thấy người dùng nào để xóa.");

            userToDelete.ForEach(u => u.IsDeleted = true);

            var userRoleDelete = await _context.UserRoles!.Where(ur => userToDelete.Select(r => r.Id).Contains(ur.UserId)).ToListAsync();

            if (userRoleDelete.Any()) _context.UserRoles!.RemoveRange(userRoleDelete);

            await _context.SaveChangesAsync();

            await transaction.CommitAsync();

            return new ApiResult().Success<UserModel>("Xoá các người dùng thành công.");
        }
        catch (Exception ex)
        {
            await transaction.RollbackAsync();

            return new ApiResult().Failure<UserModel>($"Lỗi khi xoá các người dùng: {ex.Message}");
        }
    }


}

