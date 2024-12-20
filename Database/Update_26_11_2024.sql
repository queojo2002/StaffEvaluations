USE [SA_Demo_1]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 11/26/2024 10:02:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CategoryComment]    Script Date: 11/26/2024 10:02:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CategoryComment](
	[Id] [uniqueidentifier] NOT NULL,
	[Title] [nvarchar](max) NULL,
	[Content] [nvarchar](max) NULL,
	[Sort] [int] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[UpdatedAt] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_CategoryComment] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CategoryCriteria]    Script Date: 11/26/2024 10:02:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CategoryCriteria](
	[Id] [uniqueidentifier] NOT NULL,
	[ParentId] [uniqueidentifier] NULL,
	[CategoryRatingId] [uniqueidentifier] NULL,
	[UnitId] [uniqueidentifier] NOT NULL,
	[CriteriaName] [nvarchar](max) NULL,
	[IsDistinct] [bit] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[UpdatedAt] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_CategoryCriteria] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CategoryProsCons]    Script Date: 11/26/2024 10:02:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CategoryProsCons](
	[Id] [uniqueidentifier] NOT NULL,
	[Content] [nvarchar](max) NULL,
	[IsPros] [bit] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[UpdatedAt] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_CategoryProsCons] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CategoryRating]    Script Date: 11/26/2024 10:02:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CategoryRating](
	[Id] [uniqueidentifier] NOT NULL,
	[UnitId] [uniqueidentifier] NOT NULL,
	[RatingName] [nvarchar](max) NULL,
	[StartValue] [int] NOT NULL,
	[EndValue] [int] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[UpdatedAt] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_CategoryRating] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CategoryTimeType]    Script Date: 11/26/2024 10:02:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CategoryTimeType](
	[Id] [uniqueidentifier] NOT NULL,
	[UnitId] [uniqueidentifier] NOT NULL,
	[TimeTypeName] [nvarchar](max) NULL,
	[FromDate] [datetime2](7) NOT NULL,
	[ToDate] [datetime2](7) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[UpdatedAt] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_CategoryTimeType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ElectronicSignature]    Script Date: 11/26/2024 10:02:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ElectronicSignature](
	[Id] [uniqueidentifier] NOT NULL,
	[UserId] [uniqueidentifier] NOT NULL,
	[Status] [int] NOT NULL,
	[PublicKey] [nvarchar](max) NULL,
	[PrivateKey] [nvarchar](max) NULL,
	[UpdatedAt] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_ElectronicSignature] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Evaluation]    Script Date: 11/26/2024 10:02:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Evaluation](
	[Id] [uniqueidentifier] NOT NULL,
	[UnitId] [uniqueidentifier] NOT NULL,
	[CategoryTimeTypeId] [uniqueidentifier] NULL,
	[EvaluationName] [nvarchar](max) NULL,
	[Status] [int] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[UpdatedAt] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Evaluation] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EvaluationAAE]    Script Date: 11/26/2024 10:02:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EvaluationAAE](
	[Id] [uniqueidentifier] NOT NULL,
	[EvaluationId] [uniqueidentifier] NOT NULL,
	[UserId] [uniqueidentifier] NULL,
	[SupervisorId] [uniqueidentifier] NULL,
	[Advantages] [nvarchar](max) NULL,
	[DisAdvantages] [nvarchar](max) NULL,
	[AddReviews] [nvarchar](max) NULL,
	[KetQuaHoatDongCoQuan] [nvarchar](max) NULL,
	[NangLucLanhDaoQuanLy] [nvarchar](max) NULL,
	[NangLucTapHopDoanKet] [nvarchar](max) NULL,
	[NhanXetUuKhuyetDiem] [nvarchar](max) NULL,
	[NhanDinhChieuHuongPhatTrien] [nvarchar](max) NULL,
	[IsDeleted] [bit] NOT NULL,
	[UpdatedAt] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_EvaluationAAE] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EvaluationConsolidationAndTransfer]    Script Date: 11/26/2024 10:02:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EvaluationConsolidationAndTransfer](
	[Id] [uniqueidentifier] NOT NULL,
	[UserId] [uniqueidentifier] NOT NULL,
	[UnitId] [uniqueidentifier] NOT NULL,
	[EvaluationConsolidationAndTransferName] [nvarchar](max) NULL,
	[Status] [int] NOT NULL,
	[UpdatedAt] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_EvaluationConsolidationAndTransfer] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EvaluationConsolidationAndTransferDetails]    Script Date: 11/26/2024 10:02:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EvaluationConsolidationAndTransferDetails](
	[Id] [uniqueidentifier] NOT NULL,
	[EvaluationConsolidationAndTransferId] [uniqueidentifier] NOT NULL,
	[EvaluationId] [uniqueidentifier] NOT NULL,
	[UpdatedAt] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_EvaluationConsolidationAndTransferDetails] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EvaluationCriteria]    Script Date: 11/26/2024 10:02:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EvaluationCriteria](
	[Id] [uniqueidentifier] NOT NULL,
	[EvaluationId] [uniqueidentifier] NOT NULL,
	[CategoryCriteriaId] [uniqueidentifier] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[UpdatedAt] [datetime2](7) NOT NULL,
	[Sort] [int] NOT NULL,
 CONSTRAINT [PK_EvaluationCriteria] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EvaluationCriteriaSample]    Script Date: 11/26/2024 10:02:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EvaluationCriteriaSample](
	[Id] [uniqueidentifier] NOT NULL,
	[EvaluationSampleId] [uniqueidentifier] NOT NULL,
	[CategoryCriteriaId] [uniqueidentifier] NOT NULL,
	[Sort] [int] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[UpdatedAt] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_EvaluationCriteriaSample] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EvaluationDetailsPersonal]    Script Date: 11/26/2024 10:02:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EvaluationDetailsPersonal](
	[Id] [uniqueidentifier] NOT NULL,
	[EvaluationId] [uniqueidentifier] NULL,
	[UserId] [uniqueidentifier] NULL,
	[EvaluationCriteriaId] [uniqueidentifier] NULL,
	[AssessmentValue] [int] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[UpdatedAt] [datetime2](7) NOT NULL,
	[Status] [int] NOT NULL,
 CONSTRAINT [PK_EvaluationDetailsPersonal] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EvaluationDetailsSupervisor]    Script Date: 11/26/2024 10:02:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EvaluationDetailsSupervisor](
	[Id] [uniqueidentifier] NOT NULL,
	[EvaluationId] [uniqueidentifier] NOT NULL,
	[UserSupervisorId] [uniqueidentifier] NOT NULL,
	[EvaluationDetailsPersonalId] [uniqueidentifier] NOT NULL,
	[AssessmentValueSupervisor] [int] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[UpdatedAt] [datetime2](7) NOT NULL,
	[Status] [int] NOT NULL,
 CONSTRAINT [PK_EvaluationDetailsSupervisor] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EvaluationExplaint]    Script Date: 11/26/2024 10:02:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EvaluationExplaint](
	[Id] [uniqueidentifier] NOT NULL,
	[EvaluationId] [uniqueidentifier] NULL,
	[UserId] [uniqueidentifier] NULL,
	[SupervisorId] [uniqueidentifier] NULL,
	[CategoryCriteriaId] [uniqueidentifier] NULL,
	[Note] [nvarchar](max) NULL,
	[FileAttachments] [nvarchar](max) NULL,
	[IsDeleted] [bit] NOT NULL,
	[UpdatedAt] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_EvaluationExplaint] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EvaluationSample]    Script Date: 11/26/2024 10:02:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EvaluationSample](
	[Id] [uniqueidentifier] NOT NULL,
	[EvaluationSampleName] [nvarchar](max) NULL,
	[IsDeleted] [bit] NOT NULL,
	[UpdatedAt] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_EvaluationSample] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EvaluationUser]    Script Date: 11/26/2024 10:02:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EvaluationUser](
	[Id] [uniqueidentifier] NOT NULL,
	[EvaluationId] [uniqueidentifier] NOT NULL,
	[UserId] [uniqueidentifier] NOT NULL,
	[Type] [int] NOT NULL,
	[Sort] [int] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[UpdatedAt] [datetime2](7) NOT NULL,
	[IsManager] [bit] NULL,
 CONSTRAINT [PK_EvaluationUser] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MenuItems]    Script Date: 11/26/2024 10:02:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MenuItems](
	[Id] [uniqueidentifier] NOT NULL,
	[Key] [nvarchar](max) NULL,
	[Name] [nvarchar](max) NULL,
	[ParentId] [uniqueidentifier] NULL,
	[Route] [nvarchar](max) NULL,
	[Icon] [nvarchar](max) NULL,
	[Sort] [int] NOT NULL,
 CONSTRAINT [PK_MenuItems] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RefreshToken]    Script Date: 11/26/2024 10:02:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RefreshToken](
	[Id] [uniqueidentifier] NOT NULL,
	[UserId] [uniqueidentifier] NOT NULL,
	[Token] [nvarchar](max) NULL,
	[JwtId] [nvarchar](max) NULL,
	[IsUsed] [bit] NOT NULL,
	[IsRevoked] [bit] NOT NULL,
	[IssuedAt] [datetime2](7) NOT NULL,
	[ExpiredAt] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_RefreshToken] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RoleMenuItems]    Script Date: 11/26/2024 10:02:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RoleMenuItems](
	[Id] [uniqueidentifier] NOT NULL,
	[RoleId] [uniqueidentifier] NOT NULL,
	[MenuItemId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_RoleMenuItems] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 11/26/2024 10:02:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[Id] [uniqueidentifier] NOT NULL,
	[RoleName] [nvarchar](max) NOT NULL,
	[UpdatedAt] [datetime2](7) NOT NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Unit]    Script Date: 11/26/2024 10:02:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Unit](
	[Id] [uniqueidentifier] NOT NULL,
	[UnitName] [nvarchar](max) NOT NULL,
	[ParentId] [uniqueidentifier] NULL,
	[IsDeleted] [bit] NOT NULL,
	[UpdatedAt] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Unit] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 11/26/2024 10:02:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[Id] [uniqueidentifier] NOT NULL,
	[UserTypeId] [uniqueidentifier] NOT NULL,
	[UnitId] [uniqueidentifier] NOT NULL,
	[FullName] [nvarchar](max) NOT NULL,
	[Email] [nvarchar](max) NOT NULL,
	[Password] [nvarchar](max) NOT NULL,
	[Phone] [nvarchar](max) NULL,
	[Address] [nvarchar](max) NULL,
	[Birthday] [datetime2](7) NOT NULL,
	[PositionsName] [nvarchar](max) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[UpdatedAt] [datetime2](7) NOT NULL,
	[ActivationCode] [nvarchar](max) NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserRoles]    Script Date: 11/26/2024 10:02:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserRoles](
	[Id] [uniqueidentifier] NOT NULL,
	[RoleId] [uniqueidentifier] NOT NULL,
	[UserId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_UserRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserType]    Script Date: 11/26/2024 10:02:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserType](
	[Id] [uniqueidentifier] NOT NULL,
	[UserTypeName] [nvarchar](max) NOT NULL,
	[UpdatedAt] [datetime2](7) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_UserType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20241021122100_DbInit', N'6.0.35')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20241023033504_UpdateMenuItems-UserRoles', N'6.0.35')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20241023040151_UpdateMenuItems-UserRoles', N'6.0.35')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20241023054503_DbUpdate2', N'6.0.35')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20241031031248_UpdateDB31102024', N'6.0.35')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20241102024912_UpdateDb', N'6.0.35')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20241102095516_UpdateDB11022024', N'6.0.35')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20241102095941_Update1102', N'6.0.35')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20241103063531_Update', N'6.0.35')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20241103123512_Add-CategoryComment', N'6.0.35')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20241103124538_Add-CategoryProsCons', N'6.0.35')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20241105040057_UpdateDb11052024', N'6.0.35')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20241105083933_Update-Sort-EvaluationCriteria', N'6.0.35')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20241111031603_UpdateDb11112024', N'6.0.35')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20241111031738_UpdateDb11112024-EvaluationUser', N'6.0.35')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20241112022124_UpdateDB1211', N'6.0.35')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20241112022751_UpdateDB12112024', N'6.0.35')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20241113145114_UpdateDb1311', N'6.0.35')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20241114031638_UpdateDB1411', N'6.0.35')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20241114032208_UpdateDb1411-2', N'6.0.35')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20241120154539_UpdateDB20112024', N'6.0.35')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20241122131721_UpdateDB2211', N'6.0.35')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20241123030704_UpdateDB2311', N'6.0.35')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20241126124559_UpdateDB26112024', N'6.0.35')
