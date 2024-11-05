using AutoMapper;
using StaffEvaluation.Data.Entity;
using StaffEvaluation.Models;

namespace StaffEvaluation.Helpers;

public class ApplicationMapper : Profile
{
    public ApplicationMapper()
    {
        CreateMap<Unit, UnitModel>().ReverseMap();
        CreateMap<User, UserModel>().ReverseMap();
        CreateMap<MenuItems, MenuItemsModel>().ReverseMap();
        CreateMap<Roles, RolesModel>().ReverseMap();
        CreateMap<UserType, UserTypeModel>().ReverseMap();
        CreateMap<CategoryRating, CategoryRatingModel>().ReverseMap();
        CreateMap<CategoryTimeType, CategoryTimeTypeModel>().ReverseMap();
        CreateMap<CategoryComment, CategoryCommentModel>().ReverseMap();
        CreateMap<CategoryProsCons, CategoryProsConsModel>().ReverseMap();
    }
}

