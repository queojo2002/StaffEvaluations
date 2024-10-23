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

    }
}