GO
INSERT [dbo].[CategoryComment] ([Id], [Title], [Content], [Sort], [IsDeleted], [UpdatedAt]) VALUES (N'dbb4e5b7-3edc-4c9c-8432-0ecf57a9dcda', N'Tác phong, lề lối làm việc', N'- Có trách nhiệm với công việc; năng động, sáng tạo, dám nghĩ, dám làm, linh hoạt trong thực hiện nhiệm vụ.
- Phương pháp làm việc khoa học, dân chủ, đúng nguyên tắc.
- Có tinh thần trách nhiệm và phối hợp trong thực hiện nhiệm vụ.
- Có thái độ đúng mực và phong cách ứng xử, lề lối làm việc chuẩn mực, đáp ứng yêu cầu của văn hóa công vụ.', 3, 0, CAST(N'2024-11-03T20:20:09.9295735' AS DateTime2))
INSERT [dbo].[CategoryComment] ([Id], [Title], [Content], [Sort], [IsDeleted], [UpdatedAt]) VALUES (N'a19dc9c1-b3d4-46ec-8f8e-4b5f9fcc421f', N'Đạo đức, lối sống', N'- Không tham ô, tham nhũng, tiêu cực, lãng phí, quan liêu, cơ hội, vụ lợi, hách dịch, cửa quyền; không có biểu hiện suy thoái về đạo đức, lối sống, tự diễn biến, tự chuyển hóa.
- Có lối sống trung thực, khiêm tốn, chân thành, trong sáng, giản dị.
- Có tinh thần đoàn kết, xây dựng cơ quan, tổ chức, đơn vị trong sạch, vững mạnh.
- Không để người thân, người quen lợi dụng chức vụ, quyền hạn của mình để trục lợi.', 2, 0, CAST(N'2024-11-03T20:20:09.9295750' AS DateTime2))
INSERT [dbo].[CategoryComment] ([Id], [Title], [Content], [Sort], [IsDeleted], [UpdatedAt]) VALUES (N'b22aa353-80c4-422a-ac19-6eb17696e59a', N'Ý thức tổ chức kỷ luật', N'- Chấp hành sự phân công của tổ chức.
- Thực hiện các quy định, quy chế, nội quy của cơ quan, tổ chức, đơn vị nơi công tác.
- Thực hiện việc kê khai và công khai tài sản, thu nhập theo quy định.
- Báo cáo đầy đủ, trung thực, cung cấp thông tin chính xác, khách quan về những nội dung liên quan đến việc thực hiện chức trách, nhiệm vụ được giao và hoạt động của cơ quan, tổ chức, đơn vị với cấp trên khi được yêu cầu.', 4, 0, CAST(N'2024-11-03T20:20:09.9295751' AS DateTime2))
INSERT [dbo].[CategoryComment] ([Id], [Title], [Content], [Sort], [IsDeleted], [UpdatedAt]) VALUES (N'e0b40217-9a2d-4f4e-a3e4-9118777dde47', N'Chính trị tư tưởng', N'- Chấp hành chủ trương, đường lối, quy định của Đảng, chính sách, pháp luật của Nhà nước và các nguyên tắc tổ chức, kỷ luật của Đảng, nhất là nguyên tắc tập trung dân chủ, tự phê bình và phê bình.
- Có quan điểm, bản lĩnh chính trị vững vàng; kiên định lập trường; không dao động trước mọi khó khăn, thách thức.
Đặt lợi ích của Đảng, quốc gia - dân tộc, nhân dân, tập thể lên trên lợi ích cá nhân.
- Có ý thức nghiên cứu, học tập, vận dụng chủ nghĩa Mác - Lênin, tư tưởng Hồ Chí Minh, nghị quyết, chỉ thị, quyết định và các văn bản của Đảng.', 1, 0, CAST(N'2024-11-03T20:20:09.9295752' AS DateTime2))
INSERT [dbo].[CategoryComment] ([Id], [Title], [Content], [Sort], [IsDeleted], [UpdatedAt]) VALUES (N'fe4dba44-05d3-4d8d-b8b4-fc08d7ca249b', N'Kết quả thực hiện chức trách, nhiệm vụ được giao', N'- Kết quả hoạt động của cơ quan, tổ chức, đơn vị được giao lãnh đạo, quản lý, phụ trách (xác định rõ nội dung công việc thực hiện; tỷ lệ hoàn thành, chất lượng, tiến độ công việc):
+ Quán triệt, thể chế hóa và thực hiện chủ trương, đường lối của Đảng, chính sách, pháp luật của Nhà nước tại cơ quan, tổ chức, đơn vị.
+ Duy trì kỷ luật, kỷ cương trong cơ quan, tổ chức, đơn vị; không để xảy ra các vụ, việc vi phạm kỷ luật, vi phạm pháp luật phải xử lý, tình trạng khiếu nại, tố cáo kéo dài; phòng, chống tham nhũng, lãng phí trong phạm vi cơ quan, tổ chức, đơn vị.
+ Lãnh đạo, chỉ đạo, tổ chức kiểm tra, thanh tra, giám sát, giải quyết khiếu nại, tố cáo theo thẩm quyền; chỉ đạo, thực hiện công tác cải cách hành chính, cải cách chế độ công vụ, công chức tại cơ quan, tổ chức, đơn vị.
+ Xây dựng chương trình, kế hoạch hoạt động hàng năm của cơ quan, tổ chức, đơn vị được giao quản lý, phụ trách, trong đó xác định rõ kết quả thực hiện các chỉ tiêu, nhiệm vụ, lượng hóa bằng sản phẩm cụ thể.
- Năng lực lãnh đạo, quản lý:
+ Phân công nhiệm vụ cho cấp dưới căn cứ vào năng lực, trình độ và tính phù hợp, sở trường của từng người, phù hợp với công việc được giao.
+ Tạo mối đoàn kết, hỗ trợ trong công tác của công chức trong đơn vị.
- Năng lực tập hợp, đoàn kết:
+ Lãnh đạo thực hiện mọi nhiệm vụ trên nguyên tắc tập trung dân chủ, phát huy quyền làm chủ, xây dựng khối đại đoàn kết giữa các bộ phận, tổ chức trong đơn vị.', 5, 0, CAST(N'2024-11-03T20:20:09.9295753' AS DateTime2))
GO
INSERT [dbo].[CategoryCriteria] ([Id], [ParentId], [CategoryRatingId], [UnitId], [CriteriaName], [IsDistinct], [IsDeleted], [UpdatedAt]) VALUES (N'7fe6502c-10e1-430f-bbbd-01943d0f5e98', N'93b43166-bdad-4118-9bed-8176279fdf95', N'f316dfc3-3594-4a09-9fd9-03bf49cf5e98', N'fe6717f3-92c1-48dd-acf6-a65dbefdb04e', N'Khả năng tổ chức, phân công nhiệm vụ và quản lý đội ngũ cán bộ, giáo viên.', 0, 0, CAST(N'2024-11-23T13:16:00.3944338' AS DateTime2))
INSERT [dbo].[CategoryCriteria] ([Id], [ParentId], [CategoryRatingId], [UnitId], [CriteriaName], [IsDistinct], [IsDeleted], [UpdatedAt]) VALUES (N'99652497-2b73-4368-901c-05143fd3f8b1', N'97787e25-9013-4175-a4e6-ca0d74509ac1', N'f316dfc3-3594-4a09-9fd9-03bf49cf5e98', N'fe6717f3-92c1-48dd-acf6-a65dbefdb04e', N'Đánh giá phẩm chất đạo đức, sự công bằng và uy tín trong quản lý.', 0, 0, CAST(N'2024-11-23T13:18:34.6031813' AS DateTime2))
INSERT [dbo].[CategoryCriteria] ([Id], [ParentId], [CategoryRatingId], [UnitId], [CriteriaName], [IsDistinct], [IsDeleted], [UpdatedAt]) VALUES (N'418bf356-ca1e-4db7-9aec-0635713b688d', N'8005ad2a-4d92-4101-9719-8e8364e57996', NULL, N'fe6717f3-92c1-48dd-acf6-a65dbefdb04e', N'Xây dựng chiến lược và tầm nhìn', 0, 0, CAST(N'2024-11-23T13:15:20.6768381' AS DateTime2))
INSERT [dbo].[CategoryCriteria] ([Id], [ParentId], [CategoryRatingId], [UnitId], [CriteriaName], [IsDistinct], [IsDeleted], [UpdatedAt]) VALUES (N'a7efdc67-aa93-46cb-8410-0ddcfe0d5853', N'e6d88410-17f4-479b-8e2d-8b6d5c0324a7', N'0273a6e8-6078-4383-81f2-bbbf6fe016f4', N'4402c619-783f-4580-83cd-86e50a47171d', N'Duy trì kỷ luật, kỷ cương trong cơ quan, tổ chức, đơn vị; không để xảy ra các vụ, việc vi phạm kỷ luật, vi phạm pháp luật phải xử lý, tình trạng khiếu nại, tố cáo kéo dài; phòng, chống tham nhũng, lãng phí trong phạm vi cơ quan, tổ chức, đơn vị.', 0, 0, CAST(N'2024-11-03T15:07:05.0453887' AS DateTime2))
INSERT [dbo].[CategoryCriteria] ([Id], [ParentId], [CategoryRatingId], [UnitId], [CriteriaName], [IsDistinct], [IsDeleted], [UpdatedAt]) VALUES (N'da5e3dff-a649-4508-943d-0ecc32d4f7fc', N'31314875-8f03-4874-be17-0f31c14f28ee', N'0164939d-6db7-40f9-8d73-064a33cccd6b', N'4402c619-783f-4580-83cd-86e50a47171d', N'Có thái độ đúng mực và phong cách ứng xử, lề lối làm việc chuẩn mực, đáp ứng yêu cầu của văn hóa công vụ.', 0, 0, CAST(N'2024-11-03T15:03:04.4188496' AS DateTime2))
INSERT [dbo].[CategoryCriteria] ([Id], [ParentId], [CategoryRatingId], [UnitId], [CriteriaName], [IsDistinct], [IsDeleted], [UpdatedAt]) VALUES (N'31314875-8f03-4874-be17-0f31c14f28ee', NULL, NULL, N'4402c619-783f-4580-83cd-86e50a47171d', N'Tác phong, lề lối làm việc', 0, 0, CAST(N'2024-11-03T15:02:34.6488939' AS DateTime2))
INSERT [dbo].[CategoryCriteria] ([Id], [ParentId], [CategoryRatingId], [UnitId], [CriteriaName], [IsDistinct], [IsDeleted], [UpdatedAt]) VALUES (N'f4c06feb-eb3d-4f75-95f9-10c0289de995', N'e6d88410-17f4-479b-8e2d-8b6d5c0324a7', N'0273a6e8-6078-4383-81f2-bbbf6fe016f4', N'4402c619-783f-4580-83cd-86e50a47171d', N'Lãnh đạo, chỉ đạo, tổ chức kiểm tra, thanh tra, giám sát, giải quyết khiếu nại, tố cáo theo thẩm quyền; chỉ đạo, thực hiện công tác cải cách hành chính, cải cách chế độ công vụ, công chức tại cơ quan, tổ chức, đơn vị.', 0, 0, CAST(N'2024-11-03T15:07:12.9522130' AS DateTime2))
INSERT [dbo].[CategoryCriteria] ([Id], [ParentId], [CategoryRatingId], [UnitId], [CriteriaName], [IsDistinct], [IsDeleted], [UpdatedAt]) VALUES (N'51ea330f-07af-4d54-adff-114bdd0e6057', N'418bf356-ca1e-4db7-9aec-0635713b688d', N'f316dfc3-3594-4a09-9fd9-03bf49cf5e98', N'fe6717f3-92c1-48dd-acf6-a65dbefdb04e', N'Đánh giá khả năng xây dựng kế hoạch dài hạn và tầm nhìn cho nhà trường', 0, 0, CAST(N'2024-11-23T13:15:34.1493315' AS DateTime2))
INSERT [dbo].[CategoryCriteria] ([Id], [ParentId], [CategoryRatingId], [UnitId], [CriteriaName], [IsDistinct], [IsDeleted], [UpdatedAt]) VALUES (N'8b678550-a782-4ed9-a61f-15887cf5a73e', NULL, NULL, N'4402c619-783f-4580-83cd-86e50a47171d', N'Chính trị tư tưởng', 0, 0, CAST(N'2024-11-23T08:36:42.1540004' AS DateTime2))
INSERT [dbo].[CategoryCriteria] ([Id], [ParentId], [CategoryRatingId], [UnitId], [CriteriaName], [IsDistinct], [IsDeleted], [UpdatedAt]) VALUES (N'ca2c80e4-c9e6-4bc1-a080-1c0505bccaba', N'786e1a85-def5-4a2e-a70c-cfc2c0d8b239', N'0164939d-6db7-40f9-8d73-064a33cccd6b', N'4402c619-783f-4580-83cd-86e50a47171d', N'Thực hiện các quy định, quy chế, nội quy của cơ quan, tổ chức, đơn vị nơi công tác.', 0, 0, CAST(N'2024-11-03T15:03:56.0350066' AS DateTime2))
INSERT [dbo].[CategoryCriteria] ([Id], [ParentId], [CategoryRatingId], [UnitId], [CriteriaName], [IsDistinct], [IsDeleted], [UpdatedAt]) VALUES (N'79459d60-5db6-48b6-94bf-2121d9839e15', N'8b678550-a782-4ed9-a61f-15887cf5a73e', N'81788585-ac18-4dec-b0c6-8b0bc946eccf', N'4402c619-783f-4580-83cd-86e50a47171d', N'Đặt lợi ích của Đảng, quốc gia - dân tộc, nhân dân, tập thể lên trên lợi ích cá nhân.', 0, 0, CAST(N'2024-11-23T08:37:03.6785450' AS DateTime2))
INSERT [dbo].[CategoryCriteria] ([Id], [ParentId], [CategoryRatingId], [UnitId], [CriteriaName], [IsDistinct], [IsDeleted], [UpdatedAt]) VALUES (N'cdaf282b-23f7-42a5-b099-22cd38a5c8b1', N'1834d96f-f389-45f2-9006-f9d57b1ecf53', N'dcbd5ccb-31d8-4cd6-8b79-cbe359f071f2', N'fe6717f3-92c1-48dd-acf6-a65dbefdb04e', N'Khả năng thích nghi và sáng tạo trong công việc.', 0, 0, CAST(N'2024-11-23T13:19:22.2704299' AS DateTime2))
INSERT [dbo].[CategoryCriteria] ([Id], [ParentId], [CategoryRatingId], [UnitId], [CriteriaName], [IsDistinct], [IsDeleted], [UpdatedAt]) VALUES (N'c733b044-2ace-43ea-be34-251b9af672cf', N'e9cfa38c-e121-46ce-aaf5-b454a6b9f128', N'f316dfc3-3594-4a09-9fd9-03bf49cf5e98', N'fe6717f3-92c1-48dd-acf6-a65dbefdb04e', N'Đánh giá việc triển khai các giải pháp nâng cao chất lượng giáo dục.', 0, 0, CAST(N'2024-11-23T13:17:04.1526418' AS DateTime2))
INSERT [dbo].[CategoryCriteria] ([Id], [ParentId], [CategoryRatingId], [UnitId], [CriteriaName], [IsDistinct], [IsDeleted], [UpdatedAt]) VALUES (N'4451add8-b5d1-483a-9fe8-254611d89e32', N'8005ad2a-4d92-4101-9719-8e8364e57996', NULL, N'fe6717f3-92c1-48dd-acf6-a65dbefdb04e', N'Khả năng ra quyết định', 0, 0, CAST(N'2024-11-23T13:16:10.7560623' AS DateTime2))
INSERT [dbo].[CategoryCriteria] ([Id], [ParentId], [CategoryRatingId], [UnitId], [CriteriaName], [IsDistinct], [IsDeleted], [UpdatedAt]) VALUES (N'999d3424-6bad-4d7b-8bd0-2b462b55dd45', N'8b678550-a782-4ed9-a61f-15887cf5a73e', N'81788585-ac18-4dec-b0c6-8b0bc946eccf', N'4402c619-783f-4580-83cd-86e50a47171d', N'Có ý thức nghiên cứu, học tập, vận dụng chủ nghĩa Mác - Lênin, tư tưởng Hồ Chí Minh, nghị quyết, chỉ thị, quyết định và các văn bản của Đảng.', 0, 0, CAST(N'2024-11-23T08:37:09.0195122' AS DateTime2))
INSERT [dbo].[CategoryCriteria] ([Id], [ParentId], [CategoryRatingId], [UnitId], [CriteriaName], [IsDistinct], [IsDeleted], [UpdatedAt]) VALUES (N'b4ab63da-81d4-4ea1-8a5a-3c12154fa561', N'8b678550-a782-4ed9-a61f-15887cf5a73e', N'81788585-ac18-4dec-b0c6-8b0bc946eccf', N'4402c619-783f-4580-83cd-86e50a47171d', N'Chấp hành chủ trương, đường lối, quy định của Đảng, chính sách, pháp luật của Nhà nước và các nguyên tắc tổ chức, kỷ luật của Đảng, nhất là nguyên tắc tập trung dân chủ, tự phê bình và phê bình.', 0, 0, CAST(N'2024-11-23T08:36:56.1468656' AS DateTime2))
INSERT [dbo].[CategoryCriteria] ([Id], [ParentId], [CategoryRatingId], [UnitId], [CriteriaName], [IsDistinct], [IsDeleted], [UpdatedAt]) VALUES (N'c702e9e8-111b-4402-8ed0-5f939a7892a6', N'76f4c106-34b2-4175-a413-f0b67106218f', N'0164939d-6db7-40f9-8d73-064a33cccd6b', N'4402c619-783f-4580-83cd-86e50a47171d', N'Không để người thân, người quen lợi dụng chức vụ, quyền hạn của mình để trục lợi.', 0, 0, CAST(N'2024-11-03T15:02:26.9577663' AS DateTime2))
INSERT [dbo].[CategoryCriteria] ([Id], [ParentId], [CategoryRatingId], [UnitId], [CriteriaName], [IsDistinct], [IsDeleted], [UpdatedAt]) VALUES (N'b9ec64fd-8aac-44db-8541-67b1c6162676', N'4723cac1-52f7-43bb-8d3f-bfb3b6c28a96', N'aa5db29e-7359-406a-9bc3-c37f756ae46e', N'4402c619-783f-4580-83cd-86e50a47171d', N'Tạo mối đoàn kết, hỗ trợ trong công tác của công chức trong đơn vị.', 0, 0, CAST(N'2024-11-03T15:07:51.0421238' AS DateTime2))
INSERT [dbo].[CategoryCriteria] ([Id], [ParentId], [CategoryRatingId], [UnitId], [CriteriaName], [IsDistinct], [IsDeleted], [UpdatedAt]) VALUES (N'acf13799-4766-4be0-a514-693c0d238f34', N'4723cac1-52f7-43bb-8d3f-bfb3b6c28a96', N'aa5db29e-7359-406a-9bc3-c37f756ae46e', N'4402c619-783f-4580-83cd-86e50a47171d', N'Phân công nhiệm vụ cho cấp dưới căn cứ vào năng lực, trình độ và tính phù hợp, sở trường của từng người, phù hợp với công việc được giao.', 0, 0, CAST(N'2024-11-03T15:07:56.1457463' AS DateTime2))
INSERT [dbo].[CategoryCriteria] ([Id], [ParentId], [CategoryRatingId], [UnitId], [CriteriaName], [IsDistinct], [IsDeleted], [UpdatedAt]) VALUES (N'39750d51-ea4d-4d9b-b871-6a65bb01b5a9', N'f8c74f4e-94a2-4f75-9572-bf9c4692fae0', N'22b3f64b-68f5-4bbe-8400-9f20707c2795', N'fe6717f3-92c1-48dd-acf6-a65dbefdb04e', N'Kỹ năng giao tiếp, xây dựng mối quan hệ với cán bộ, giáo viên và phụ huynh.', 0, 0, CAST(N'2024-11-23T13:18:54.7189828' AS DateTime2))
INSERT [dbo].[CategoryCriteria] ([Id], [ParentId], [CategoryRatingId], [UnitId], [CriteriaName], [IsDistinct], [IsDeleted], [UpdatedAt]) VALUES (N'41245dd4-b247-48cd-a67c-6f23c005a5fe', N'abbcb306-3144-4c8a-8b98-eb07a3663ade', NULL, N'fe6717f3-92c1-48dd-acf6-a65dbefdb04e', N'Khuyến khích đổi mới sáng tạo', 0, 0, CAST(N'2024-11-23T13:17:49.6130257' AS DateTime2))
INSERT [dbo].[CategoryCriteria] ([Id], [ParentId], [CategoryRatingId], [UnitId], [CriteriaName], [IsDistinct], [IsDeleted], [UpdatedAt]) VALUES (N'0f8a3810-dc07-47e8-a089-7d6c08107382', N'31314875-8f03-4874-be17-0f31c14f28ee', N'0164939d-6db7-40f9-8d73-064a33cccd6b', N'4402c619-783f-4580-83cd-86e50a47171d', N'Phương pháp làm việc khoa học, dân chủ, đúng nguyên tắc.', 0, 0, CAST(N'2024-11-03T15:02:50.4423472' AS DateTime2))
INSERT [dbo].[CategoryCriteria] ([Id], [ParentId], [CategoryRatingId], [UnitId], [CriteriaName], [IsDistinct], [IsDeleted], [UpdatedAt]) VALUES (N'93b43166-bdad-4118-9bed-8176279fdf95', N'8005ad2a-4d92-4101-9719-8e8364e57996', NULL, N'fe6717f3-92c1-48dd-acf6-a65dbefdb04e', N'Quản lý tổ chức và nhân sự', 0, 0, CAST(N'2024-11-23T13:15:48.8626312' AS DateTime2))
INSERT [dbo].[CategoryCriteria] ([Id], [ParentId], [CategoryRatingId], [UnitId], [CriteriaName], [IsDistinct], [IsDeleted], [UpdatedAt]) VALUES (N'1b68a81a-b654-4896-9195-84abfb081103', N'e6d88410-17f4-479b-8e2d-8b6d5c0324a7', N'0273a6e8-6078-4383-81f2-bbbf6fe016f4', N'4402c619-783f-4580-83cd-86e50a47171d', N'Quán triệt, thể chế hóa và thực hiện chủ trương, đường lối của Đảng, chính sách, pháp luật của Nhà nước tại cơ quan, tổ chức, đơn vị.', 0, 0, CAST(N'2024-11-03T15:06:16.9008104' AS DateTime2))
INSERT [dbo].[CategoryCriteria] ([Id], [ParentId], [CategoryRatingId], [UnitId], [CriteriaName], [IsDistinct], [IsDeleted], [UpdatedAt]) VALUES (N'e6d88410-17f4-479b-8e2d-8b6d5c0324a7', N'3c69d1e2-9204-431f-863f-a4ba07f3ac1d', NULL, N'4402c619-783f-4580-83cd-86e50a47171d', N'Kết quả hoạt động của cơ quan, tổ chức, đơn vị được giao lãnh đạo, quản lý, phụ trách (xác định rõ nội dung công việc thực hiện; tỷ lệ hoàn thành, chất lượng, tiến độ công việc)', 0, 0, CAST(N'2024-11-03T15:04:42.1757843' AS DateTime2))
INSERT [dbo].[CategoryCriteria] ([Id], [ParentId], [CategoryRatingId], [UnitId], [CriteriaName], [IsDistinct], [IsDeleted], [UpdatedAt]) VALUES (N'8005ad2a-4d92-4101-9719-8e8364e57996', NULL, NULL, N'fe6717f3-92c1-48dd-acf6-a65dbefdb04e', N'Năng lực lãnh đạo', 0, 0, CAST(N'2024-11-23T13:13:21.8486924' AS DateTime2))
INSERT [dbo].[CategoryCriteria] ([Id], [ParentId], [CategoryRatingId], [UnitId], [CriteriaName], [IsDistinct], [IsDeleted], [UpdatedAt]) VALUES (N'6f0a8890-c105-4fb4-874b-9d559847eca6', N'35ca5805-aa8f-4dc0-a895-c2bae87a00eb', N'aa5db29e-7359-406a-9bc3-c37f756ae46e', N'4402c619-783f-4580-83cd-86e50a47171d', N'Lãnh đạo thực hiện mọi nhiệm vụ trên nguyên tắc tập trung dân chủ, phát huy quyền làm chủ, xây dựng khối đại đoàn kết giữa các bộ phận, tổ chức trong đơn vị.', 0, 0, CAST(N'2024-11-03T15:08:18.4846660' AS DateTime2))
INSERT [dbo].[CategoryCriteria] ([Id], [ParentId], [CategoryRatingId], [UnitId], [CriteriaName], [IsDistinct], [IsDeleted], [UpdatedAt]) VALUES (N'3a9ab36e-b834-4a20-ba32-a0d34fdc47da', N'786e1a85-def5-4a2e-a70c-cfc2c0d8b239', N'0164939d-6db7-40f9-8d73-064a33cccd6b', N'4402c619-783f-4580-83cd-86e50a47171d', N'Chấp hành sự phân công của tổ chức', 0, 0, CAST(N'2024-11-03T15:03:27.4825669' AS DateTime2))
INSERT [dbo].[CategoryCriteria] ([Id], [ParentId], [CategoryRatingId], [UnitId], [CriteriaName], [IsDistinct], [IsDeleted], [UpdatedAt]) VALUES (N'3c69d1e2-9204-431f-863f-a4ba07f3ac1d', NULL, NULL, N'4402c619-783f-4580-83cd-86e50a47171d', N'Kết quả thực hiện chức trách, nhiệm vụ được giao', 0, 0, CAST(N'2024-11-03T15:04:30.2662224' AS DateTime2))
INSERT [dbo].[CategoryCriteria] ([Id], [ParentId], [CategoryRatingId], [UnitId], [CriteriaName], [IsDistinct], [IsDeleted], [UpdatedAt]) VALUES (N'87fedc0d-caae-4890-80d9-a6e086d71a1c', N'8b678550-a782-4ed9-a61f-15887cf5a73e', N'81788585-ac18-4dec-b0c6-8b0bc946eccf', N'4402c619-783f-4580-83cd-86e50a47171d', N'Có quan điểm, bản lĩnh chính trị vững vàng; kiên định lập trường; không dao động trước mọi khó khăn, thách thức.', 0, 0, CAST(N'2024-11-03T15:01:25.2812856' AS DateTime2))
INSERT [dbo].[CategoryCriteria] ([Id], [ParentId], [CategoryRatingId], [UnitId], [CriteriaName], [IsDistinct], [IsDeleted], [UpdatedAt]) VALUES (N'1746be1c-1adf-4f5d-8604-a711e2cc52f0', N'45455dc8-4edc-4fd6-bc00-d5433173d947', N'22b3f64b-68f5-4bbe-8400-9f20707c2795', N'fe6717f3-92c1-48dd-acf6-a65dbefdb04e', N'Quản lý và giám sát các hoạt động chuyên môn đạt hiệu quả.', 0, 0, CAST(N'2024-11-23T13:17:35.5932220' AS DateTime2))
INSERT [dbo].[CategoryCriteria] ([Id], [ParentId], [CategoryRatingId], [UnitId], [CriteriaName], [IsDistinct], [IsDeleted], [UpdatedAt]) VALUES (N'e9cfa38c-e121-46ce-aaf5-b454a6b9f128', N'abbcb306-3144-4c8a-8b98-eb07a3663ade', NULL, N'fe6717f3-92c1-48dd-acf6-a65dbefdb04e', N'Đảm bảo chất lượng giảng dạy', 0, 0, CAST(N'2024-11-23T13:16:51.8951575' AS DateTime2))
INSERT [dbo].[CategoryCriteria] ([Id], [ParentId], [CategoryRatingId], [UnitId], [CriteriaName], [IsDistinct], [IsDeleted], [UpdatedAt]) VALUES (N'415eb223-1f18-4338-be5a-b6b2ce5496ed', N'41245dd4-b247-48cd-a67c-6f23c005a5fe', N'dcbd5ccb-31d8-4cd6-8b79-cbe359f071f2', N'fe6717f3-92c1-48dd-acf6-a65dbefdb04e', N'Khả năng hỗ trợ và thúc đẩy sáng kiến đổi mới trong giảng dạy.', 0, 0, CAST(N'2024-11-23T13:18:01.3212035' AS DateTime2))
INSERT [dbo].[CategoryCriteria] ([Id], [ParentId], [CategoryRatingId], [UnitId], [CriteriaName], [IsDistinct], [IsDeleted], [UpdatedAt]) VALUES (N'e296f2f3-e89c-49b9-b304-b76df59719ae', N'31314875-8f03-4874-be17-0f31c14f28ee', N'0164939d-6db7-40f9-8d73-064a33cccd6b', N'4402c619-783f-4580-83cd-86e50a47171d', N'Có trách nhiệm với công việc; năng động, sáng tạo, dám nghĩ, dám làm, linh hoạt trong thực hiện nhiệm vụ.', 0, 0, CAST(N'2024-11-03T15:02:43.9248464' AS DateTime2))
INSERT [dbo].[CategoryCriteria] ([Id], [ParentId], [CategoryRatingId], [UnitId], [CriteriaName], [IsDistinct], [IsDeleted], [UpdatedAt]) VALUES (N'f8c74f4e-94a2-4f75-9572-bf9c4692fae0', N'71cc2ca9-d338-4621-bb19-f4bd2abc9e06', NULL, N'fe6717f3-92c1-48dd-acf6-a65dbefdb04e', N'Khả năng giao tiếp và ứng xử', 0, 0, CAST(N'2024-11-23T13:18:42.8444970' AS DateTime2))
INSERT [dbo].[CategoryCriteria] ([Id], [ParentId], [CategoryRatingId], [UnitId], [CriteriaName], [IsDistinct], [IsDeleted], [UpdatedAt]) VALUES (N'4723cac1-52f7-43bb-8d3f-bfb3b6c28a96', N'3c69d1e2-9204-431f-863f-a4ba07f3ac1d', NULL, N'4402c619-783f-4580-83cd-86e50a47171d', N'Năng lực lãnh đạo, quản lý', 0, 0, CAST(N'2024-11-03T15:07:38.5728019' AS DateTime2))
INSERT [dbo].[CategoryCriteria] ([Id], [ParentId], [CategoryRatingId], [UnitId], [CriteriaName], [IsDistinct], [IsDeleted], [UpdatedAt]) VALUES (N'fb40ad8f-098f-4fd1-8870-c05d1d25fae2', N'e6d88410-17f4-479b-8e2d-8b6d5c0324a7', N'0273a6e8-6078-4383-81f2-bbbf6fe016f4', N'4402c619-783f-4580-83cd-86e50a47171d', N'Xây dựng chương trình, kế hoạch hoạt động hàng năm của cơ quan, tổ chức, đơn vị được giao quản lý, phụ trách, trong đó xác định rõ kết quả thực hiện các chỉ tiêu, nhiệm vụ, lượng hóa bằng sản phẩm cụ thể.', 0, 0, CAST(N'2024-11-03T15:07:19.9708645' AS DateTime2))
INSERT [dbo].[CategoryCriteria] ([Id], [ParentId], [CategoryRatingId], [UnitId], [CriteriaName], [IsDistinct], [IsDeleted], [UpdatedAt]) VALUES (N'35ca5805-aa8f-4dc0-a895-c2bae87a00eb', N'3c69d1e2-9204-431f-863f-a4ba07f3ac1d', NULL, N'4402c619-783f-4580-83cd-86e50a47171d', N'Năng lực tập hợp, đoàn kết', 0, 0, CAST(N'2024-11-03T15:08:06.9496262' AS DateTime2))
INSERT [dbo].[CategoryCriteria] ([Id], [ParentId], [CategoryRatingId], [UnitId], [CriteriaName], [IsDistinct], [IsDeleted], [UpdatedAt]) VALUES (N'97787e25-9013-4175-a4e6-ca0d74509ac1', N'71cc2ca9-d338-4621-bb19-f4bd2abc9e06', NULL, N'fe6717f3-92c1-48dd-acf6-a65dbefdb04e', N'Đạo đức nghề nghiệp', 0, 0, CAST(N'2024-11-23T13:18:20.0051229' AS DateTime2))
INSERT [dbo].[CategoryCriteria] ([Id], [ParentId], [CategoryRatingId], [UnitId], [CriteriaName], [IsDistinct], [IsDeleted], [UpdatedAt]) VALUES (N'3622e825-11bb-44fd-bc59-ce0c40aa9509', N'76f4c106-34b2-4175-a413-f0b67106218f', N'3aea35b0-3c2f-4c9a-85ab-5d6bfbd06444', N'4402c619-783f-4580-83cd-86e50a47171d', N'Có lối sống trung thực, khiêm tốn, chân thành, trong sáng, giản dị.', 0, 0, CAST(N'2024-11-03T15:02:10.5558641' AS DateTime2))
INSERT [dbo].[CategoryCriteria] ([Id], [ParentId], [CategoryRatingId], [UnitId], [CriteriaName], [IsDistinct], [IsDeleted], [UpdatedAt]) VALUES (N'786e1a85-def5-4a2e-a70c-cfc2c0d8b239', NULL, NULL, N'4402c619-783f-4580-83cd-86e50a47171d', N'Ý thức tổ chức kỷ luật', 0, 0, CAST(N'2024-11-03T15:03:15.4696293' AS DateTime2))
INSERT [dbo].[CategoryCriteria] ([Id], [ParentId], [CategoryRatingId], [UnitId], [CriteriaName], [IsDistinct], [IsDeleted], [UpdatedAt]) VALUES (N'45455dc8-4edc-4fd6-bc00-d5433173d947', N'abbcb306-3144-4c8a-8b98-eb07a3663ade', NULL, N'fe6717f3-92c1-48dd-acf6-a65dbefdb04e', N'Khả năng kiểm soát tiến độ', 0, 0, CAST(N'2024-11-23T13:17:16.0846059' AS DateTime2))
INSERT [dbo].[CategoryCriteria] ([Id], [ParentId], [CategoryRatingId], [UnitId], [CriteriaName], [IsDistinct], [IsDeleted], [UpdatedAt]) VALUES (N'1fb789cf-87b0-43b0-a45e-e85e3891a9ee', N'31314875-8f03-4874-be17-0f31c14f28ee', N'0164939d-6db7-40f9-8d73-064a33cccd6b', N'4402c619-783f-4580-83cd-86e50a47171d', N'Có tinh thần trách nhiệm và phối hợp trong thực hiện nhiệm vụ.', 0, 0, CAST(N'2024-11-03T15:02:57.1283828' AS DateTime2))
INSERT [dbo].[CategoryCriteria] ([Id], [ParentId], [CategoryRatingId], [UnitId], [CriteriaName], [IsDistinct], [IsDeleted], [UpdatedAt]) VALUES (N'abbcb306-3144-4c8a-8b98-eb07a3663ade', NULL, NULL, N'fe6717f3-92c1-48dd-acf6-a65dbefdb04e', N'Quản lý hoạt động chuyên môn', 0, 0, CAST(N'2024-11-23T13:16:40.8208087' AS DateTime2))
INSERT [dbo].[CategoryCriteria] ([Id], [ParentId], [CategoryRatingId], [UnitId], [CriteriaName], [IsDistinct], [IsDeleted], [UpdatedAt]) VALUES (N'76f4c106-34b2-4175-a413-f0b67106218f', NULL, NULL, N'4402c619-783f-4580-83cd-86e50a47171d', N'Đạo đức, lối sống', 0, 0, CAST(N'2024-11-03T19:00:31.0594389' AS DateTime2))
INSERT [dbo].[CategoryCriteria] ([Id], [ParentId], [CategoryRatingId], [UnitId], [CriteriaName], [IsDistinct], [IsDeleted], [UpdatedAt]) VALUES (N'efbe3ff8-a8cb-408b-b2de-f0cdc5f03d55', N'76f4c106-34b2-4175-a413-f0b67106218f', N'3aea35b0-3c2f-4c9a-85ab-5d6bfbd06444', N'4402c619-783f-4580-83cd-86e50a47171d', N'Có tinh thần đoàn kết, xây dựng cơ quan, tổ chức, đơn vị trong sạch, vững mạnh.', 0, 0, CAST(N'2024-11-03T15:02:19.4751641' AS DateTime2))
INSERT [dbo].[CategoryCriteria] ([Id], [ParentId], [CategoryRatingId], [UnitId], [CriteriaName], [IsDistinct], [IsDeleted], [UpdatedAt]) VALUES (N'71cc2ca9-d338-4621-bb19-f4bd2abc9e06', NULL, NULL, N'fe6717f3-92c1-48dd-acf6-a65dbefdb04e', N'Phẩm chất cá nhân và uy tín', 0, 0, CAST(N'2024-11-23T13:18:12.0254528' AS DateTime2))
INSERT [dbo].[CategoryCriteria] ([Id], [ParentId], [CategoryRatingId], [UnitId], [CriteriaName], [IsDistinct], [IsDeleted], [UpdatedAt]) VALUES (N'51ef79d2-b47e-41f1-a99d-f5c0e4f4416e', N'786e1a85-def5-4a2e-a70c-cfc2c0d8b239', N'0164939d-6db7-40f9-8d73-064a33cccd6b', N'4402c619-783f-4580-83cd-86e50a47171d', N'Báo cáo đầy đủ, trung thực, cung cấp thông tin chính xác, khách quan về những nội dung liên quan đến việc thực hiện chức trách, nhiệm vụ được giao và hoạt động của cơ quan, tổ chức, đơn vị với cấp trên khi được yêu cầu.', 0, 0, CAST(N'2024-11-03T15:04:15.0766354' AS DateTime2))
INSERT [dbo].[CategoryCriteria] ([Id], [ParentId], [CategoryRatingId], [UnitId], [CriteriaName], [IsDistinct], [IsDeleted], [UpdatedAt]) VALUES (N'b2360422-271d-47f6-8884-f734d48e2cf6', N'4451add8-b5d1-483a-9fe8-254611d89e32', N'22b3f64b-68f5-4bbe-8400-9f20707c2795', N'fe6717f3-92c1-48dd-acf6-a65dbefdb04e', N'Đánh giá tính kịp thời và hiệu quả của các quyết định quản lý.', 0, 0, CAST(N'2024-11-23T13:16:25.9242823' AS DateTime2))
INSERT [dbo].[CategoryCriteria] ([Id], [ParentId], [CategoryRatingId], [UnitId], [CriteriaName], [IsDistinct], [IsDeleted], [UpdatedAt]) VALUES (N'bf0b9144-be3b-4213-8f3c-f744035ed4b5', N'786e1a85-def5-4a2e-a70c-cfc2c0d8b239', N'0164939d-6db7-40f9-8d73-064a33cccd6b', N'4402c619-783f-4580-83cd-86e50a47171d', N'Thực hiện việc kê khai và công khai tài sản, thu nhập theo quy định', 0, 0, CAST(N'2024-11-03T15:04:07.0678839' AS DateTime2))
INSERT [dbo].[CategoryCriteria] ([Id], [ParentId], [CategoryRatingId], [UnitId], [CriteriaName], [IsDistinct], [IsDeleted], [UpdatedAt]) VALUES (N'1834d96f-f389-45f2-9006-f9d57b1ecf53', N'71cc2ca9-d338-4621-bb19-f4bd2abc9e06', NULL, N'fe6717f3-92c1-48dd-acf6-a65dbefdb04e', N'Tính sáng tạo và linh hoạt', 0, 0, CAST(N'2024-11-23T13:19:13.2793363' AS DateTime2))
INSERT [dbo].[CategoryCriteria] ([Id], [ParentId], [CategoryRatingId], [UnitId], [CriteriaName], [IsDistinct], [IsDeleted], [UpdatedAt]) VALUES (N'ad4a5bce-f3c4-44a7-85c5-fdb1c2d19d12', N'76f4c106-34b2-4175-a413-f0b67106218f', N'3aea35b0-3c2f-4c9a-85ab-5d6bfbd06444', N'4402c619-783f-4580-83cd-86e50a47171d', N'Không tham ô, tham nhũng, tiêu cực, lãng phí, quan liêu, cơ hội, vụ lợi, hách dịch, cửa quyền; không có biểu hiện suy thoái về đạo đức, lối sống, tự diễn biến, tự chuyển hóa', 0, 0, CAST(N'2024-11-03T15:02:01.9729049' AS DateTime2))
GO
INSERT [dbo].[CategoryProsCons] ([Id], [Content], [IsPros], [IsDeleted], [UpdatedAt]) VALUES (N'9e91acdf-b669-41b6-a1dd-00e190859b17', N'Đôi khi chưa đảm bảo ngày, giờ công lao động.', 0, 0, CAST(N'2024-11-03T20:07:55.7710068' AS DateTime2))
INSERT [dbo].[CategoryProsCons] ([Id], [Content], [IsPros], [IsDeleted], [UpdatedAt]) VALUES (N'7b8b1285-b79c-4519-b569-42bfd95df536', N'Có tinh thần trách nhiệm và nhiệt tình, chủ động trong công việc.', 1, 0, CAST(N'2024-11-03T20:07:01.4351779' AS DateTime2))
INSERT [dbo].[CategoryProsCons] ([Id], [Content], [IsPros], [IsDeleted], [UpdatedAt]) VALUES (N'4311e99e-9b6c-42c5-a4ce-58bbbadfe13d', N'Có ý thức học hỏi, tiếp thu kinh nghiệm, lắng nghe ý kiến hướng dẫn, góp ý của lãnh đạo và các đồng nghiệp trong cơ quan. Tự nâng cao trình độ, không ngại những những nhiệm vụ mới có áp lực công việc cao do cơ quan, đơn vị, tổ chức giao phó.', 1, 0, CAST(N'2024-11-03T20:07:04.6702372' AS DateTime2))
INSERT [dbo].[CategoryProsCons] ([Id], [Content], [IsPros], [IsDeleted], [UpdatedAt]) VALUES (N'1cda3d04-83ce-40de-bb1d-5c7727847e47', N'Có năng lực trình độ chuyên môn nghiệp vụ vững vàng, đảm bảo được những nhiệm vụ công việc được cấp trên giao phó.', 1, 0, CAST(N'2024-11-03T20:06:57.6717241' AS DateTime2))
INSERT [dbo].[CategoryProsCons] ([Id], [Content], [IsPros], [IsDeleted], [UpdatedAt]) VALUES (N'7a285d32-2d2d-49eb-af5f-5d780d6ec972', N'Đôi lúc chưa đảm bảo giờ giấc trực nhật', 0, 0, CAST(N'2024-11-03T20:07:49.8786663' AS DateTime2))
INSERT [dbo].[CategoryProsCons] ([Id], [Content], [IsPros], [IsDeleted], [UpdatedAt]) VALUES (N'08bb4c20-eeb3-440f-907d-66176bf228b9', N'Không vi phạm về nhân cách danh dự, nhân phẩm làm ảnh hưởng xấu đến ngành, đơn vị nơi công tác.', 1, 0, CAST(N'2024-11-03T20:07:07.8200229' AS DateTime2))
INSERT [dbo].[CategoryProsCons] ([Id], [Content], [IsPros], [IsDeleted], [UpdatedAt]) VALUES (N'428ad543-15f6-4812-8a82-7d47a2c5aa5a', N'Ít phát biểu trong cuộc họp, chưa mạnh dạn trong tự phê bình và phê bình.', 0, 0, CAST(N'2024-11-03T20:07:27.6803352' AS DateTime2))
INSERT [dbo].[CategoryProsCons] ([Id], [Content], [IsPros], [IsDeleted], [UpdatedAt]) VALUES (N'203cd284-c7f4-4d96-a696-8312a35be201', N'Luôn chấp hành mọi chủ trương chính sách của Đảng, chính sách pháp luật của nhà nước, không vi phạm pháp luật, không mắc tệ nạn xã hội,có tinh thần đoàn kết,sẵn sàng giúp đỡ mọi người.', 1, 0, CAST(N'2024-11-03T20:06:42.2509257' AS DateTime2))
INSERT [dbo].[CategoryProsCons] ([Id], [Content], [IsPros], [IsDeleted], [UpdatedAt]) VALUES (N'79764a10-b1d6-48fe-ba82-92894e4c239a', N' Chấp hành tốt quy định về đạo đức nghề nghiệp, có phẩm chất đạo đức trong sáng giản dị, có thái độ hòa nhã, khiêm tốn với nhân đân khi giao tiếp trong công việc và lắng nghe ý kiến đóng góp của nhân dân.', 1, 0, CAST(N'2024-11-03T20:06:49.6259013' AS DateTime2))
INSERT [dbo].[CategoryProsCons] ([Id], [Content], [IsPros], [IsDeleted], [UpdatedAt]) VALUES (N'4440f7e5-3870-48fa-bac9-b6845067515c', N'Chưa hòa đồng với đồng nghiệp.', 0, 0, CAST(N'2024-11-03T20:07:44.8840895' AS DateTime2))
INSERT [dbo].[CategoryProsCons] ([Id], [Content], [IsPros], [IsDeleted], [UpdatedAt]) VALUES (N'2e316bf0-e770-4dd2-8d71-ccf00e30d598', N'Chưa chủ động thực hiện nhiệm vụ được giao.', 0, 0, CAST(N'2024-11-03T20:07:36.2587294' AS DateTime2))
INSERT [dbo].[CategoryProsCons] ([Id], [Content], [IsPros], [IsDeleted], [UpdatedAt]) VALUES (N'bb251d27-6e70-4202-b299-db80208aef0c', N'Tích cực, tận tụy, có ý thức trách nhiệm với công việc.', 1, 0, CAST(N'2024-11-03T20:07:12.8469086' AS DateTime2))
INSERT [dbo].[CategoryProsCons] ([Id], [Content], [IsPros], [IsDeleted], [UpdatedAt]) VALUES (N'9b0051cf-aa9d-49e7-9437-e69ba8189af4', N'Thực hiện đóng góp đầy đủ các loại quỹ và các nghĩa vụ khác của viên chức.', 1, 0, CAST(N'2024-11-03T20:06:53.8409188' AS DateTime2))
INSERT [dbo].[CategoryProsCons] ([Id], [Content], [IsPros], [IsDeleted], [UpdatedAt]) VALUES (N'7cd0d591-2dae-4fff-8da2-e9fc9bd4c028', N'test1', 1, 1, CAST(N'2024-11-03T20:06:29.3387198' AS DateTime2))
GO
INSERT [dbo].[CategoryRating] ([Id], [UnitId], [RatingName], [StartValue], [EndValue], [IsDeleted], [UpdatedAt]) VALUES (N'f316dfc3-3594-4a09-9fd9-03bf49cf5e98', N'fe6717f3-92c1-48dd-acf6-a65dbefdb04e', N'Thang điểm 0 - 15', 0, 15, 0, CAST(N'2024-11-23T13:14:12.3360521' AS DateTime2))
INSERT [dbo].[CategoryRating] ([Id], [UnitId], [RatingName], [StartValue], [EndValue], [IsDeleted], [UpdatedAt]) VALUES (N'0164939d-6db7-40f9-8d73-064a33cccd6b', N'4402c619-783f-4580-83cd-86e50a47171d', N'Thang điểm 0 - 3', 0, 3, 0, CAST(N'2024-11-03T15:00:28.2110712' AS DateTime2))
INSERT [dbo].[CategoryRating] ([Id], [UnitId], [RatingName], [StartValue], [EndValue], [IsDeleted], [UpdatedAt]) VALUES (N'3aea35b0-3c2f-4c9a-85ab-5d6bfbd06444', N'4402c619-783f-4580-83cd-86e50a47171d', N'Thang điểm 0 - 2', 0, 2, 0, CAST(N'2024-11-03T15:00:16.6323979' AS DateTime2))
INSERT [dbo].[CategoryRating] ([Id], [UnitId], [RatingName], [StartValue], [EndValue], [IsDeleted], [UpdatedAt]) VALUES (N'daf888a5-ca30-4679-8fc3-63ed35d0f970', N'4402c619-783f-4580-83cd-86e50a47171d', N'Thang điểm 0 - 24', 0, 24, 0, CAST(N'2024-11-03T15:00:41.8382124' AS DateTime2))
INSERT [dbo].[CategoryRating] ([Id], [UnitId], [RatingName], [StartValue], [EndValue], [IsDeleted], [UpdatedAt]) VALUES (N'7bc5f0d7-7f31-4ec4-804c-84e3cee675ce', N'4402c619-783f-4580-83cd-86e50a47171d', N'Thang điểm 0 - 9', 0, 9, 0, CAST(N'2024-11-03T15:05:22.6516042' AS DateTime2))
INSERT [dbo].[CategoryRating] ([Id], [UnitId], [RatingName], [StartValue], [EndValue], [IsDeleted], [UpdatedAt]) VALUES (N'81788585-ac18-4dec-b0c6-8b0bc946eccf', N'4402c619-783f-4580-83cd-86e50a47171d', N'Thang điểm 0 - 4', 0, 4, 0, CAST(N'2024-11-03T15:00:05.2911919' AS DateTime2))
INSERT [dbo].[CategoryRating] ([Id], [UnitId], [RatingName], [StartValue], [EndValue], [IsDeleted], [UpdatedAt]) VALUES (N'22b3f64b-68f5-4bbe-8400-9f20707c2795', N'fe6717f3-92c1-48dd-acf6-a65dbefdb04e', N'Thang điểm 0 - 10', 0, 10, 0, CAST(N'2024-11-23T13:14:37.5096469' AS DateTime2))
INSERT [dbo].[CategoryRating] ([Id], [UnitId], [RatingName], [StartValue], [EndValue], [IsDeleted], [UpdatedAt]) VALUES (N'2dff7931-edf8-4330-b5df-aadb06d13fa4', N'4402c619-783f-4580-83cd-86e50a47171d', N'Thang điểm 0 - 18', 0, 18, 0, CAST(N'2024-11-03T15:00:48.8073585' AS DateTime2))
INSERT [dbo].[CategoryRating] ([Id], [UnitId], [RatingName], [StartValue], [EndValue], [IsDeleted], [UpdatedAt]) VALUES (N'0273a6e8-6078-4383-81f2-bbbf6fe016f4', N'4402c619-783f-4580-83cd-86e50a47171d', N'Thang điểm 0 - 6', 0, 6, 0, CAST(N'2024-11-03T15:05:14.9995621' AS DateTime2))
INSERT [dbo].[CategoryRating] ([Id], [UnitId], [RatingName], [StartValue], [EndValue], [IsDeleted], [UpdatedAt]) VALUES (N'aa5db29e-7359-406a-9bc3-c37f756ae46e', N'4402c619-783f-4580-83cd-86e50a47171d', N'Thang điểm 0 - 9', 0, 9, 0, CAST(N'2024-11-03T15:00:54.9197438' AS DateTime2))
INSERT [dbo].[CategoryRating] ([Id], [UnitId], [RatingName], [StartValue], [EndValue], [IsDeleted], [UpdatedAt]) VALUES (N'dcbd5ccb-31d8-4cd6-8b79-cbe359f071f2', N'fe6717f3-92c1-48dd-acf6-a65dbefdb04e', N'Thang điểm 0 - 5', 0, 5, 0, CAST(N'2024-11-23T13:14:49.9870184' AS DateTime2))
INSERT [dbo].[CategoryRating] ([Id], [UnitId], [RatingName], [StartValue], [EndValue], [IsDeleted], [UpdatedAt]) VALUES (N'd896d84f-4f11-4573-86d5-e7b95c6ddc9d', N'4402c619-783f-4580-83cd-86e50a47171d', N'Thang điểm 10 - 15', 10, 15, 0, CAST(N'2024-11-23T13:14:24.7184931' AS DateTime2))
GO
INSERT [dbo].[CategoryTimeType] ([Id], [UnitId], [TimeTypeName], [FromDate], [ToDate], [IsDeleted], [UpdatedAt]) VALUES (N'cbd1e5ab-0498-460c-823d-0acfde1bc2d3', N'fe6717f3-92c1-48dd-acf6-a65dbefdb04e', N'Kỳ đánh giá tháng 12 - 2024', CAST(N'2024-12-01T00:00:00.0000000' AS DateTime2), CAST(N'2024-12-31T00:00:00.0000000' AS DateTime2), 0, CAST(N'2024-11-03T13:02:00.8186735' AS DateTime2))
INSERT [dbo].[CategoryTimeType] ([Id], [UnitId], [TimeTypeName], [FromDate], [ToDate], [IsDeleted], [UpdatedAt]) VALUES (N'f62939c8-91ba-4607-b531-1c13e0f974a1', N'fe6717f3-92c1-48dd-acf6-a65dbefdb04e', NULL, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 1, CAST(N'2024-11-03T14:26:35.8099810' AS DateTime2))
INSERT [dbo].[CategoryTimeType] ([Id], [UnitId], [TimeTypeName], [FromDate], [ToDate], [IsDeleted], [UpdatedAt]) VALUES (N'c8985f07-1ed7-4652-aa38-3b31bed2c4f6', N'93684774-0d94-42c9-ac77-078b6e3d2366', N'Thang 11 - 2024', CAST(N'2024-11-01T00:00:00.0000000' AS DateTime2), CAST(N'2024-11-30T00:00:00.0000000' AS DateTime2), 0, CAST(N'2024-11-23T18:48:20.2515297' AS DateTime2))
INSERT [dbo].[CategoryTimeType] ([Id], [UnitId], [TimeTypeName], [FromDate], [ToDate], [IsDeleted], [UpdatedAt]) VALUES (N'13d5e5a0-7eda-4725-9e56-455790a9c0a2', N'fe6717f3-92c1-48dd-acf6-a65dbefdb04e', N'Kỳ đánh giá tháng 11 - 2024', CAST(N'2024-11-01T00:00:00.0000000' AS DateTime2), CAST(N'2024-11-30T00:00:00.0000000' AS DateTime2), 0, CAST(N'2024-11-03T13:02:02.8835845' AS DateTime2))
INSERT [dbo].[CategoryTimeType] ([Id], [UnitId], [TimeTypeName], [FromDate], [ToDate], [IsDeleted], [UpdatedAt]) VALUES (N'6b42c95a-33d4-4432-a4f9-4f530a159af4', N'4402c619-783f-4580-83cd-86e50a47171d', N'test ky danh gia', CAST(N'2024-11-01T00:00:00.0000000' AS DateTime2), CAST(N'2024-11-30T00:00:00.0000000' AS DateTime2), 0, CAST(N'2024-11-23T13:49:36.1277841' AS DateTime2))
INSERT [dbo].[CategoryTimeType] ([Id], [UnitId], [TimeTypeName], [FromDate], [ToDate], [IsDeleted], [UpdatedAt]) VALUES (N'f3ce7482-413e-4776-b7af-7e5b4fa66902', N'4402c619-783f-4580-83cd-86e50a47171d', N'Thang 11 - 2024', CAST(N'2024-11-01T00:00:00.0000000' AS DateTime2), CAST(N'2024-11-30T00:00:00.0000000' AS DateTime2), 0, CAST(N'2024-11-23T18:48:44.4029925' AS DateTime2))
INSERT [dbo].[CategoryTimeType] ([Id], [UnitId], [TimeTypeName], [FromDate], [ToDate], [IsDeleted], [UpdatedAt]) VALUES (N'0ec736da-795b-4bc3-9b92-f4e0242d18e0', N'fe6717f3-92c1-48dd-acf6-a65dbefdb04e', N'Kỳ đánh giá tháng 1 - 2025', CAST(N'2025-01-01T00:00:00.0000000' AS DateTime2), CAST(N'2025-01-31T00:00:00.0000000' AS DateTime2), 0, CAST(N'2024-11-03T13:01:48.2535009' AS DateTime2))
GO
INSERT [dbo].[ElectronicSignature] ([Id], [UserId], [Status], [PublicKey], [PrivateKey], [UpdatedAt]) VALUES (N'ef66be0d-b061-4850-84a8-1ce089ddb466', N'0630cc13-3e54-4ba7-bdfe-f1ff42051257', 0, N'MIIBCgKCAQEAvdl5+9zOFJmeq222RfReVjE1rF3KrMN01EtvSycICuF4vLvH3MlxPkdzDJ77m+3r2EBofjN6ghiGnewPuMx6XezOCh5VorqmSkrSgbGo7AQly0CnsZdwOjurGq8+NHOgDaJfjYVmUVl0iYyw1VbfPUULvS8D16uwxX6IFwZShna+aG66hJKEN0H9aJGYtSmFIqRCYoBBUIJog3UmXh9ru1aSbf1b4iwMqwXSwhIUb9sdP6RWraHrKXFzYtaWqxeJFiWrYCNIx/xxLXiXqda+Yqn0c7gzf3HzijhYQXQF3B83E0IItEL/fni9QBgeb3DFtNszR23DaMTjGOtJhkoi4QIDAQAB', N'MIIEpQIBAAKCAQEAvdl5+9zOFJmeq222RfReVjE1rF3KrMN01EtvSycICuF4vLvH3MlxPkdzDJ77m+3r2EBofjN6ghiGnewPuMx6XezOCh5VorqmSkrSgbGo7AQly0CnsZdwOjurGq8+NHOgDaJfjYVmUVl0iYyw1VbfPUULvS8D16uwxX6IFwZShna+aG66hJKEN0H9aJGYtSmFIqRCYoBBUIJog3UmXh9ru1aSbf1b4iwMqwXSwhIUb9sdP6RWraHrKXFzYtaWqxeJFiWrYCNIx/xxLXiXqda+Yqn0c7gzf3HzijhYQXQF3B83E0IItEL/fni9QBgeb3DFtNszR23DaMTjGOtJhkoi4QIDAQABAoIBACHAPvpyt8RbxySM3aG0Hu1N1E/vYK+0E9oGCyQeLUTZ7sAG1jI/Mb2zsBVnUi3Xb11DnhAJkNb+CziaFfVxjLOT/NE5sVm7uwJsKN5buj8zQZDPzsA4vv/rSbD1xKZIhATIgBpFw/nkYF5vv6Q9zHQ1CTA54oH+CPAjXYhSXGuA89PwOW7sJVkmVzQwxVhUiDNgwgyLGvTgTbkz3kU/FHBKy3pH4jVkSNEJzG39T2PbqxGIEnPTzD+e0ZYC/12TtDvQ00O0/uPP0kcTeOgNi4G72Kv18vzE4Ick64fT2rgOakgem0oplXGboiX04wh2IOWvzapQLHtNA3x71OONuz0CgYEAxJIACR1Az+sBFCCsXjRBqktFWJioFBgGY6agPYbosCvdjaDt6C2rrk8qeNyx+y1cVRaRwIFmFv6O+jerpbsHxtvInGaWVxGSAup4qdiZwVbQnPo/d0jYS3vp9ssOrhSo8aBfDBc7IsRUpQK5ZS/Q8dLLfPQ6kc5O5Mpco3TODDsCgYEA9z9OKmyUbawU9XEdusxGCeh3Vk2nO7NqAq0d3o4aow2Wxj55SDc55g2T6KIUauIlKIE+npzFSUVhwTKgIipJaxic164+3P8xzlO/h0LCb7EjqlCGAfWyZA0LPYVwQErrcUWapQ8BDzcj27yiF1OX+cR4n1x/cT8y5PvYpLgyh5MCgYEAhzDmh14wIg89SauDALMt6kIkal9rUY6Ibma91DMBu5AfqvVgSguHBLX7vu4CFn7G/tor2drk7LGcgehhy/TKz3B/E1nW0gEKi6jY3e9TJ85eYWgW2CIoaBnL+mkDKqSY4L1sQTOE/09J68bo3Pe622Yff0u1MGxUhDPM7Lo7r9sCgYEAl7dx6Jh+MBozNjU2MATfSX8rk3rNDtZWS9QdCw8aC0nwZi+5znWNArz8MPkcHEYu1P8SBNRgP0ji5mGBX9Wg/aW5wKN8kbHKxzgexApUM6N4Ji+JO7SfxcM3TYYPTnRqqzQx4+0kEkkcqN7EfBngnPRRrEBfN4e3XEmqM9GPuB8CgYEArOHDp5BgEgt/F+APbAnKWdxCKWg7lRL5LworHfSqwBLxK7eC3UjL3Av9RjsSvjO31S2SLmQU4+OLOimm6pwP6mZC4O+26qtcihkO2Nudsd3ha1BbdHuek9PMEJ6yTErEoppCAVWCRNbKcLPjkM/8ZVbttufqfbIrp2IOLyuJCW8=', CAST(N'2024-11-23T14:16:10.3206624' AS DateTime2))
INSERT [dbo].[ElectronicSignature] ([Id], [UserId], [Status], [PublicKey], [PrivateKey], [UpdatedAt]) VALUES (N'3e531a06-9c5a-418b-b4d0-24b4d74bc856', N'c778e7e0-b970-4533-96a0-5091f4c57114', 0, N'MIIBCgKCAQEAu2qKuRWmFCvzreuhT26DtdSQq8X2dyIobbGYOpCpLh77zW1m4QM9kHjgeaTM0EBYdCDqUP/abM8jWd+qFF+Byl6ECMLGcMGIJJgCdv/9Sp7AuGkgH0xsYpj9PKery8HjadYw/qA3Jk948lJFalT9VDqn2vOr9rJTbEleDSfakBhtZ2MrLMMAoxadiiRUzQuarC64n3QynLff7m/CbnuyPNBzWMiiu3v1CJr6i2Cc+MvWCWK6aLn0KGKrKHcWO+uoxUDXi8Qm/R1TW8HKb//V4pWsmGvgKX0HarzzhCyC89rhcArI9O2imld6uLN+Q1kWyNnBIjKwArMmFbQDVkTo1QIDAQAB', N'MIIEpAIBAAKCAQEAu2qKuRWmFCvzreuhT26DtdSQq8X2dyIobbGYOpCpLh77zW1m4QM9kHjgeaTM0EBYdCDqUP/abM8jWd+qFF+Byl6ECMLGcMGIJJgCdv/9Sp7AuGkgH0xsYpj9PKery8HjadYw/qA3Jk948lJFalT9VDqn2vOr9rJTbEleDSfakBhtZ2MrLMMAoxadiiRUzQuarC64n3QynLff7m/CbnuyPNBzWMiiu3v1CJr6i2Cc+MvWCWK6aLn0KGKrKHcWO+uoxUDXi8Qm/R1TW8HKb//V4pWsmGvgKX0HarzzhCyC89rhcArI9O2imld6uLN+Q1kWyNnBIjKwArMmFbQDVkTo1QIDAQABAoIBADIRUGYJpoiVBVBdNobl20HkO5HoHOPOuEY1v5lFtCyiElra8zUBjJzf7fgRUrX/uqGreW2SLGQNIkCMQ/+VVDMf9N3yStksmpZMFbx8vsoEhy+8xdwWqo3cmSpvELIqZfqMQiKD4rfVW1ZBLFIvyk2KLfWMS1Boa2juYLXbA8SijOhiyqLbDibr1a9XToH0Vgy+kKHS3H0Usew2ssZJq3T/j/IgfXEwzPJ8cTZDjfeJwu6Y/waFgrqAwuAD60ez4j/RDwCQu2Htcm8GJ+UBDysZawZzR5t4RexGrDJRmeBrq6i463rVt1fam06RMWCaY7pCU8lYbpsysuFlU6KgJLECgYEA1nWrPfNfSZmjjPiBM53Efms4Px3O+h1ZL8jpEEH4wVwl52yu9Arzb7zG5bkISq3FJjA21tHu+jvX/BEX1mveonsmwrnc3lWJtmh9Z8XMSpfedxvRSR34fPRaUCLrjKhnD89aUc4fDLYC3HeUyoC+CzE2i5NhNsWEJssKzh7ca6MCgYEA37fg8NOJt5fHdBF5/GCoffh82+B2C8FikBUGCcYX4hmHyomozsZQ/BhH1SXLp9CslHiNElPgEm4ZX5hpyY5wqKfAJQ5EOKYLNv/kTmHHoc6nrb0y64TwjAiYcJkkPemUgyG0Upm3r16ZeGVRAJYolI+JRPHkmYePh5/uywD1oScCgYEAyPA1g3Utmctfh20ruY4gFocli1XFoWmwL+qiHL6DccCCL0UQ484C63XIMmPdFgOdDjvslfjbXhCGPUJSwHAPiNO0rIzzGkqxHnzmyz10PYvwQE+LF2QCeCmHGUCuzPrYneKdcLqdMw6yvZk5i0d3SQtSXRK46lXEjYh+1kPqKNsCgYEAn6CqZevqdg9ch5r4uXWWg9vL62+rixO/aiM2Hb80x2WEGKZExtWGb3o7twCy4djpaz7hGdSzKzNX83fi86gpBo47cbVOREVl9yZ7Ftp6ASBdUICRVq+Sm7h+XMlIrMx/5VklO1LnV8BeLSPNumdqKSaJwaH/hPTPGuypDDxxBz0CgYAPtf2pZZOG9Mo+ZrY88pqMyx4gOpO1Jzx2uMN2iMMp0Xq8DdXBZ5XyPNPq0EIJEHo2mhqFJGnxjq3LlrOHq46v/ClnRNQP9jjrzxSuqVgEqSBbUKzrNMolKx5vJQg/DuDJv8TGXsfEmdoV+lT8YznXt0dhriUw83dsko7M4kRTog==', CAST(N'2024-11-23T14:15:06.3370272' AS DateTime2))
INSERT [dbo].[ElectronicSignature] ([Id], [UserId], [Status], [PublicKey], [PrivateKey], [UpdatedAt]) VALUES (N'fe9dbdd3-7fe3-421c-aba8-40eda65e7ff8', N'70be578e-af27-4056-a6ad-55990f86b3e7', 0, N'MIIBCgKCAQEAtM9Wlli9fNvl31+H2kXCvcg7Ht7/k6grKRga6VYcb28IIe5rf4Qkbt2LgJTo61eN+eBPuFYJvM1FRha62lFJhwLkJnwkMACGU6exntqAyWnoXNyFoWVYj6y2Z888mvR18/RadW8ZXh4lHtNj9+u7NW8TReurHkeXPVr+NbLkFsLRzu8eaEe9B4Fteq3CHypOsc1P76bGrTCZryVgvjyecXmJk5FLRxDio1ngDjMeveGZANgLycfW2d0U3JEdag7JogZWovrLZfxdXXKxWTGMcb61UlKMWmnVCqccWHnEr2DbgsKJ73wfKL15rETz4Ei9Rn5CeGs2zpM6H7szJqaMyQIDAQAB', N'MIIEpAIBAAKCAQEAtM9Wlli9fNvl31+H2kXCvcg7Ht7/k6grKRga6VYcb28IIe5rf4Qkbt2LgJTo61eN+eBPuFYJvM1FRha62lFJhwLkJnwkMACGU6exntqAyWnoXNyFoWVYj6y2Z888mvR18/RadW8ZXh4lHtNj9+u7NW8TReurHkeXPVr+NbLkFsLRzu8eaEe9B4Fteq3CHypOsc1P76bGrTCZryVgvjyecXmJk5FLRxDio1ngDjMeveGZANgLycfW2d0U3JEdag7JogZWovrLZfxdXXKxWTGMcb61UlKMWmnVCqccWHnEr2DbgsKJ73wfKL15rETz4Ei9Rn5CeGs2zpM6H7szJqaMyQIDAQABAoIBAQCNR8mntvVxP74R2Wqk4oe1lWSkzai0rt3ywVQd6VxUslSPduXmgNGbE1+y/Cg35HUav+xq5Ee9kEPF7XLZrlSeu2Kcs7nvDCnp6gm/T4r8VtXq4aFFKJSXx2PMH8GCbuxP0Cpywnn28eUdfh4KFdd1fDJ6GxjdkyEZHyWtvfe90/FVCc1kGts4hqBUX4E6JqbKfTIlNKVz2r+YHcOFpsXJF4GanRKf6Pp42qnhvnwZEpuRoaqBuDhq8Y042tsPIrSsRSUXt3sfcox7amt62PBKaLvb304h/kiyJvGUnFkH3Ya1/m3Yj5zsbw0439UVHwymF/GIv8f7C5XL/Oniz3k1AoGBAOuH+kIRHgRacNSoygzStBvVMNLutmZN/PThV4LlbWAxL+OiUSAttCLULRu8htKeoGA2dSRZWeYxQjCE3YMZpw/Nol9Ly/uTLSxiA/TnPsK6f9yl+HYH3cSZmClOQzvGmuwaVo9wN6appOx/xkEB+ywRneY2JJc1PKU8v0MKQdZXAoGBAMSF8JMGGdpA0xp9+Z3I1ygsRbhqjSusc8AQlzP4Phdscs64OOiPlBj9S8w4ecMUEXZHUC6BN8YeyhfEOiO632VUYkeXlrMIrTAK4V3SBj+0DQnuer3Od9/T98KBcoqCB0krZZXesDq1BDybvC7gdkLenl0lMH0Z1THzgK9rLYHfAoGAAJULd1JXgqc+lCf+p911eIQkZMEWTlZvA6Py9W3fwVcdyTBDhxLV2SgxHFpw8uBVgSdhTr+xyzHf+gK6EXLkyNM3TYkAbhTFDdEINXjE3PJdEoyOeqw2TiAbEi8RV3p8M401HZGncZAFylfeg5afqlI407LakE0fY0EtL9s8om0CgYBXm95DrNSZl4yEouREkuRX5GSwcc+9SIPRe5Psdx43EwGbZkT4aAl9mm3P/N1LOgcO03vLP4+9orw1HCVPCF/OrG+jutBTv+p1IGSXjql6fKnTY50UQJbwEW7CJzMIzC6zT8VZqoyln0zkOAkMXMRbyyKOI6YaHwoL2qHjkcQXwQKBgQCZ0B7vhoTgA6uVCDp+w+Igexm0Kea/5KwrYg5thshNXIx4/utvNB9T5rDHH6BvsMl2/qakx0Uz68FnQXXJxG+TigVMIDCVG4xBRp9Bd0zkvpk2yBj8+Qqf4QCMKeP70j25yAvI0YUNGBaJ4cqgyG2FdyzV9gDjFkOYk3PPiRLmyg==', CAST(N'2024-11-23T14:11:09.7465472' AS DateTime2))
INSERT [dbo].[ElectronicSignature] ([Id], [UserId], [Status], [PublicKey], [PrivateKey], [UpdatedAt]) VALUES (N'3aaa5e61-7b02-4959-a5f2-44e7b9af3530', N'2d1c4b21-92b0-4105-9151-0980a4c924ad', 0, N'MIIBCgKCAQEAwR9F3FIpyA/XgUsYzw7ffTe/8IUcaj3DyCT8g2C7uJWhs1TlbNNQX2jT7UsXMQLEt2rPbGSdro3mojBZoTTLNLwIpztMemj395sWm8gQGkuD0Sf+eno+CiPFscZ25H1r1Kzhz5woV6vLvQLd3QHuDL5EJCZ2IPqWpbliMtVP9I5C80GCiN3GLoQyPEiACENasjv3sIAw3+vftb1ZhH5CGIMmNYwXOB1o2l8l0G9YpniZ8PWvU2w+v/+4jpoY0SAv0yTxcEVlH0CkrxbjJfvuRQnz7ywQ0t9F2+b21VWtThKe3une53Ieh0nMoGUdjI6FxWZTgoF7Y36dgmhKqUIKQQIDAQAB', N'MIIEowIBAAKCAQEAwR9F3FIpyA/XgUsYzw7ffTe/8IUcaj3DyCT8g2C7uJWhs1TlbNNQX2jT7UsXMQLEt2rPbGSdro3mojBZoTTLNLwIpztMemj395sWm8gQGkuD0Sf+eno+CiPFscZ25H1r1Kzhz5woV6vLvQLd3QHuDL5EJCZ2IPqWpbliMtVP9I5C80GCiN3GLoQyPEiACENasjv3sIAw3+vftb1ZhH5CGIMmNYwXOB1o2l8l0G9YpniZ8PWvU2w+v/+4jpoY0SAv0yTxcEVlH0CkrxbjJfvuRQnz7ywQ0t9F2+b21VWtThKe3une53Ieh0nMoGUdjI6FxWZTgoF7Y36dgmhKqUIKQQIDAQABAoIBAQC0DyRjt3edQKf9tLb81zEo3sHmzzUfGVdhVJrbI2XjRB/vxEfkn2Fgk6yEom6NE7e2C7A5r9YU2dkff1USKNcN5ANtaKx1tUj9Y2xA8teQrLfKWy+5oiAV9CRvDEvt3cKcGFSx7TbwBw1+vR1+4j3BQ+Tkj7e0J/AttBsKqjhSGnJ3gcnPibNyPeyzRy9ZEIvZuwuumkcHSikcu3KoP0aU4D2+akmtFVexb3jnLVyn/R7lRFPZ4rl6IDki4eTmBBIJAuxhmhRQn2h176pE9oaCd/hpWQ9458/xToE+rG/jx4TcngEyDh4pj/dn/Dw8N17B6B0vVLoQclZEO9VB2MLBAoGBAO0R01tugr237Bkp+5CGgdyPmYXYQ5QJEixwRIIqUfOBQo3aLGga821i917+Gf7vR4kRe4xS1RvAuL1rpbPA6jVUr+N+g8SHL2UeJTxHBNNR9IoaSI7VkRS6Q9wxSDshU6br4jPTRL1z/PPxHTHw02rvL6by7b+ihodIvG2YxdXPAoGBANCLEtkSGIYIljm2Ljks5GV9tC+TTTabYwy7XUsJQX6Ruh2OwS77hHUJTodhWyqRnLFGBkPbKISLM7qSDLH7/wtmCU83PiZ7S2UmQo9j0mPYE1tYzdGvDA9gHl4Wjha9kuQ5ZyH+3RKMGhkjKorG4pvFF1+TUqv6syYEgVMeozLvAoGARjOkIgwsnR+sw5riCt8572V6sd7jzB+PiSdJsj3z/KbHXZhA1Cc+9KJ83F1kt1CGH3nU2y3gO5KrYjRRYlR7RoWofDaHsJfTmh7+KcZiEG3Re1/jIqDtkHTECZ1yZUguLFznpC8oyO1i953r5lEJWj4wH0EK1Fe9fKw2WEIIO5MCgYBVtYLmkihgFfFgAL8YopmwGKzQjNLEKbLYzby3FTPEyDHc6gn9vEOhMlUDEQE+CqCCv0vd4ZnSd7+n41SyZeZZkfMrioHRoQTIqqPaeOVEQc8a0PGuRypGu3Nfqhd1wy42/FylvTCw6cHkKO7YIIuMB8Hmdw8YPa4ZZuqb9dCPIwKBgEwSlRujESpiU+yL2qejeW1XnEaJX7WzDTXlP8NMaiWQnLaQETbgZCk9T/4f/eG1i8UiFZRFTJyDgKuldnXndZuLzifZ/712s8eOmLndh3R9FH8cBN7Tf0Q3SUA95Zie9S5G2nC/ZlyZDz1HYSRrq+QYglz1/n/hgeTVROo/f1DK', CAST(N'2024-11-23T14:13:45.5225072' AS DateTime2))
INSERT [dbo].[ElectronicSignature] ([Id], [UserId], [Status], [PublicKey], [PrivateKey], [UpdatedAt]) VALUES (N'ab3c0102-a734-4248-8ca6-52584164c69d', N'110aa824-4b97-4fac-972c-b66f2c478dca', 0, N'MIIBCgKCAQEAttVg3Vq8sirZaqVON4tRUORkn8b9hBXNJsHCnLYmwBtRqOVZdSIywwNFpF9HnlsCCj5eiomuK7kkA05tFGFPLa3XCmPI3R4mur/Si+KTz1+fx7TfNs43Kpy52h7fT6GciLq+kBn1JWm2vDX8JTKu3DGTtz/MvQYwEq0U53G+fe+iYKwZWEGWt3Rk69jdQXX0T+toRPOrEZ+zP60pRvKltxjQeFtv/eNBnUchM3QZGeNU6sy6dDrAgJx9VReHjfeh981EeClD76+WhNH0x1HRGgUxAhhnr6rVc/c8RsKJrodhzC5dD2fJv2MWuo7v6oa94QwT3pEmYTR2Ab8+CHLkcQIDAQAB', N'MIIEpAIBAAKCAQEAttVg3Vq8sirZaqVON4tRUORkn8b9hBXNJsHCnLYmwBtRqOVZdSIywwNFpF9HnlsCCj5eiomuK7kkA05tFGFPLa3XCmPI3R4mur/Si+KTz1+fx7TfNs43Kpy52h7fT6GciLq+kBn1JWm2vDX8JTKu3DGTtz/MvQYwEq0U53G+fe+iYKwZWEGWt3Rk69jdQXX0T+toRPOrEZ+zP60pRvKltxjQeFtv/eNBnUchM3QZGeNU6sy6dDrAgJx9VReHjfeh981EeClD76+WhNH0x1HRGgUxAhhnr6rVc/c8RsKJrodhzC5dD2fJv2MWuo7v6oa94QwT3pEmYTR2Ab8+CHLkcQIDAQABAoIBAQCyXUINUFrrua+3QaMnvstKjjW4RgnGlPo5yCcSeQUevsgQbAa0pfM9mnCTZbxZuVEpKyVSI/T9hLWkYBs8GZ6D4qb55NTtGmAQKdi+TQGD+jbHPiXQsqbQ9Gq/ZwTWC8TJAt2reRdWM2ZpAIWGyIYcHGWODTiwY1v8rEvLaoS7F6aarEZJ91qzoq5Ucv6l+3ItgwEwWy2nPW/eZZ0Kg/+n3UXUEEHJl1hDrj2N8jlV73FmEter1djPz8VvD0C1cm3HGX2AlMOT86bCqcDs2san6MwgZ4oHrY+m9nuNpe6WFAlcqhd+reRIEfUbw4GGsYXq/uMT19HTWrpBaWC4wnSNAoGBAMBjyUsXQgEyh6DlrdfveYgMHgIw6lM8bQHXvP0WFxDrSahkBV9Bobvig/jijnq4wzNHT95fyzvTo5+18qIg+19uNTO8BRlASag7QsWpmP4kq0Te1jW59fJ+S34IAk95ziH4YxcSO3aIQE2ZdKg8Fz0tVTo7rR7DJiqYCCN5Lg9rAoGBAPNIu0H2Y1WutK1I05JS1JweHIASO7K9TSfKeOnrRVoa5ddAg0GAYvkSEakHrOuCU/+tlcQYxRtKPdStYDafE2HrUv4o5xWFUpB1cyhALZvOwhyxuX+jR896Tx1w98t8Rx6hfDFDy5pdISfBKKQ04UF94mXoZ9975BPHpvFbdJ6TAoGBAJCteb6iatyDp0Lz9duhFv+cPSTgrBaUJlVwa4rXhdkPV4DuVqvfq0SjfyM3HHZlY0W4pvNPjoIbEb0VErWhn+eP9SpGhn8KvVlp1zjV5VuZL8LG4MfeZHpLR3Iri7FApCcfp0S+TUFCDTlN4VByf/ddk+4K2pF7p8P4OIaUpnKpAoGAZCOr8JraiIpBFJLFg5VUrm42jQD0Ub5Z4+cTnjWZdl1b/h4v6OZP1vX5Dvp50vbyXGu3GeCYQYNtr/0tfU49TDDxGGz9sX4PXib6H7dLDrcsb2M4V7F9/Yj6x8OYO8oL/C+8Twr447Ex1ItNj0m07qBCcHAZUYRNfVbRAMgEWMECgYAVaqrQ22DccQA7mt5F8PE3W5ecLqWSZBA/IPh8ChdsS0N8gaF7fCuMTB2st/XlnT2VmzcTCQXhDzk6b7WUIHrnljKtEp3ghKGha0p5vfsvf7PNA8AE4pht5LeFfTTriL2j41YMCTvXpgzHKoJKUt46R4r7otWx2JWVvDGNVzmjHg==', CAST(N'2024-11-23T14:15:39.2749008' AS DateTime2))
INSERT [dbo].[ElectronicSignature] ([Id], [UserId], [Status], [PublicKey], [PrivateKey], [UpdatedAt]) VALUES (N'6985c19e-85ea-44ec-b1db-53cc4fbdd6a0', N'55fc6d0e-50b3-4876-bf93-ee3937daeb62', 0, N'MIIBCgKCAQEA7I1UCWQ/86r8Cd5rYPkgh31ci3vvWzQ6KSve+qwQd61TXTwVqWtkfrUi0hSfBDbSPrhRfT4sG0CvcSIO1sYcraMkeKlDQ3sqMgG4neDPET0CiL0fFs23ayXT2m5ioYY5dLQWSQymJFnPkaQaACDm9yOWiAbxvpHR+QukZ/yKd8gZgHS6h2FkOqiL/l9RDaQ3JKKNp7Ar0t8YvmHGQWRu3lKS6Am7PkHFXXoHQYCzqxSuSjfTUKlK1MQEP2Qyy6/3XfyzIYQxbqX9qN3ChpT/r38La2pEQFlxLDxPw8el2x55IcreQjtGdkkBYkwxzVN5gLX4pusPL6ibWyOi3DXdpQIDAQAB', N'MIIEpAIBAAKCAQEA7I1UCWQ/86r8Cd5rYPkgh31ci3vvWzQ6KSve+qwQd61TXTwVqWtkfrUi0hSfBDbSPrhRfT4sG0CvcSIO1sYcraMkeKlDQ3sqMgG4neDPET0CiL0fFs23ayXT2m5ioYY5dLQWSQymJFnPkaQaACDm9yOWiAbxvpHR+QukZ/yKd8gZgHS6h2FkOqiL/l9RDaQ3JKKNp7Ar0t8YvmHGQWRu3lKS6Am7PkHFXXoHQYCzqxSuSjfTUKlK1MQEP2Qyy6/3XfyzIYQxbqX9qN3ChpT/r38La2pEQFlxLDxPw8el2x55IcreQjtGdkkBYkwxzVN5gLX4pusPL6ibWyOi3DXdpQIDAQABAoIBAQCyjjd541c2mcEnveE10LcSLrl1fDZ/lJu2SixE8S5497cucFU1jh/MWPQQuYoSh0MKHt07+XsXkysa7Ydf7SjmlHfKMJHaVRTTrGLroS8MJw5Lot3du6iQ03vnrFz86bFi+zC7MTYTyEsa91C8+hj9Qbq1sPA3ViC1qWkPKRxoLooRllhWBfWVlDv5onwWQSUbXtX82zoc8jiA1yFikGlJiP9UAY+onih2g2kkF16VNMukEObR3fijs2PdMykRe9nEpmoikT9SsH2w4mCPH6A/2TDD9nO8tVppfslQqXmwm2++cTbUyqPZFUORDevamfrWg/TL58ubjrQ4f4Z9VIe9AoGBAO83WrXDbqj2LwzrfOeiKpQssxRwQ4us8ETdhOBRW/Kgj6aXouTMEpxSwvSvgDStdlAnc4XS+WfdwNWrYqkbCEj0z7ZYAh0QUbxIJhF3HK/MsMqSAPHf1mkDdSKMz270BaCNaCuVQHkdfEhXt7t9cGoU8+smzwK1KxzajAYtN343AoGBAP0mHzhHvL+V9d5TIQ+v+ZCa5nzoaCJFh4x2sK6jvWMYrm5UZwvhuJYJ3KZSuEv2bw8daxOgMy7Y1PjJXWhRj3YQNPflmy292slrmvU+OtzYHKfrCUQJTuNsTMOTc80Nv4eTnq9FQsBemFap6hO/QhH4ORSQoVEYunzDMfx9AjUDAoGBAJMxlmldlcv1n8HtbPACwvxl/NNIuOdLRJS7UbXNmixTS9EQYTUztQfnjPqOuu6vBawQem8QAFM/Chbv3Ed90L1DlkP3J2XG0uRt6K66gjZSVz5uVJKATyhS7lKSHlmBYa0HFeAreH6N/BlvkCiX6QH9XpGFUb+yxpJ8j8iFLi5FAoGAdQcfnawEROl1jX8OpKrsi34gmZPzOAy+mh/wk/ucPOiXEugv7x09cRdECxvomS1msC0gaCVCJCEXa5/jb6tsz960LfnWYDIJp9339/H50kiSDsqoMOzArIBPiIZtHVmCtpF25X32WuogMMhCLzjWuWnwMWKfQNdWtwCh5iCAWbMCgYAyOYaI/j4++2ruXikztABh47pdzc3/Q9wBvClH4I+ifLYWqX9Nu4oiPC92TrYHNRAgozZ4ke3SvWDbE6TOmZ57T0Kkm+tH2HRGm+E6w+PrJox4hU/BV3lWmC/98w2jnBg3TyYYjCbbIr1aRV+WJeZASMbsYO74snGsGkPZUzK9PA==', CAST(N'2024-11-23T14:13:10.7375175' AS DateTime2))
INSERT [dbo].[ElectronicSignature] ([Id], [UserId], [Status], [PublicKey], [PrivateKey], [UpdatedAt]) VALUES (N'6bbe3f3e-bc48-48e6-804c-59dfef706a93', N'4b986f5b-4e1d-4016-b771-14dab0c7af11', 0, N'MIIBCgKCAQEAxQvryaGtSu0jH/0+imY+8BNt9fSGOEgMSZHf5GcI6v3mfva0aR2UKMmeRFJwSaLi16/VCB4TiS8P1DTapSACwCKSfstb077lE5ioqIwwgiXGY+bLdPhYPB4lJ/Tf46oLW9mEbfsZQcDUCEF6nZeAefvfV8FFKZ8e3Wx3IVRWJAwkRfTfIGaUZ5Lzv8yH3bh3z3BaddjFLtrDDzuV5DEkwUPURVBD3A7x+1CrbTLQQD3R+pUmj+onT+RtYk2ieE56jO3IUTPgdLJ2PyPB9LKAevfjmPh8yzN154bpIbDecvfRLkzf+bohWs34JQH/XmR8Q20vrBDiEmav9WvcHAdNhQIDAQAB', N'MIIEpgIBAAKCAQEAxQvryaGtSu0jH/0+imY+8BNt9fSGOEgMSZHf5GcI6v3mfva0aR2UKMmeRFJwSaLi16/VCB4TiS8P1DTapSACwCKSfstb077lE5ioqIwwgiXGY+bLdPhYPB4lJ/Tf46oLW9mEbfsZQcDUCEF6nZeAefvfV8FFKZ8e3Wx3IVRWJAwkRfTfIGaUZ5Lzv8yH3bh3z3BaddjFLtrDDzuV5DEkwUPURVBD3A7x+1CrbTLQQD3R+pUmj+onT+RtYk2ieE56jO3IUTPgdLJ2PyPB9LKAevfjmPh8yzN154bpIbDecvfRLkzf+bohWs34JQH/XmR8Q20vrBDiEmav9WvcHAdNhQIDAQABAoIBAQC7IK0VWQMXasi2smtYR+1xVSJSN5vXiySQIYZ8hBUGBYWGAYgnYz221nIE9D1K0POYXZV0Fgv7dcQUhPU3Z4T1Ll/tJfbYyisGRy20kx3mGzWi3iVNuiMhRIeIwJZ2wJ/05EdNou7DcPprtLNbQety7O2XiyXBdyl6om0oK816gJqLrV8SJvzUveF7bmuqoHpLXiQG4jUoSlfcpYX1iravgPWrGmi8MbA4uLALJjJHpDzoGzDzxgWleOSLM2yK2c9mWNgYVlpdTtNKRkJNIkkiUunDgXDsOXkmkoJrH+OdgwRQ0faH+MeAmp5tvmZfKRaIMLojVS9nYKvZNNbdfU9pAoGBAOfe/O+bQAxFPHxjdi+5K5INf0ZvTz4uUoeftgQaTvlj+LJp695cwmuDauMrpVsJXgAK1nxggLGHEq/+uN/UlNmwhDIoVWhjIhvzH1LxMbuYmIBIMazCT3J3I390a9WXG3OWGM/owoksz4Jn9vp9qoM7IrEXH9Sux2VzL9rMgQf/AoGBANmNNrmuAt/HvI5XEINtHZj6/Zfb5fwSNoJ3noBggfWvixi5sB0cJLL67ODpWOJ+4waxCKyTPIE2jvLrGJt0ptaJxKblS3mslkxKexcRG3E+OrbDZkXnumPWN5guwvI2ulunXRdF3+ExN+BksgZC/nnamI3iAHtuukkLf6rsR4p7AoGBAL27tudt93PS99KlJKGaeO+zQbFmBcbQ6tF1u+ARkwv5ZRjBGbPD3YdSaxVmspES0itgsu/lm4kpCP6ghbEKZ57WFOZiILkhXVjXkYsyOErUa/2UlalS+uWkXZS+tDp7wofLi5QdV4od89M2tV91kyB9ND8KuA410o3OOptkejULAoGBANgI2ydYHZKLjjrrSoK4gIPB+sIqpB/FFkxI7SUesO+A+uf6vWCq6eayNzjBgHqq9ldWxf5Z1+OYgivIOg9lr6er95SkbmbNdBMeg01Mt6uk2DlVoOIaU4WA3IRLK1vL7RPHBzJtOP0vGwXB+Ocu7/WhlYyPuVrZgjO3L3hUWlaxAoGBAIkB1eKQD/0/VLc6UbYnE0Lh1t8ee4Bi6IFtT0ZraiCxdX4wDl6I0H7exKtw6QSdQooGP3o3osI7kZUhBUgZqU5JhiTxfDFI9RegUEJsndDXDn06VgCL74lNYmJ/rAmxS6D5fKsm1MHZ6IUENYfUsKBZNB3u4kHCX/caLioTdBBG', CAST(N'2024-11-23T14:16:31.7769244' AS DateTime2))
INSERT [dbo].[ElectronicSignature] ([Id], [UserId], [Status], [PublicKey], [PrivateKey], [UpdatedAt]) VALUES (N'6d57d425-5436-467c-a2f1-61580eddc542', N'cdb5713c-fcb9-4105-8140-033fc2ac032e', 0, N'MIIBCgKCAQEAqbMCmTzT7ynMpiH3g4BHikEOqqipEMMZckENDv/ZmKk+ZITrznrO5FIHp8tYPuzzkALQ4mCTgyqUmwiNCQdeR273V+ciTLMjoxUjwfCvLmGNgJ1N6MT9SXT0nOdH50ezsRmh63lLqq1KAMjzrNaz7ZVKLPQl4LkqGjAPPF71Tg+uUxLFPO+VQ959uTjgYB2zqdONyg7A898p8nCkBuDNNTImse3Co5b2tNTfNNKMQWOVipQKMBzuv5T7vKHxJn3mXM193hY0KZ5qEDY7cuHsyeP6iOyo0BriQu9laWvOQ5u2aUBnvgntqCKXxKTq3kPl3Am4wa9mr3KUg4CZv3WqpQIDAQAB', N'MIIEowIBAAKCAQEAqbMCmTzT7ynMpiH3g4BHikEOqqipEMMZckENDv/ZmKk+ZITrznrO5FIHp8tYPuzzkALQ4mCTgyqUmwiNCQdeR273V+ciTLMjoxUjwfCvLmGNgJ1N6MT9SXT0nOdH50ezsRmh63lLqq1KAMjzrNaz7ZVKLPQl4LkqGjAPPF71Tg+uUxLFPO+VQ959uTjgYB2zqdONyg7A898p8nCkBuDNNTImse3Co5b2tNTfNNKMQWOVipQKMBzuv5T7vKHxJn3mXM193hY0KZ5qEDY7cuHsyeP6iOyo0BriQu9laWvOQ5u2aUBnvgntqCKXxKTq3kPl3Am4wa9mr3KUg4CZv3WqpQIDAQABAoIBAH9tiHoBDzP8M0xdHTuFzDKo/5Zu5+VKW4VMC75DqOXV0KAyn8+AsHMKle0N6Mn3rD1rn+cdlidchhKUrTMmcUk6rkk3qq3lptEDQsKTNTii0FrPxH0RzxCl3jkkAv5M/UXzdX8YqhUT4woL287humKhQ/3Vp8vDvzXC+O3gcFuYeTpxyiMaJWR82ReWoEzUNFsH6Zf7YtysjxNQDOPqEckRvhzSJI/uhUbi1FTjl80qLMkaYZynsbMjJ+86cmv/q0e3W1tqtKDyZRDN+9YFCLy9HRBSw4+mW8p/9zDXts4xcgWiOmCrcJJQt+w41QSJWM2sU/Q9DYJwbXONKg0r+lECgYEA3V96xCF9yJrOLqj3V2Ig6itJjKJdOg/YpZFkp3u42UgQQlfjE8Y5EixCjbnJlGG3gyxEXCcig3QvG1+s5UCUQ6dRrl9F0/UPgTfVdOtHL13Z+11ko6Zv2rXPwz+tlH0UlTSR7MC52kRTlwGAMq44WHJrhO2/wmnq53titvcCd1MCgYEAxD5XSeOC5qgYSnZx+gC7Qbn8Zz1EJUfIHYwFDnBHEpoHKHasD+xFH/7H5xymkF8BpQbGz9pclCWF55eE52i4ovuNEKwU0Bdj/j1tIdBoKY0308cs8ccslSUQefqOboOBEs+9sONFykhQiqF45uT1MpyiFcc87x7RMN7x7mG17ycCgYACo1mmLrP+CQI+Aht4eh3kTIHC4Eh2Iaw2ROZLLKlGRZqT/9If8TPK6KYeZEFnuEZklMl3w6ugn2jUTa6UyNE7gSnzBwWhAgGeS5kKnKcrhFXNrg49+QTKOXJxZDfgViFBqe+3P5C3bisE2Kq7b+ISA8MOQXsQiQyYl5rUjVsFKwKBgDpbk5eceZPgDwEtwe0nhIgiJ8YHuRkhBIiM2AAYMXp9pX1J9RbzGwdNu+KlaX7rUdDieALdm8ROeEiLjXFHegi1p5h6o+HR4uF7INX6ZM9eeGiZBWuM4Fwl3oV3lh2VK7ANaQqOO3XRFWp0ZEC9e5EmdSjmy98MGgdfdTB/jBvnAoGBAMUyyLeZ8fI2cQltFejnqqifvWWBb8BUgXG5OvX+QAK6nwYqaNRJb6YIh4C+h4o6LwhUuZHD0ePb73HCAirVA1MbinyHckLWNRyGfowMt6VGML1fKk2SeL1abqScX2cr2zXxir5AB66VJnxJfko5nX9fSMbFviMXJgrE8GYcmYZG', CAST(N'2024-11-23T18:41:11.3535823' AS DateTime2))
INSERT [dbo].[ElectronicSignature] ([Id], [UserId], [Status], [PublicKey], [PrivateKey], [UpdatedAt]) VALUES (N'ded8376f-037b-47ac-a826-773527a482cb', N'dd3c7e8b-3dc7-45d2-a2bd-282de7d5e2de', 0, N'MIIBCgKCAQEA0lq1YPfROzhc6z2b2bZI2XIX27U330xTISUnOircW00BmcPjWlURYcZc/hNFXxGRtGRFw9wh88AP2Eg7vCs2K5t4MC4FfM3dS08GAIDMMtVgtuQApPaIh150UVsdWvQIWFfgP39qX5o81zQYp/X70d2VDMooXDagYmUuikaqFhjWxyyiL/Ua+AyRHnH9zl4zH6nmJIUkKflz6/zoAqFNLzyZgGf212Iri91odwzfoc/C/s39hmZQXFNyaGk5el3DtA2TdReNhtiVXk8F2aeDW8ZB9QvZCd6iJCCncQj2Cpl6g8mw62Z+GSslBg0cUX6wuC44r8Otuuu+bd2rMry9YQIDAQAB', N'MIIEowIBAAKCAQEA0lq1YPfROzhc6z2b2bZI2XIX27U330xTISUnOircW00BmcPjWlURYcZc/hNFXxGRtGRFw9wh88AP2Eg7vCs2K5t4MC4FfM3dS08GAIDMMtVgtuQApPaIh150UVsdWvQIWFfgP39qX5o81zQYp/X70d2VDMooXDagYmUuikaqFhjWxyyiL/Ua+AyRHnH9zl4zH6nmJIUkKflz6/zoAqFNLzyZgGf212Iri91odwzfoc/C/s39hmZQXFNyaGk5el3DtA2TdReNhtiVXk8F2aeDW8ZB9QvZCd6iJCCncQj2Cpl6g8mw62Z+GSslBg0cUX6wuC44r8Otuuu+bd2rMry9YQIDAQABAoIBAQCjNP3FXoFYEUMGwaZKJMQg8gTQ0qmm9vEIpmrpFpghvn2fb/zV+WqjEeTUvN72BAuoiqQWcpVlKX8hr+mo9V3yN43o08wuKQupgoaFnWjRh/yh6gUV+LG1VfOpq6f7CZvv7z5uBc3inyjVT/ZRWukmy2T5p1/pK/kEXrzdTDZrLTJSzbN3ILaSDZf6U0sN3IyvrrqAZK2eMWTA4tUafTCN02EHyeyMsMa8RyUkCTz7CbyIskAvg+atJvl592+k1fS1GO0tOCa6PWNrpP1o6vWyt/U9TrHjz5coGVJMSHqSK2g4QxSiWOdTKfYVSOyKyeLXaPwMitup+WmjxAnJk1KBAoGBAORu6E825rfCfKJxv0IxWHAoLR3IuEmcd4w6XDHbpuNmFNGmOxpSj34+xG0MIfviZYNLHKSwDLczHf9Y3f8c/4ptWv9HrCIVRhx664AQCYk2o+Jr0pSoDlLSIh6Mdy9YWbwkgn7LaTUXpccGpzJa9Jl4y30YtzFAAGOH7cYIj5L/AoGBAOu9R/9+rIa4MxV2L+Lq9dbh7A6Gf3OXLcrDePflzHEkKVEj6EnMC8W5SsHYjzbbkzZtDZ3xjn2v03Zwcgv8B+cOPcOsWHg9WkHnskI2pRKlJWToGKWZEPB4QULxpTxU8AYL7bdVaLH8wwZb4P2uFtSK4rchukexbcDkvY+1jI+fAoGAZQaHx0DImMxywoT7yRJ5wmCCU4HJvwRr+qB01bgG/trOqkmSKfoJbBPmWzPac8OUkZROfqc9eGgrBBsRUxpICbiDXhMclZZDA6V5MZHmJcD8ic6Vuxj3/LjiThBhRZcVWJfs/paHWOu0bWkL2MFRG+7IT/L2Udm0UlBzX/m5RZECgYBMcqyXkXfXlIKUcihjWTjyP3+y0jEgxiUGfU+MbMxY4JY5hwB8dhxXOZihtl3zN0/NNZ5V2xEPd2aHIT4K3uedKYQkIY7rJ1JOzxmC2X+8xSuURqQ/h5zzrrvTPtQL9auE+ndTnfH+zm5ccI1NFxi2Qnf1VY24VDS4ejVzFjgIFwKBgEVBAUXp2DVqlV21rnd9sIiHBVJ98ZVWef2ZhYBLdthrAw994ByBDJfZ5Aq0yaU178Jk2s8C7dFyqOwrPmsRo/6G6EC1Sq8+0awX6jtm+Y/DKSoJQY/0MJT/kwv3Bz4zdjodgVZJicf0zpZcL2mnwd5+XhHISd9z9IzoQzqEaKlE', CAST(N'2024-11-23T14:14:15.2824702' AS DateTime2))
INSERT [dbo].[ElectronicSignature] ([Id], [UserId], [Status], [PublicKey], [PrivateKey], [UpdatedAt]) VALUES (N'bc59e177-1176-4ce3-bf45-8568069c7e13', N'32f207a2-02ba-4b83-8c71-03af11657c63', 0, N'MIIBCgKCAQEAoqy8QVYr9TkwUJEEgcHvJYM8Pvr6QxI/X66i3j1lroXXilYZhiqPsjDNXVMgNnNmVb2Y7ENrZSCS5wTCE7dd/NKcBgbESOndG/wLUyhoMGon6Xz1uGLN+xaBuVD3atpDLgiuQEBApxV+aBSk3FFUkn4nx7mXGIT2WSdB1GM7oe8u8wvFIvyxuIYK51Tk39Nz2s7aY7nVttEKS2f+fxFtRUCSkKICiecpJn0UyQ53NGD/UXQCHo12hTxRoGN0AHWMMfLK9DUIG+XSmGWxbf2Ygl5zAPQkOHczZ7efNeP4ZUOOUUyEszuZ4Ow6hAnjnItjXaLxUsiAE6Lq89dGBNhr/QIDAQAB', N'MIIEogIBAAKCAQEAoqy8QVYr9TkwUJEEgcHvJYM8Pvr6QxI/X66i3j1lroXXilYZhiqPsjDNXVMgNnNmVb2Y7ENrZSCS5wTCE7dd/NKcBgbESOndG/wLUyhoMGon6Xz1uGLN+xaBuVD3atpDLgiuQEBApxV+aBSk3FFUkn4nx7mXGIT2WSdB1GM7oe8u8wvFIvyxuIYK51Tk39Nz2s7aY7nVttEKS2f+fxFtRUCSkKICiecpJn0UyQ53NGD/UXQCHo12hTxRoGN0AHWMMfLK9DUIG+XSmGWxbf2Ygl5zAPQkOHczZ7efNeP4ZUOOUUyEszuZ4Ow6hAnjnItjXaLxUsiAE6Lq89dGBNhr/QIDAQABAoIBADdMTLpRFqRHinr4sPWC/U5dLC+klUoTe+OEs+ykJlqLONfXqNmIwkwqdsUQqtSXqePfjYpS6MD5r7ZEUczt+k8lMNCDoFnA1d7bcOYVyEUc8PBYABdrzuVZo0NhmJmEFG4jmUhSDyg9EDlFOz2BkCQ0KkWkew5ktHFd/Oy7xtumrh+lWlLarGZ4HfJy2QC64W3bo5tsnxFo2KS0XYobALb0lMmi5u8MNSOGAjGsUbdzWwuJE44yDcQty/KGs4F2Ve8gUt6BlyeWsrPcZ5ikPxYTG0m9KgT3odtNU2SQ58fSSFF8CXaHKt7dbugiJmFSFZz95Bb8Kq6o0Kyvp1gdrakCgYEAxu5owD4+a1cYx40aK7hD75dFGlzTl0j8LBI0ef5D2cN8r+uHPRJ/YGMb+7eZcJgH8MX7D0vcTdMMYwt5d4dM16I6dJt+oTwLJJQADv4O5ZgKJx7x+GfX5f4uRRwaBG7AKIVEd4WAu3kk+VqmwFKEThj5ovvtX67f+A92W331fmcCgYEA0Vehx0aLZpDPdjSwrL+6VLR1/dBtve8+9C09JPXSn3VLOyuZw9u1yLhnTm/RDdRvdXjsoQOr/QbnsnTM3gUTwJw+EklPH4v4cEHcqom4avQ7gX2pmZ93lFkRTq4FeSMZJhe7Ki0CoGAw0J9MIGwmrEutOTtAUk07wGH5IK0Ge/sCgYAsQZXkTvSsBLBqlKWh3Fig0NJ6zvPz0DTpyRMLoNmPdMIkkQ2BNMBJvULYeTwVpHz/v8ve102nsrAqyL65LMyXnGvMzVsam7UO6i4pJ7RAt9ZqZaQHU3Lgo++/SEUxf0IYwa09ueGt04G6R8SZPMJabYv8CngAtXL2SNpX+GnJOQKBgAQ3Z6LD4Prn38XZudVA51fdaqL6F7vDndj9MEYWTW+4xRMkBazUOA0a6bnCtss4hCYxkVKM6GHoSbJmd9ng8Ezo2Lc1kspn31EjgnZM39IHqUsqZMgbViU+xgJ3rtSJyG/j+nkW/v6L8W/CRZ5Bj2XZAFwuvVTrCVEOqB3oXkERAoGAcfF9eZY/YvliCyCyxmDhvualXygxrJplGubhiLSwiHPJMg5bqaCad6IUal6UvIHOO5+FWmD8C7kL0SziXDcq+1vwsmEtcttND4HaEpXb6g/M7S3LdueelqSVeH9d++SFIMTJl1KzGsE4mD+Yf+fjJLEQbebBxX8c+ozJKyha0+Q=', CAST(N'2024-11-23T21:46:50.6158644' AS DateTime2))
INSERT [dbo].[ElectronicSignature] ([Id], [UserId], [Status], [PublicKey], [PrivateKey], [UpdatedAt]) VALUES (N'b8ee9e9f-cae2-422c-b058-bb1b3dea9854', N'ce648ca9-fee9-40e7-8aff-03869bb6b010', 0, N'MIIBCgKCAQEAzrjw4uDEf+DjB9HqIxqYaHYqzvP2SHvGix6GJdA9iUemxaxcI91nf01aypcQoLZzgAZqvdUwm8g5WipsBlshtLq+jghdDovCbmV7iIu8KfcV+h1a+0YIMRMTlPkofx2EatKSmbZcBI0uCrXQ9wjJRUQ/cty/tdQxqLS4o676pAeneuF0Im8TjNWeAXwePvjWUxbO2mUd0Hzy1l+/FfU2G5DKK7c6N3i4E7Zi30oPboTosbmyxVwwKWOBxnpvE+TehuEjXlzxsa/p4hErVzvkbn9VgTEECu36z83XM+4f8cvldiJGrIaJUMUuPiMwuiH8G3AU0+aChgeJ+aJFPoAm9QIDAQAB', N'MIIEpgIBAAKCAQEAzrjw4uDEf+DjB9HqIxqYaHYqzvP2SHvGix6GJdA9iUemxaxcI91nf01aypcQoLZzgAZqvdUwm8g5WipsBlshtLq+jghdDovCbmV7iIu8KfcV+h1a+0YIMRMTlPkofx2EatKSmbZcBI0uCrXQ9wjJRUQ/cty/tdQxqLS4o676pAeneuF0Im8TjNWeAXwePvjWUxbO2mUd0Hzy1l+/FfU2G5DKK7c6N3i4E7Zi30oPboTosbmyxVwwKWOBxnpvE+TehuEjXlzxsa/p4hErVzvkbn9VgTEECu36z83XM+4f8cvldiJGrIaJUMUuPiMwuiH8G3AU0+aChgeJ+aJFPoAm9QIDAQABAoIBAQCjTCCteBSBV+q/sKieFlIyorXqSXlRhMUv/GrH0BnsKbeqCx+2DR3GyBpiUrcF3Vqb1XXYg2IkjSQQ/9XZp3+WvrXsiNrJtMlgX7YYBRocpFyt+SZ3u7iY25LqaW/+ChkiMTkxR4ak6clnGHz7x+sGVoUwfQTL49VeiXQZiQ3hJ+WgvZdOe8a8jt8Byz7CbswUIyGYFuohk8KQyuelK9FmCsGQSWPzpqtr9/VZxpPT1LEaihU3XuqcTd7OxuQ7CycDrQ8OHPgwJM1N02DFrhdrXxG/4V4Knr7rE7wK0ymiXD8aaciyX3mzpsa3jhKPcbDsa1RNyqNh4Oh7aMjbZdS5AoGBAP0SDJToOukiT75/aX5z+7F9CG4B1BUYTLLYlc2+NadW1rHrqTzMg4+w4aY2MQfq0A/YU1mF4yqZZJevGIYPwjuscbKjtKOzCLTUsNxTzW+VbWjd9xMGBvaNz/CJ6yhM8vTylgMjORKmJpYMX2mluXXG26H5MKTKZMLRGrgoRtITAoGBANEdiymPOMxK0+gRyBdX9i3KslMQNF/gcN6uksjc8CxxnIkoc9/clGE644aVegBzeXu4SFWAm2Ebc2lzQtdQRVHZ1Og2jE4Mb01ocGL8Wx3CmQZTrSY3i3A/F0DRUWbgwtGGikfEuGICxAu07jl6gqbqxEC6Dyf+Xxb33Wx9IoPXAoGBAIY9qMbkWTuJo9tdIsydIYoI1QvllGaMOUM1eGFm4HcfrUs7ws4pfjAel9PfMysL98ov6ia2ysWyEJYVn2Cdw158HuOvywZ61cd2e0qkeXkTPrI96+3/aHoox4DE6CS8jLQ6ajDH4mJuGFHHxmT4L+S105Ob553CbqiY2x+M3eRZAoGBAJaOz9AXRwyHX3R5wPdVpHApvSRiyWKyRHF/fT1THTTSg6KY1ny54rbyYDhYzKMggLnb33B4DObojbrBesFtEMuyq0CZbYEQIN65sBkEmlGd9vEAM+0NFr61HffT/Oi2MG4MkOjFMP+YADBxjwchNooZAz2a+CiSU0JFKU3f9oa3AoGBAKoFOBgBudLo393UJZjcp3usRim17prnuwXFPoYjfouVxB3sWYzDxMrTxAXTU9kaS83MVfxW+dmQgicYkYcs91r9/jEx4Tagn272+ASi6dvBdW0kBzu69eU8zXjCSFLfatO6Ar/RtGX1lcGZqOG7G8RBamfe8TbYOBp0488bEms3', CAST(N'2024-11-23T14:16:59.3996117' AS DateTime2))
INSERT [dbo].[ElectronicSignature] ([Id], [UserId], [Status], [PublicKey], [PrivateKey], [UpdatedAt]) VALUES (N'c32dcc49-b861-4b55-b995-fb61603687a9', N'd3f15e0a-7ac8-4f28-b93e-f8c11eee7fcf', 0, N'MIIBCgKCAQEA7dBkgHt+8lZPSthDNK1/qkJTfNg7J3Z9R/xNA77ktlGW2OWbhDvLogaQM3Le2+NNHiQr54TjRAy6lSmhWfEc8ohuef7fGUZM0P3Aqhos1xhsLuYBKAOwNTpbx/nzJaqHLlGA8qH7goeQgOcpOaKtZn2QjmqqQXGIdyN9eLGTn0m0n+CoJAmmRuQ+1jtjw794zsvjp+tJlbFV7dIs5xZAv7hUGaa1HoeKAJgDvQAAysZ4t3ZCPkcajgWzwOtNR0a9jS0Xo+IZYi/ZuoAFEtNG/HDEQo1Y3Mke9qYGc4szQgO0BI7s21rsFHgLJltctlcHAQFl+njsXeU0TgOtcHMRXQIDAQAB', N'MIIEpAIBAAKCAQEA7dBkgHt+8lZPSthDNK1/qkJTfNg7J3Z9R/xNA77ktlGW2OWbhDvLogaQM3Le2+NNHiQr54TjRAy6lSmhWfEc8ohuef7fGUZM0P3Aqhos1xhsLuYBKAOwNTpbx/nzJaqHLlGA8qH7goeQgOcpOaKtZn2QjmqqQXGIdyN9eLGTn0m0n+CoJAmmRuQ+1jtjw794zsvjp+tJlbFV7dIs5xZAv7hUGaa1HoeKAJgDvQAAysZ4t3ZCPkcajgWzwOtNR0a9jS0Xo+IZYi/ZuoAFEtNG/HDEQo1Y3Mke9qYGc4szQgO0BI7s21rsFHgLJltctlcHAQFl+njsXeU0TgOtcHMRXQIDAQABAoIBAQCwP+EsY9qKyjLL+omccfWK/ssXXL5CmgtxnWiKnSCuirtslobysspRk+Gtb7YBa22NKCut04wHtBNYV1kw6oSUr06Jdb5s4fAud9Ihf3K6G2yaOXaj7E/csxqwk+uDf+XeCyOxLyHS9JvBHREtmQZATlEja6QxCm6kNZZZK+qHgs/cdgvykkYsT1eiWrdJxR+xdNZnmuUHIPJ7Ddqpdc/g8o19FKvm/UNtyKDNRLVc9rC6qL1IGPuWfQ1/Yk/e1aInqtkkzw0O5ZdCQ4BVp8xUOpy8ECHbJzqpyuP7qgWHb2PqIJZ5eMVaL7YGa3GQSFpPkHrj5X8M9/coJJ/atvUVAoGBAPwbsb9p9wU0uWa4pAosClExL+JgGxPuZO4hi5O5RIz/L8MfOndjFzouQl9etvjcOUOzO6RHKJQsa3mhzA8E1uOW9RH5vtDbR+i1U0/Hbdra7yZZ8BvTWcGotsybH9d/0ScwshIkJo08Ni1V54EtYf4lX/dAGrUksAP5UX+idU/zAoGBAPF8NZGrI9AToT/Se5oaRQZa2qBLEamJ8O+G/y1vXL1d8wEmWPIIJuUZ/8JeinUSli3o7LOaJNMywkoJXal3/pSLwzXFgH7EcUnDPYH/96lYCV9tTvRAzs+1blbLR5dEVHGXa/RFy4cnoKBHZy6IelzbQepq0lKjjEpnczig9b1vAoGALlyZb235M0fi4HUMFaLLsuqst6Cc2il4/iHFHUFwzc0P534SrmnWl6hyJD+yvkkhbsXDLg6386fHi/KpKAnnyqq0Hr4izR3GN5FA5Obz2M9yM0dO1I8lbmusUiwkyuiCegaGeLeVL1vnSqcFj8fcwXP2Fe3/+1fn1pM+3Y3urOkCgYAowqRwIAj9eDLBiQ+f5Us9VVyNrd4fVc87PvgXfTKULCV2Tji5MbMO/KJ09mw8cpSyzxwU/LG2jFzLDmWm00A/Zo/epaWYwCO3JaNeLAxroxaB6vtmswG1gZRMRiehWsE+IybvplBCUegE5ch+zD6LKd8oaDt0A3MMpAWIy3JvNQKBgQC4lwqRZolzF0b+JNL2/CXITlz8oObvG1j94hfAXSBJpGF1HhYLJUZjQ/MR2YGQ3V2HvoZnFS3ATtm2/FGWvWwEOMtIS7a6QstlqZ1FHs4Ob7rjsXy5IDnecvey+sSPjIH0fTHLfKCA7ux2tLwHYfCm6/WuFMNQhfAd4wCrJgDlQA==', CAST(N'2024-11-23T14:12:42.4373300' AS DateTime2))
GO
INSERT [dbo].[Evaluation] ([Id], [UnitId], [CategoryTimeTypeId], [EvaluationName], [Status], [IsDeleted], [UpdatedAt]) VALUES (N'1f711c2a-f18c-4892-91eb-b5f07a74e48d', N'4402c619-783f-4580-83cd-86e50a47171d', N'13d5e5a0-7eda-4725-9e56-455790a9c0a2', N'test', 0, 0, CAST(N'2024-11-26T19:09:39.4380663' AS DateTime2))
GO
INSERT [dbo].[EvaluationAAE] ([Id], [EvaluationId], [UserId], [SupervisorId], [Advantages], [DisAdvantages], [AddReviews], [KetQuaHoatDongCoQuan], [NangLucLanhDaoQuanLy], [NangLucTapHopDoanKet], [NhanXetUuKhuyetDiem], [NhanDinhChieuHuongPhatTrien], [IsDeleted], [UpdatedAt]) VALUES (N'd709d80d-7db4-47c0-8793-3cc1edb9c597', N'1f711c2a-f18c-4892-91eb-b5f07a74e48d', N'32f207a2-02ba-4b83-8c71-03af11657c63', N'70be578e-af27-4056-a6ad-55990f86b3e7', N' - Có tinh thần trách nhiệm và nhiệt tình, chủ động trong công việc.
 - Thực hiện đóng góp đầy đủ các loại quỹ và các nghĩa vụ khác của viên chức.
', N' - Đôi khi chưa đảm bảo ngày, giờ công lao động.
', N'1. Chính trị tư tưởng
- Chấp hành chủ trương, đường lối, quy định của Đảng, chính sách, pháp luật của Nhà nước và các nguyên tắc tổ chức, kỷ luật của Đảng, nhất là nguyên tắc tập trung dân chủ, tự phê bình và phê bình.
- Có quan điểm, bản lĩnh chính trị vững vàng; kiên định lập trường; không dao động trước mọi khó khăn, thách thức.
Đặt lợi ích của Đảng, quốc gia - dân tộc, nhân dân, tập thể lên trên lợi ích cá nhân.
- Có ý thức nghiên cứu, học tập, vận dụng chủ nghĩa Mác - Lênin, tư tưởng Hồ Chí Minh, nghị quyết, chỉ thị, quyết định và các văn bản của Đảng.
2. Đạo đức, lối sống
- Không tham ô, tham nhũng, tiêu cực, lãng phí, quan liêu, cơ hội, vụ lợi, hách dịch, cửa quyền; không có biểu hiện suy thoái về đạo đức, lối sống, tự diễn biến, tự chuyển hóa.
- Có lối sống trung thực, khiêm tốn, chân thành, trong sáng, giản dị.
- Có tinh thần đoàn kết, xây dựng cơ quan, tổ chức, đơn vị trong sạch, vững mạnh.
- Không để người thân, người quen lợi dụng chức vụ, quyền hạn của mình để trục lợi.
3. Tác phong, lề lối làm việc
- Có trách nhiệm với công việc; năng động, sáng tạo, dám nghĩ, dám làm, linh hoạt trong thực hiện nhiệm vụ.
- Phương pháp làm việc khoa học, dân chủ, đúng nguyên tắc.
- Có tinh thần trách nhiệm và phối hợp trong thực hiện nhiệm vụ.
- Có thái độ đúng mực và phong cách ứng xử, lề lối làm việc chuẩn mực, đáp ứng yêu cầu của văn hóa công vụ.
4. Ý thức tổ chức kỷ luật
- Chấp hành sự phân công của tổ chức.
- Thực hiện các quy định, quy chế, nội quy của cơ quan, tổ chức, đơn vị nơi công tác.
- Thực hiện việc kê khai và công khai tài sản, thu nhập theo quy định.
- Báo cáo đầy đủ, trung thực, cung cấp thông tin chính xác, khách quan về những nội dung liên quan đến việc thực hiện chức trách, nhiệm vụ được giao và hoạt động của cơ quan, tổ chức, đơn vị với cấp trên khi được yêu cầu.
5. Kết quả thực hiện chức trách, nhiệm vụ được giao
- Kết quả hoạt động của cơ quan, tổ chức, đơn vị được giao lãnh đạo, quản lý, phụ trách (xác định rõ nội dung công việc thực hiện; tỷ lệ hoàn thành, chất lượng, tiến độ công việc):
+ Quán triệt, thể chế hóa và thực hiện chủ trương, đường lối của Đảng, chính sách, pháp luật của Nhà nước tại cơ quan, tổ chức, đơn vị.
+ Duy trì kỷ luật, kỷ cương trong cơ quan, tổ chức, đơn vị; không để xảy ra các vụ, việc vi phạm kỷ luật, vi phạm pháp luật phải xử lý, tình trạng khiếu nại, tố cáo kéo dài; phòng, chống tham nhũng, lãng phí trong phạm vi cơ quan, tổ chức, đơn vị.
+ Lãnh đạo, chỉ đạo, tổ chức kiểm tra, thanh tra, giám sát, giải quyết khiếu nại, tố cáo theo thẩm quyền; chỉ đạo, thực hiện công tác cải cách hành chính, cải cách chế độ công vụ, công chức tại cơ quan, tổ chức, đơn vị.
+ Xây dựng chương trình, kế hoạch hoạt động hàng năm của cơ quan, tổ chức, đơn vị được giao quản lý, phụ trách, trong đó xác định rõ kết quả thực hiện các chỉ tiêu, nhiệm vụ, lượng hóa bằng sản phẩm cụ thể.
- Năng lực lãnh đạo, quản lý:
+ Phân công nhiệm vụ cho cấp dưới căn cứ vào năng lực, trình độ và tính phù hợp, sở trường của từng người, phù hợp với công việc được giao.
+ Tạo mối đoàn kết, hỗ trợ trong công tác của công chức trong đơn vị.
- Năng lực tập hợp, đoàn kết:
+ Lãnh đạo thực hiện mọi nhiệm vụ trên nguyên tắc tập trung dân chủ, phát huy quyền làm chủ, xây dựng khối đại đoàn kết giữa các bộ phận, tổ chức trong đơn vị.', NULL, NULL, NULL, N'- asdad', N'- asdasd', 0, CAST(N'2024-11-26T19:10:46.0986391' AS DateTime2))
INSERT [dbo].[EvaluationAAE] ([Id], [EvaluationId], [UserId], [SupervisorId], [Advantages], [DisAdvantages], [AddReviews], [KetQuaHoatDongCoQuan], [NangLucLanhDaoQuanLy], [NangLucTapHopDoanKet], [NhanXetUuKhuyetDiem], [NhanDinhChieuHuongPhatTrien], [IsDeleted], [UpdatedAt]) VALUES (N'5c59eb77-eac0-421c-9a65-fe06ec23a897', N'1f711c2a-f18c-4892-91eb-b5f07a74e48d', N'dd3c7e8b-3dc7-45d2-a2bd-282de7d5e2de', NULL, N' - Tích cực, tận tụy, có ý thức trách nhiệm với công việc.
 - Có ý thức học hỏi, tiếp thu kinh nghiệm, lắng nghe ý kiến hướng dẫn, góp ý của lãnh đạo và các đồng nghiệp trong cơ quan. Tự nâng cao trình độ, không ngại những những nhiệm vụ mới có áp lực công việc cao do cơ quan, đơn vị, tổ chức giao phó.
', N' - Đôi khi chưa đảm bảo ngày, giờ công lao động.
', N'1. Chính trị tư tưởng
- Chấp hành chủ trương, đường lối, quy định của Đảng, chính sách, pháp luật của Nhà nước và các nguyên tắc tổ chức, kỷ luật của Đảng, nhất là nguyên tắc tập trung dân chủ, tự phê bình và phê bình.
- Có quan điểm, bản lĩnh chính trị vững vàng; kiên định lập trường; không dao động trước mọi khó khăn, thách thức.
Đặt lợi ích của Đảng, quốc gia - dân tộc, nhân dân, tập thể lên trên lợi ích cá nhân.
- Có ý thức nghiên cứu, học tập, vận dụng chủ nghĩa Mác - Lênin, tư tưởng Hồ Chí Minh, nghị quyết, chỉ thị, quyết định và các văn bản của Đảng.
2. Đạo đức, lối sống
- Không tham ô, tham nhũng, tiêu cực, lãng phí, quan liêu, cơ hội, vụ lợi, hách dịch, cửa quyền; không có biểu hiện suy thoái về đạo đức, lối sống, tự diễn biến, tự chuyển hóa.
- Có lối sống trung thực, khiêm tốn, chân thành, trong sáng, giản dị.
- Có tinh thần đoàn kết, xây dựng cơ quan, tổ chức, đơn vị trong sạch, vững mạnh.
- Không để người thân, người quen lợi dụng chức vụ, quyền hạn của mình để trục lợi.
3. Tác phong, lề lối làm việc
- Có trách nhiệm với công việc; năng động, sáng tạo, dám nghĩ, dám làm, linh hoạt trong thực hiện nhiệm vụ.
- Phương pháp làm việc khoa học, dân chủ, đúng nguyên tắc.
- Có tinh thần trách nhiệm và phối hợp trong thực hiện nhiệm vụ.
- Có thái độ đúng mực và phong cách ứng xử, lề lối làm việc chuẩn mực, đáp ứng yêu cầu của văn hóa công vụ.
4. Ý thức tổ chức kỷ luật
- Chấp hành sự phân công của tổ chức.
- Thực hiện các quy định, quy chế, nội quy của cơ quan, tổ chức, đơn vị nơi công tác.
- Thực hiện việc kê khai và công khai tài sản, thu nhập theo quy định.
- Báo cáo đầy đủ, trung thực, cung cấp thông tin chính xác, khách quan về những nội dung liên quan đến việc thực hiện chức trách, nhiệm vụ được giao và hoạt động của cơ quan, tổ chức, đơn vị với cấp trên khi được yêu cầu.
5. Kết quả thực hiện chức trách, nhiệm vụ được giao
- Kết quả hoạt động của cơ quan, tổ chức, đơn vị được giao lãnh đạo, quản lý, phụ trách (xác định rõ nội dung công việc thực hiện; tỷ lệ hoàn thành, chất lượng, tiến độ công việc):
+ Quán triệt, thể chế hóa và thực hiện chủ trương, đường lối của Đảng, chính sách, pháp luật của Nhà nước tại cơ quan, tổ chức, đơn vị.
+ Duy trì kỷ luật, kỷ cương trong cơ quan, tổ chức, đơn vị; không để xảy ra các vụ, việc vi phạm kỷ luật, vi phạm pháp luật phải xử lý, tình trạng khiếu nại, tố cáo kéo dài; phòng, chống tham nhũng, lãng phí trong phạm vi cơ quan, tổ chức, đơn vị.
+ Lãnh đạo, chỉ đạo, tổ chức kiểm tra, thanh tra, giám sát, giải quyết khiếu nại, tố cáo theo thẩm quyền; chỉ đạo, thực hiện công tác cải cách hành chính, cải cách chế độ công vụ, công chức tại cơ quan, tổ chức, đơn vị.
+ Xây dựng chương trình, kế hoạch hoạt động hàng năm của cơ quan, tổ chức, đơn vị được giao quản lý, phụ trách, trong đó xác định rõ kết quả thực hiện các chỉ tiêu, nhiệm vụ, lượng hóa bằng sản phẩm cụ thể.
- Năng lực lãnh đạo, quản lý:
+ Phân công nhiệm vụ cho cấp dưới căn cứ vào năng lực, trình độ và tính phù hợp, sở trường của từng người, phù hợp với công việc được giao.
+ Tạo mối đoàn kết, hỗ trợ trong công tác của công chức trong đơn vị.
- Năng lực tập hợp, đoàn kết:
+ Lãnh đạo thực hiện mọi nhiệm vụ trên nguyên tắc tập trung dân chủ, phát huy quyền làm chủ, xây dựng khối đại đoàn kết giữa các bộ phận, tổ chức trong đơn vị.', NULL, NULL, NULL, NULL, NULL, 0, CAST(N'2024-11-26T19:12:34.6616416' AS DateTime2))
GO
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'0bcc1f0e-a30a-4ab3-9e0c-14ac450ecd2c', N'1f711c2a-f18c-4892-91eb-b5f07a74e48d', N'0f8a3810-dc07-47e8-a089-7d6c08107382', 0, CAST(N'2024-11-26T19:08:40.6039323' AS DateTime2), 8)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'3dc2e4a1-c9aa-42b8-8725-23a9ae83f56a', N'1f711c2a-f18c-4892-91eb-b5f07a74e48d', N'c702e9e8-111b-4402-8ed0-5f939a7892a6', 0, CAST(N'2024-11-26T19:08:40.6476839' AS DateTime2), 19)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'31962181-7089-42e8-be7c-2d4535d966e4', N'1f711c2a-f18c-4892-91eb-b5f07a74e48d', N'3c69d1e2-9204-431f-863f-a4ba07f3ac1d', 0, CAST(N'2024-11-26T19:08:40.6617690' AS DateTime2), 21)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'1f41766c-d993-43e1-b3a2-346bad45bcea', N'1f711c2a-f18c-4892-91eb-b5f07a74e48d', N'6f0a8890-c105-4fb4-874b-9d559847eca6', 0, CAST(N'2024-11-26T19:08:40.6288496' AS DateTime2), 23)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'767c3150-f5d0-4ef3-ad30-3493f880d7a4', N'1f711c2a-f18c-4892-91eb-b5f07a74e48d', N'35ca5805-aa8f-4dc0-a895-c2bae87a00eb', 0, CAST(N'2024-11-26T19:08:40.5970871' AS DateTime2), 22)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'bf553f7c-c7e0-4b5d-b0da-527f776bd803', N'1f711c2a-f18c-4892-91eb-b5f07a74e48d', N'3a9ab36e-b834-4a20-ba32-a0d34fdc47da', 0, CAST(N'2024-11-26T19:08:40.5593775' AS DateTime2), 12)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'eb7c108d-9746-4aa3-898b-610006ab4f9d', N'1f711c2a-f18c-4892-91eb-b5f07a74e48d', N'efbe3ff8-a8cb-408b-b2de-f0cdc5f03d55', 0, CAST(N'2024-11-26T19:08:40.5910075' AS DateTime2), 17)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'20bbdbec-f71b-4f94-8b87-6d966aeb907a', N'1f711c2a-f18c-4892-91eb-b5f07a74e48d', N'ca2c80e4-c9e6-4bc1-a080-1c0505bccaba', 0, CAST(N'2024-11-26T19:08:40.6356062' AS DateTime2), 13)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'12764211-b74a-4fa8-bf3a-6ffb010ad417', N'1f711c2a-f18c-4892-91eb-b5f07a74e48d', N'51ef79d2-b47e-41f1-a99d-f5c0e4f4416e', 0, CAST(N'2024-11-26T19:08:40.6506295' AS DateTime2), 15)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'e508c2c7-40bd-496a-bc00-73e20ff472b9', N'1f711c2a-f18c-4892-91eb-b5f07a74e48d', N'e296f2f3-e89c-49b9-b304-b76df59719ae', 0, CAST(N'2024-11-26T19:08:40.6397301' AS DateTime2), 10)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'7ba0e161-4dbe-4a77-b150-781c7a9d4ac2', N'1f711c2a-f18c-4892-91eb-b5f07a74e48d', N'ad4a5bce-f3c4-44a7-85c5-fdb1c2d19d12', 0, CAST(N'2024-11-26T19:08:40.6017185' AS DateTime2), 20)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'3af97924-83ca-491f-a872-7abc05396e98', N'1f711c2a-f18c-4892-91eb-b5f07a74e48d', N'e6d88410-17f4-479b-8e2d-8b6d5c0324a7', 0, CAST(N'2024-11-26T19:08:40.6427587' AS DateTime2), 27)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'bf949fe5-3b52-4f04-96a4-886599bc87bb', N'1f711c2a-f18c-4892-91eb-b5f07a74e48d', N'76f4c106-34b2-4175-a413-f0b67106218f', 0, CAST(N'2024-11-26T19:08:40.6253393' AS DateTime2), 16)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'354352c2-26e2-4f15-a2f3-9205fdd04319', N'1f711c2a-f18c-4892-91eb-b5f07a74e48d', N'4723cac1-52f7-43bb-8d3f-bfb3b6c28a96', 0, CAST(N'2024-11-26T19:08:40.6310441' AS DateTime2), 24)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'a9345870-92ea-49e5-b42e-938a6eb1cb92', N'1f711c2a-f18c-4892-91eb-b5f07a74e48d', N'999d3424-6bad-4d7b-8bd0-2b462b55dd45', 0, CAST(N'2024-11-26T19:08:40.6567282' AS DateTime2), 4)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'b303b934-75b8-4760-9242-a758ceaf0bf7', N'1f711c2a-f18c-4892-91eb-b5f07a74e48d', N'8b678550-a782-4ed9-a61f-15887cf5a73e', 0, CAST(N'2024-11-26T19:08:40.6210435' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'3d9795bd-3744-4f4a-a227-a78c473d1893', N'1f711c2a-f18c-4892-91eb-b5f07a74e48d', N'1b68a81a-b654-4896-9195-84abfb081103', 0, CAST(N'2024-11-26T19:08:40.6139171' AS DateTime2), 28)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'fa1d669a-05e8-4279-b9ce-a9957be63f04', N'1f711c2a-f18c-4892-91eb-b5f07a74e48d', N'f4c06feb-eb3d-4f75-95f9-10c0289de995', 0, CAST(N'2024-11-26T19:08:40.6329557' AS DateTime2), 30)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'cd4846c7-f1a8-4c67-adbd-b44fe1f00efe', N'1f711c2a-f18c-4892-91eb-b5f07a74e48d', N'79459d60-5db6-48b6-94bf-2121d9839e15', 0, CAST(N'2024-11-26T19:08:40.6107892' AS DateTime2), 2)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'7d3f154e-4e3a-4a7f-891e-baf2a6e1b809', N'1f711c2a-f18c-4892-91eb-b5f07a74e48d', N'fb40ad8f-098f-4fd1-8870-c05d1d25fae2', 0, CAST(N'2024-11-26T19:08:40.6162479' AS DateTime2), 29)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'540ef3c7-d302-48e5-87a3-bf312c942c36', N'1f711c2a-f18c-4892-91eb-b5f07a74e48d', N'3622e825-11bb-44fd-bc59-ce0c40aa9509', 0, CAST(N'2024-11-26T19:08:40.6450321' AS DateTime2), 18)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'574ee623-8bea-425c-8965-cb508a3087e4', N'1f711c2a-f18c-4892-91eb-b5f07a74e48d', N'b9ec64fd-8aac-44db-8541-67b1c6162676', 0, CAST(N'2024-11-26T19:08:40.6182691' AS DateTime2), 26)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'6be38dda-5a8e-4568-86c3-cb60c3c47d50', N'1f711c2a-f18c-4892-91eb-b5f07a74e48d', N'bf0b9144-be3b-4213-8f3c-f744035ed4b5', 0, CAST(N'2024-11-26T19:08:40.6592318' AS DateTime2), 14)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'f8db7ba4-4925-4584-8807-ccd18c71864c', N'1f711c2a-f18c-4892-91eb-b5f07a74e48d', N'b4ab63da-81d4-4ea1-8a5a-3c12154fa561', 0, CAST(N'2024-11-26T19:08:40.6087295' AS DateTime2), 5)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'682fd45a-ced4-4f33-9ded-ddc012d37c87', N'1f711c2a-f18c-4892-91eb-b5f07a74e48d', N'87fedc0d-caae-4890-80d9-a6e086d71a1c', 0, CAST(N'2024-11-26T19:08:40.6232189' AS DateTime2), 3)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'e1c13de2-61ee-40a8-91be-e10bc9035184', N'1f711c2a-f18c-4892-91eb-b5f07a74e48d', N'1fb789cf-87b0-43b0-a45e-e85e3891a9ee', 0, CAST(N'2024-11-26T19:08:40.6375746' AS DateTime2), 7)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'0499c6df-a8f3-46be-8492-e34894864453', N'1f711c2a-f18c-4892-91eb-b5f07a74e48d', N'31314875-8f03-4874-be17-0f31c14f28ee', 0, CAST(N'2024-11-26T19:08:40.6646264' AS DateTime2), 6)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'aa1db3d2-e8b4-4d49-942a-ebda1e888261', N'1f711c2a-f18c-4892-91eb-b5f07a74e48d', N'acf13799-4766-4be0-a514-693c0d238f34', 0, CAST(N'2024-11-26T19:08:40.5891141' AS DateTime2), 25)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'638cd2f2-301c-4e9b-8d77-f568b9a8f642', N'1f711c2a-f18c-4892-91eb-b5f07a74e48d', N'a7efdc67-aa93-46cb-8410-0ddcfe0d5853', 0, CAST(N'2024-11-26T19:08:40.6533777' AS DateTime2), 31)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'df5bd4b5-8f6b-4503-8e4e-f83f20b261ba', N'1f711c2a-f18c-4892-91eb-b5f07a74e48d', N'da5e3dff-a649-4508-943d-0ecc32d4f7fc', 0, CAST(N'2024-11-26T19:08:40.5993832' AS DateTime2), 9)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'5df064e2-5191-47a9-ba80-f90236f295fa', N'1f711c2a-f18c-4892-91eb-b5f07a74e48d', N'786e1a85-def5-4a2e-a70c-cfc2c0d8b239', 0, CAST(N'2024-11-26T19:08:40.6064946' AS DateTime2), 11)
GO
INSERT [dbo].[EvaluationCriteriaSample] ([Id], [EvaluationSampleId], [CategoryCriteriaId], [Sort], [IsDeleted], [UpdatedAt]) VALUES (N'805b5dcb-b864-4340-8362-00bd9ba5e068', N'9a245d3a-088b-4831-b3bf-77dc93c5ea1d', N'3a9ab36e-b834-4a20-ba32-a0d34fdc47da', 12, 0, CAST(N'2024-11-23T13:10:36.4584410' AS DateTime2))
INSERT [dbo].[EvaluationCriteriaSample] ([Id], [EvaluationSampleId], [CategoryCriteriaId], [Sort], [IsDeleted], [UpdatedAt]) VALUES (N'83995348-adcc-4253-b351-0131b04c18bf', N'b621540f-6142-42f3-8ec1-8f3cd8167a24', N'1746be1c-1adf-4f5d-8604-a711e2cc52f0', 12, 0, CAST(N'2024-11-23T13:20:24.6491805' AS DateTime2))
INSERT [dbo].[EvaluationCriteriaSample] ([Id], [EvaluationSampleId], [CategoryCriteriaId], [Sort], [IsDeleted], [UpdatedAt]) VALUES (N'ac9a3d43-750e-43af-a8f0-07f6a59d83ac', N'9a245d3a-088b-4831-b3bf-77dc93c5ea1d', N'acf13799-4766-4be0-a514-693c0d238f34', 25, 0, CAST(N'2024-11-23T13:10:36.5117625' AS DateTime2))
INSERT [dbo].[EvaluationCriteriaSample] ([Id], [EvaluationSampleId], [CategoryCriteriaId], [Sort], [IsDeleted], [UpdatedAt]) VALUES (N'41c9bab1-e4b6-4d9f-8b8e-0bc0c6742118', N'9a245d3a-088b-4831-b3bf-77dc93c5ea1d', N'efbe3ff8-a8cb-408b-b2de-f0cdc5f03d55', 17, 0, CAST(N'2024-11-23T13:10:36.4797631' AS DateTime2))
INSERT [dbo].[EvaluationCriteriaSample] ([Id], [EvaluationSampleId], [CategoryCriteriaId], [Sort], [IsDeleted], [UpdatedAt]) VALUES (N'766eae14-0cd3-4536-b7a9-101e4f7e5caf', N'b621540f-6142-42f3-8ec1-8f3cd8167a24', N'41245dd4-b247-48cd-a67c-6f23c005a5fe', 13, 0, CAST(N'2024-11-23T13:20:24.6528842' AS DateTime2))
INSERT [dbo].[EvaluationCriteriaSample] ([Id], [EvaluationSampleId], [CategoryCriteriaId], [Sort], [IsDeleted], [UpdatedAt]) VALUES (N'42256331-7895-48e6-bbdf-113d9952b580', N'9a245d3a-088b-4831-b3bf-77dc93c5ea1d', N'35ca5805-aa8f-4dc0-a895-c2bae87a00eb', 22, 0, CAST(N'2024-11-23T13:10:36.4999402' AS DateTime2))
INSERT [dbo].[EvaluationCriteriaSample] ([Id], [EvaluationSampleId], [CategoryCriteriaId], [Sort], [IsDeleted], [UpdatedAt]) VALUES (N'da5e296b-0d87-458d-8b83-125e09f93110', N'9a245d3a-088b-4831-b3bf-77dc93c5ea1d', N'da5e3dff-a649-4508-943d-0ecc32d4f7fc', 9, 0, CAST(N'2024-11-23T13:10:36.4376619' AS DateTime2))
INSERT [dbo].[EvaluationCriteriaSample] ([Id], [EvaluationSampleId], [CategoryCriteriaId], [Sort], [IsDeleted], [UpdatedAt]) VALUES (N'628b6a1e-04a1-46b8-83da-166110d73c0a', N'9a245d3a-088b-4831-b3bf-77dc93c5ea1d', N'ad4a5bce-f3c4-44a7-85c5-fdb1c2d19d12', 20, 0, CAST(N'2024-11-23T13:10:36.4922913' AS DateTime2))
INSERT [dbo].[EvaluationCriteriaSample] ([Id], [EvaluationSampleId], [CategoryCriteriaId], [Sort], [IsDeleted], [UpdatedAt]) VALUES (N'1bd107ce-f8a7-4dd5-b6c3-221db4ea74fc', N'9a245d3a-088b-4831-b3bf-77dc93c5ea1d', N'0f8a3810-dc07-47e8-a089-7d6c08107382', 8, 0, CAST(N'2024-11-23T13:10:36.4336182' AS DateTime2))
INSERT [dbo].[EvaluationCriteriaSample] ([Id], [EvaluationSampleId], [CategoryCriteriaId], [Sort], [IsDeleted], [UpdatedAt]) VALUES (N'5ff3d743-3b2a-4506-ab44-242586fd701e', N'b621540f-6142-42f3-8ec1-8f3cd8167a24', N'b2360422-271d-47f6-8884-f734d48e2cf6', 7, 0, CAST(N'2024-11-23T13:20:24.6268983' AS DateTime2))
INSERT [dbo].[EvaluationCriteriaSample] ([Id], [EvaluationSampleId], [CategoryCriteriaId], [Sort], [IsDeleted], [UpdatedAt]) VALUES (N'f58810a1-ab21-4aa6-a8b1-249462dc3882', N'9a245d3a-088b-4831-b3bf-77dc93c5ea1d', N'786e1a85-def5-4a2e-a70c-cfc2c0d8b239', 11, 0, CAST(N'2024-11-23T13:10:36.4533082' AS DateTime2))
INSERT [dbo].[EvaluationCriteriaSample] ([Id], [EvaluationSampleId], [CategoryCriteriaId], [Sort], [IsDeleted], [UpdatedAt]) VALUES (N'730784ae-780c-4663-9a9d-25cf5c507a9c', N'b621540f-6142-42f3-8ec1-8f3cd8167a24', N'45455dc8-4edc-4fd6-bc00-d5433173d947', 11, 0, CAST(N'2024-11-23T13:20:24.6446230' AS DateTime2))
INSERT [dbo].[EvaluationCriteriaSample] ([Id], [EvaluationSampleId], [CategoryCriteriaId], [Sort], [IsDeleted], [UpdatedAt]) VALUES (N'345a5bc0-c6cd-4bb7-8fd9-27607203cb0e', N'b621540f-6142-42f3-8ec1-8f3cd8167a24', N'51ea330f-07af-4d54-adff-114bdd0e6057', 3, 0, CAST(N'2024-11-23T13:20:24.6097218' AS DateTime2))
INSERT [dbo].[EvaluationCriteriaSample] ([Id], [EvaluationSampleId], [CategoryCriteriaId], [Sort], [IsDeleted], [UpdatedAt]) VALUES (N'58b2d2e5-8f2a-4cb0-9c16-2ccc530c189a', N'b621540f-6142-42f3-8ec1-8f3cd8167a24', N'abbcb306-3144-4c8a-8b98-eb07a3663ade', 8, 0, CAST(N'2024-11-23T13:20:24.6307687' AS DateTime2))
INSERT [dbo].[EvaluationCriteriaSample] ([Id], [EvaluationSampleId], [CategoryCriteriaId], [Sort], [IsDeleted], [UpdatedAt]) VALUES (N'dd90671f-5654-4b13-ae94-37e62a5dde07', N'9a245d3a-088b-4831-b3bf-77dc93c5ea1d', N'b4ab63da-81d4-4ea1-8a5a-3c12154fa561', 5, 0, CAST(N'2024-11-23T13:10:36.4215026' AS DateTime2))
INSERT [dbo].[EvaluationCriteriaSample] ([Id], [EvaluationSampleId], [CategoryCriteriaId], [Sort], [IsDeleted], [UpdatedAt]) VALUES (N'ef422cd0-6daf-407e-819a-3ae8c58adce0', N'9a245d3a-088b-4831-b3bf-77dc93c5ea1d', N'79459d60-5db6-48b6-94bf-2121d9839e15', 2, 0, CAST(N'2024-11-23T13:10:36.4067674' AS DateTime2))
INSERT [dbo].[EvaluationCriteriaSample] ([Id], [EvaluationSampleId], [CategoryCriteriaId], [Sort], [IsDeleted], [UpdatedAt]) VALUES (N'88b4b98e-200f-4128-8081-4521aaf873b6', N'9a245d3a-088b-4831-b3bf-77dc93c5ea1d', N'1b68a81a-b654-4896-9195-84abfb081103', 28, 0, CAST(N'2024-11-23T13:10:36.5259812' AS DateTime2))
INSERT [dbo].[EvaluationCriteriaSample] ([Id], [EvaluationSampleId], [CategoryCriteriaId], [Sort], [IsDeleted], [UpdatedAt]) VALUES (N'73d2a464-8061-4801-8817-4d09fa294cdf', N'9a245d3a-088b-4831-b3bf-77dc93c5ea1d', N'fb40ad8f-098f-4fd1-8870-c05d1d25fae2', 29, 0, CAST(N'2024-11-23T13:10:36.5320481' AS DateTime2))
INSERT [dbo].[EvaluationCriteriaSample] ([Id], [EvaluationSampleId], [CategoryCriteriaId], [Sort], [IsDeleted], [UpdatedAt]) VALUES (N'8a9f0227-2be4-421b-95dc-524837e41449', N'b621540f-6142-42f3-8ec1-8f3cd8167a24', N'7fe6502c-10e1-430f-bbbd-01943d0f5e98', 5, 0, CAST(N'2024-11-23T13:20:24.6178124' AS DateTime2))
INSERT [dbo].[EvaluationCriteriaSample] ([Id], [EvaluationSampleId], [CategoryCriteriaId], [Sort], [IsDeleted], [UpdatedAt]) VALUES (N'f3c0c5ca-a95f-4b62-a77f-56d9c4e7b9f6', N'b621540f-6142-42f3-8ec1-8f3cd8167a24', N'99652497-2b73-4368-901c-05143fd3f8b1', 17, 0, CAST(N'2024-11-23T13:20:24.6698499' AS DateTime2))
INSERT [dbo].[EvaluationCriteriaSample] ([Id], [EvaluationSampleId], [CategoryCriteriaId], [Sort], [IsDeleted], [UpdatedAt]) VALUES (N'80826631-3f0c-4117-8f65-60244e87b75f', N'9a245d3a-088b-4831-b3bf-77dc93c5ea1d', N'b9ec64fd-8aac-44db-8541-67b1c6162676', 26, 0, CAST(N'2024-11-23T13:10:36.5158513' AS DateTime2))
INSERT [dbo].[EvaluationCriteriaSample] ([Id], [EvaluationSampleId], [CategoryCriteriaId], [Sort], [IsDeleted], [UpdatedAt]) VALUES (N'06bdcca9-bb1f-4651-b559-620398ce5f06', N'9a245d3a-088b-4831-b3bf-77dc93c5ea1d', N'8b678550-a782-4ed9-a61f-15887cf5a73e', 1, 0, CAST(N'2024-11-23T13:10:36.3962028' AS DateTime2))
INSERT [dbo].[EvaluationCriteriaSample] ([Id], [EvaluationSampleId], [CategoryCriteriaId], [Sort], [IsDeleted], [UpdatedAt]) VALUES (N'40c08901-50ba-4b42-ae8c-65868cda1328', N'9a245d3a-088b-4831-b3bf-77dc93c5ea1d', N'87fedc0d-caae-4890-80d9-a6e086d71a1c', 3, 0, CAST(N'2024-11-23T13:10:36.4117608' AS DateTime2))
INSERT [dbo].[EvaluationCriteriaSample] ([Id], [EvaluationSampleId], [CategoryCriteriaId], [Sort], [IsDeleted], [UpdatedAt]) VALUES (N'25384798-2394-4b5d-8b8d-688f51663000', N'b621540f-6142-42f3-8ec1-8f3cd8167a24', N'8005ad2a-4d92-4101-9719-8e8364e57996', 1, 0, CAST(N'2024-11-23T13:20:24.5949117' AS DateTime2))
INSERT [dbo].[EvaluationCriteriaSample] ([Id], [EvaluationSampleId], [CategoryCriteriaId], [Sort], [IsDeleted], [UpdatedAt]) VALUES (N'f3d0dc65-23da-4936-9dfe-6af3abf9dd2b', N'b621540f-6142-42f3-8ec1-8f3cd8167a24', N'c733b044-2ace-43ea-be34-251b9af672cf', 10, 0, CAST(N'2024-11-23T13:20:24.6405704' AS DateTime2))
INSERT [dbo].[EvaluationCriteriaSample] ([Id], [EvaluationSampleId], [CategoryCriteriaId], [Sort], [IsDeleted], [UpdatedAt]) VALUES (N'059dca37-88d2-429c-81af-779480a95e1f', N'b621540f-6142-42f3-8ec1-8f3cd8167a24', N'418bf356-ca1e-4db7-9aec-0635713b688d', 2, 0, CAST(N'2024-11-23T13:20:24.6038428' AS DateTime2))
INSERT [dbo].[EvaluationCriteriaSample] ([Id], [EvaluationSampleId], [CategoryCriteriaId], [Sort], [IsDeleted], [UpdatedAt]) VALUES (N'66310358-f374-4551-b3f7-77bad7375919', N'9a245d3a-088b-4831-b3bf-77dc93c5ea1d', N'76f4c106-34b2-4175-a413-f0b67106218f', 16, 0, CAST(N'2024-11-23T13:10:36.4759786' AS DateTime2))
INSERT [dbo].[EvaluationCriteriaSample] ([Id], [EvaluationSampleId], [CategoryCriteriaId], [Sort], [IsDeleted], [UpdatedAt]) VALUES (N'71435a6b-380e-4f45-8d4d-81d3ee2d701d', N'b621540f-6142-42f3-8ec1-8f3cd8167a24', N'71cc2ca9-d338-4621-bb19-f4bd2abc9e06', 15, 0, CAST(N'2024-11-23T13:20:24.6614041' AS DateTime2))
INSERT [dbo].[EvaluationCriteriaSample] ([Id], [EvaluationSampleId], [CategoryCriteriaId], [Sort], [IsDeleted], [UpdatedAt]) VALUES (N'ca8245e9-077e-4027-a27d-845a00144237', N'9a245d3a-088b-4831-b3bf-77dc93c5ea1d', N'6f0a8890-c105-4fb4-874b-9d559847eca6', 23, 0, CAST(N'2024-11-23T13:10:36.5038483' AS DateTime2))
INSERT [dbo].[EvaluationCriteriaSample] ([Id], [EvaluationSampleId], [CategoryCriteriaId], [Sort], [IsDeleted], [UpdatedAt]) VALUES (N'6812a6b2-4bae-40e9-8562-85c08ddaf2f1', N'b621540f-6142-42f3-8ec1-8f3cd8167a24', N'415eb223-1f18-4338-be5a-b6b2ce5496ed', 14, 0, CAST(N'2024-11-23T13:20:24.6573512' AS DateTime2))
INSERT [dbo].[EvaluationCriteriaSample] ([Id], [EvaluationSampleId], [CategoryCriteriaId], [Sort], [IsDeleted], [UpdatedAt]) VALUES (N'989bec30-d16c-42d4-b187-9783307cccad', N'9a245d3a-088b-4831-b3bf-77dc93c5ea1d', N'4723cac1-52f7-43bb-8d3f-bfb3b6c28a96', 24, 0, CAST(N'2024-11-23T13:10:36.5074989' AS DateTime2))
INSERT [dbo].[EvaluationCriteriaSample] ([Id], [EvaluationSampleId], [CategoryCriteriaId], [Sort], [IsDeleted], [UpdatedAt]) VALUES (N'c1340999-5317-4e03-8d2d-a61d6606e9f4', N'b621540f-6142-42f3-8ec1-8f3cd8167a24', N'1834d96f-f389-45f2-9006-f9d57b1ecf53', 20, 0, CAST(N'2024-11-23T13:20:24.6827442' AS DateTime2))
INSERT [dbo].[EvaluationCriteriaSample] ([Id], [EvaluationSampleId], [CategoryCriteriaId], [Sort], [IsDeleted], [UpdatedAt]) VALUES (N'4a931a23-0681-4530-9021-b5a27319ecd8', N'9a245d3a-088b-4831-b3bf-77dc93c5ea1d', N'f4c06feb-eb3d-4f75-95f9-10c0289de995', 30, 0, CAST(N'2024-11-23T13:10:36.5365322' AS DateTime2))
INSERT [dbo].[EvaluationCriteriaSample] ([Id], [EvaluationSampleId], [CategoryCriteriaId], [Sort], [IsDeleted], [UpdatedAt]) VALUES (N'0db405c2-2d90-4442-a93e-b8d0a4865b7c', N'9a245d3a-088b-4831-b3bf-77dc93c5ea1d', N'ca2c80e4-c9e6-4bc1-a080-1c0505bccaba', 13, 0, CAST(N'2024-11-23T13:10:36.4627794' AS DateTime2))
INSERT [dbo].[EvaluationCriteriaSample] ([Id], [EvaluationSampleId], [CategoryCriteriaId], [Sort], [IsDeleted], [UpdatedAt]) VALUES (N'ee86c4b9-c080-4f3d-a9ef-c02dd42f5d4e', N'b621540f-6142-42f3-8ec1-8f3cd8167a24', N'e9cfa38c-e121-46ce-aaf5-b454a6b9f128', 9, 0, CAST(N'2024-11-23T13:20:24.6357002' AS DateTime2))
INSERT [dbo].[EvaluationCriteriaSample] ([Id], [EvaluationSampleId], [CategoryCriteriaId], [Sort], [IsDeleted], [UpdatedAt]) VALUES (N'66d79451-01ef-4412-a23c-c0dfaf6b53ff', N'b621540f-6142-42f3-8ec1-8f3cd8167a24', N'93b43166-bdad-4118-9bed-8176279fdf95', 4, 0, CAST(N'2024-11-23T13:20:24.6140656' AS DateTime2))
INSERT [dbo].[EvaluationCriteriaSample] ([Id], [EvaluationSampleId], [CategoryCriteriaId], [Sort], [IsDeleted], [UpdatedAt]) VALUES (N'c3525b4a-bd39-4a9c-a3a9-c0e6c0cc2248', N'9a245d3a-088b-4831-b3bf-77dc93c5ea1d', N'1fb789cf-87b0-43b0-a45e-e85e3891a9ee', 7, 0, CAST(N'2024-11-23T13:10:36.4297517' AS DateTime2))
INSERT [dbo].[EvaluationCriteriaSample] ([Id], [EvaluationSampleId], [CategoryCriteriaId], [Sort], [IsDeleted], [UpdatedAt]) VALUES (N'ac57fbc1-cd1a-4212-8f9e-c75736d95507', N'b621540f-6142-42f3-8ec1-8f3cd8167a24', N'f8c74f4e-94a2-4f75-9572-bf9c4692fae0', 18, 0, CAST(N'2024-11-23T13:20:24.6738114' AS DateTime2))
INSERT [dbo].[EvaluationCriteriaSample] ([Id], [EvaluationSampleId], [CategoryCriteriaId], [Sort], [IsDeleted], [UpdatedAt]) VALUES (N'93573a80-ad8e-4b68-abe2-d271ca7be4f5', N'9a245d3a-088b-4831-b3bf-77dc93c5ea1d', N'e296f2f3-e89c-49b9-b304-b76df59719ae', 10, 0, CAST(N'2024-11-23T13:10:36.4418626' AS DateTime2))
INSERT [dbo].[EvaluationCriteriaSample] ([Id], [EvaluationSampleId], [CategoryCriteriaId], [Sort], [IsDeleted], [UpdatedAt]) VALUES (N'de1ea98b-9d7e-4b97-a4b6-d5bad2cca938', N'9a245d3a-088b-4831-b3bf-77dc93c5ea1d', N'e6d88410-17f4-479b-8e2d-8b6d5c0324a7', 27, 0, CAST(N'2024-11-23T13:10:36.5206534' AS DateTime2))
INSERT [dbo].[EvaluationCriteriaSample] ([Id], [EvaluationSampleId], [CategoryCriteriaId], [Sort], [IsDeleted], [UpdatedAt]) VALUES (N'38d8f59e-ffc1-4158-bd34-d7aad21cab02', N'b621540f-6142-42f3-8ec1-8f3cd8167a24', N'39750d51-ea4d-4d9b-b871-6a65bb01b5a9', 19, 0, CAST(N'2024-11-23T13:20:24.6784199' AS DateTime2))
INSERT [dbo].[EvaluationCriteriaSample] ([Id], [EvaluationSampleId], [CategoryCriteriaId], [Sort], [IsDeleted], [UpdatedAt]) VALUES (N'14a5340b-0bbe-4f52-ad0c-d81e3a0cc681', N'9a245d3a-088b-4831-b3bf-77dc93c5ea1d', N'3622e825-11bb-44fd-bc59-ce0c40aa9509', 18, 0, CAST(N'2024-11-23T13:10:36.4841044' AS DateTime2))
INSERT [dbo].[EvaluationCriteriaSample] ([Id], [EvaluationSampleId], [CategoryCriteriaId], [Sort], [IsDeleted], [UpdatedAt]) VALUES (N'74c875af-6bd4-4b5b-afb9-db2cf854ba17', N'9a245d3a-088b-4831-b3bf-77dc93c5ea1d', N'c702e9e8-111b-4402-8ed0-5f939a7892a6', 19, 0, CAST(N'2024-11-23T13:10:36.4876894' AS DateTime2))
INSERT [dbo].[EvaluationCriteriaSample] ([Id], [EvaluationSampleId], [CategoryCriteriaId], [Sort], [IsDeleted], [UpdatedAt]) VALUES (N'3225a0d8-9e74-4f41-943e-dd4b6b04d635', N'b621540f-6142-42f3-8ec1-8f3cd8167a24', N'97787e25-9013-4175-a4e6-ca0d74509ac1', 16, 0, CAST(N'2024-11-23T13:20:24.6655985' AS DateTime2))
INSERT [dbo].[EvaluationCriteriaSample] ([Id], [EvaluationSampleId], [CategoryCriteriaId], [Sort], [IsDeleted], [UpdatedAt]) VALUES (N'018b48c0-1b97-45e4-9dc1-e383ff9595fd', N'9a245d3a-088b-4831-b3bf-77dc93c5ea1d', N'51ef79d2-b47e-41f1-a99d-f5c0e4f4416e', 15, 0, CAST(N'2024-11-23T13:10:36.4715138' AS DateTime2))
INSERT [dbo].[EvaluationCriteriaSample] ([Id], [EvaluationSampleId], [CategoryCriteriaId], [Sort], [IsDeleted], [UpdatedAt]) VALUES (N'dc2b64aa-7e51-4358-88ca-e6fa72713048', N'9a245d3a-088b-4831-b3bf-77dc93c5ea1d', N'a7efdc67-aa93-46cb-8410-0ddcfe0d5853', 31, 0, CAST(N'2024-11-23T13:10:36.5432490' AS DateTime2))
INSERT [dbo].[EvaluationCriteriaSample] ([Id], [EvaluationSampleId], [CategoryCriteriaId], [Sort], [IsDeleted], [UpdatedAt]) VALUES (N'31aeffd6-eb75-419f-8461-e7739ce52ae2', N'b621540f-6142-42f3-8ec1-8f3cd8167a24', N'cdaf282b-23f7-42a5-b099-22cd38a5c8b1', 21, 0, CAST(N'2024-11-23T13:20:24.6871892' AS DateTime2))
INSERT [dbo].[EvaluationCriteriaSample] ([Id], [EvaluationSampleId], [CategoryCriteriaId], [Sort], [IsDeleted], [UpdatedAt]) VALUES (N'7e92c47a-4428-4d81-bf47-eb700beab66e', N'9a245d3a-088b-4831-b3bf-77dc93c5ea1d', N'999d3424-6bad-4d7b-8bd0-2b462b55dd45', 4, 0, CAST(N'2024-11-23T13:10:36.4168317' AS DateTime2))
INSERT [dbo].[EvaluationCriteriaSample] ([Id], [EvaluationSampleId], [CategoryCriteriaId], [Sort], [IsDeleted], [UpdatedAt]) VALUES (N'93902193-7a81-4da9-b097-f055a9866926', N'9a245d3a-088b-4831-b3bf-77dc93c5ea1d', N'bf0b9144-be3b-4213-8f3c-f744035ed4b5', 14, 0, CAST(N'2024-11-23T13:10:36.4670397' AS DateTime2))
INSERT [dbo].[EvaluationCriteriaSample] ([Id], [EvaluationSampleId], [CategoryCriteriaId], [Sort], [IsDeleted], [UpdatedAt]) VALUES (N'63568c4b-9721-4a41-9228-f0f5936a35b8', N'9a245d3a-088b-4831-b3bf-77dc93c5ea1d', N'3c69d1e2-9204-431f-863f-a4ba07f3ac1d', 21, 0, CAST(N'2024-11-23T13:10:36.4960473' AS DateTime2))
INSERT [dbo].[EvaluationCriteriaSample] ([Id], [EvaluationSampleId], [CategoryCriteriaId], [Sort], [IsDeleted], [UpdatedAt]) VALUES (N'ccad1ece-2d6a-449f-a082-f886b390c27d', N'b621540f-6142-42f3-8ec1-8f3cd8167a24', N'4451add8-b5d1-483a-9fe8-254611d89e32', 6, 0, CAST(N'2024-11-23T13:20:24.6226060' AS DateTime2))
INSERT [dbo].[EvaluationCriteriaSample] ([Id], [EvaluationSampleId], [CategoryCriteriaId], [Sort], [IsDeleted], [UpdatedAt]) VALUES (N'f3686d85-0dc2-4a9f-88b7-ff78dbe8e624', N'9a245d3a-088b-4831-b3bf-77dc93c5ea1d', N'31314875-8f03-4874-be17-0f31c14f28ee', 6, 0, CAST(N'2024-11-23T13:10:36.4251612' AS DateTime2))
GO
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'58e9e9b9-d200-43be-a901-0b3c0c805ac6', N'1f711c2a-f18c-4892-91eb-b5f07a74e48d', N'dd3c7e8b-3dc7-45d2-a2bd-282de7d5e2de', N'574ee623-8bea-425c-8965-cb508a3087e4', 9, 0, CAST(N'2024-11-26T19:12:34.6288840' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'5b87d9f3-eef7-48b4-a5fe-0cac539fda4d', N'1f711c2a-f18c-4892-91eb-b5f07a74e48d', N'dd3c7e8b-3dc7-45d2-a2bd-282de7d5e2de', N'3dc2e4a1-c9aa-42b8-8725-23a9ae83f56a', 3, 0, CAST(N'2024-11-26T19:12:34.6090812' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'6dba827f-357f-4ff1-81ab-1313f5143c75', N'1f711c2a-f18c-4892-91eb-b5f07a74e48d', N'dd3c7e8b-3dc7-45d2-a2bd-282de7d5e2de', N'3d9795bd-3744-4f4a-a227-a78c473d1893', 6, 0, CAST(N'2024-11-26T19:12:34.6335098' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'0719fc25-a021-42be-90da-14dd85c2646c', N'1f711c2a-f18c-4892-91eb-b5f07a74e48d', N'32f207a2-02ba-4b83-8c71-03af11657c63', N'a9345870-92ea-49e5-b42e-938a6eb1cb92', 4, 0, CAST(N'2024-11-26T19:10:45.9636524' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'e93280af-c4c9-46ea-8bc1-15595bc3a5e4', N'1f711c2a-f18c-4892-91eb-b5f07a74e48d', N'dd3c7e8b-3dc7-45d2-a2bd-282de7d5e2de', N'e1c13de2-61ee-40a8-91be-e10bc9035184', 3, 0, CAST(N'2024-11-26T19:12:34.5590095' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'7d09c67a-ee72-4cf7-ad5c-1b6d34ac6602', N'1f711c2a-f18c-4892-91eb-b5f07a74e48d', N'32f207a2-02ba-4b83-8c71-03af11657c63', N'bf553f7c-c7e0-4b5d-b0da-527f776bd803', 3, 0, CAST(N'2024-11-26T19:10:46.0006764' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'fb1e2b65-e22f-4345-b8a6-1bb6d665cda0', N'1f711c2a-f18c-4892-91eb-b5f07a74e48d', N'32f207a2-02ba-4b83-8c71-03af11657c63', N'e1c13de2-61ee-40a8-91be-e10bc9035184', 2, 0, CAST(N'2024-11-26T19:10:45.9780009' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'6ed6e7de-22d4-4831-998b-1e611900f10b', N'1f711c2a-f18c-4892-91eb-b5f07a74e48d', N'dd3c7e8b-3dc7-45d2-a2bd-282de7d5e2de', N'682fd45a-ced4-4f33-9ded-ddc012d37c87', 4, 0, CAST(N'2024-11-26T19:12:34.5438821' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'85bcba15-a8c1-4839-9361-2c51a1db9c0c', N'1f711c2a-f18c-4892-91eb-b5f07a74e48d', N'dd3c7e8b-3dc7-45d2-a2bd-282de7d5e2de', N'aa1db3d2-e8b4-4d49-942a-ebda1e888261', 9, 0, CAST(N'2024-11-26T19:12:34.6236868' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'd0e9eb69-17cd-47b9-9826-2c920e175276', N'1f711c2a-f18c-4892-91eb-b5f07a74e48d', N'dd3c7e8b-3dc7-45d2-a2bd-282de7d5e2de', N'e508c2c7-40bd-496a-bc00-73e20ff472b9', 3, 0, CAST(N'2024-11-26T19:12:34.5739033' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'4ea6cc71-4d86-48bd-8673-305be3e50e2c', N'1f711c2a-f18c-4892-91eb-b5f07a74e48d', N'32f207a2-02ba-4b83-8c71-03af11657c63', N'3dc2e4a1-c9aa-42b8-8725-23a9ae83f56a', 2, 0, CAST(N'2024-11-26T19:10:46.0307837' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'ea5e2387-919b-4211-8674-31d8742ad8c9', N'1f711c2a-f18c-4892-91eb-b5f07a74e48d', N'dd3c7e8b-3dc7-45d2-a2bd-282de7d5e2de', N'cd4846c7-f1a8-4c67-adbd-b44fe1f00efe', 0, 0, CAST(N'2024-11-26T19:12:34.5360014' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'3c4ea09c-bea3-4640-9aee-3427f947ac39', N'1f711c2a-f18c-4892-91eb-b5f07a74e48d', N'32f207a2-02ba-4b83-8c71-03af11657c63', N'6be38dda-5a8e-4568-86c3-cb60c3c47d50', 3, 0, CAST(N'2024-11-26T19:10:46.0110220' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'e619dea5-dd61-4c8c-bf65-371d3fc54c43', N'1f711c2a-f18c-4892-91eb-b5f07a74e48d', N'32f207a2-02ba-4b83-8c71-03af11657c63', N'0bcc1f0e-a30a-4ab3-9e0c-14ac450ecd2c', 3, 0, CAST(N'2024-11-26T19:10:45.9841843' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'28271923-354e-4b14-8745-37ef17402cec', N'1f711c2a-f18c-4892-91eb-b5f07a74e48d', N'dd3c7e8b-3dc7-45d2-a2bd-282de7d5e2de', N'7ba0e161-4dbe-4a77-b150-781c7a9d4ac2', 2, 0, CAST(N'2024-11-26T19:12:34.6136024' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'38f192ca-3cae-435b-a177-39b5d7db6ea6', N'1f711c2a-f18c-4892-91eb-b5f07a74e48d', N'dd3c7e8b-3dc7-45d2-a2bd-282de7d5e2de', N'fa1d669a-05e8-4279-b9ce-a9957be63f04', 6, 0, CAST(N'2024-11-26T19:12:34.6438348' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'2e7daf22-5f8b-44d7-bc33-3b3ef6c2680f', N'1f711c2a-f18c-4892-91eb-b5f07a74e48d', N'dd3c7e8b-3dc7-45d2-a2bd-282de7d5e2de', N'eb7c108d-9746-4aa3-898b-610006ab4f9d', 2, 0, CAST(N'2024-11-26T19:12:34.5981036' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'407203ef-210f-43bf-ad52-4603809b2c97', N'1f711c2a-f18c-4892-91eb-b5f07a74e48d', N'32f207a2-02ba-4b83-8c71-03af11657c63', N'540ef3c7-d302-48e5-87a3-bf312c942c36', 2, 0, CAST(N'2024-11-26T19:10:46.0258121' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'bb54ea91-2745-40b1-9234-4e2426e3c1e9', N'1f711c2a-f18c-4892-91eb-b5f07a74e48d', N'32f207a2-02ba-4b83-8c71-03af11657c63', N'cd4846c7-f1a8-4c67-adbd-b44fe1f00efe', 2, 0, CAST(N'2024-11-26T19:10:45.8927896' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'1dab15d3-a3d7-497f-9212-56e72920e198', N'1f711c2a-f18c-4892-91eb-b5f07a74e48d', N'dd3c7e8b-3dc7-45d2-a2bd-282de7d5e2de', N'540ef3c7-d302-48e5-87a3-bf312c942c36', 2, 0, CAST(N'2024-11-26T19:12:34.6037595' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'cd495af7-8ccd-4511-9159-5b5243331084', N'1f711c2a-f18c-4892-91eb-b5f07a74e48d', N'dd3c7e8b-3dc7-45d2-a2bd-282de7d5e2de', N'f8db7ba4-4925-4584-8807-ccd18c71864c', 4, 0, CAST(N'2024-11-26T19:12:34.5542660' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'1d53454c-ee0d-4cb1-9bcf-5be86f2f2d78', N'1f711c2a-f18c-4892-91eb-b5f07a74e48d', N'dd3c7e8b-3dc7-45d2-a2bd-282de7d5e2de', N'6be38dda-5a8e-4568-86c3-cb60c3c47d50', 0, 0, CAST(N'2024-11-26T19:12:34.5891702' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'bff7ffb4-efa7-4519-b054-642a393343d3', N'1f711c2a-f18c-4892-91eb-b5f07a74e48d', N'dd3c7e8b-3dc7-45d2-a2bd-282de7d5e2de', N'1f41766c-d993-43e1-b3a2-346bad45bcea', 9, 0, CAST(N'2024-11-26T19:12:34.6185867' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'f5aaece9-f3dd-48cb-a86e-6bfe9411b799', N'1f711c2a-f18c-4892-91eb-b5f07a74e48d', N'32f207a2-02ba-4b83-8c71-03af11657c63', N'aa1db3d2-e8b4-4d49-942a-ebda1e888261', 9, 0, CAST(N'2024-11-26T19:10:46.0468159' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'e9c0e0f9-29ef-47b0-b9ef-745604379eae', N'1f711c2a-f18c-4892-91eb-b5f07a74e48d', N'32f207a2-02ba-4b83-8c71-03af11657c63', N'fa1d669a-05e8-4279-b9ce-a9957be63f04', 0, 0, CAST(N'2024-11-26T19:10:46.0688436' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'70c90bd1-a768-4248-9c0e-782204acd958', N'1f711c2a-f18c-4892-91eb-b5f07a74e48d', N'dd3c7e8b-3dc7-45d2-a2bd-282de7d5e2de', N'7d3f154e-4e3a-4a7f-891e-baf2a6e1b809', 6, 0, CAST(N'2024-11-26T19:12:34.6386184' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'29672c1d-7678-41a4-9392-7ed2e667ee6d', N'1f711c2a-f18c-4892-91eb-b5f07a74e48d', N'32f207a2-02ba-4b83-8c71-03af11657c63', N'638cd2f2-301c-4e9b-8d77-f568b9a8f642', 0, 0, CAST(N'2024-11-26T19:10:46.0747372' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'35ff7c04-e559-429c-b34a-82d5ddc7186e', N'1f711c2a-f18c-4892-91eb-b5f07a74e48d', N'dd3c7e8b-3dc7-45d2-a2bd-282de7d5e2de', N'12764211-b74a-4fa8-bf3a-6ffb010ad417', 3, 0, CAST(N'2024-11-26T19:12:34.5940630' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'638c456b-43dc-44af-95fb-888714ed9762', N'1f711c2a-f18c-4892-91eb-b5f07a74e48d', N'32f207a2-02ba-4b83-8c71-03af11657c63', N'1f41766c-d993-43e1-b3a2-346bad45bcea', 9, 0, CAST(N'2024-11-26T19:10:46.0413604' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'02e60023-bdd1-4b89-be01-892ed80bc90f', N'1f711c2a-f18c-4892-91eb-b5f07a74e48d', N'32f207a2-02ba-4b83-8c71-03af11657c63', N'f8db7ba4-4925-4584-8807-ccd18c71864c', 4, 0, CAST(N'2024-11-26T19:10:45.9706838' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'78e16b5e-e148-431d-9159-91a9be4ab822', N'1f711c2a-f18c-4892-91eb-b5f07a74e48d', N'32f207a2-02ba-4b83-8c71-03af11657c63', N'e508c2c7-40bd-496a-bc00-73e20ff472b9', 3, 0, CAST(N'2024-11-26T19:10:45.9952175' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'0f174636-520a-453b-86b1-a39029777304', N'1f711c2a-f18c-4892-91eb-b5f07a74e48d', N'32f207a2-02ba-4b83-8c71-03af11657c63', N'682fd45a-ced4-4f33-9ded-ddc012d37c87', 2, 0, CAST(N'2024-11-26T19:10:45.9572075' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'29452b50-6674-4ccf-b218-a5e0948686eb', N'1f711c2a-f18c-4892-91eb-b5f07a74e48d', N'32f207a2-02ba-4b83-8c71-03af11657c63', N'12764211-b74a-4fa8-bf3a-6ffb010ad417', 3, 0, CAST(N'2024-11-26T19:10:46.0148405' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'88fee4d5-999f-4db5-9388-b03213c69e8e', N'1f711c2a-f18c-4892-91eb-b5f07a74e48d', N'32f207a2-02ba-4b83-8c71-03af11657c63', N'7d3f154e-4e3a-4a7f-891e-baf2a6e1b809', 0, 0, CAST(N'2024-11-26T19:10:46.0628705' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'9b3f9f61-2a66-4ea1-a33c-b51eb2e0d326', N'1f711c2a-f18c-4892-91eb-b5f07a74e48d', N'32f207a2-02ba-4b83-8c71-03af11657c63', N'eb7c108d-9746-4aa3-898b-610006ab4f9d', 2, 0, CAST(N'2024-11-26T19:10:46.0203941' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'499fbedd-7ed7-4551-9aec-b6001ea180d3', N'1f711c2a-f18c-4892-91eb-b5f07a74e48d', N'dd3c7e8b-3dc7-45d2-a2bd-282de7d5e2de', N'df5bd4b5-8f6b-4503-8e4e-f83f20b261ba', 2, 0, CAST(N'2024-11-26T19:12:34.5687821' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'67c42922-3e24-4707-9950-b939f65f2ac0', N'1f711c2a-f18c-4892-91eb-b5f07a74e48d', N'dd3c7e8b-3dc7-45d2-a2bd-282de7d5e2de', N'a9345870-92ea-49e5-b42e-938a6eb1cb92', 2, 0, CAST(N'2024-11-26T19:12:34.5491054' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'7f59b09e-0457-415d-9eb0-ba47fedc4577', N'1f711c2a-f18c-4892-91eb-b5f07a74e48d', N'32f207a2-02ba-4b83-8c71-03af11657c63', N'df5bd4b5-8f6b-4503-8e4e-f83f20b261ba', 3, 0, CAST(N'2024-11-26T19:10:45.9898416' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'857ae91a-a44d-4322-a7ac-e5dcd9fc924a', N'1f711c2a-f18c-4892-91eb-b5f07a74e48d', N'dd3c7e8b-3dc7-45d2-a2bd-282de7d5e2de', N'0bcc1f0e-a30a-4ab3-9e0c-14ac450ecd2c', 3, 0, CAST(N'2024-11-26T19:12:34.5633265' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'209a4205-0c6b-4f28-9278-ead533e5a22f', N'1f711c2a-f18c-4892-91eb-b5f07a74e48d', N'dd3c7e8b-3dc7-45d2-a2bd-282de7d5e2de', N'20bbdbec-f71b-4f94-8b87-6d966aeb907a', 0, 0, CAST(N'2024-11-26T19:12:34.5839269' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'e0857655-cc58-4306-8325-ece2cd0ceab6', N'1f711c2a-f18c-4892-91eb-b5f07a74e48d', N'dd3c7e8b-3dc7-45d2-a2bd-282de7d5e2de', N'bf553f7c-c7e0-4b5d-b0da-527f776bd803', 0, 0, CAST(N'2024-11-26T19:12:34.5782474' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'101f1691-1659-43b4-9618-edf461d0c592', N'1f711c2a-f18c-4892-91eb-b5f07a74e48d', N'dd3c7e8b-3dc7-45d2-a2bd-282de7d5e2de', N'638cd2f2-301c-4e9b-8d77-f568b9a8f642', 6, 0, CAST(N'2024-11-26T19:12:34.6488667' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'd93e26e6-0cdf-49b0-a1b8-f099640f6f1f', N'1f711c2a-f18c-4892-91eb-b5f07a74e48d', N'32f207a2-02ba-4b83-8c71-03af11657c63', N'574ee623-8bea-425c-8965-cb508a3087e4', 9, 0, CAST(N'2024-11-26T19:10:46.0523087' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'74454bae-7823-4a71-8b0b-f287959c21c1', N'1f711c2a-f18c-4892-91eb-b5f07a74e48d', N'32f207a2-02ba-4b83-8c71-03af11657c63', N'7ba0e161-4dbe-4a77-b150-781c7a9d4ac2', 2, 0, CAST(N'2024-11-26T19:10:46.0354323' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'5d85f890-255e-4481-b8dc-f9bbb8c2f845', N'1f711c2a-f18c-4892-91eb-b5f07a74e48d', N'32f207a2-02ba-4b83-8c71-03af11657c63', N'20bbdbec-f71b-4f94-8b87-6d966aeb907a', 2, 0, CAST(N'2024-11-26T19:10:46.0058326' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'2b1ef593-886d-43c1-9529-ffe9955fae6b', N'1f711c2a-f18c-4892-91eb-b5f07a74e48d', N'32f207a2-02ba-4b83-8c71-03af11657c63', N'3d9795bd-3744-4f4a-a227-a78c473d1893', 0, 0, CAST(N'2024-11-26T19:10:46.0570946' AS DateTime2), 2)
GO
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'4577e5f4-0f29-4535-abfd-061199ceb9a0', N'1f711c2a-f18c-4892-91eb-b5f07a74e48d', N'55fc6d0e-50b3-4876-bf93-ee3937daeb62', N'3c4ea09c-bea3-4640-9aee-3427f947ac39', 3, 0, CAST(N'2024-11-26T19:11:32.5836486' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'21e3d501-2e00-4653-9eab-0685df6868c0', N'1f711c2a-f18c-4892-91eb-b5f07a74e48d', N'55fc6d0e-50b3-4876-bf93-ee3937daeb62', N'88fee4d5-999f-4db5-9388-b03213c69e8e', 0, 0, CAST(N'2024-11-26T19:11:32.6285322' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'8a01990d-5599-46c1-875b-0c26490cabb3', N'1f711c2a-f18c-4892-91eb-b5f07a74e48d', N'55fc6d0e-50b3-4876-bf93-ee3937daeb62', N'd93e26e6-0cdf-49b0-a1b8-f099640f6f1f', 9, 0, CAST(N'2024-11-26T19:11:32.6200617' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'd65fbd93-9a2f-45c2-ba8e-0dd444c8b464', N'1f711c2a-f18c-4892-91eb-b5f07a74e48d', N'55fc6d0e-50b3-4876-bf93-ee3937daeb62', N'407203ef-210f-43bf-ad52-4603809b2c97', 2, 0, CAST(N'2024-11-26T19:11:32.5978362' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'5de9598e-cb72-4343-8348-1ce145beadec', N'1f711c2a-f18c-4892-91eb-b5f07a74e48d', N'70be578e-af27-4056-a6ad-55990f86b3e7', N'29672c1d-7678-41a4-9392-7ed2e667ee6d', 6, 0, CAST(N'2024-11-26T21:22:03.5175749' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'8907bd94-33f0-4aad-95c5-1f66f5acbb6c', N'1f711c2a-f18c-4892-91eb-b5f07a74e48d', N'70be578e-af27-4056-a6ad-55990f86b3e7', N'd93e26e6-0cdf-49b0-a1b8-f099640f6f1f', 9, 0, CAST(N'2024-11-26T21:22:03.4966073' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'30219eaa-2dad-48c6-bcaf-246f7c737fc1', N'1f711c2a-f18c-4892-91eb-b5f07a74e48d', N'70be578e-af27-4056-a6ad-55990f86b3e7', N'fb1e2b65-e22f-4345-b8a6-1bb6d665cda0', 2, 0, CAST(N'2024-11-26T21:22:03.4257644' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'13db86bd-f5fd-45fa-8ade-25f28f0dcd4e', N'1f711c2a-f18c-4892-91eb-b5f07a74e48d', N'55fc6d0e-50b3-4876-bf93-ee3937daeb62', N'2b1ef593-886d-43c1-9529-ffe9955fae6b', 0, 0, CAST(N'2024-11-26T19:11:32.6246059' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'317d2528-cd7a-4249-ba89-2734e7a23d6c', N'1f711c2a-f18c-4892-91eb-b5f07a74e48d', N'55fc6d0e-50b3-4876-bf93-ee3937daeb62', N'fb1e2b65-e22f-4345-b8a6-1bb6d665cda0', 2, 0, CAST(N'2024-11-26T19:11:32.4974331' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'db95a46e-4f19-4538-8e43-34e926094105', N'1f711c2a-f18c-4892-91eb-b5f07a74e48d', N'55fc6d0e-50b3-4876-bf93-ee3937daeb62', N'bb54ea91-2745-40b1-9234-4e2426e3c1e9', 2, 0, CAST(N'2024-11-26T19:11:32.4637823' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'b49b97cc-1725-4580-bdb3-4055a6f0f2e3', N'1f711c2a-f18c-4892-91eb-b5f07a74e48d', N'70be578e-af27-4056-a6ad-55990f86b3e7', N'78e16b5e-e148-431d-9159-91a9be4ab822', 3, 0, CAST(N'2024-11-26T21:22:03.4409420' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'e9110d28-b9f6-412e-b3b1-424f185e0818', N'1f711c2a-f18c-4892-91eb-b5f07a74e48d', N'70be578e-af27-4056-a6ad-55990f86b3e7', N'5d85f890-255e-4481-b8dc-f9bbb8c2f845', 2, 0, CAST(N'2024-11-26T21:22:03.4500214' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'daf71f8e-45df-4266-92d5-42db995b54ef', N'1f711c2a-f18c-4892-91eb-b5f07a74e48d', N'70be578e-af27-4056-a6ad-55990f86b3e7', N'638c456b-43dc-44af-95fb-888714ed9762', 9, 0, CAST(N'2024-11-26T21:22:03.4849455' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'99b7a663-8189-4abb-b271-5085fba4de45', N'1f711c2a-f18c-4892-91eb-b5f07a74e48d', N'70be578e-af27-4056-a6ad-55990f86b3e7', N'74454bae-7823-4a71-8b0b-f287959c21c1', 2, 0, CAST(N'2024-11-26T21:22:03.4790973' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'd5db6b5e-3cc5-4f39-8375-50b4609024b5', N'1f711c2a-f18c-4892-91eb-b5f07a74e48d', N'55fc6d0e-50b3-4876-bf93-ee3937daeb62', N'638c456b-43dc-44af-95fb-888714ed9762', 9, 0, CAST(N'2024-11-26T19:11:32.6113272' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'3869cfde-adf7-4221-9954-521aacd5e048', N'1f711c2a-f18c-4892-91eb-b5f07a74e48d', N'70be578e-af27-4056-a6ad-55990f86b3e7', N'bb54ea91-2745-40b1-9234-4e2426e3c1e9', 2, 0, CAST(N'2024-11-26T21:22:03.3932432' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'd5796b3f-126f-43e7-9e22-545039e6f064', N'1f711c2a-f18c-4892-91eb-b5f07a74e48d', N'70be578e-af27-4056-a6ad-55990f86b3e7', N'2b1ef593-886d-43c1-9529-ffe9955fae6b', 0, 0, CAST(N'2024-11-26T21:22:03.5013299' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'37eb9e92-7146-416c-acca-572c805f98b0', N'1f711c2a-f18c-4892-91eb-b5f07a74e48d', N'55fc6d0e-50b3-4876-bf93-ee3937daeb62', N'f5aaece9-f3dd-48cb-a86e-6bfe9411b799', 9, 0, CAST(N'2024-11-26T19:11:32.6152099' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'42a66bbd-2bb7-4335-98b8-59a29f1f6936', N'1f711c2a-f18c-4892-91eb-b5f07a74e48d', N'55fc6d0e-50b3-4876-bf93-ee3937daeb62', N'7f59b09e-0457-415d-9eb0-ba47fedc4577', 3, 0, CAST(N'2024-11-26T19:11:32.5080569' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'66e64b5a-a37c-4a76-b68c-5e92519a32a4', N'1f711c2a-f18c-4892-91eb-b5f07a74e48d', N'55fc6d0e-50b3-4876-bf93-ee3937daeb62', N'29672c1d-7678-41a4-9392-7ed2e667ee6d', 0, 0, CAST(N'2024-11-26T19:11:32.6373350' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'aa8a0237-e2ed-4af2-93ce-694dce9c7fb6', N'1f711c2a-f18c-4892-91eb-b5f07a74e48d', N'70be578e-af27-4056-a6ad-55990f86b3e7', N'02e60023-bdd1-4b89-be01-892ed80bc90f', 4, 0, CAST(N'2024-11-26T21:22:03.4203077' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'b6fc95e7-c769-439b-9302-6bf2ee760748', N'1f711c2a-f18c-4892-91eb-b5f07a74e48d', N'70be578e-af27-4056-a6ad-55990f86b3e7', N'9b3f9f61-2a66-4ea1-a33c-b51eb2e0d326', 2, 0, CAST(N'2024-11-26T21:22:03.4640306' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'a502c4fb-a422-480a-b2a2-7aa83f019d2c', N'1f711c2a-f18c-4892-91eb-b5f07a74e48d', N'70be578e-af27-4056-a6ad-55990f86b3e7', N'407203ef-210f-43bf-ad52-4603809b2c97', 2, 0, CAST(N'2024-11-26T21:22:03.4692048' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'd29e5711-ecdf-484b-961b-7c4910000766', N'1f711c2a-f18c-4892-91eb-b5f07a74e48d', N'70be578e-af27-4056-a6ad-55990f86b3e7', N'7d09c67a-ee72-4cf7-ad5c-1b6d34ac6602', 3, 0, CAST(N'2024-11-26T21:22:03.4455122' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'89b9c100-9dd7-4efe-9141-84ab79d42861', N'1f711c2a-f18c-4892-91eb-b5f07a74e48d', N'55fc6d0e-50b3-4876-bf93-ee3937daeb62', N'e619dea5-dd61-4c8c-bf65-371d3fc54c43', 3, 0, CAST(N'2024-11-26T19:11:32.5025000' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'f0468a13-c31f-4c5f-8873-8b29a9c0b5d0', N'1f711c2a-f18c-4892-91eb-b5f07a74e48d', N'55fc6d0e-50b3-4876-bf93-ee3937daeb62', N'7d09c67a-ee72-4cf7-ad5c-1b6d34ac6602', 3, 0, CAST(N'2024-11-26T19:11:32.5652534' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'73030839-5518-47a6-9a8f-a02b69618d82', N'1f711c2a-f18c-4892-91eb-b5f07a74e48d', N'70be578e-af27-4056-a6ad-55990f86b3e7', N'f5aaece9-f3dd-48cb-a86e-6bfe9411b799', 9, 0, CAST(N'2024-11-26T21:22:03.4910601' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'befa6559-152b-4044-ae1c-a212f93b44b3', N'1f711c2a-f18c-4892-91eb-b5f07a74e48d', N'55fc6d0e-50b3-4876-bf93-ee3937daeb62', N'02e60023-bdd1-4b89-be01-892ed80bc90f', 4, 0, CAST(N'2024-11-26T19:11:32.4935099' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'd0b8e5e1-27ac-47ed-ad63-a48a2afff514', N'1f711c2a-f18c-4892-91eb-b5f07a74e48d', N'55fc6d0e-50b3-4876-bf93-ee3937daeb62', N'4ea6cc71-4d86-48bd-8673-305be3e50e2c', 2, 0, CAST(N'2024-11-26T19:11:32.6017052' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'f5dbfe59-90c8-48e1-810c-a5b9d3fb6d55', N'1f711c2a-f18c-4892-91eb-b5f07a74e48d', N'70be578e-af27-4056-a6ad-55990f86b3e7', N'7f59b09e-0457-415d-9eb0-ba47fedc4577', 3, 0, CAST(N'2024-11-26T21:22:03.4356417' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'8d2befaf-ec27-4ecb-b987-a9312c8a6ba1', N'1f711c2a-f18c-4892-91eb-b5f07a74e48d', N'70be578e-af27-4056-a6ad-55990f86b3e7', N'29452b50-6674-4ccf-b218-a5e0948686eb', 3, 0, CAST(N'2024-11-26T21:22:03.4594378' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'8edc21da-3d79-40ea-81fb-aafe4fb1f49c', N'1f711c2a-f18c-4892-91eb-b5f07a74e48d', N'55fc6d0e-50b3-4876-bf93-ee3937daeb62', N'78e16b5e-e148-431d-9159-91a9be4ab822', 3, 0, CAST(N'2024-11-26T19:11:32.5132101' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'8f6c5d40-6359-46eb-a165-afb21a5d63fa', N'1f711c2a-f18c-4892-91eb-b5f07a74e48d', N'55fc6d0e-50b3-4876-bf93-ee3937daeb62', N'29452b50-6674-4ccf-b218-a5e0948686eb', 3, 0, CAST(N'2024-11-26T19:11:32.5892169' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'2128374b-7166-45fb-8d5e-afcdeedf6b33', N'1f711c2a-f18c-4892-91eb-b5f07a74e48d', N'70be578e-af27-4056-a6ad-55990f86b3e7', N'0f174636-520a-453b-86b1-a39029777304', 2, 0, CAST(N'2024-11-26T21:22:03.4092499' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'487c4f06-89a1-41cb-beac-b08997ec5752', N'1f711c2a-f18c-4892-91eb-b5f07a74e48d', N'55fc6d0e-50b3-4876-bf93-ee3937daeb62', N'74454bae-7823-4a71-8b0b-f287959c21c1', 2, 0, CAST(N'2024-11-26T19:11:32.6064118' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'c2d8b7bc-7987-40c2-9a08-b6a205f90645', N'1f711c2a-f18c-4892-91eb-b5f07a74e48d', N'70be578e-af27-4056-a6ad-55990f86b3e7', N'4ea6cc71-4d86-48bd-8673-305be3e50e2c', 2, 0, CAST(N'2024-11-26T21:22:03.4745439' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'2e047a6e-1de7-4a80-8c67-ba01ee1b44cc', N'1f711c2a-f18c-4892-91eb-b5f07a74e48d', N'70be578e-af27-4056-a6ad-55990f86b3e7', N'88fee4d5-999f-4db5-9388-b03213c69e8e', 0, 0, CAST(N'2024-11-26T21:22:03.5061840' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'132ab3b5-0dca-46ee-bb57-c2d27f5f826a', N'1f711c2a-f18c-4892-91eb-b5f07a74e48d', N'55fc6d0e-50b3-4876-bf93-ee3937daeb62', N'9b3f9f61-2a66-4ea1-a33c-b51eb2e0d326', 2, 0, CAST(N'2024-11-26T19:11:32.5933878' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'ba41700b-b7ac-435c-b97b-d5bccf7beda0', N'1f711c2a-f18c-4892-91eb-b5f07a74e48d', N'70be578e-af27-4056-a6ad-55990f86b3e7', N'e619dea5-dd61-4c8c-bf65-371d3fc54c43', 3, 0, CAST(N'2024-11-26T21:22:03.4306149' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'be9cbc49-2ce4-4d08-8c9f-dc808de83c26', N'1f711c2a-f18c-4892-91eb-b5f07a74e48d', N'70be578e-af27-4056-a6ad-55990f86b3e7', N'e9c0e0f9-29ef-47b0-b9ef-745604379eae', 6, 0, CAST(N'2024-11-26T21:22:03.5117102' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'42196e36-135c-4e00-a9b8-e06a272ed5ee', N'1f711c2a-f18c-4892-91eb-b5f07a74e48d', N'55fc6d0e-50b3-4876-bf93-ee3937daeb62', N'5d85f890-255e-4481-b8dc-f9bbb8c2f845', 2, 0, CAST(N'2024-11-26T19:11:32.5705937' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'89d01175-d497-4761-804a-e1ba3345c8a8', N'1f711c2a-f18c-4892-91eb-b5f07a74e48d', N'55fc6d0e-50b3-4876-bf93-ee3937daeb62', N'e9c0e0f9-29ef-47b0-b9ef-745604379eae', 0, 0, CAST(N'2024-11-26T19:11:32.6330193' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'6bfdc2bc-ab55-4fbc-868b-f21591aba1fa', N'1f711c2a-f18c-4892-91eb-b5f07a74e48d', N'70be578e-af27-4056-a6ad-55990f86b3e7', N'3c4ea09c-bea3-4640-9aee-3427f947ac39', 3, 0, CAST(N'2024-11-26T21:22:03.4547806' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'6a912618-1d88-4d75-8deb-f30b1d444f32', N'1f711c2a-f18c-4892-91eb-b5f07a74e48d', N'55fc6d0e-50b3-4876-bf93-ee3937daeb62', N'0f174636-520a-453b-86b1-a39029777304', 2, 0, CAST(N'2024-11-26T19:11:32.4836170' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'41653f55-3a6f-4ee2-9c15-f47b8c1b3ab9', N'1f711c2a-f18c-4892-91eb-b5f07a74e48d', N'70be578e-af27-4056-a6ad-55990f86b3e7', N'0719fc25-a021-42be-90da-14dd85c2646c', 4, 0, CAST(N'2024-11-26T21:22:03.4150158' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'442b87ee-00fa-4f30-847c-fa478d563db8', N'1f711c2a-f18c-4892-91eb-b5f07a74e48d', N'55fc6d0e-50b3-4876-bf93-ee3937daeb62', N'0719fc25-a021-42be-90da-14dd85c2646c', 4, 0, CAST(N'2024-11-26T19:11:32.4889036' AS DateTime2), 2)
GO
INSERT [dbo].[EvaluationExplaint] ([Id], [EvaluationId], [UserId], [SupervisorId], [CategoryCriteriaId], [Note], [FileAttachments], [IsDeleted], [UpdatedAt]) VALUES (N'b9bf708c-4460-4c53-b398-123cdcd497a8', N'1f711c2a-f18c-4892-91eb-b5f07a74e48d', N'dd3c7e8b-3dc7-45d2-a2bd-282de7d5e2de', NULL, N'b4ab63da-81d4-4ea1-8a5a-3c12154fa561', N'test', N'20241126215557906', 0, CAST(N'2024-11-26T21:55:58.0679119' AS DateTime2))
INSERT [dbo].[EvaluationExplaint] ([Id], [EvaluationId], [UserId], [SupervisorId], [CategoryCriteriaId], [Note], [FileAttachments], [IsDeleted], [UpdatedAt]) VALUES (N'0a028a2c-ed16-460a-872e-641bb76db67d', N'1f711c2a-f18c-4892-91eb-b5f07a74e48d', N'32f207a2-02ba-4b83-8c71-03af11657c63', N'70be578e-af27-4056-a6ad-55990f86b3e7', N'79459d60-5db6-48b6-94bf-2121d9839e15', N'asdadasd', NULL, 0, CAST(N'2024-11-26T21:21:38.3224356' AS DateTime2))
INSERT [dbo].[EvaluationExplaint] ([Id], [EvaluationId], [UserId], [SupervisorId], [CategoryCriteriaId], [Note], [FileAttachments], [IsDeleted], [UpdatedAt]) VALUES (N'e4fce532-bfe7-4704-92d2-9e0950bbb248', N'1f711c2a-f18c-4892-91eb-b5f07a74e48d', N'dd3c7e8b-3dc7-45d2-a2bd-282de7d5e2de', NULL, N'79459d60-5db6-48b6-94bf-2121d9839e15', N'asdsadasd', NULL, 0, CAST(N'2024-11-26T21:22:36.8601081' AS DateTime2))
INSERT [dbo].[EvaluationExplaint] ([Id], [EvaluationId], [UserId], [SupervisorId], [CategoryCriteriaId], [Note], [FileAttachments], [IsDeleted], [UpdatedAt]) VALUES (N'944b0315-580d-4b35-8ae5-bb11d21d069d', N'1f711c2a-f18c-4892-91eb-b5f07a74e48d', N'dd3c7e8b-3dc7-45d2-a2bd-282de7d5e2de', NULL, N'79459d60-5db6-48b6-94bf-2121d9839e15', N'test1', N'20241126213358231', 0, CAST(N'2024-11-26T21:33:58.2665080' AS DateTime2))
INSERT [dbo].[EvaluationExplaint] ([Id], [EvaluationId], [UserId], [SupervisorId], [CategoryCriteriaId], [Note], [FileAttachments], [IsDeleted], [UpdatedAt]) VALUES (N'78f07e19-1b3d-47f2-8255-c8c94ed16727', N'1f711c2a-f18c-4892-91eb-b5f07a74e48d', N'32f207a2-02ba-4b83-8c71-03af11657c63', NULL, N'79459d60-5db6-48b6-94bf-2121d9839e15', N'asdasdsad', NULL, 0, CAST(N'2024-11-26T20:22:41.8316207' AS DateTime2))
INSERT [dbo].[EvaluationExplaint] ([Id], [EvaluationId], [UserId], [SupervisorId], [CategoryCriteriaId], [Note], [FileAttachments], [IsDeleted], [UpdatedAt]) VALUES (N'e939d17d-705e-457e-9aa9-e876dc65b498', N'1f711c2a-f18c-4892-91eb-b5f07a74e48d', N'32f207a2-02ba-4b83-8c71-03af11657c63', N'55fc6d0e-50b3-4876-bf93-ee3937daeb62', N'79459d60-5db6-48b6-94bf-2121d9839e15', N'ASASA', NULL, 0, CAST(N'2024-11-26T20:22:10.2263669' AS DateTime2))
GO
INSERT [dbo].[EvaluationSample] ([Id], [EvaluationSampleName], [IsDeleted], [UpdatedAt]) VALUES (N'9a245d3a-088b-4831-b3bf-77dc93c5ea1d', N'Mẫu 2 - Phiếu đánh giá dành cho nhóm đối tượng chung', 0, CAST(N'2024-11-23T13:09:47.0232562' AS DateTime2))
INSERT [dbo].[EvaluationSample] ([Id], [EvaluationSampleName], [IsDeleted], [UpdatedAt]) VALUES (N'b621540f-6142-42f3-8ec1-8f3cd8167a24', N'Mẫu 1 - Phiếu đánh giá dành cho HT PHT', 0, CAST(N'2024-11-23T13:09:09.4585816' AS DateTime2))
GO
INSERT [dbo].[EvaluationUser] ([Id], [EvaluationId], [UserId], [Type], [Sort], [IsDeleted], [UpdatedAt], [IsManager]) VALUES (N'a0884bf8-f5ce-4d54-9af2-0514d02323a1', N'1f711c2a-f18c-4892-91eb-b5f07a74e48d', N'2d1c4b21-92b0-4105-9151-0980a4c924ad', 1, 0, 0, CAST(N'2024-11-26T19:09:02.2665957' AS DateTime2), NULL)
INSERT [dbo].[EvaluationUser] ([Id], [EvaluationId], [UserId], [Type], [Sort], [IsDeleted], [UpdatedAt], [IsManager]) VALUES (N'af2169cb-5632-4ce7-805f-184d688b7ae9', N'1f711c2a-f18c-4892-91eb-b5f07a74e48d', N'dd3c7e8b-3dc7-45d2-a2bd-282de7d5e2de', 1, 0, 0, CAST(N'2024-11-26T19:09:02.2644046' AS DateTime2), NULL)
INSERT [dbo].[EvaluationUser] ([Id], [EvaluationId], [UserId], [Type], [Sort], [IsDeleted], [UpdatedAt], [IsManager]) VALUES (N'3fd84fba-6cc5-4421-9413-1cb2672b7203', N'1f711c2a-f18c-4892-91eb-b5f07a74e48d', N'55fc6d0e-50b3-4876-bf93-ee3937daeb62', 1, 0, 0, CAST(N'2024-11-26T19:09:02.2619084' AS DateTime2), NULL)
INSERT [dbo].[EvaluationUser] ([Id], [EvaluationId], [UserId], [Type], [Sort], [IsDeleted], [UpdatedAt], [IsManager]) VALUES (N'05b0d53e-2982-45ee-b7fb-4e8df09e6cef', N'1f711c2a-f18c-4892-91eb-b5f07a74e48d', N'55fc6d0e-50b3-4876-bf93-ee3937daeb62', 2, 1, 0, CAST(N'2024-11-26T19:09:18.7955888' AS DateTime2), 0)
INSERT [dbo].[EvaluationUser] ([Id], [EvaluationId], [UserId], [Type], [Sort], [IsDeleted], [UpdatedAt], [IsManager]) VALUES (N'2178d5f3-0d9d-407a-b400-a384c4f1488a', N'1f711c2a-f18c-4892-91eb-b5f07a74e48d', N'32f207a2-02ba-4b83-8c71-03af11657c63', 1, 0, 0, CAST(N'2024-11-26T19:09:02.1979838' AS DateTime2), NULL)
INSERT [dbo].[EvaluationUser] ([Id], [EvaluationId], [UserId], [Type], [Sort], [IsDeleted], [UpdatedAt], [IsManager]) VALUES (N'eb24c89b-651e-48d1-9ae0-e94626d75c4f', N'1f711c2a-f18c-4892-91eb-b5f07a74e48d', N'70be578e-af27-4056-a6ad-55990f86b3e7', 2, 2, 0, CAST(N'2024-11-26T19:09:28.6608977' AS DateTime2), 1)
GO
INSERT [dbo].[MenuItems] ([Id], [Key], [Name], [ParentId], [Route], [Icon], [Sort]) VALUES (N'be782bc6-5b5f-4edc-a2c4-0dc8ad2af70e', N'evaluation-statistics', N'Thống kê đánh giá', N'fa70e2f4-8d7f-479d-a12a-f91508b8c33e', N'/statistics/evaluation-statistics', N'IconBarChartFill', 1)
INSERT [dbo].[MenuItems] ([Id], [Key], [Name], [ParentId], [Route], [Icon], [Sort]) VALUES (N'b67dc630-6c6f-4dd1-88a1-1380ddf043f6', N'units', N'Quản lý đơn vị/phòng ban', N'd7d627dc-8642-4131-ac61-f629a0f69929', N'/organization-management/units', N'IconDeploymentUnit', 4)
INSERT [dbo].[MenuItems] ([Id], [Key], [Name], [ParentId], [Route], [Icon], [Sort]) VALUES (N'8d34733f-09dd-4c18-8170-16e03456d202', N'evaluation-ratings', N'Danh mục thang điểm đánh giá', N'97e2f2a0-00c8-492e-8503-adbbcb791b1f', N'/categories/evaluation-ratings', N'IconScoreboardOutline', 1)
INSERT [dbo].[MenuItems] ([Id], [Key], [Name], [ParentId], [Route], [Icon], [Sort]) VALUES (N'b519f203-6a8c-48c5-800e-2b673aadec05', N'evaluations-sample', N'Quản lý mẫu phiếu đánh giá', NULL, N'/evaluations-sample', N'IconFileDocumentMultiple', 2)
INSERT [dbo].[MenuItems] ([Id], [Key], [Name], [ParentId], [Route], [Icon], [Sort]) VALUES (N'7df44a05-ecf1-4adf-91ee-328dcbd5dd99', N'consolidation-and-transfer', N'Tổng hợp và chuyển', N'fa70e2f4-8d7f-479d-a12a-f91508b8c33e', N'/statistics/consolidation-and-transfer', N'IconBxTransfer', 2)
INSERT [dbo].[MenuItems] ([Id], [Key], [Name], [ParentId], [Route], [Icon], [Sort]) VALUES (N'f0a0148d-7e05-4873-b5bd-37e61c626887', N'evaluation-forms', N'Phiếu đánh giá', NULL, N'/evaluation-forms', NULL, 8)
INSERT [dbo].[MenuItems] ([Id], [Key], [Name], [ParentId], [Route], [Icon], [Sort]) VALUES (N'93a76a6e-3f4c-4d02-9b67-3c938a873be1', N'users', N'Quản lý người dùng', N'd7d627dc-8642-4131-ac61-f629a0f69929', N'/organization-management/users', N'IconUser', 2)
INSERT [dbo].[MenuItems] ([Id], [Key], [Name], [ParentId], [Route], [Icon], [Sort]) VALUES (N'3172d91d-37cf-46ec-9eb8-62fd2a01e691', N'user-type', N'Quản lý loại người dùng', N'd7d627dc-8642-4131-ac61-f629a0f69929', N'/organization-management/user-type', N'IconPersonRolodex', 1)
INSERT [dbo].[MenuItems] ([Id], [Key], [Name], [ParentId], [Route], [Icon], [Sort]) VALUES (N'dd8e29a6-c51e-4e9a-9b89-6c255c7f1e07', N'supervisor-evaluation', N'Giám sát viên đánh giá', N'f0a0148d-7e05-4873-b5bd-37e61c626887', N'/evaluation-forms/supervisor-evaluation', N'IconAccountSupervisorOutline', 2)
INSERT [dbo].[MenuItems] ([Id], [Key], [Name], [ParentId], [Route], [Icon], [Sort]) VALUES (N'd0a617ce-7a4a-4556-a2d0-82503dfef228', N'dashboard', N'Trang tổng quan', NULL, N'/dashboard', N'IconDashboard', 1)
INSERT [dbo].[MenuItems] ([Id], [Key], [Name], [ParentId], [Route], [Icon], [Sort]) VALUES (N'78ca07f2-0549-449a-9ca4-8a950a40b567', N'evaluation-criteria', N'Danh mục tiêu chí đánh giá', N'97e2f2a0-00c8-492e-8503-adbbcb791b1f', N'/categories/evaluation-criteria', N'IconCardChecklist', 2)
INSERT [dbo].[MenuItems] ([Id], [Key], [Name], [ParentId], [Route], [Icon], [Sort]) VALUES (N'97e2f2a0-00c8-492e-8503-adbbcb791b1f', N'categories', N'Quản lý danh mục', NULL, NULL, NULL, 6)
INSERT [dbo].[MenuItems] ([Id], [Key], [Name], [ParentId], [Route], [Icon], [Sort]) VALUES (N'9f7dd98f-381f-4cec-8448-b1f7e3ce6531', N'global-management', N'Quản lý chung', NULL, NULL, NULL, 4)
INSERT [dbo].[MenuItems] ([Id], [Key], [Name], [ParentId], [Route], [Icon], [Sort]) VALUES (N'63a5cead-6c28-4993-8c46-d86458b4d8bb', N'evaluation-periods', N'Danh mục kỳ đánh giá', N'97e2f2a0-00c8-492e-8503-adbbcb791b1f', N'/categories/evaluation-periods', N'IconClipboardTextClock', 6)
INSERT [dbo].[MenuItems] ([Id], [Key], [Name], [ParentId], [Route], [Icon], [Sort]) VALUES (N'e73b567f-c830-41d4-ac5c-e299543cf95a', N'self-evaluation', N'Tự đánh giá', N'f0a0148d-7e05-4873-b5bd-37e61c626887', N'/evaluation-forms/self-evaluation', N'IconBxUserCheck', 1)
INSERT [dbo].[MenuItems] ([Id], [Key], [Name], [ParentId], [Route], [Icon], [Sort]) VALUES (N'32cc32e8-8e12-4b5f-9089-e2c52227155d', N'evaluation-comments', N'Danh mục nhận xét đánh giá', N'97e2f2a0-00c8-492e-8503-adbbcb791b1f', N'/categories/evaluation-comments', N'IconComment', 5)
INSERT [dbo].[MenuItems] ([Id], [Key], [Name], [ParentId], [Route], [Icon], [Sort]) VALUES (N'51b36720-d531-4648-9efb-e80c5bdd04a5', N'roles', N'Quản lý vai trò', N'9f7dd98f-381f-4cec-8448-b1f7e3ce6531', N'/global-management/roles', N'IconUserShield', 1)
INSERT [dbo].[MenuItems] ([Id], [Key], [Name], [ParentId], [Route], [Icon], [Sort]) VALUES (N'f9518f77-2b01-4131-b229-f1f675f5ceca', N'evaluations', N'Quản lý phiếu đánh giá', NULL, N'/evaluations', N'IconDocument_justified', 3)
INSERT [dbo].[MenuItems] ([Id], [Key], [Name], [ParentId], [Route], [Icon], [Sort]) VALUES (N'd7d627dc-8642-4131-ac61-f629a0f69929', N'organization-management', N'Quản lý đơn vị và nhân sự', NULL, NULL, NULL, 5)
INSERT [dbo].[MenuItems] ([Id], [Key], [Name], [ParentId], [Route], [Icon], [Sort]) VALUES (N'fa70e2f4-8d7f-479d-a12a-f91508b8c33e', N'statistics', N'Thống kê', NULL, NULL, NULL, 7)
INSERT [dbo].[MenuItems] ([Id], [Key], [Name], [ParentId], [Route], [Icon], [Sort]) VALUES (N'6f9046d3-eb0e-4da1-97c1-f9509c240fd9', N'evaluation-pros-cons', N'Danh mục ưu và nhược điểm đánh giá', N'97e2f2a0-00c8-492e-8503-adbbcb791b1f', N'/categories/evaluation-pros-cons', N'IconThumbsUpDown', 4)
GO
INSERT [dbo].[RefreshToken] ([Id], [UserId], [Token], [JwtId], [IsUsed], [IsRevoked], [IssuedAt], [ExpiredAt]) VALUES (N'c2115f1f-1ba4-444b-aae0-45670016df34', N'32f207a2-02ba-4b83-8c71-03af11657c63', N'X4WmHa2W/EH3ApCamshqbFaf62+moz3M1GFyW1n9q1U=', N'a305cdd3-1cd7-4714-85b3-c7c139cd5f1f', 0, 0, CAST(N'2024-11-26T21:22:14.5563302' AS DateTime2), CAST(N'2024-12-03T21:22:14.5563303' AS DateTime2))
INSERT [dbo].[RefreshToken] ([Id], [UserId], [Token], [JwtId], [IsUsed], [IsRevoked], [IssuedAt], [ExpiredAt]) VALUES (N'7fb1fcb1-e828-4371-ae76-57b44e5c10ee', N'70be578e-af27-4056-a6ad-55990f86b3e7', N'07OAjzBjEkdnDQMVlrCUu6BX2CRMAzJb1RAElAg1mwk=', N'61b7d8ae-0582-4029-b930-292099f718a2', 0, 0, CAST(N'2024-11-26T21:21:20.8334289' AS DateTime2), CAST(N'2024-12-03T21:21:20.8334289' AS DateTime2))
INSERT [dbo].[RefreshToken] ([Id], [UserId], [Token], [JwtId], [IsUsed], [IsRevoked], [IssuedAt], [ExpiredAt]) VALUES (N'8295377e-3952-43af-93a1-6a4b1dda5bc9', N'4b986f5b-4e1d-4016-b771-14dab0c7af11', N'Gbw/TK3wtqQaNuOkteNApwxpOWvVGyg15m+c7PUrL0Y=', N'7ac67685-629f-4179-8ced-f97d9d38adec', 0, 0, CAST(N'2024-11-23T18:51:39.6830662' AS DateTime2), CAST(N'2024-11-30T18:51:39.6830662' AS DateTime2))
INSERT [dbo].[RefreshToken] ([Id], [UserId], [Token], [JwtId], [IsUsed], [IsRevoked], [IssuedAt], [ExpiredAt]) VALUES (N'1b37955d-37fc-4354-aedd-6f3cba7d78f8', N'cdb5713c-fcb9-4105-8140-033fc2ac032e', N'W+1x4dNo4WG3yjEn/dheFhv9XvGzFjYU7WLhK85Suh0=', N'011bc7c3-499e-48e4-9a13-61b85d63e80e', 0, 0, CAST(N'2024-11-23T21:52:19.4238822' AS DateTime2), CAST(N'2024-11-30T21:52:19.4238823' AS DateTime2))
INSERT [dbo].[RefreshToken] ([Id], [UserId], [Token], [JwtId], [IsUsed], [IsRevoked], [IssuedAt], [ExpiredAt]) VALUES (N'25d17cd0-d3c9-407b-beac-6f40756921b3', N'a6ba15f2-d668-4059-a1c4-5b0deda85c47', N'MsNtE7sVBF3hkgFJjzauojKa5bIlJrawKN1zX9V/YX0=', N'3abf975c-ec58-4a3e-9497-7317b6f4a992', 0, 0, CAST(N'2024-11-26T19:12:40.6553932' AS DateTime2), CAST(N'2024-12-03T19:12:40.6553932' AS DateTime2))
INSERT [dbo].[RefreshToken] ([Id], [UserId], [Token], [JwtId], [IsUsed], [IsRevoked], [IssuedAt], [ExpiredAt]) VALUES (N'4933c5da-2b12-41d6-ab1d-722788d10c60', N'0630cc13-3e54-4ba7-bdfe-f1ff42051257', N'Mom27FbqSKgAmxCRJ9dlQGeXsD362mGjVFshri7h6TA=', N'84353c0a-6645-48a7-a343-7cc6b29d52b5', 0, 0, CAST(N'2024-11-23T18:52:23.4983169' AS DateTime2), CAST(N'2024-11-30T18:52:23.4983169' AS DateTime2))
INSERT [dbo].[RefreshToken] ([Id], [UserId], [Token], [JwtId], [IsUsed], [IsRevoked], [IssuedAt], [ExpiredAt]) VALUES (N'51365e95-22ce-41d8-8566-7a166c655a15', N'c778e7e0-b970-4533-96a0-5091f4c57114', N'uZctZYb1XGUN/dSDZH735NbIAaLUxhGUXMW9DhF1rI0=', N'13a154d7-0eb3-45ac-9c92-d5b5a97ad058', 0, 0, CAST(N'2024-11-24T13:51:48.9952326' AS DateTime2), CAST(N'2024-12-01T13:51:48.9952329' AS DateTime2))
INSERT [dbo].[RefreshToken] ([Id], [UserId], [Token], [JwtId], [IsUsed], [IsRevoked], [IssuedAt], [ExpiredAt]) VALUES (N'1f68c014-f234-42c5-885f-8f0edb1393b3', N'd3f15e0a-7ac8-4f28-b93e-f8c11eee7fcf', N'kOvfkTL1isfGzw4DpIgJ37kFUZimr3Jup0BRvhQ8a9I=', N'adcbb5aa-c5b9-4373-a9b9-1aa76376e8ee', 0, 0, CAST(N'2024-11-23T21:45:19.0242775' AS DateTime2), CAST(N'2024-11-30T21:45:19.0242775' AS DateTime2))
INSERT [dbo].[RefreshToken] ([Id], [UserId], [Token], [JwtId], [IsUsed], [IsRevoked], [IssuedAt], [ExpiredAt]) VALUES (N'6ad255f7-e2fa-4c33-9031-bc0d6f478611', N'2d1c4b21-92b0-4105-9151-0980a4c924ad', N'Z04jW2bdvM+cNYdjBOn77IFtYpPQnvIK6YGybEySMVI=', N'ec74f038-bd2c-4971-b52b-5fa6192b2879', 0, 0, CAST(N'2024-11-23T18:57:19.5913677' AS DateTime2), CAST(N'2024-11-30T18:57:19.5913678' AS DateTime2))
INSERT [dbo].[RefreshToken] ([Id], [UserId], [Token], [JwtId], [IsUsed], [IsRevoked], [IssuedAt], [ExpiredAt]) VALUES (N'e4cb31ed-0f2a-45b0-8527-c9a5f31187b3', N'110aa824-4b97-4fac-972c-b66f2c478dca', N'hmzfcxTzMSZaoVUyqMYf4w/Ia1WdCGzl5cNQKU3hnRk=', N'b341cd32-7d05-4fe7-b75a-5fc7f0fc7002', 0, 0, CAST(N'2024-11-23T18:53:40.5645420' AS DateTime2), CAST(N'2024-11-30T18:53:40.5645421' AS DateTime2))
INSERT [dbo].[RefreshToken] ([Id], [UserId], [Token], [JwtId], [IsUsed], [IsRevoked], [IssuedAt], [ExpiredAt]) VALUES (N'b41e68ce-c665-4d7b-bcd6-e67b0a1d9dc4', N'dd3c7e8b-3dc7-45d2-a2bd-282de7d5e2de', N'wilQEF7vgTxYlM9BPwCx5MX77LPbjnRvF5aSEZPv+tI=', N'fa1a5a4f-6069-4402-a839-23d97de14f4a', 0, 0, CAST(N'2024-11-26T21:22:30.1805096' AS DateTime2), CAST(N'2024-12-03T21:22:30.1805098' AS DateTime2))
INSERT [dbo].[RefreshToken] ([Id], [UserId], [Token], [JwtId], [IsUsed], [IsRevoked], [IssuedAt], [ExpiredAt]) VALUES (N'41041e28-8b49-40d7-9036-f348fa15d5c2', N'ce648ca9-fee9-40e7-8aff-03869bb6b010', N'kdDeUS06tYO9IzTgAyRSl2XSRt25f1hXllFwHcdYW/c=', N'66316663-bb45-4e59-90b3-b79efc2e52a2', 0, 0, CAST(N'2024-11-23T19:01:53.2826883' AS DateTime2), CAST(N'2024-11-30T19:01:53.2826884' AS DateTime2))
INSERT [dbo].[RefreshToken] ([Id], [UserId], [Token], [JwtId], [IsUsed], [IsRevoked], [IssuedAt], [ExpiredAt]) VALUES (N'89c939f6-3a54-4201-a73c-f974739429e3', N'55fc6d0e-50b3-4876-bf93-ee3937daeb62', N'tyMltlZSkMTKUyKMlN5uTSU4npTUiF33O0wjs8bzDsw=', N'cc31c16a-8e27-48a2-8900-a5bd97cc7b32', 0, 0, CAST(N'2024-11-26T21:10:01.8582052' AS DateTime2), CAST(N'2024-12-03T21:10:01.8582456' AS DateTime2))
GO
INSERT [dbo].[RoleMenuItems] ([Id], [RoleId], [MenuItemId]) VALUES (N'5750dfc0-9985-460b-bc47-027e5a095175', N'fa00a51d-a46e-4d10-926e-5ba8ba68d432', N'63a5cead-6c28-4993-8c46-d86458b4d8bb')
INSERT [dbo].[RoleMenuItems] ([Id], [RoleId], [MenuItemId]) VALUES (N'46b74f49-1bd9-4c57-83ba-0692aa5f2ee3', N'a6204804-82cf-4f94-a3e1-07cd10a8e579', N'd7d627dc-8642-4131-ac61-f629a0f69929')
INSERT [dbo].[RoleMenuItems] ([Id], [RoleId], [MenuItemId]) VALUES (N'd11b8e70-80af-403a-87f7-0e6c64ef3799', N'fa00a51d-a46e-4d10-926e-5ba8ba68d432', N'f0a0148d-7e05-4873-b5bd-37e61c626887')
INSERT [dbo].[RoleMenuItems] ([Id], [RoleId], [MenuItemId]) VALUES (N'cdb0916b-1a50-4f93-9f2d-0f65d58728f2', N'a6204804-82cf-4f94-a3e1-07cd10a8e579', N'6f9046d3-eb0e-4da1-97c1-f9509c240fd9')
INSERT [dbo].[RoleMenuItems] ([Id], [RoleId], [MenuItemId]) VALUES (N'1df5b40d-3641-49e2-b5d9-102ce661f27b', N'bc4ce45e-b29f-4f21-8c68-9e1cff35614e', N'd0a617ce-7a4a-4556-a2d0-82503dfef228')
INSERT [dbo].[RoleMenuItems] ([Id], [RoleId], [MenuItemId]) VALUES (N'92e118c0-be0b-48af-9c82-123653800be7', N'a6204804-82cf-4f94-a3e1-07cd10a8e579', N'f0a0148d-7e05-4873-b5bd-37e61c626887')
INSERT [dbo].[RoleMenuItems] ([Id], [RoleId], [MenuItemId]) VALUES (N'6d810b2a-47b7-4e29-8c49-1fc90d8c9f4e', N'a6204804-82cf-4f94-a3e1-07cd10a8e579', N'be782bc6-5b5f-4edc-a2c4-0dc8ad2af70e')
INSERT [dbo].[RoleMenuItems] ([Id], [RoleId], [MenuItemId]) VALUES (N'66b92f99-3dec-404e-b869-2c414ecda073', N'de170fda-aa4a-4e0b-8722-0522b950f745', N'97e2f2a0-00c8-492e-8503-adbbcb791b1f')
INSERT [dbo].[RoleMenuItems] ([Id], [RoleId], [MenuItemId]) VALUES (N'82f21b70-91c9-4d69-b6e6-308450ad11bc', N'fa00a51d-a46e-4d10-926e-5ba8ba68d432', N'93a76a6e-3f4c-4d02-9b67-3c938a873be1')
INSERT [dbo].[RoleMenuItems] ([Id], [RoleId], [MenuItemId]) VALUES (N'9a153856-f618-491c-b485-30c65b9e1f1a', N'de170fda-aa4a-4e0b-8722-0522b950f745', N'f9518f77-2b01-4131-b229-f1f675f5ceca')
INSERT [dbo].[RoleMenuItems] ([Id], [RoleId], [MenuItemId]) VALUES (N'4cc8711c-cd02-456d-9ffd-3ad97f238700', N'fa00a51d-a46e-4d10-926e-5ba8ba68d432', N'7df44a05-ecf1-4adf-91ee-328dcbd5dd99')
INSERT [dbo].[RoleMenuItems] ([Id], [RoleId], [MenuItemId]) VALUES (N'a9496335-3a05-4067-9b14-3c246f596121', N'de170fda-aa4a-4e0b-8722-0522b950f745', N'6f9046d3-eb0e-4da1-97c1-f9509c240fd9')
INSERT [dbo].[RoleMenuItems] ([Id], [RoleId], [MenuItemId]) VALUES (N'22a385a7-54d0-46ac-854e-5f85792001dc', N'fa00a51d-a46e-4d10-926e-5ba8ba68d432', N'8d34733f-09dd-4c18-8170-16e03456d202')
INSERT [dbo].[RoleMenuItems] ([Id], [RoleId], [MenuItemId]) VALUES (N'4a9ad7a3-ff0a-419d-a243-5fa9e2aae79d', N'20a6ddc3-0e72-400e-80e0-dd5256182a9a', N'd0a617ce-7a4a-4556-a2d0-82503dfef228')
INSERT [dbo].[RoleMenuItems] ([Id], [RoleId], [MenuItemId]) VALUES (N'3b3ec954-ab0d-4e41-8b46-64a8b3f37796', N'fa00a51d-a46e-4d10-926e-5ba8ba68d432', N'97e2f2a0-00c8-492e-8503-adbbcb791b1f')
INSERT [dbo].[RoleMenuItems] ([Id], [RoleId], [MenuItemId]) VALUES (N'da7841f4-cafa-4043-80a2-64d7b0987a97', N'de170fda-aa4a-4e0b-8722-0522b950f745', N'd0a617ce-7a4a-4556-a2d0-82503dfef228')
INSERT [dbo].[RoleMenuItems] ([Id], [RoleId], [MenuItemId]) VALUES (N'badde6b1-4205-486b-9042-7431e23cc719', N'a6204804-82cf-4f94-a3e1-07cd10a8e579', N'7df44a05-ecf1-4adf-91ee-328dcbd5dd99')
INSERT [dbo].[RoleMenuItems] ([Id], [RoleId], [MenuItemId]) VALUES (N'ec4defcf-afc7-4bd2-9e54-756738b0d538', N'bc4ce45e-b29f-4f21-8c68-9e1cff35614e', N'e73b567f-c830-41d4-ac5c-e299543cf95a')
INSERT [dbo].[RoleMenuItems] ([Id], [RoleId], [MenuItemId]) VALUES (N'e936c215-61b2-43a3-b1a0-75e959e09c49', N'de170fda-aa4a-4e0b-8722-0522b950f745', N'8d34733f-09dd-4c18-8170-16e03456d202')
INSERT [dbo].[RoleMenuItems] ([Id], [RoleId], [MenuItemId]) VALUES (N'03693ca4-b064-461f-95fd-76881a388bc2', N'de170fda-aa4a-4e0b-8722-0522b950f745', N'dd8e29a6-c51e-4e9a-9b89-6c255c7f1e07')
INSERT [dbo].[RoleMenuItems] ([Id], [RoleId], [MenuItemId]) VALUES (N'4cc6dc08-004d-4f7d-8cec-7bbe638c4b33', N'a6204804-82cf-4f94-a3e1-07cd10a8e579', N'63a5cead-6c28-4993-8c46-d86458b4d8bb')
INSERT [dbo].[RoleMenuItems] ([Id], [RoleId], [MenuItemId]) VALUES (N'81d353f0-217b-4a4d-8cb9-7cbe9b1dae50', N'de170fda-aa4a-4e0b-8722-0522b950f745', N'32cc32e8-8e12-4b5f-9089-e2c52227155d')
INSERT [dbo].[RoleMenuItems] ([Id], [RoleId], [MenuItemId]) VALUES (N'630e3988-be22-4942-a22c-81c284906939', N'bc4ce45e-b29f-4f21-8c68-9e1cff35614e', N'dd8e29a6-c51e-4e9a-9b89-6c255c7f1e07')
INSERT [dbo].[RoleMenuItems] ([Id], [RoleId], [MenuItemId]) VALUES (N'2cf41576-a7ac-4198-a8fb-86ed97553da6', N'a6204804-82cf-4f94-a3e1-07cd10a8e579', N'32cc32e8-8e12-4b5f-9089-e2c52227155d')
INSERT [dbo].[RoleMenuItems] ([Id], [RoleId], [MenuItemId]) VALUES (N'ce73cb74-3641-4901-b830-896b71fc03e2', N'de170fda-aa4a-4e0b-8722-0522b950f745', N'78ca07f2-0549-449a-9ca4-8a950a40b567')
INSERT [dbo].[RoleMenuItems] ([Id], [RoleId], [MenuItemId]) VALUES (N'2648119a-646f-4173-9d03-8a2a985da62b', N'a6204804-82cf-4f94-a3e1-07cd10a8e579', N'fa70e2f4-8d7f-479d-a12a-f91508b8c33e')
INSERT [dbo].[RoleMenuItems] ([Id], [RoleId], [MenuItemId]) VALUES (N'e5c43999-0efe-42e5-8b6c-8b1c04353394', N'de170fda-aa4a-4e0b-8722-0522b950f745', N'3172d91d-37cf-46ec-9eb8-62fd2a01e691')
INSERT [dbo].[RoleMenuItems] ([Id], [RoleId], [MenuItemId]) VALUES (N'3fcc1142-4e42-4d23-beee-8d361010cc47', N'a6204804-82cf-4f94-a3e1-07cd10a8e579', N'8d34733f-09dd-4c18-8170-16e03456d202')
INSERT [dbo].[RoleMenuItems] ([Id], [RoleId], [MenuItemId]) VALUES (N'21238363-7f8e-4ca6-923b-8fa812712337', N'de170fda-aa4a-4e0b-8722-0522b950f745', N'63a5cead-6c28-4993-8c46-d86458b4d8bb')
INSERT [dbo].[RoleMenuItems] ([Id], [RoleId], [MenuItemId]) VALUES (N'2da6f922-af3a-48ba-8b0c-91ce13cfb223', N'a6204804-82cf-4f94-a3e1-07cd10a8e579', N'9f7dd98f-381f-4cec-8448-b1f7e3ce6531')
INSERT [dbo].[RoleMenuItems] ([Id], [RoleId], [MenuItemId]) VALUES (N'2063f038-6dda-4974-9c15-9d776359b095', N'fa00a51d-a46e-4d10-926e-5ba8ba68d432', N'fa70e2f4-8d7f-479d-a12a-f91508b8c33e')
INSERT [dbo].[RoleMenuItems] ([Id], [RoleId], [MenuItemId]) VALUES (N'b8a93947-c888-4005-bba4-a017d3ceff68', N'a6204804-82cf-4f94-a3e1-07cd10a8e579', N'f9518f77-2b01-4131-b229-f1f675f5ceca')
INSERT [dbo].[RoleMenuItems] ([Id], [RoleId], [MenuItemId]) VALUES (N'110bb42b-c86f-4496-9478-a2d206a67658', N'a6204804-82cf-4f94-a3e1-07cd10a8e579', N'3172d91d-37cf-46ec-9eb8-62fd2a01e691')
INSERT [dbo].[RoleMenuItems] ([Id], [RoleId], [MenuItemId]) VALUES (N'e19a979a-5be7-4075-a92a-a695228bab32', N'a6204804-82cf-4f94-a3e1-07cd10a8e579', N'51b36720-d531-4648-9efb-e80c5bdd04a5')
INSERT [dbo].[RoleMenuItems] ([Id], [RoleId], [MenuItemId]) VALUES (N'b6d91f67-a085-431c-ad69-a79159cfdb68', N'bc4ce45e-b29f-4f21-8c68-9e1cff35614e', N'f0a0148d-7e05-4873-b5bd-37e61c626887')
INSERT [dbo].[RoleMenuItems] ([Id], [RoleId], [MenuItemId]) VALUES (N'e6230b3e-52e8-4d13-94b1-a7c19515f971', N'fa00a51d-a46e-4d10-926e-5ba8ba68d432', N'b67dc630-6c6f-4dd1-88a1-1380ddf043f6')
INSERT [dbo].[RoleMenuItems] ([Id], [RoleId], [MenuItemId]) VALUES (N'e1f9c69d-6976-4684-bec0-ab15382c63fe', N'a6204804-82cf-4f94-a3e1-07cd10a8e579', N'b67dc630-6c6f-4dd1-88a1-1380ddf043f6')
INSERT [dbo].[RoleMenuItems] ([Id], [RoleId], [MenuItemId]) VALUES (N'7a7b7109-2e4c-4de9-94f1-b069c98bd024', N'20a6ddc3-0e72-400e-80e0-dd5256182a9a', N'e73b567f-c830-41d4-ac5c-e299543cf95a')
INSERT [dbo].[RoleMenuItems] ([Id], [RoleId], [MenuItemId]) VALUES (N'3d409a8f-15cf-4902-b6fb-b100c196f0ae', N'a6204804-82cf-4f94-a3e1-07cd10a8e579', N'b519f203-6a8c-48c5-800e-2b673aadec05')
INSERT [dbo].[RoleMenuItems] ([Id], [RoleId], [MenuItemId]) VALUES (N'e37c1ca7-93da-4b0c-a79f-c130e4dbb07a', N'fa00a51d-a46e-4d10-926e-5ba8ba68d432', N'd7d627dc-8642-4131-ac61-f629a0f69929')
INSERT [dbo].[RoleMenuItems] ([Id], [RoleId], [MenuItemId]) VALUES (N'cfd7f1d5-2356-48db-bd41-c1ae2a0a2e92', N'a6204804-82cf-4f94-a3e1-07cd10a8e579', N'd0a617ce-7a4a-4556-a2d0-82503dfef228')
INSERT [dbo].[RoleMenuItems] ([Id], [RoleId], [MenuItemId]) VALUES (N'68c3dbc8-4f62-436b-afcc-c309db66923e', N'a6204804-82cf-4f94-a3e1-07cd10a8e579', N'78ca07f2-0549-449a-9ca4-8a950a40b567')
INSERT [dbo].[RoleMenuItems] ([Id], [RoleId], [MenuItemId]) VALUES (N'15dc9d34-ec3b-47bc-abe8-ca359757faa0', N'de170fda-aa4a-4e0b-8722-0522b950f745', N'd7d627dc-8642-4131-ac61-f629a0f69929')
INSERT [dbo].[RoleMenuItems] ([Id], [RoleId], [MenuItemId]) VALUES (N'3d80f16c-c73a-46de-a252-cd37e3fa26f5', N'de170fda-aa4a-4e0b-8722-0522b950f745', N'b519f203-6a8c-48c5-800e-2b673aadec05')
INSERT [dbo].[RoleMenuItems] ([Id], [RoleId], [MenuItemId]) VALUES (N'e0e9151e-be3e-4677-a74d-db1a945a5100', N'fa00a51d-a46e-4d10-926e-5ba8ba68d432', N'd0a617ce-7a4a-4556-a2d0-82503dfef228')
INSERT [dbo].[RoleMenuItems] ([Id], [RoleId], [MenuItemId]) VALUES (N'cf4357cd-9a33-4a3c-a103-e0db3b7b0058', N'de170fda-aa4a-4e0b-8722-0522b950f745', N'f0a0148d-7e05-4873-b5bd-37e61c626887')
INSERT [dbo].[RoleMenuItems] ([Id], [RoleId], [MenuItemId]) VALUES (N'63950ab4-bdde-41b0-96a1-e67022e458b8', N'fa00a51d-a46e-4d10-926e-5ba8ba68d432', N'e73b567f-c830-41d4-ac5c-e299543cf95a')
INSERT [dbo].[RoleMenuItems] ([Id], [RoleId], [MenuItemId]) VALUES (N'9a544aa6-9bd7-4aa4-bd55-e82378579813', N'a6204804-82cf-4f94-a3e1-07cd10a8e579', N'dd8e29a6-c51e-4e9a-9b89-6c255c7f1e07')
INSERT [dbo].[RoleMenuItems] ([Id], [RoleId], [MenuItemId]) VALUES (N'4abfd3d4-0142-4797-831a-e9de8e07e53a', N'fa00a51d-a46e-4d10-926e-5ba8ba68d432', N'f9518f77-2b01-4131-b229-f1f675f5ceca')
INSERT [dbo].[RoleMenuItems] ([Id], [RoleId], [MenuItemId]) VALUES (N'49bc8fe4-8949-4b6a-b91e-ec0d43cdb668', N'fa00a51d-a46e-4d10-926e-5ba8ba68d432', N'dd8e29a6-c51e-4e9a-9b89-6c255c7f1e07')
INSERT [dbo].[RoleMenuItems] ([Id], [RoleId], [MenuItemId]) VALUES (N'0d005229-444e-45da-b9b8-f58c74a1c1ab', N'de170fda-aa4a-4e0b-8722-0522b950f745', N'b67dc630-6c6f-4dd1-88a1-1380ddf043f6')
INSERT [dbo].[RoleMenuItems] ([Id], [RoleId], [MenuItemId]) VALUES (N'ea8a1269-42fb-4461-b49c-f9e612f76b2d', N'de170fda-aa4a-4e0b-8722-0522b950f745', N'93a76a6e-3f4c-4d02-9b67-3c938a873be1')
INSERT [dbo].[RoleMenuItems] ([Id], [RoleId], [MenuItemId]) VALUES (N'3b2cfbd0-9dc0-4051-a79f-fa02e498a1ef', N'a6204804-82cf-4f94-a3e1-07cd10a8e579', N'93a76a6e-3f4c-4d02-9b67-3c938a873be1')
INSERT [dbo].[RoleMenuItems] ([Id], [RoleId], [MenuItemId]) VALUES (N'28571700-b465-4c4b-ad24-fbeb957dfb4d', N'20a6ddc3-0e72-400e-80e0-dd5256182a9a', N'f0a0148d-7e05-4873-b5bd-37e61c626887')
INSERT [dbo].[RoleMenuItems] ([Id], [RoleId], [MenuItemId]) VALUES (N'9fcbf6e7-356f-4442-b51a-fbf81dc41628', N'de170fda-aa4a-4e0b-8722-0522b950f745', N'fa70e2f4-8d7f-479d-a12a-f91508b8c33e')
INSERT [dbo].[RoleMenuItems] ([Id], [RoleId], [MenuItemId]) VALUES (N'd8223a72-4d4e-4ba4-a28f-fc9704cb0a6a', N'de170fda-aa4a-4e0b-8722-0522b950f745', N'be782bc6-5b5f-4edc-a2c4-0dc8ad2af70e')
INSERT [dbo].[RoleMenuItems] ([Id], [RoleId], [MenuItemId]) VALUES (N'dca06ed6-cc38-40a2-9f36-fd11d9ed07a5', N'fa00a51d-a46e-4d10-926e-5ba8ba68d432', N'78ca07f2-0549-449a-9ca4-8a950a40b567')
INSERT [dbo].[RoleMenuItems] ([Id], [RoleId], [MenuItemId]) VALUES (N'615aff24-d582-4831-8cae-fe37220eb41d', N'a6204804-82cf-4f94-a3e1-07cd10a8e579', N'97e2f2a0-00c8-492e-8503-adbbcb791b1f')
INSERT [dbo].[RoleMenuItems] ([Id], [RoleId], [MenuItemId]) VALUES (N'c7a90e6c-3a3c-4aa2-80ac-ffc63c5e809a', N'a6204804-82cf-4f94-a3e1-07cd10a8e579', N'e73b567f-c830-41d4-ac5c-e299543cf95a')
GO
INSERT [dbo].[Roles] ([Id], [RoleName], [UpdatedAt], [IsDeleted]) VALUES (N'de170fda-aa4a-4e0b-8722-0522b950f745', N'CHUYÊN VIÊN PGD', CAST(N'2024-11-23T13:03:16.6596231' AS DateTime2), 0)
INSERT [dbo].[Roles] ([Id], [RoleName], [UpdatedAt], [IsDeleted]) VALUES (N'a6204804-82cf-4f94-a3e1-07cd10a8e579', N'QUẢN TRỊ HỆ THỐNG', CAST(N'2024-11-23T08:48:10.5086627' AS DateTime2), 0)
INSERT [dbo].[Roles] ([Id], [RoleName], [UpdatedAt], [IsDeleted]) VALUES (N'fa00a51d-a46e-4d10-926e-5ba8ba68d432', N'QUẢN LÝ ĐƠN VỊ', CAST(N'2024-11-23T08:13:10.1223247' AS DateTime2), 0)
INSERT [dbo].[Roles] ([Id], [RoleName], [UpdatedAt], [IsDeleted]) VALUES (N'459779cb-eece-4ac0-afed-791253c18be4', N'test1234566', CAST(N'2024-10-25T14:48:26.6279582' AS DateTime2), 1)
INSERT [dbo].[Roles] ([Id], [RoleName], [UpdatedAt], [IsDeleted]) VALUES (N'10aa2a01-5d85-428e-8b4f-7d41fce70a42', N'asdsad3334412', CAST(N'2024-10-25T14:57:39.2114150' AS DateTime2), 1)
INSERT [dbo].[Roles] ([Id], [RoleName], [UpdatedAt], [IsDeleted]) VALUES (N'bc4ce45e-b29f-4f21-8c68-9e1cff35614e', N'GIÁM SÁT VIÊN', CAST(N'2024-11-22T20:46:08.0832101' AS DateTime2), 0)
INSERT [dbo].[Roles] ([Id], [RoleName], [UpdatedAt], [IsDeleted]) VALUES (N'338ef3e3-c086-4abb-bed4-a942d0d34ecd', N'1', CAST(N'2024-11-02T10:52:37.1795331' AS DateTime2), 1)
INSERT [dbo].[Roles] ([Id], [RoleName], [UpdatedAt], [IsDeleted]) VALUES (N'20a6ddc3-0e72-400e-80e0-dd5256182a9a', N'NGƯỜI ĐÁNH GIÁ', CAST(N'2024-11-12T07:57:41.2407209' AS DateTime2), 0)
GO
INSERT [dbo].[Unit] ([Id], [UnitName], [ParentId], [IsDeleted], [UpdatedAt]) VALUES (N'3878d070-67e7-48bf-9382-039bae5397dd', N'Lịch sử-Địa lý-GDCD', N'4402c619-783f-4580-83cd-86e50a47171d', 0, CAST(N'2024-10-30T17:21:09.4027969' AS DateTime2))
INSERT [dbo].[Unit] ([Id], [UnitName], [ParentId], [IsDeleted], [UpdatedAt]) VALUES (N'93684774-0d94-42c9-ac77-078b6e3d2366', N'Trường TH - THCS Lộc Thạnh', N'fe6717f3-92c1-48dd-acf6-a65dbefdb04e', 0, CAST(N'2024-10-30T17:19:32.3361431' AS DateTime2))
INSERT [dbo].[Unit] ([Id], [UnitName], [ParentId], [IsDeleted], [UpdatedAt]) VALUES (N'22b62062-301d-4709-a5dc-13b99f931f02', N'GDTC-NT', N'4402c619-783f-4580-83cd-86e50a47171d', 0, CAST(N'2024-10-30T17:21:09.4053707' AS DateTime2))
INSERT [dbo].[Unit] ([Id], [UnitName], [ParentId], [IsDeleted], [UpdatedAt]) VALUES (N'c9197ced-92ac-4399-bbc6-2926feb2436a', N'1', NULL, 1, CAST(N'2024-10-25T15:09:03.9753303' AS DateTime2))
INSERT [dbo].[Unit] ([Id], [UnitName], [ParentId], [IsDeleted], [UpdatedAt]) VALUES (N'1feb11df-bb8c-4871-b916-3225c3897d40', N'Trường TH - THCS Lộc An', N'fe6717f3-92c1-48dd-acf6-a65dbefdb04e', 0, CAST(N'2024-10-30T17:19:32.3100610' AS DateTime2))
INSERT [dbo].[Unit] ([Id], [UnitName], [ParentId], [IsDeleted], [UpdatedAt]) VALUES (N'c8e8fe3c-4e4d-4d25-a5a6-3f175fae3d5f', N'Trường TH - THCS Lộc Hòa', N'fe6717f3-92c1-48dd-acf6-a65dbefdb04e', 0, CAST(N'2024-10-30T17:19:32.3131439' AS DateTime2))
INSERT [dbo].[Unit] ([Id], [UnitName], [ParentId], [IsDeleted], [UpdatedAt]) VALUES (N'48c504d3-7b0a-4fc9-82b5-46e58b9b79fa', N'Ngữ Văn', N'4402c619-783f-4580-83cd-86e50a47171d', 0, CAST(N'2024-10-30T17:21:09.3680117' AS DateTime2))
INSERT [dbo].[Unit] ([Id], [UnitName], [ParentId], [IsDeleted], [UpdatedAt]) VALUES (N'4801aee9-d3dd-4330-ba8a-4fd180adc15e', N'Trường THCS Lộc Điền', N'fe6717f3-92c1-48dd-acf6-a65dbefdb04e', 0, CAST(N'2024-10-30T17:19:32.3576691' AS DateTime2))
INSERT [dbo].[Unit] ([Id], [UnitName], [ParentId], [IsDeleted], [UpdatedAt]) VALUES (N'f7f74c20-39c6-4f71-bc32-53606457096f', N'1', N'c9197ced-92ac-4399-bbc6-2926feb2436a', 1, CAST(N'2024-10-25T15:09:00.9541088' AS DateTime2))
INSERT [dbo].[Unit] ([Id], [UnitName], [ParentId], [IsDeleted], [UpdatedAt]) VALUES (N'078a7927-d967-4d63-9543-56d3437aa343', N'Trường Trung học cơ sở Lộc Quang', N'fe6717f3-92c1-48dd-acf6-a65dbefdb04e', 0, CAST(N'2024-10-30T17:19:32.3652585' AS DateTime2))
INSERT [dbo].[Unit] ([Id], [UnitName], [ParentId], [IsDeleted], [UpdatedAt]) VALUES (N'eddeeb9a-3d58-4996-9cf3-6033f9088f2f', N'Trường TH - THCS Lộc Khánh', N'fe6717f3-92c1-48dd-acf6-a65dbefdb04e', 0, CAST(N'2024-10-30T17:19:32.3220019' AS DateTime2))
INSERT [dbo].[Unit] ([Id], [UnitName], [ParentId], [IsDeleted], [UpdatedAt]) VALUES (N'73e09ead-208e-45f4-9045-693b6166254e', N'Trường TH -THCS Lộc Thịnh', N'fe6717f3-92c1-48dd-acf6-a65dbefdb04e', 0, CAST(N'2024-10-30T17:19:32.3397358' AS DateTime2))
INSERT [dbo].[Unit] ([Id], [UnitName], [ParentId], [IsDeleted], [UpdatedAt]) VALUES (N'664bd0e3-9aad-4100-9271-6ab89fb35d88', N'Trường TH - THCS Lộc Thành', N'fe6717f3-92c1-48dd-acf6-a65dbefdb04e', 0, CAST(N'2024-10-30T17:19:32.3333993' AS DateTime2))
INSERT [dbo].[Unit] ([Id], [UnitName], [ParentId], [IsDeleted], [UpdatedAt]) VALUES (N'd027056f-5de8-4e88-8bfa-7a01f6ffc001', N'Trường THCS Lộc Hưng', N'fe6717f3-92c1-48dd-acf6-a65dbefdb04e', 0, CAST(N'2024-10-30T17:19:32.3471420' AS DateTime2))
INSERT [dbo].[Unit] ([Id], [UnitName], [ParentId], [IsDeleted], [UpdatedAt]) VALUES (N'4402c619-783f-4580-83cd-86e50a47171d', N'Trường THCS TT Lộc Ninh', N'fe6717f3-92c1-48dd-acf6-a65dbefdb04e', 0, CAST(N'2024-10-30T17:19:32.3622132' AS DateTime2))
INSERT [dbo].[Unit] ([Id], [UnitName], [ParentId], [IsDeleted], [UpdatedAt]) VALUES (N'287806ce-3c0d-4389-8090-87ac378b909e', N'test1', N'c9197ced-92ac-4399-bbc6-2926feb2436a', 1, CAST(N'2024-10-25T15:09:00.9541107' AS DateTime2))
INSERT [dbo].[Unit] ([Id], [UnitName], [ParentId], [IsDeleted], [UpdatedAt]) VALUES (N'b2e7e7e9-c953-4c60-9dea-9935efa85b46', N'Trường THCS Lộc Hiệp', N'fe6717f3-92c1-48dd-acf6-a65dbefdb04e', 0, CAST(N'2024-10-30T17:19:32.3434816' AS DateTime2))
INSERT [dbo].[Unit] ([Id], [UnitName], [ParentId], [IsDeleted], [UpdatedAt]) VALUES (N'fe6717f3-92c1-48dd-acf6-a65dbefdb04e', N'Phòng Giáo dục và Đào tạo Huyện Lộc Ninh', N'7787a766-2655-457b-afa5-cc21e94ff712', 0, CAST(N'2024-10-30T17:19:17.1469028' AS DateTime2))
INSERT [dbo].[Unit] ([Id], [UnitName], [ParentId], [IsDeleted], [UpdatedAt]) VALUES (N'8e83fcdd-fe53-4060-8fea-a66c386d687e', N'Test', N'7787a766-2655-457b-afa5-cc21e94ff712', 1, CAST(N'2024-10-30T14:32:12.8771935' AS DateTime2))
INSERT [dbo].[Unit] ([Id], [UnitName], [ParentId], [IsDeleted], [UpdatedAt]) VALUES (N'260bcd0f-d423-4ba0-8d5f-b1935c177f32', N'Văn phòng', N'4402c619-783f-4580-83cd-86e50a47171d', 0, CAST(N'2024-10-30T17:21:09.4073712' AS DateTime2))
INSERT [dbo].[Unit] ([Id], [UnitName], [ParentId], [IsDeleted], [UpdatedAt]) VALUES (N'685ae7bc-6d3f-46ff-8ef8-b5bc25d2ddc5', N'KHTN-CN', N'4402c619-783f-4580-83cd-86e50a47171d', 0, CAST(N'2024-10-30T17:21:09.4001943' AS DateTime2))
INSERT [dbo].[Unit] ([Id], [UnitName], [ParentId], [IsDeleted], [UpdatedAt]) VALUES (N'fd66f1ab-0ea4-498b-8f48-bf47805d5d19', N'Trường PT DTNT THCS Lộc Ninh', N'fe6717f3-92c1-48dd-acf6-a65dbefdb04e', 0, CAST(N'2024-10-30T17:19:32.2932704' AS DateTime2))
INSERT [dbo].[Unit] ([Id], [UnitName], [ParentId], [IsDeleted], [UpdatedAt]) VALUES (N'0877da50-70ee-41f6-a5fe-c4d6b50591a6', N'Toán-Tin', N'4402c619-783f-4580-83cd-86e50a47171d', 0, CAST(N'2024-10-30T17:21:09.3867977' AS DateTime2))
INSERT [dbo].[Unit] ([Id], [UnitName], [ParentId], [IsDeleted], [UpdatedAt]) VALUES (N'9fc274de-cfb9-46e1-9682-c8200ef4d7ee', N'Tiếng Anh', N'4402c619-783f-4580-83cd-86e50a47171d', 0, CAST(N'2024-10-30T17:21:09.3973063' AS DateTime2))
INSERT [dbo].[Unit] ([Id], [UnitName], [ParentId], [IsDeleted], [UpdatedAt]) VALUES (N'210c8e9b-190f-431a-93f3-c85712cec031', N'Trường THCS Lộc Thái', N'fe6717f3-92c1-48dd-acf6-a65dbefdb04e', 0, CAST(N'2024-10-30T17:19:32.3509144' AS DateTime2))
INSERT [dbo].[Unit] ([Id], [UnitName], [ParentId], [IsDeleted], [UpdatedAt]) VALUES (N'7787a766-2655-457b-afa5-cc21e94ff712', N'HỆ THỐNG', NULL, 0, CAST(N'2024-10-23T03:45:03.2933333' AS DateTime2))
INSERT [dbo].[Unit] ([Id], [UnitName], [ParentId], [IsDeleted], [UpdatedAt]) VALUES (N'31f88bfa-50ad-4d96-a9a6-cf9bbfd781a7', N'test3', N'c9197ced-92ac-4399-bbc6-2926feb2436a', 1, CAST(N'2024-10-25T15:09:00.9541109' AS DateTime2))
INSERT [dbo].[Unit] ([Id], [UnitName], [ParentId], [IsDeleted], [UpdatedAt]) VALUES (N'4953b007-ded7-4c29-adfc-d7b125fe5154', N'Trường TH - THCS Lộc Thiện', N'fe6717f3-92c1-48dd-acf6-a65dbefdb04e', 0, CAST(N'2024-10-30T17:19:32.3279770' AS DateTime2))
INSERT [dbo].[Unit] ([Id], [UnitName], [ParentId], [IsDeleted], [UpdatedAt]) VALUES (N'fd34509d-430c-448b-96f7-d84a909d8e66', N'test2', N'c9197ced-92ac-4399-bbc6-2926feb2436a', 1, CAST(N'2024-10-25T15:09:00.9541110' AS DateTime2))
INSERT [dbo].[Unit] ([Id], [UnitName], [ParentId], [IsDeleted], [UpdatedAt]) VALUES (N'24ebc090-ca73-4d0f-af47-eaa7702dc5d9', N'Trường THCS Lộc Tấn', N'fe6717f3-92c1-48dd-acf6-a65dbefdb04e', 0, CAST(N'2024-10-30T17:19:32.3544237' AS DateTime2))
INSERT [dbo].[Unit] ([Id], [UnitName], [ParentId], [IsDeleted], [UpdatedAt]) VALUES (N'ecb4a88f-5067-4887-93be-eac66b58a754', N'Trường TH - THCS Lộc Thuận', N'fe6717f3-92c1-48dd-acf6-a65dbefdb04e', 0, CAST(N'2024-10-30T17:19:32.3306184' AS DateTime2))
INSERT [dbo].[Unit] ([Id], [UnitName], [ParentId], [IsDeleted], [UpdatedAt]) VALUES (N'9b04cf12-4a76-427b-b4e1-f2d3b760aa39', N'Trường TH - THCS Lộc Phú', N'fe6717f3-92c1-48dd-acf6-a65dbefdb04e', 0, CAST(N'2024-10-30T17:19:32.3250931' AS DateTime2))
GO
INSERT [dbo].[User] ([Id], [UserTypeId], [UnitId], [FullName], [Email], [Password], [Phone], [Address], [Birthday], [PositionsName], [IsActive], [IsDeleted], [UpdatedAt], [ActivationCode]) VALUES (N'cdb5713c-fcb9-4105-8140-033fc2ac032e', N'1e7a7f64-ed46-4fdc-ac67-d647b76be283', N'fe6717f3-92c1-48dd-acf6-a65dbefdb04e', N'Ngô Thị Lan', N'lan.ngo@1secmail.com', N'admin', N'0923456789', N'Test', CAST(N'2024-11-01T00:00:00.0000000' AS DateTime2), N'VCQL', 1, 0, CAST(N'2024-11-23T18:41:11.2676057' AS DateTime2), NULL)
INSERT [dbo].[User] ([Id], [UserTypeId], [UnitId], [FullName], [Email], [Password], [Phone], [Address], [Birthday], [PositionsName], [IsActive], [IsDeleted], [UpdatedAt], [ActivationCode]) VALUES (N'ce648ca9-fee9-40e7-8aff-03869bb6b010', N'1bd77fd4-32a8-4c80-ad95-e0c9373d485f', N'93684774-0d94-42c9-ac77-078b6e3d2366', N'Bùi Văn An', N'an.bui@1secmail.com', N'admin', N'0923456785', N'Test', CAST(N'2024-11-01T00:00:00.0000000' AS DateTime2), N'VCGV', 1, 0, CAST(N'2024-11-23T14:16:59.3604343' AS DateTime2), NULL)
INSERT [dbo].[User] ([Id], [UserTypeId], [UnitId], [FullName], [Email], [Password], [Phone], [Address], [Birthday], [PositionsName], [IsActive], [IsDeleted], [UpdatedAt], [ActivationCode]) VALUES (N'32f207a2-02ba-4b83-8c71-03af11657c63', N'1bd77fd4-32a8-4c80-ad95-e0c9373d485f', N'4402c619-783f-4580-83cd-86e50a47171d', N'Giáo viên 1', N'ducadmin@1secmail.com', N'admin', N'03263935411', N'Test', CAST(N'2024-11-01T00:00:00.0000000' AS DateTime2), N'VCGV', 1, 0, CAST(N'2024-11-23T21:47:29.6061437' AS DateTime2), NULL)
INSERT [dbo].[User] ([Id], [UserTypeId], [UnitId], [FullName], [Email], [Password], [Phone], [Address], [Birthday], [PositionsName], [IsActive], [IsDeleted], [UpdatedAt], [ActivationCode]) VALUES (N'2d1c4b21-92b0-4105-9151-0980a4c924ad', N'1bd77fd4-32a8-4c80-ad95-e0c9373d485f', N'4402c619-783f-4580-83cd-86e50a47171d', N'Trần Thị Mai', N'mai.tran@1secmail.com', N'admin', N'0912345674', N'Test', CAST(N'2024-11-01T00:00:00.0000000' AS DateTime2), N'VCGV', 1, 0, CAST(N'2024-11-23T14:13:45.4411348' AS DateTime2), NULL)
INSERT [dbo].[User] ([Id], [UserTypeId], [UnitId], [FullName], [Email], [Password], [Phone], [Address], [Birthday], [PositionsName], [IsActive], [IsDeleted], [UpdatedAt], [ActivationCode]) VALUES (N'4b986f5b-4e1d-4016-b771-14dab0c7af11', N'1bd77fd4-32a8-4c80-ad95-e0c9373d485f', N'93684774-0d94-42c9-ac77-078b6e3d2366', N'Nguyễn Thị Hằng', N'hang.nguyen@1secmail.com', N'admin', N'0923456784', N'Test', CAST(N'2024-11-01T00:00:00.0000000' AS DateTime2), N'VCGV', 1, 0, CAST(N'2024-11-23T14:16:31.7290731' AS DateTime2), NULL)
INSERT [dbo].[User] ([Id], [UserTypeId], [UnitId], [FullName], [Email], [Password], [Phone], [Address], [Birthday], [PositionsName], [IsActive], [IsDeleted], [UpdatedAt], [ActivationCode]) VALUES (N'dd3c7e8b-3dc7-45d2-a2bd-282de7d5e2de', N'1bd77fd4-32a8-4c80-ad95-e0c9373d485f', N'4402c619-783f-4580-83cd-86e50a47171d', N'Phạm Văn Hoàng', N'hoang.pham@1secmail.com', N'admin', N'0912345675', N'Test', CAST(N'2024-11-01T00:00:00.0000000' AS DateTime2), N'VCGV', 1, 0, CAST(N'2024-11-23T14:14:15.2111208' AS DateTime2), NULL)
INSERT [dbo].[User] ([Id], [UserTypeId], [UnitId], [FullName], [Email], [Password], [Phone], [Address], [Birthday], [PositionsName], [IsActive], [IsDeleted], [UpdatedAt], [ActivationCode]) VALUES (N'c778e7e0-b970-4533-96a0-5091f4c57114', N'0acb8f47-7f4b-4ed9-aeb8-b331f0dbf704', N'93684774-0d94-42c9-ac77-078b6e3d2366', N'Phạm Ngọc Hải', N'hai.pham@1secmail.com', N'admin', N'0923456781', N'Test', CAST(N'2024-11-01T00:00:00.0000000' AS DateTime2), N'VCQL', 1, 0, CAST(N'2024-11-23T14:15:06.2706217' AS DateTime2), NULL)
INSERT [dbo].[User] ([Id], [UserTypeId], [UnitId], [FullName], [Email], [Password], [Phone], [Address], [Birthday], [PositionsName], [IsActive], [IsDeleted], [UpdatedAt], [ActivationCode]) VALUES (N'70be578e-af27-4056-a6ad-55990f86b3e7', N'0acb8f47-7f4b-4ed9-aeb8-b331f0dbf704', N'4402c619-783f-4580-83cd-86e50a47171d', N'Nguyễn Văn Tâm', N'tam.nguyen@1secmail.com', N'admin', N'0912345671', N'AAAA', CAST(N'2024-11-01T00:00:00.0000000' AS DateTime2), N'VCQL', 1, 0, CAST(N'2024-11-23T14:11:51.0079598' AS DateTime2), NULL)
INSERT [dbo].[User] ([Id], [UserTypeId], [UnitId], [FullName], [Email], [Password], [Phone], [Address], [Birthday], [PositionsName], [IsActive], [IsDeleted], [UpdatedAt], [ActivationCode]) VALUES (N'a6ba15f2-d668-4059-a1c4-5b0deda85c47', N'25baa22a-3368-4958-96a2-fe3a3591a35d', N'7787a766-2655-457b-afa5-cc21e94ff712', N'ADMIN', N'admin@gmail.com', N'admin', N'03263935401', N'Lộc Ninh, Bình Phước', CAST(N'2002-01-20T00:00:00.0000000' AS DateTime2), N'LDHD', 1, 0, CAST(N'2024-10-31T15:01:27.4135003' AS DateTime2), NULL)
INSERT [dbo].[User] ([Id], [UserTypeId], [UnitId], [FullName], [Email], [Password], [Phone], [Address], [Birthday], [PositionsName], [IsActive], [IsDeleted], [UpdatedAt], [ActivationCode]) VALUES (N'110aa824-4b97-4fac-972c-b66f2c478dca', N'1c1dcbe5-babf-4e41-a04f-425efd75fef1', N'93684774-0d94-42c9-ac77-078b6e3d2366', N'Trần Văn Bình', N'binh.tran@1secmail.com', N'admin', N'0923456782', N'Test', CAST(N'2024-11-01T00:00:00.0000000' AS DateTime2), N'VCGV', 1, 0, CAST(N'2024-11-23T14:15:39.2317748' AS DateTime2), NULL)
INSERT [dbo].[User] ([Id], [UserTypeId], [UnitId], [FullName], [Email], [Password], [Phone], [Address], [Birthday], [PositionsName], [IsActive], [IsDeleted], [UpdatedAt], [ActivationCode]) VALUES (N'55fc6d0e-50b3-4876-bf93-ee3937daeb62', N'4bb20ca7-76b9-4137-b32a-1174b43a9765', N'4402c619-783f-4580-83cd-86e50a47171d', N'Hoàng Thị Vân', N'van.hoang@1secmail.com', N'admin', N'0912345673', N'Test', CAST(N'2024-11-01T00:00:00.0000000' AS DateTime2), N'VCGV', 1, 0, CAST(N'2024-11-23T14:13:10.6539678' AS DateTime2), NULL)
INSERT [dbo].[User] ([Id], [UserTypeId], [UnitId], [FullName], [Email], [Password], [Phone], [Address], [Birthday], [PositionsName], [IsActive], [IsDeleted], [UpdatedAt], [ActivationCode]) VALUES (N'0630cc13-3e54-4ba7-bdfe-f1ff42051257', N'4bb20ca7-76b9-4137-b32a-1174b43a9765', N'93684774-0d94-42c9-ac77-078b6e3d2366', N'Lý Văn Sơn', N'son.ly@1secmail.com', N'admin', N'0923456783', N'Test', CAST(N'2024-11-01T00:00:00.0000000' AS DateTime2), N'VCGV', 1, 0, CAST(N'2024-11-23T14:16:10.2832950' AS DateTime2), NULL)
INSERT [dbo].[User] ([Id], [UserTypeId], [UnitId], [FullName], [Email], [Password], [Phone], [Address], [Birthday], [PositionsName], [IsActive], [IsDeleted], [UpdatedAt], [ActivationCode]) VALUES (N'd3f15e0a-7ac8-4f28-b93e-f8c11eee7fcf', N'1c1dcbe5-babf-4e41-a04f-425efd75fef1', N'4402c619-783f-4580-83cd-86e50a47171d', N'Lê Thị Hòa', N'hoa.le@1secmail.com', N'admin', N'0912345672', N'Test', CAST(N'2024-11-01T00:00:00.0000000' AS DateTime2), N'VCGV', 1, 0, CAST(N'2024-11-23T14:12:42.3749238' AS DateTime2), NULL)
GO
INSERT [dbo].[UserRoles] ([Id], [RoleId], [UserId]) VALUES (N'55332c61-a610-4231-8708-06483d089c01', N'fa00a51d-a46e-4d10-926e-5ba8ba68d432', N'70be578e-af27-4056-a6ad-55990f86b3e7')
INSERT [dbo].[UserRoles] ([Id], [RoleId], [UserId]) VALUES (N'c9fa5b66-9d8d-42a6-b5e2-22d0d6ce1685', N'20a6ddc3-0e72-400e-80e0-dd5256182a9a', N'110aa824-4b97-4fac-972c-b66f2c478dca')
INSERT [dbo].[UserRoles] ([Id], [RoleId], [UserId]) VALUES (N'282eaa95-77a1-4ed2-85fa-2da08575e218', N'20a6ddc3-0e72-400e-80e0-dd5256182a9a', N'4b986f5b-4e1d-4016-b771-14dab0c7af11')
INSERT [dbo].[UserRoles] ([Id], [RoleId], [UserId]) VALUES (N'196e39dc-f75b-4af1-922e-4c7904180ed4', N'a6204804-82cf-4f94-a3e1-07cd10a8e579', N'a6ba15f2-d668-4059-a1c4-5b0deda85c47')
INSERT [dbo].[UserRoles] ([Id], [RoleId], [UserId]) VALUES (N'138b68a6-1395-41cc-9404-4d50d481a17e', N'de170fda-aa4a-4e0b-8722-0522b950f745', N'cdb5713c-fcb9-4105-8140-033fc2ac032e')
INSERT [dbo].[UserRoles] ([Id], [RoleId], [UserId]) VALUES (N'aecd39fd-9b51-44a0-81b0-5f0f875bebeb', N'bc4ce45e-b29f-4f21-8c68-9e1cff35614e', N'55fc6d0e-50b3-4876-bf93-ee3937daeb62')
INSERT [dbo].[UserRoles] ([Id], [RoleId], [UserId]) VALUES (N'20dae1e7-17ba-4beb-8080-69c07f7f5e1b', N'bc4ce45e-b29f-4f21-8c68-9e1cff35614e', N'0630cc13-3e54-4ba7-bdfe-f1ff42051257')
INSERT [dbo].[UserRoles] ([Id], [RoleId], [UserId]) VALUES (N'de17bd67-89e0-4838-977b-8f2d2ef65aec', N'20a6ddc3-0e72-400e-80e0-dd5256182a9a', N'dd3c7e8b-3dc7-45d2-a2bd-282de7d5e2de')
INSERT [dbo].[UserRoles] ([Id], [RoleId], [UserId]) VALUES (N'1bc94da0-e27c-45f8-8da8-9ce463400f9b', N'fa00a51d-a46e-4d10-926e-5ba8ba68d432', N'c778e7e0-b970-4533-96a0-5091f4c57114')
INSERT [dbo].[UserRoles] ([Id], [RoleId], [UserId]) VALUES (N'329c8fc3-4dd8-489c-afda-cb09a0d5f714', N'20a6ddc3-0e72-400e-80e0-dd5256182a9a', N'ce648ca9-fee9-40e7-8aff-03869bb6b010')
INSERT [dbo].[UserRoles] ([Id], [RoleId], [UserId]) VALUES (N'157aa70b-0510-49e7-b2a9-e2e1bf096873', N'20a6ddc3-0e72-400e-80e0-dd5256182a9a', N'32f207a2-02ba-4b83-8c71-03af11657c63')
INSERT [dbo].[UserRoles] ([Id], [RoleId], [UserId]) VALUES (N'b29e6180-7c9a-428f-97f4-fbb0e6d9300d', N'20a6ddc3-0e72-400e-80e0-dd5256182a9a', N'd3f15e0a-7ac8-4f28-b93e-f8c11eee7fcf')
INSERT [dbo].[UserRoles] ([Id], [RoleId], [UserId]) VALUES (N'bb0a717f-f0a2-4520-8cba-fd5451cd5f2a', N'20a6ddc3-0e72-400e-80e0-dd5256182a9a', N'2d1c4b21-92b0-4105-9151-0980a4c924ad')
GO
INSERT [dbo].[UserType] ([Id], [UserTypeName], [UpdatedAt], [IsDeleted]) VALUES (N'3cff44e1-32d2-49d7-ae22-01e2ce616c56', N'TEST1S', CAST(N'2024-10-31T10:54:47.9610611' AS DateTime2), 1)
INSERT [dbo].[UserType] ([Id], [UserTypeName], [UpdatedAt], [IsDeleted]) VALUES (N'4bb20ca7-76b9-4137-b32a-1174b43a9765', N'TRƯỞNG BỘ MÔN', CAST(N'2024-10-31T13:07:06.9601907' AS DateTime2), 0)
INSERT [dbo].[UserType] ([Id], [UserTypeName], [UpdatedAt], [IsDeleted]) VALUES (N'db1bc179-7f4c-4eb3-9e9b-24c67f6421f4', N'TEST23S', CAST(N'2024-10-31T10:54:42.9018584' AS DateTime2), 1)
INSERT [dbo].[UserType] ([Id], [UserTypeName], [UpdatedAt], [IsDeleted]) VALUES (N'1c1dcbe5-babf-4e41-a04f-425efd75fef1', N'PHÓ HIỆU TRƯỞNG', CAST(N'2024-10-31T13:05:29.3369892' AS DateTime2), 0)
INSERT [dbo].[UserType] ([Id], [UserTypeName], [UpdatedAt], [IsDeleted]) VALUES (N'c76b48e9-d169-46bc-bc1e-62276cb19010', N'ASDASDASs', CAST(N'2024-10-31T10:54:09.6878590' AS DateTime2), 1)
INSERT [dbo].[UserType] ([Id], [UserTypeName], [UpdatedAt], [IsDeleted]) VALUES (N'0acb8f47-7f4b-4ed9-aeb8-b331f0dbf704', N'HIỆU TRƯỞNG', CAST(N'2024-10-31T13:05:17.7327675' AS DateTime2), 0)
INSERT [dbo].[UserType] ([Id], [UserTypeName], [UpdatedAt], [IsDeleted]) VALUES (N'1e7a7f64-ed46-4fdc-ac67-d647b76be283', N'CHUYÊN VIÊN PGD', CAST(N'2024-11-22T18:28:11.5578326' AS DateTime2), 0)
INSERT [dbo].[UserType] ([Id], [UserTypeName], [UpdatedAt], [IsDeleted]) VALUES (N'1bd77fd4-32a8-4c80-ad95-e0c9373d485f', N'GIÁO VIÊN', CAST(N'2024-10-31T13:05:12.2426359' AS DateTime2), 0)
INSERT [dbo].[UserType] ([Id], [UserTypeName], [UpdatedAt], [IsDeleted]) VALUES (N'25baa22a-3368-4958-96a2-fe3a3591a35d', N'ADMIN', CAST(N'2024-10-31T13:06:26.3168615' AS DateTime2), 0)
GO
ALTER TABLE [dbo].[EvaluationCriteria] ADD  DEFAULT ((0)) FOR [Sort]
GO
ALTER TABLE [dbo].[EvaluationDetailsPersonal] ADD  DEFAULT ((0)) FOR [Status]
GO
ALTER TABLE [dbo].[EvaluationDetailsSupervisor] ADD  DEFAULT ((0)) FOR [Status]
GO
ALTER TABLE [dbo].[Roles] ADD  CONSTRAINT [DF_Roles_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[CategoryCriteria]  WITH CHECK ADD  CONSTRAINT [FK_CategoryCriteria_CategoryRating_CategoryRatingId] FOREIGN KEY([CategoryRatingId])
REFERENCES [dbo].[CategoryRating] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CategoryCriteria] CHECK CONSTRAINT [FK_CategoryCriteria_CategoryRating_CategoryRatingId]
GO
ALTER TABLE [dbo].[CategoryCriteria]  WITH CHECK ADD  CONSTRAINT [FK_CategoryCriteria_Unit_UnitId] FOREIGN KEY([UnitId])
REFERENCES [dbo].[Unit] ([Id])
GO
ALTER TABLE [dbo].[CategoryCriteria] CHECK CONSTRAINT [FK_CategoryCriteria_Unit_UnitId]
GO
ALTER TABLE [dbo].[CategoryRating]  WITH CHECK ADD  CONSTRAINT [FK_CategoryRating_Unit_UnitId] FOREIGN KEY([UnitId])
REFERENCES [dbo].[Unit] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CategoryRating] CHECK CONSTRAINT [FK_CategoryRating_Unit_UnitId]
GO
ALTER TABLE [dbo].[CategoryTimeType]  WITH CHECK ADD  CONSTRAINT [FK_CategoryTimeType_Unit_UnitId] FOREIGN KEY([UnitId])
REFERENCES [dbo].[Unit] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CategoryTimeType] CHECK CONSTRAINT [FK_CategoryTimeType_Unit_UnitId]
GO
ALTER TABLE [dbo].[ElectronicSignature]  WITH CHECK ADD  CONSTRAINT [FK_ElectronicSignature_User_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ElectronicSignature] CHECK CONSTRAINT [FK_ElectronicSignature_User_UserId]
GO
ALTER TABLE [dbo].[Evaluation]  WITH CHECK ADD  CONSTRAINT [FK_Evaluation_CategoryTimeType_CategoryTimeTypeId] FOREIGN KEY([CategoryTimeTypeId])
REFERENCES [dbo].[CategoryTimeType] ([Id])
GO
ALTER TABLE [dbo].[Evaluation] CHECK CONSTRAINT [FK_Evaluation_CategoryTimeType_CategoryTimeTypeId]
GO
ALTER TABLE [dbo].[Evaluation]  WITH CHECK ADD  CONSTRAINT [FK_Evaluation_Unit_UnitId] FOREIGN KEY([UnitId])
REFERENCES [dbo].[Unit] ([Id])
GO
ALTER TABLE [dbo].[Evaluation] CHECK CONSTRAINT [FK_Evaluation_Unit_UnitId]
GO
ALTER TABLE [dbo].[EvaluationAAE]  WITH CHECK ADD  CONSTRAINT [FK_EvaluationAAE_Evaluation_EvaluationId] FOREIGN KEY([EvaluationId])
REFERENCES [dbo].[Evaluation] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[EvaluationAAE] CHECK CONSTRAINT [FK_EvaluationAAE_Evaluation_EvaluationId]
GO
ALTER TABLE [dbo].[EvaluationAAE]  WITH CHECK ADD  CONSTRAINT [FK_EvaluationAAE_User_SupervisorId] FOREIGN KEY([SupervisorId])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[EvaluationAAE] CHECK CONSTRAINT [FK_EvaluationAAE_User_SupervisorId]
GO
ALTER TABLE [dbo].[EvaluationAAE]  WITH CHECK ADD  CONSTRAINT [FK_EvaluationAAE_User_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[EvaluationAAE] CHECK CONSTRAINT [FK_EvaluationAAE_User_UserId]
GO
ALTER TABLE [dbo].[EvaluationConsolidationAndTransfer]  WITH CHECK ADD  CONSTRAINT [FK_EvaluationConsolidationAndTransfer_Unit_UnitId] FOREIGN KEY([UnitId])
REFERENCES [dbo].[Unit] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[EvaluationConsolidationAndTransfer] CHECK CONSTRAINT [FK_EvaluationConsolidationAndTransfer_Unit_UnitId]
GO
ALTER TABLE [dbo].[EvaluationConsolidationAndTransfer]  WITH CHECK ADD  CONSTRAINT [FK_EvaluationConsolidationAndTransfer_User_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[EvaluationConsolidationAndTransfer] CHECK CONSTRAINT [FK_EvaluationConsolidationAndTransfer_User_UserId]
GO
ALTER TABLE [dbo].[EvaluationConsolidationAndTransferDetails]  WITH CHECK ADD  CONSTRAINT [FK_EvaluationConsolidationAndTransferDetails_Evaluation_EvaluationId] FOREIGN KEY([EvaluationId])
REFERENCES [dbo].[Evaluation] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[EvaluationConsolidationAndTransferDetails] CHECK CONSTRAINT [FK_EvaluationConsolidationAndTransferDetails_Evaluation_EvaluationId]
GO
ALTER TABLE [dbo].[EvaluationConsolidationAndTransferDetails]  WITH CHECK ADD  CONSTRAINT [FK_EvaluationConsolidationAndTransferDetails_EvaluationConsolidationAndTransfer_EvaluationConsolidationAndTransferId] FOREIGN KEY([EvaluationConsolidationAndTransferId])
REFERENCES [dbo].[EvaluationConsolidationAndTransfer] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[EvaluationConsolidationAndTransferDetails] CHECK CONSTRAINT [FK_EvaluationConsolidationAndTransferDetails_EvaluationConsolidationAndTransfer_EvaluationConsolidationAndTransferId]
GO
ALTER TABLE [dbo].[EvaluationCriteria]  WITH CHECK ADD  CONSTRAINT [FK_EvaluationCriteria_CategoryCriteria_CategoryCriteriaId] FOREIGN KEY([CategoryCriteriaId])
REFERENCES [dbo].[CategoryCriteria] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[EvaluationCriteria] CHECK CONSTRAINT [FK_EvaluationCriteria_CategoryCriteria_CategoryCriteriaId]
GO
ALTER TABLE [dbo].[EvaluationCriteria]  WITH CHECK ADD  CONSTRAINT [FK_EvaluationCriteria_Evaluation_EvaluationId] FOREIGN KEY([EvaluationId])
REFERENCES [dbo].[Evaluation] ([Id])
GO
ALTER TABLE [dbo].[EvaluationCriteria] CHECK CONSTRAINT [FK_EvaluationCriteria_Evaluation_EvaluationId]
GO
ALTER TABLE [dbo].[EvaluationCriteriaSample]  WITH CHECK ADD  CONSTRAINT [FK_EvaluationCriteriaSample_CategoryCriteria_CategoryCriteriaId] FOREIGN KEY([CategoryCriteriaId])
REFERENCES [dbo].[CategoryCriteria] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[EvaluationCriteriaSample] CHECK CONSTRAINT [FK_EvaluationCriteriaSample_CategoryCriteria_CategoryCriteriaId]
GO
ALTER TABLE [dbo].[EvaluationCriteriaSample]  WITH CHECK ADD  CONSTRAINT [FK_EvaluationCriteriaSample_EvaluationSample_EvaluationSampleId] FOREIGN KEY([EvaluationSampleId])
REFERENCES [dbo].[EvaluationSample] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[EvaluationCriteriaSample] CHECK CONSTRAINT [FK_EvaluationCriteriaSample_EvaluationSample_EvaluationSampleId]
GO
ALTER TABLE [dbo].[EvaluationDetailsPersonal]  WITH CHECK ADD  CONSTRAINT [FK_EvaluationDetailsPersonal_Evaluation_EvaluationId] FOREIGN KEY([EvaluationId])
REFERENCES [dbo].[Evaluation] ([Id])
GO
ALTER TABLE [dbo].[EvaluationDetailsPersonal] CHECK CONSTRAINT [FK_EvaluationDetailsPersonal_Evaluation_EvaluationId]
GO
ALTER TABLE [dbo].[EvaluationDetailsPersonal]  WITH CHECK ADD  CONSTRAINT [FK_EvaluationDetailsPersonal_EvaluationCriteria_EvaluationCriteriaId] FOREIGN KEY([EvaluationCriteriaId])
REFERENCES [dbo].[EvaluationCriteria] ([Id])
GO
ALTER TABLE [dbo].[EvaluationDetailsPersonal] CHECK CONSTRAINT [FK_EvaluationDetailsPersonal_EvaluationCriteria_EvaluationCriteriaId]
GO
ALTER TABLE [dbo].[EvaluationDetailsPersonal]  WITH CHECK ADD  CONSTRAINT [FK_EvaluationDetailsPersonal_User_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[EvaluationDetailsPersonal] CHECK CONSTRAINT [FK_EvaluationDetailsPersonal_User_UserId]
GO
ALTER TABLE [dbo].[EvaluationDetailsSupervisor]  WITH CHECK ADD  CONSTRAINT [FK_EvaluationDetailsSupervisor_Evaluation_EvaluationId] FOREIGN KEY([EvaluationId])
REFERENCES [dbo].[Evaluation] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[EvaluationDetailsSupervisor] CHECK CONSTRAINT [FK_EvaluationDetailsSupervisor_Evaluation_EvaluationId]
GO
ALTER TABLE [dbo].[EvaluationDetailsSupervisor]  WITH CHECK ADD  CONSTRAINT [FK_EvaluationDetailsSupervisor_EvaluationDetailsPersonal_EvaluationDetailsPersonalId] FOREIGN KEY([EvaluationDetailsPersonalId])
REFERENCES [dbo].[EvaluationDetailsPersonal] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[EvaluationDetailsSupervisor] CHECK CONSTRAINT [FK_EvaluationDetailsSupervisor_EvaluationDetailsPersonal_EvaluationDetailsPersonalId]
GO
ALTER TABLE [dbo].[EvaluationDetailsSupervisor]  WITH CHECK ADD  CONSTRAINT [FK_EvaluationDetailsSupervisor_User_UserSupervisorId] FOREIGN KEY([UserSupervisorId])
REFERENCES [dbo].[User] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[EvaluationDetailsSupervisor] CHECK CONSTRAINT [FK_EvaluationDetailsSupervisor_User_UserSupervisorId]
GO
ALTER TABLE [dbo].[EvaluationExplaint]  WITH CHECK ADD  CONSTRAINT [FK_EvaluationExplaint_CategoryCriteria_CategoryCriteriaId] FOREIGN KEY([CategoryCriteriaId])
REFERENCES [dbo].[CategoryCriteria] ([Id])
GO
ALTER TABLE [dbo].[EvaluationExplaint] CHECK CONSTRAINT [FK_EvaluationExplaint_CategoryCriteria_CategoryCriteriaId]
GO
ALTER TABLE [dbo].[EvaluationExplaint]  WITH CHECK ADD  CONSTRAINT [FK_EvaluationExplaint_Evaluation_EvaluationId] FOREIGN KEY([EvaluationId])
REFERENCES [dbo].[Evaluation] ([Id])
GO
ALTER TABLE [dbo].[EvaluationExplaint] CHECK CONSTRAINT [FK_EvaluationExplaint_Evaluation_EvaluationId]
GO
ALTER TABLE [dbo].[EvaluationExplaint]  WITH CHECK ADD  CONSTRAINT [FK_EvaluationExplaint_User_SupervisorId] FOREIGN KEY([SupervisorId])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[EvaluationExplaint] CHECK CONSTRAINT [FK_EvaluationExplaint_User_SupervisorId]
GO
ALTER TABLE [dbo].[EvaluationExplaint]  WITH CHECK ADD  CONSTRAINT [FK_EvaluationExplaint_User_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[EvaluationExplaint] CHECK CONSTRAINT [FK_EvaluationExplaint_User_UserId]
GO
ALTER TABLE [dbo].[EvaluationUser]  WITH CHECK ADD  CONSTRAINT [FK_EvaluationUser_Evaluation_EvaluationId] FOREIGN KEY([EvaluationId])
REFERENCES [dbo].[Evaluation] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[EvaluationUser] CHECK CONSTRAINT [FK_EvaluationUser_Evaluation_EvaluationId]
GO
ALTER TABLE [dbo].[EvaluationUser]  WITH CHECK ADD  CONSTRAINT [FK_EvaluationUser_User_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[EvaluationUser] CHECK CONSTRAINT [FK_EvaluationUser_User_UserId]
GO
ALTER TABLE [dbo].[RefreshToken]  WITH CHECK ADD  CONSTRAINT [FK_RefreshToken_User_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[RefreshToken] CHECK CONSTRAINT [FK_RefreshToken_User_UserId]
GO
ALTER TABLE [dbo].[RoleMenuItems]  WITH CHECK ADD  CONSTRAINT [FK_RoleMenuItems_MenuItems_MenuItemId] FOREIGN KEY([MenuItemId])
REFERENCES [dbo].[MenuItems] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[RoleMenuItems] CHECK CONSTRAINT [FK_RoleMenuItems_MenuItems_MenuItemId]
GO
ALTER TABLE [dbo].[RoleMenuItems]  WITH CHECK ADD  CONSTRAINT [FK_RoleMenuItems_Roles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Roles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[RoleMenuItems] CHECK CONSTRAINT [FK_RoleMenuItems_Roles_RoleId]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_Unit_UnitId] FOREIGN KEY([UnitId])
REFERENCES [dbo].[Unit] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_Unit_UnitId]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_UserType] FOREIGN KEY([UserTypeId])
REFERENCES [dbo].[UserType] ([Id])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_UserType]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_UserType_UserTypeId] FOREIGN KEY([UserTypeId])
REFERENCES [dbo].[UserType] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_UserType_UserTypeId]
GO
ALTER TABLE [dbo].[UserRoles]  WITH CHECK ADD  CONSTRAINT [FK_UserRoles_Roles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Roles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UserRoles] CHECK CONSTRAINT [FK_UserRoles_Roles_RoleId]
GO
ALTER TABLE [dbo].[UserRoles]  WITH CHECK ADD  CONSTRAINT [FK_UserRoles_User_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UserRoles] CHECK CONSTRAINT [FK_UserRoles_User_UserId]
GO
