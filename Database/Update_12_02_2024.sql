USE [SA_Demo_1]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 12/2/2024 6:38:01 PM ******/
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
/****** Object:  Table [dbo].[CategoryComment]    Script Date: 12/2/2024 6:38:01 PM ******/
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
/****** Object:  Table [dbo].[CategoryCriteria]    Script Date: 12/2/2024 6:38:01 PM ******/
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
/****** Object:  Table [dbo].[CategoryProsCons]    Script Date: 12/2/2024 6:38:01 PM ******/
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
/****** Object:  Table [dbo].[CategoryRating]    Script Date: 12/2/2024 6:38:01 PM ******/
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
/****** Object:  Table [dbo].[CategoryTimeType]    Script Date: 12/2/2024 6:38:01 PM ******/
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
/****** Object:  Table [dbo].[ElectronicSignature]    Script Date: 12/2/2024 6:38:01 PM ******/
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
/****** Object:  Table [dbo].[Evaluation]    Script Date: 12/2/2024 6:38:01 PM ******/
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
/****** Object:  Table [dbo].[EvaluationAAE]    Script Date: 12/2/2024 6:38:01 PM ******/
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
/****** Object:  Table [dbo].[EvaluationConsolidationAndTransfer]    Script Date: 12/2/2024 6:38:01 PM ******/
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
/****** Object:  Table [dbo].[EvaluationConsolidationAndTransferDetails]    Script Date: 12/2/2024 6:38:01 PM ******/
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
/****** Object:  Table [dbo].[EvaluationCriteria]    Script Date: 12/2/2024 6:38:01 PM ******/
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
/****** Object:  Table [dbo].[EvaluationCriteriaSample]    Script Date: 12/2/2024 6:38:01 PM ******/
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
/****** Object:  Table [dbo].[EvaluationDetailsPersonal]    Script Date: 12/2/2024 6:38:01 PM ******/
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
/****** Object:  Table [dbo].[EvaluationDetailsSupervisor]    Script Date: 12/2/2024 6:38:01 PM ******/
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
/****** Object:  Table [dbo].[EvaluationExplaint]    Script Date: 12/2/2024 6:38:01 PM ******/
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
/****** Object:  Table [dbo].[EvaluationSample]    Script Date: 12/2/2024 6:38:01 PM ******/
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
/****** Object:  Table [dbo].[EvaluationUser]    Script Date: 12/2/2024 6:38:01 PM ******/
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
/****** Object:  Table [dbo].[MenuItems]    Script Date: 12/2/2024 6:38:01 PM ******/
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
/****** Object:  Table [dbo].[RefreshToken]    Script Date: 12/2/2024 6:38:01 PM ******/
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
/****** Object:  Table [dbo].[RoleMenuItems]    Script Date: 12/2/2024 6:38:01 PM ******/
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
/****** Object:  Table [dbo].[Roles]    Script Date: 12/2/2024 6:38:01 PM ******/
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
/****** Object:  Table [dbo].[Unit]    Script Date: 12/2/2024 6:38:01 PM ******/
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
/****** Object:  Table [dbo].[User]    Script Date: 12/2/2024 6:38:01 PM ******/
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
/****** Object:  Table [dbo].[UserRoles]    Script Date: 12/2/2024 6:38:01 PM ******/
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
/****** Object:  Table [dbo].[UserType]    Script Date: 12/2/2024 6:38:01 PM ******/
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
INSERT [dbo].[CategoryCriteria] ([Id], [ParentId], [CategoryRatingId], [UnitId], [CriteriaName], [IsDistinct], [IsDeleted], [UpdatedAt]) VALUES (N'6add1deb-8016-448e-a5cb-207937e45c1b', N'204a1bdb-ddc7-4832-a266-7feb0dd0df1b', N'dcbd5ccb-31d8-4cd6-8b79-cbe359f071f2', N'fe6717f3-92c1-48dd-acf6-a65dbefdb04e', N'adsad', 0, 1, CAST(N'2024-11-30T21:36:37.8736984' AS DateTime2))
INSERT [dbo].[CategoryCriteria] ([Id], [ParentId], [CategoryRatingId], [UnitId], [CriteriaName], [IsDistinct], [IsDeleted], [UpdatedAt]) VALUES (N'79459d60-5db6-48b6-94bf-2121d9839e15', N'8b678550-a782-4ed9-a61f-15887cf5a73e', N'81788585-ac18-4dec-b0c6-8b0bc946eccf', N'4402c619-783f-4580-83cd-86e50a47171d', N'Đặt lợi ích của Đảng, quốc gia - dân tộc, nhân dân, tập thể lên trên lợi ích cá nhân.', 0, 0, CAST(N'2024-11-23T08:37:03.6785450' AS DateTime2))
INSERT [dbo].[CategoryCriteria] ([Id], [ParentId], [CategoryRatingId], [UnitId], [CriteriaName], [IsDistinct], [IsDeleted], [UpdatedAt]) VALUES (N'cdaf282b-23f7-42a5-b099-22cd38a5c8b1', N'1834d96f-f389-45f2-9006-f9d57b1ecf53', N'dcbd5ccb-31d8-4cd6-8b79-cbe359f071f2', N'fe6717f3-92c1-48dd-acf6-a65dbefdb04e', N'Khả năng thích nghi và sáng tạo trong công việc.', 0, 0, CAST(N'2024-11-23T13:19:22.2704299' AS DateTime2))
INSERT [dbo].[CategoryCriteria] ([Id], [ParentId], [CategoryRatingId], [UnitId], [CriteriaName], [IsDistinct], [IsDeleted], [UpdatedAt]) VALUES (N'c733b044-2ace-43ea-be34-251b9af672cf', N'e9cfa38c-e121-46ce-aaf5-b454a6b9f128', N'f316dfc3-3594-4a09-9fd9-03bf49cf5e98', N'fe6717f3-92c1-48dd-acf6-a65dbefdb04e', N'Đánh giá việc triển khai các giải pháp nâng cao chất lượng giáo dục.', 0, 0, CAST(N'2024-11-23T13:17:04.1526418' AS DateTime2))
INSERT [dbo].[CategoryCriteria] ([Id], [ParentId], [CategoryRatingId], [UnitId], [CriteriaName], [IsDistinct], [IsDeleted], [UpdatedAt]) VALUES (N'4451add8-b5d1-483a-9fe8-254611d89e32', N'8005ad2a-4d92-4101-9719-8e8364e57996', NULL, N'fe6717f3-92c1-48dd-acf6-a65dbefdb04e', N'Khả năng ra quyết định', 0, 0, CAST(N'2024-11-23T13:16:10.7560623' AS DateTime2))
INSERT [dbo].[CategoryCriteria] ([Id], [ParentId], [CategoryRatingId], [UnitId], [CriteriaName], [IsDistinct], [IsDeleted], [UpdatedAt]) VALUES (N'999d3424-6bad-4d7b-8bd0-2b462b55dd45', N'8b678550-a782-4ed9-a61f-15887cf5a73e', N'81788585-ac18-4dec-b0c6-8b0bc946eccf', N'4402c619-783f-4580-83cd-86e50a47171d', N'Có ý thức nghiên cứu, học tập, vận dụng chủ nghĩa Mác - Lênin, tư tưởng Hồ Chí Minh, nghị quyết, chỉ thị, quyết định và các văn bản của Đảng.', 0, 0, CAST(N'2024-11-23T08:37:09.0195122' AS DateTime2))
INSERT [dbo].[CategoryCriteria] ([Id], [ParentId], [CategoryRatingId], [UnitId], [CriteriaName], [IsDistinct], [IsDeleted], [UpdatedAt]) VALUES (N'b4ab63da-81d4-4ea1-8a5a-3c12154fa561', N'8b678550-a782-4ed9-a61f-15887cf5a73e', N'81788585-ac18-4dec-b0c6-8b0bc946eccf', N'4402c619-783f-4580-83cd-86e50a47171d', N'Chấp hành chủ trương, đường lối, quy định của Đảng, chính sách, pháp luật của Nhà nước và các nguyên tắc tổ chức, kỷ luật của Đảng, nhất là nguyên tắc tập trung dân chủ, tự phê bình và phê bình.', 0, 0, CAST(N'2024-11-23T08:36:56.1468656' AS DateTime2))
INSERT [dbo].[CategoryCriteria] ([Id], [ParentId], [CategoryRatingId], [UnitId], [CriteriaName], [IsDistinct], [IsDeleted], [UpdatedAt]) VALUES (N'79638d81-2136-4e42-a30b-49c1aaf89785', N'8005ad2a-4d92-4101-9719-8e8364e57996', NULL, N'fe6717f3-92c1-48dd-acf6-a65dbefdb04e', N'123', 0, 1, CAST(N'2024-11-30T21:44:24.4588811' AS DateTime2))
INSERT [dbo].[CategoryCriteria] ([Id], [ParentId], [CategoryRatingId], [UnitId], [CriteriaName], [IsDistinct], [IsDeleted], [UpdatedAt]) VALUES (N'96e17990-403d-4765-b1d5-50e48260d56b', NULL, NULL, N'fe6717f3-92c1-48dd-acf6-a65dbefdb04e', N'a', 0, 1, CAST(N'2024-11-30T21:41:28.1362333' AS DateTime2))
INSERT [dbo].[CategoryCriteria] ([Id], [ParentId], [CategoryRatingId], [UnitId], [CriteriaName], [IsDistinct], [IsDeleted], [UpdatedAt]) VALUES (N'c702e9e8-111b-4402-8ed0-5f939a7892a6', N'76f4c106-34b2-4175-a413-f0b67106218f', N'0164939d-6db7-40f9-8d73-064a33cccd6b', N'4402c619-783f-4580-83cd-86e50a47171d', N'Không để người thân, người quen lợi dụng chức vụ, quyền hạn của mình để trục lợi.', 0, 0, CAST(N'2024-11-03T15:02:26.9577663' AS DateTime2))
INSERT [dbo].[CategoryCriteria] ([Id], [ParentId], [CategoryRatingId], [UnitId], [CriteriaName], [IsDistinct], [IsDeleted], [UpdatedAt]) VALUES (N'b9ec64fd-8aac-44db-8541-67b1c6162676', N'4723cac1-52f7-43bb-8d3f-bfb3b6c28a96', N'aa5db29e-7359-406a-9bc3-c37f756ae46e', N'4402c619-783f-4580-83cd-86e50a47171d', N'Tạo mối đoàn kết, hỗ trợ trong công tác của công chức trong đơn vị.', 0, 0, CAST(N'2024-11-03T15:07:51.0421238' AS DateTime2))
INSERT [dbo].[CategoryCriteria] ([Id], [ParentId], [CategoryRatingId], [UnitId], [CriteriaName], [IsDistinct], [IsDeleted], [UpdatedAt]) VALUES (N'acf13799-4766-4be0-a514-693c0d238f34', N'4723cac1-52f7-43bb-8d3f-bfb3b6c28a96', N'aa5db29e-7359-406a-9bc3-c37f756ae46e', N'4402c619-783f-4580-83cd-86e50a47171d', N'Phân công nhiệm vụ cho cấp dưới căn cứ vào năng lực, trình độ và tính phù hợp, sở trường của từng người, phù hợp với công việc được giao.', 0, 0, CAST(N'2024-11-03T15:07:56.1457463' AS DateTime2))
INSERT [dbo].[CategoryCriteria] ([Id], [ParentId], [CategoryRatingId], [UnitId], [CriteriaName], [IsDistinct], [IsDeleted], [UpdatedAt]) VALUES (N'39750d51-ea4d-4d9b-b871-6a65bb01b5a9', N'f8c74f4e-94a2-4f75-9572-bf9c4692fae0', N'22b3f64b-68f5-4bbe-8400-9f20707c2795', N'fe6717f3-92c1-48dd-acf6-a65dbefdb04e', N'Kỹ năng giao tiếp, xây dựng mối quan hệ với cán bộ, giáo viên và phụ huynh.', 0, 0, CAST(N'2024-11-23T13:18:54.7189828' AS DateTime2))
INSERT [dbo].[CategoryCriteria] ([Id], [ParentId], [CategoryRatingId], [UnitId], [CriteriaName], [IsDistinct], [IsDeleted], [UpdatedAt]) VALUES (N'41245dd4-b247-48cd-a67c-6f23c005a5fe', N'abbcb306-3144-4c8a-8b98-eb07a3663ade', NULL, N'fe6717f3-92c1-48dd-acf6-a65dbefdb04e', N'Khuyến khích đổi mới sáng tạo', 0, 0, CAST(N'2024-11-23T13:17:49.6130257' AS DateTime2))
INSERT [dbo].[CategoryCriteria] ([Id], [ParentId], [CategoryRatingId], [UnitId], [CriteriaName], [IsDistinct], [IsDeleted], [UpdatedAt]) VALUES (N'0f8a3810-dc07-47e8-a089-7d6c08107382', N'31314875-8f03-4874-be17-0f31c14f28ee', N'0164939d-6db7-40f9-8d73-064a33cccd6b', N'4402c619-783f-4580-83cd-86e50a47171d', N'Phương pháp làm việc khoa học, dân chủ, đúng nguyên tắc.', 0, 0, CAST(N'2024-11-03T15:02:50.4423472' AS DateTime2))
INSERT [dbo].[CategoryCriteria] ([Id], [ParentId], [CategoryRatingId], [UnitId], [CriteriaName], [IsDistinct], [IsDeleted], [UpdatedAt]) VALUES (N'b7448f10-a0ca-4081-87b6-7e08932e5ade', N'8005ad2a-4d92-4101-9719-8e8364e57996', N'dcbd5ccb-31d8-4cd6-8b79-cbe359f071f2', N'fe6717f3-92c1-48dd-acf6-a65dbefdb04e', N'asdsadasd', 0, 1, CAST(N'2024-11-30T21:21:54.7004805' AS DateTime2))
INSERT [dbo].[CategoryCriteria] ([Id], [ParentId], [CategoryRatingId], [UnitId], [CriteriaName], [IsDistinct], [IsDeleted], [UpdatedAt]) VALUES (N'204a1bdb-ddc7-4832-a266-7feb0dd0df1b', N'8005ad2a-4d92-4101-9719-8e8364e57996', N'dcbd5ccb-31d8-4cd6-8b79-cbe359f071f2', N'fe6717f3-92c1-48dd-acf6-a65dbefdb04e', N'test', 0, 1, CAST(N'2024-11-30T21:36:37.8737557' AS DateTime2))
INSERT [dbo].[CategoryCriteria] ([Id], [ParentId], [CategoryRatingId], [UnitId], [CriteriaName], [IsDistinct], [IsDeleted], [UpdatedAt]) VALUES (N'93b43166-bdad-4118-9bed-8176279fdf95', N'8005ad2a-4d92-4101-9719-8e8364e57996', NULL, N'fe6717f3-92c1-48dd-acf6-a65dbefdb04e', N'Quản lý tổ chức và nhân sự', 0, 0, CAST(N'2024-11-23T13:15:48.8626312' AS DateTime2))
INSERT [dbo].[CategoryCriteria] ([Id], [ParentId], [CategoryRatingId], [UnitId], [CriteriaName], [IsDistinct], [IsDeleted], [UpdatedAt]) VALUES (N'1b68a81a-b654-4896-9195-84abfb081103', N'e6d88410-17f4-479b-8e2d-8b6d5c0324a7', N'0273a6e8-6078-4383-81f2-bbbf6fe016f4', N'4402c619-783f-4580-83cd-86e50a47171d', N'Quán triệt, thể chế hóa và thực hiện chủ trương, đường lối của Đảng, chính sách, pháp luật của Nhà nước tại cơ quan, tổ chức, đơn vị.', 0, 0, CAST(N'2024-11-03T15:06:16.9008104' AS DateTime2))
INSERT [dbo].[CategoryCriteria] ([Id], [ParentId], [CategoryRatingId], [UnitId], [CriteriaName], [IsDistinct], [IsDeleted], [UpdatedAt]) VALUES (N'e6d88410-17f4-479b-8e2d-8b6d5c0324a7', N'3c69d1e2-9204-431f-863f-a4ba07f3ac1d', NULL, N'4402c619-783f-4580-83cd-86e50a47171d', N'Kết quả hoạt động của cơ quan, tổ chức, đơn vị được giao lãnh đạo, quản lý, phụ trách (xác định rõ nội dung công việc thực hiện; tỷ lệ hoàn thành, chất lượng, tiến độ công việc)', 0, 0, CAST(N'2024-11-03T15:04:42.1757843' AS DateTime2))
INSERT [dbo].[CategoryCriteria] ([Id], [ParentId], [CategoryRatingId], [UnitId], [CriteriaName], [IsDistinct], [IsDeleted], [UpdatedAt]) VALUES (N'3699a6dc-e963-4075-ad96-8da9e098b787', N'204a1bdb-ddc7-4832-a266-7feb0dd0df1b', N'dcbd5ccb-31d8-4cd6-8b79-cbe359f071f2', N'fe6717f3-92c1-48dd-acf6-a65dbefdb04e', N'asdsad', 0, 1, CAST(N'2024-11-30T21:36:37.8737560' AS DateTime2))
INSERT [dbo].[CategoryCriteria] ([Id], [ParentId], [CategoryRatingId], [UnitId], [CriteriaName], [IsDistinct], [IsDeleted], [UpdatedAt]) VALUES (N'8005ad2a-4d92-4101-9719-8e8364e57996', NULL, NULL, N'fe6717f3-92c1-48dd-acf6-a65dbefdb04e', N'Năng lực lãnh đạo', 0, 0, CAST(N'2024-11-30T21:31:55.2657765' AS DateTime2))
INSERT [dbo].[CategoryCriteria] ([Id], [ParentId], [CategoryRatingId], [UnitId], [CriteriaName], [IsDistinct], [IsDeleted], [UpdatedAt]) VALUES (N'9be2ca27-ae7c-4fac-9858-8f6f560e504f', N'204a1bdb-ddc7-4832-a266-7feb0dd0df1b', N'dcbd5ccb-31d8-4cd6-8b79-cbe359f071f2', N'fe6717f3-92c1-48dd-acf6-a65dbefdb04e', N'asdsad', 0, 1, CAST(N'2024-11-30T21:36:37.8737561' AS DateTime2))
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
INSERT [dbo].[CategoryCriteria] ([Id], [ParentId], [CategoryRatingId], [UnitId], [CriteriaName], [IsDistinct], [IsDeleted], [UpdatedAt]) VALUES (N'ad60865d-9a01-4983-ba28-c8dfd4f378b5', N'74123fcc-8e98-4985-8cb1-efe608eea13d', N'dcbd5ccb-31d8-4cd6-8b79-cbe359f071f2', N'fe6717f3-92c1-48dd-acf6-a65dbefdb04e', N'asdsad', 0, 1, CAST(N'2024-11-30T21:41:25.0881940' AS DateTime2))
INSERT [dbo].[CategoryCriteria] ([Id], [ParentId], [CategoryRatingId], [UnitId], [CriteriaName], [IsDistinct], [IsDeleted], [UpdatedAt]) VALUES (N'97787e25-9013-4175-a4e6-ca0d74509ac1', N'71cc2ca9-d338-4621-bb19-f4bd2abc9e06', NULL, N'fe6717f3-92c1-48dd-acf6-a65dbefdb04e', N'Đạo đức nghề nghiệp', 0, 0, CAST(N'2024-11-23T13:18:20.0051229' AS DateTime2))
INSERT [dbo].[CategoryCriteria] ([Id], [ParentId], [CategoryRatingId], [UnitId], [CriteriaName], [IsDistinct], [IsDeleted], [UpdatedAt]) VALUES (N'3622e825-11bb-44fd-bc59-ce0c40aa9509', N'76f4c106-34b2-4175-a413-f0b67106218f', N'3aea35b0-3c2f-4c9a-85ab-5d6bfbd06444', N'4402c619-783f-4580-83cd-86e50a47171d', N'Có lối sống trung thực, khiêm tốn, chân thành, trong sáng, giản dị.', 0, 0, CAST(N'2024-11-03T15:02:10.5558641' AS DateTime2))
INSERT [dbo].[CategoryCriteria] ([Id], [ParentId], [CategoryRatingId], [UnitId], [CriteriaName], [IsDistinct], [IsDeleted], [UpdatedAt]) VALUES (N'786e1a85-def5-4a2e-a70c-cfc2c0d8b239', NULL, NULL, N'4402c619-783f-4580-83cd-86e50a47171d', N'Ý thức tổ chức kỷ luật', 0, 0, CAST(N'2024-11-03T15:03:15.4696293' AS DateTime2))
INSERT [dbo].[CategoryCriteria] ([Id], [ParentId], [CategoryRatingId], [UnitId], [CriteriaName], [IsDistinct], [IsDeleted], [UpdatedAt]) VALUES (N'45455dc8-4edc-4fd6-bc00-d5433173d947', N'abbcb306-3144-4c8a-8b98-eb07a3663ade', NULL, N'fe6717f3-92c1-48dd-acf6-a65dbefdb04e', N'Khả năng kiểm soát tiến độ', 0, 0, CAST(N'2024-11-23T13:17:16.0846059' AS DateTime2))
INSERT [dbo].[CategoryCriteria] ([Id], [ParentId], [CategoryRatingId], [UnitId], [CriteriaName], [IsDistinct], [IsDeleted], [UpdatedAt]) VALUES (N'1fb789cf-87b0-43b0-a45e-e85e3891a9ee', N'31314875-8f03-4874-be17-0f31c14f28ee', N'0164939d-6db7-40f9-8d73-064a33cccd6b', N'4402c619-783f-4580-83cd-86e50a47171d', N'Có tinh thần trách nhiệm và phối hợp trong thực hiện nhiệm vụ.', 0, 0, CAST(N'2024-11-03T15:02:57.1283828' AS DateTime2))
INSERT [dbo].[CategoryCriteria] ([Id], [ParentId], [CategoryRatingId], [UnitId], [CriteriaName], [IsDistinct], [IsDeleted], [UpdatedAt]) VALUES (N'abbcb306-3144-4c8a-8b98-eb07a3663ade', NULL, NULL, N'fe6717f3-92c1-48dd-acf6-a65dbefdb04e', N'Quản lý hoạt động chuyên môn', 0, 0, CAST(N'2024-11-23T13:16:40.8208087' AS DateTime2))
INSERT [dbo].[CategoryCriteria] ([Id], [ParentId], [CategoryRatingId], [UnitId], [CriteriaName], [IsDistinct], [IsDeleted], [UpdatedAt]) VALUES (N'74123fcc-8e98-4985-8cb1-efe608eea13d', N'96e17990-403d-4765-b1d5-50e48260d56b', N'f316dfc3-3594-4a09-9fd9-03bf49cf5e98', N'fe6717f3-92c1-48dd-acf6-a65dbefdb04e', N'asdsadad', 0, 1, CAST(N'2024-11-30T21:41:25.0881954' AS DateTime2))
INSERT [dbo].[CategoryCriteria] ([Id], [ParentId], [CategoryRatingId], [UnitId], [CriteriaName], [IsDistinct], [IsDeleted], [UpdatedAt]) VALUES (N'76f4c106-34b2-4175-a413-f0b67106218f', NULL, NULL, N'4402c619-783f-4580-83cd-86e50a47171d', N'Đạo đức, lối sống', 0, 0, CAST(N'2024-11-03T19:00:31.0594389' AS DateTime2))
INSERT [dbo].[CategoryCriteria] ([Id], [ParentId], [CategoryRatingId], [UnitId], [CriteriaName], [IsDistinct], [IsDeleted], [UpdatedAt]) VALUES (N'efbe3ff8-a8cb-408b-b2de-f0cdc5f03d55', N'76f4c106-34b2-4175-a413-f0b67106218f', N'3aea35b0-3c2f-4c9a-85ab-5d6bfbd06444', N'4402c619-783f-4580-83cd-86e50a47171d', N'Có tinh thần đoàn kết, xây dựng cơ quan, tổ chức, đơn vị trong sạch, vững mạnh.', 0, 0, CAST(N'2024-11-03T15:02:19.4751641' AS DateTime2))
INSERT [dbo].[CategoryCriteria] ([Id], [ParentId], [CategoryRatingId], [UnitId], [CriteriaName], [IsDistinct], [IsDeleted], [UpdatedAt]) VALUES (N'71cc2ca9-d338-4621-bb19-f4bd2abc9e06', NULL, NULL, N'fe6717f3-92c1-48dd-acf6-a65dbefdb04e', N'Phẩm chất cá nhân và uy tín', 0, 0, CAST(N'2024-11-23T13:18:12.0254528' AS DateTime2))
INSERT [dbo].[CategoryCriteria] ([Id], [ParentId], [CategoryRatingId], [UnitId], [CriteriaName], [IsDistinct], [IsDeleted], [UpdatedAt]) VALUES (N'51ef79d2-b47e-41f1-a99d-f5c0e4f4416e', N'786e1a85-def5-4a2e-a70c-cfc2c0d8b239', N'0164939d-6db7-40f9-8d73-064a33cccd6b', N'4402c619-783f-4580-83cd-86e50a47171d', N'Báo cáo đầy đủ, trung thực, cung cấp thông tin chính xác, khách quan về những nội dung liên quan đến việc thực hiện chức trách, nhiệm vụ được giao và hoạt động của cơ quan, tổ chức, đơn vị với cấp trên khi được yêu cầu.', 0, 0, CAST(N'2024-11-03T15:04:15.0766354' AS DateTime2))
INSERT [dbo].[CategoryCriteria] ([Id], [ParentId], [CategoryRatingId], [UnitId], [CriteriaName], [IsDistinct], [IsDeleted], [UpdatedAt]) VALUES (N'08534c23-182b-4592-8fd4-f6d5adc91641', N'4451add8-b5d1-483a-9fe8-254611d89e32', N'dcbd5ccb-31d8-4cd6-8b79-cbe359f071f2', N'fe6717f3-92c1-48dd-acf6-a65dbefdb04e', N'asdasd', 0, 1, CAST(N'2024-11-30T21:44:34.1581473' AS DateTime2))
INSERT [dbo].[CategoryCriteria] ([Id], [ParentId], [CategoryRatingId], [UnitId], [CriteriaName], [IsDistinct], [IsDeleted], [UpdatedAt]) VALUES (N'b2360422-271d-47f6-8884-f734d48e2cf6', N'4451add8-b5d1-483a-9fe8-254611d89e32', N'22b3f64b-68f5-4bbe-8400-9f20707c2795', N'fe6717f3-92c1-48dd-acf6-a65dbefdb04e', N'Đánh giá tính kịp thời và hiệu quả của các quyết định quản lý.', 0, 0, CAST(N'2024-11-23T13:16:25.9242823' AS DateTime2))
INSERT [dbo].[CategoryCriteria] ([Id], [ParentId], [CategoryRatingId], [UnitId], [CriteriaName], [IsDistinct], [IsDeleted], [UpdatedAt]) VALUES (N'bf0b9144-be3b-4213-8f3c-f744035ed4b5', N'786e1a85-def5-4a2e-a70c-cfc2c0d8b239', N'0164939d-6db7-40f9-8d73-064a33cccd6b', N'4402c619-783f-4580-83cd-86e50a47171d', N'Thực hiện việc kê khai và công khai tài sản, thu nhập theo quy định', 0, 0, CAST(N'2024-11-03T15:04:07.0678839' AS DateTime2))
INSERT [dbo].[CategoryCriteria] ([Id], [ParentId], [CategoryRatingId], [UnitId], [CriteriaName], [IsDistinct], [IsDeleted], [UpdatedAt]) VALUES (N'1834d96f-f389-45f2-9006-f9d57b1ecf53', N'71cc2ca9-d338-4621-bb19-f4bd2abc9e06', NULL, N'fe6717f3-92c1-48dd-acf6-a65dbefdb04e', N'Tính sáng tạo và linh hoạt', 0, 0, CAST(N'2024-11-23T13:19:13.2793363' AS DateTime2))
INSERT [dbo].[CategoryCriteria] ([Id], [ParentId], [CategoryRatingId], [UnitId], [CriteriaName], [IsDistinct], [IsDeleted], [UpdatedAt]) VALUES (N'713b1bea-d037-413c-89fd-f9fadc17b475', N'74123fcc-8e98-4985-8cb1-efe608eea13d', N'dcbd5ccb-31d8-4cd6-8b79-cbe359f071f2', N'fe6717f3-92c1-48dd-acf6-a65dbefdb04e', N'asdasd', 0, 1, CAST(N'2024-11-30T21:41:25.0881954' AS DateTime2))
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
INSERT [dbo].[Evaluation] ([Id], [UnitId], [CategoryTimeTypeId], [EvaluationName], [Status], [IsDeleted], [UpdatedAt]) VALUES (N'22aae825-e436-4532-b92b-5c8a1bcc88ad', N'4402c619-783f-4580-83cd-86e50a47171d', N'cbd1e5ab-0498-460c-823d-0acfde1bc2d3', N'Phiếu đánh giá tháng 12', 1, 0, CAST(N'2024-12-02T18:26:35.2716689' AS DateTime2))
INSERT [dbo].[Evaluation] ([Id], [UnitId], [CategoryTimeTypeId], [EvaluationName], [Status], [IsDeleted], [UpdatedAt]) VALUES (N'114be4a4-f231-4d0d-8eb4-6ccac85798be', N'4402c619-783f-4580-83cd-86e50a47171d', N'cbd1e5ab-0498-460c-823d-0acfde1bc2d3', N'Phiếu đánh giá tháng 12 - HT - PHT', 1, 0, CAST(N'2024-12-02T18:26:35.3125402' AS DateTime2))
GO
INSERT [dbo].[EvaluationAAE] ([Id], [EvaluationId], [UserId], [SupervisorId], [Advantages], [DisAdvantages], [AddReviews], [KetQuaHoatDongCoQuan], [NangLucLanhDaoQuanLy], [NangLucTapHopDoanKet], [NhanXetUuKhuyetDiem], [NhanDinhChieuHuongPhatTrien], [IsDeleted], [UpdatedAt]) VALUES (N'c24e1a31-1d0c-4a03-8a81-0c52e33420fa', N'114be4a4-f231-4d0d-8eb4-6ccac85798be', N'70be578e-af27-4056-a6ad-55990f86b3e7', N'cdb5713c-fcb9-4105-8140-033fc2ac032e', N' - Tích cực, tận tụy, có ý thức trách nhiệm với công việc.
 - Có ý thức học hỏi, tiếp thu kinh nghiệm, lắng nghe ý kiến hướng dẫn, góp ý của lãnh đạo và các đồng nghiệp trong cơ quan. Tự nâng cao trình độ, không ngại những những nhiệm vụ mới có áp lực công việc cao do cơ quan, đơn vị, tổ chức giao phó.
', N' - Đôi khi chưa đảm bảo ngày, giờ công lao động.
 - Chưa chủ động thực hiện nhiệm vụ được giao.
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
+ Lãnh đạo thực hiện mọi nhiệm vụ trên nguyên tắc tập trung dân chủ, phát huy quyền làm chủ, xây dựng khối đại đoàn kết giữa các bộ phận, tổ chức trong đơn vị.', N'- hieu truong 1', N'- hieu truong 2', N'- hieu truong 3', N'- danh gia hieu truong - pgd 1', N'- danh gia hieu truong - pgd 2', 0, CAST(N'2024-12-02T18:22:23.5210944' AS DateTime2))
INSERT [dbo].[EvaluationAAE] ([Id], [EvaluationId], [UserId], [SupervisorId], [Advantages], [DisAdvantages], [AddReviews], [KetQuaHoatDongCoQuan], [NangLucLanhDaoQuanLy], [NangLucTapHopDoanKet], [NhanXetUuKhuyetDiem], [NhanDinhChieuHuongPhatTrien], [IsDeleted], [UpdatedAt]) VALUES (N'3734de32-cb2c-4cbe-b831-1467333765f8', N'22aae825-e436-4532-b92b-5c8a1bcc88ad', N'55fc6d0e-50b3-4876-bf93-ee3937daeb62', N'70be578e-af27-4056-a6ad-55990f86b3e7', N' - Có ý thức học hỏi, tiếp thu kinh nghiệm, lắng nghe ý kiến hướng dẫn, góp ý của lãnh đạo và các đồng nghiệp trong cơ quan. Tự nâng cao trình độ, không ngại những những nhiệm vụ mới có áp lực công việc cao do cơ quan, đơn vị, tổ chức giao phó.
 -  Chấp hành tốt quy định về đạo đức nghề nghiệp, có phẩm chất đạo đức trong sáng giản dị, có thái độ hòa nhã, khiêm tốn với nhân đân khi giao tiếp trong công việc và lắng nghe ý kiến đóng góp của nhân dân.
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
+ Lãnh đạo thực hiện mọi nhiệm vụ trên nguyên tắc tập trung dân chủ, phát huy quyền làm chủ, xây dựng khối đại đoàn kết giữa các bộ phận, tổ chức trong đơn vị.', NULL, NULL, NULL, N'- hoang thi van', N'- hoang thi van', 0, CAST(N'2024-12-02T11:01:22.6330676' AS DateTime2))
INSERT [dbo].[EvaluationAAE] ([Id], [EvaluationId], [UserId], [SupervisorId], [Advantages], [DisAdvantages], [AddReviews], [KetQuaHoatDongCoQuan], [NangLucLanhDaoQuanLy], [NangLucTapHopDoanKet], [NhanXetUuKhuyetDiem], [NhanDinhChieuHuongPhatTrien], [IsDeleted], [UpdatedAt]) VALUES (N'dbc428e6-1847-47ed-85b3-450e78f13a21', N'22aae825-e436-4532-b92b-5c8a1bcc88ad', N'dd3c7e8b-3dc7-45d2-a2bd-282de7d5e2de', N'70be578e-af27-4056-a6ad-55990f86b3e7', N' - Tích cực, tận tụy, có ý thức trách nhiệm với công việc.
 -  Chấp hành tốt quy định về đạo đức nghề nghiệp, có phẩm chất đạo đức trong sáng giản dị, có thái độ hòa nhã, khiêm tốn với nhân đân khi giao tiếp trong công việc và lắng nghe ý kiến đóng góp của nhân dân.
', N' - Ít phát biểu trong cuộc họp, chưa mạnh dạn trong tự phê bình và phê bình.
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
+ Lãnh đạo thực hiện mọi nhiệm vụ trên nguyên tắc tập trung dân chủ, phát huy quyền làm chủ, xây dựng khối đại đoàn kết giữa các bộ phận, tổ chức trong đơn vị.', NULL, NULL, NULL, N'- pham van hoang', N'- pham van hoang', 0, CAST(N'2024-12-02T18:17:36.5140372' AS DateTime2))
INSERT [dbo].[EvaluationAAE] ([Id], [EvaluationId], [UserId], [SupervisorId], [Advantages], [DisAdvantages], [AddReviews], [KetQuaHoatDongCoQuan], [NangLucLanhDaoQuanLy], [NangLucTapHopDoanKet], [NhanXetUuKhuyetDiem], [NhanDinhChieuHuongPhatTrien], [IsDeleted], [UpdatedAt]) VALUES (N'3b8e7192-ee03-4d9a-af0c-45b2474bdb92', N'22aae825-e436-4532-b92b-5c8a1bcc88ad', N'2d1c4b21-92b0-4105-9151-0980a4c924ad', N'70be578e-af27-4056-a6ad-55990f86b3e7', N' - Có ý thức học hỏi, tiếp thu kinh nghiệm, lắng nghe ý kiến hướng dẫn, góp ý của lãnh đạo và các đồng nghiệp trong cơ quan. Tự nâng cao trình độ, không ngại những những nhiệm vụ mới có áp lực công việc cao do cơ quan, đơn vị, tổ chức giao phó.
 - Luôn chấp hành mọi chủ trương chính sách của Đảng, chính sách pháp luật của nhà nước, không vi phạm pháp luật, không mắc tệ nạn xã hội,có tinh thần đoàn kết,sẵn sàng giúp đỡ mọi người.
', N' - Chưa hòa đồng với đồng nghiệp.
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
+ Lãnh đạo thực hiện mọi nhiệm vụ trên nguyên tắc tập trung dân chủ, phát huy quyền làm chủ, xây dựng khối đại đoàn kết giữa các bộ phận, tổ chức trong đơn vị.', NULL, NULL, NULL, N'- tran thi mai', N'- tran thi mai', 0, CAST(N'2024-12-02T11:56:22.4240234' AS DateTime2))
INSERT [dbo].[EvaluationAAE] ([Id], [EvaluationId], [UserId], [SupervisorId], [Advantages], [DisAdvantages], [AddReviews], [KetQuaHoatDongCoQuan], [NangLucLanhDaoQuanLy], [NangLucTapHopDoanKet], [NhanXetUuKhuyetDiem], [NhanDinhChieuHuongPhatTrien], [IsDeleted], [UpdatedAt]) VALUES (N'acc65cbb-ac3b-4116-8986-7ec31ce761cd', N'22aae825-e436-4532-b92b-5c8a1bcc88ad', N'32f207a2-02ba-4b83-8c71-03af11657c63', N'70be578e-af27-4056-a6ad-55990f86b3e7', N' - Có ý thức học hỏi, tiếp thu kinh nghiệm, lắng nghe ý kiến hướng dẫn, góp ý của lãnh đạo và các đồng nghiệp trong cơ quan. Tự nâng cao trình độ, không ngại những những nhiệm vụ mới có áp lực công việc cao do cơ quan, đơn vị, tổ chức giao phó.
 - Thực hiện đóng góp đầy đủ các loại quỹ và các nghĩa vụ khác của viên chức.
', N' - Đôi khi chưa đảm bảo ngày, giờ công lao động.
 - Chưa chủ động thực hiện nhiệm vụ được giao.
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
+ Lãnh đạo thực hiện mọi nhiệm vụ trên nguyên tắc tập trung dân chủ, phát huy quyền làm chủ, xây dựng khối đại đoàn kết giữa các bộ phận, tổ chức trong đơn vị.', NULL, NULL, NULL, N'- giao vien 1', N'- giao vien 1', 0, CAST(N'2024-12-02T10:45:33.9583862' AS DateTime2))
INSERT [dbo].[EvaluationAAE] ([Id], [EvaluationId], [UserId], [SupervisorId], [Advantages], [DisAdvantages], [AddReviews], [KetQuaHoatDongCoQuan], [NangLucLanhDaoQuanLy], [NangLucTapHopDoanKet], [NhanXetUuKhuyetDiem], [NhanDinhChieuHuongPhatTrien], [IsDeleted], [UpdatedAt]) VALUES (N'ce533cf6-a874-439d-a38c-8e55415df4fc', N'22aae825-e436-4532-b92b-5c8a1bcc88ad', N'2d1c4b21-92b0-4105-9151-0980a4c924ad', NULL, N' - Tích cực, tận tụy, có ý thức trách nhiệm với công việc.
 - Có ý thức học hỏi, tiếp thu kinh nghiệm, lắng nghe ý kiến hướng dẫn, góp ý của lãnh đạo và các đồng nghiệp trong cơ quan. Tự nâng cao trình độ, không ngại những những nhiệm vụ mới có áp lực công việc cao do cơ quan, đơn vị, tổ chức giao phó.
', N' - Chưa chủ động thực hiện nhiệm vụ được giao.
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
+ Lãnh đạo thực hiện mọi nhiệm vụ trên nguyên tắc tập trung dân chủ, phát huy quyền làm chủ, xây dựng khối đại đoàn kết giữa các bộ phận, tổ chức trong đơn vị.', NULL, NULL, NULL, NULL, NULL, 0, CAST(N'2024-12-02T18:18:14.4916818' AS DateTime2))
INSERT [dbo].[EvaluationAAE] ([Id], [EvaluationId], [UserId], [SupervisorId], [Advantages], [DisAdvantages], [AddReviews], [KetQuaHoatDongCoQuan], [NangLucLanhDaoQuanLy], [NangLucTapHopDoanKet], [NhanXetUuKhuyetDiem], [NhanDinhChieuHuongPhatTrien], [IsDeleted], [UpdatedAt]) VALUES (N'de692f31-47c9-4a8d-a6c3-c238718d4700', N'22aae825-e436-4532-b92b-5c8a1bcc88ad', N'32f207a2-02ba-4b83-8c71-03af11657c63', NULL, N' - Tích cực, tận tụy, có ý thức trách nhiệm với công việc.
 - Có tinh thần trách nhiệm và nhiệt tình, chủ động trong công việc.
', N' - Chưa hòa đồng với đồng nghiệp.
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
+ Lãnh đạo thực hiện mọi nhiệm vụ trên nguyên tắc tập trung dân chủ, phát huy quyền làm chủ, xây dựng khối đại đoàn kết giữa các bộ phận, tổ chức trong đơn vị.', NULL, NULL, NULL, NULL, NULL, 0, CAST(N'2024-12-02T18:16:34.6557741' AS DateTime2))
INSERT [dbo].[EvaluationAAE] ([Id], [EvaluationId], [UserId], [SupervisorId], [Advantages], [DisAdvantages], [AddReviews], [KetQuaHoatDongCoQuan], [NangLucLanhDaoQuanLy], [NangLucTapHopDoanKet], [NhanXetUuKhuyetDiem], [NhanDinhChieuHuongPhatTrien], [IsDeleted], [UpdatedAt]) VALUES (N'7a91f0e5-f42f-4888-ae40-c5eee8942444', N'22aae825-e436-4532-b92b-5c8a1bcc88ad', N'32f207a2-02ba-4b83-8c71-03af11657c63', NULL, N' - Tích cực, tận tụy, có ý thức trách nhiệm với công việc.
 - Thực hiện đóng góp đầy đủ các loại quỹ và các nghĩa vụ khác của viên chức.
', N' - Đôi khi chưa đảm bảo ngày, giờ công lao động.
 - Chưa chủ động thực hiện nhiệm vụ được giao.
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
+ Lãnh đạo thực hiện mọi nhiệm vụ trên nguyên tắc tập trung dân chủ, phát huy quyền làm chủ, xây dựng khối đại đoàn kết giữa các bộ phận, tổ chức trong đơn vị.', NULL, NULL, NULL, NULL, NULL, 0, CAST(N'2024-12-02T10:49:29.8149817' AS DateTime2))
INSERT [dbo].[EvaluationAAE] ([Id], [EvaluationId], [UserId], [SupervisorId], [Advantages], [DisAdvantages], [AddReviews], [KetQuaHoatDongCoQuan], [NangLucLanhDaoQuanLy], [NangLucTapHopDoanKet], [NhanXetUuKhuyetDiem], [NhanDinhChieuHuongPhatTrien], [IsDeleted], [UpdatedAt]) VALUES (N'9180138e-b694-42fe-8b67-dc9fd94af0c0', N'22aae825-e436-4532-b92b-5c8a1bcc88ad', N'dd3c7e8b-3dc7-45d2-a2bd-282de7d5e2de', NULL, N' - Tích cực, tận tụy, có ý thức trách nhiệm với công việc.
 - Có ý thức học hỏi, tiếp thu kinh nghiệm, lắng nghe ý kiến hướng dẫn, góp ý của lãnh đạo và các đồng nghiệp trong cơ quan. Tự nâng cao trình độ, không ngại những những nhiệm vụ mới có áp lực công việc cao do cơ quan, đơn vị, tổ chức giao phó.
 - Có năng lực trình độ chuyên môn nghiệp vụ vững vàng, đảm bảo được những nhiệm vụ công việc được cấp trên giao phó.
', N' - Đôi khi chưa đảm bảo ngày, giờ công lao động.
 - Chưa hòa đồng với đồng nghiệp.
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
+ Lãnh đạo thực hiện mọi nhiệm vụ trên nguyên tắc tập trung dân chủ, phát huy quyền làm chủ, xây dựng khối đại đoàn kết giữa các bộ phận, tổ chức trong đơn vị.', NULL, NULL, NULL, NULL, NULL, 0, CAST(N'2024-12-02T11:55:34.0990582' AS DateTime2))
INSERT [dbo].[EvaluationAAE] ([Id], [EvaluationId], [UserId], [SupervisorId], [Advantages], [DisAdvantages], [AddReviews], [KetQuaHoatDongCoQuan], [NangLucLanhDaoQuanLy], [NangLucTapHopDoanKet], [NhanXetUuKhuyetDiem], [NhanDinhChieuHuongPhatTrien], [IsDeleted], [UpdatedAt]) VALUES (N'fdd0aa3a-fe5e-4caa-93d4-f55c7b765632', N'114be4a4-f231-4d0d-8eb4-6ccac85798be', N'd3f15e0a-7ac8-4f28-b93e-f8c11eee7fcf', N'cdb5713c-fcb9-4105-8140-033fc2ac032e', N' - Không vi phạm về nhân cách danh dự, nhân phẩm làm ảnh hưởng xấu đến ngành, đơn vị nơi công tác.
 -  Chấp hành tốt quy định về đạo đức nghề nghiệp, có phẩm chất đạo đức trong sáng giản dị, có thái độ hòa nhã, khiêm tốn với nhân đân khi giao tiếp trong công việc và lắng nghe ý kiến đóng góp của nhân dân.
', N' - Đôi lúc chưa đảm bảo giờ giấc trực nhật
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
+ Lãnh đạo thực hiện mọi nhiệm vụ trên nguyên tắc tập trung dân chủ, phát huy quyền làm chủ, xây dựng khối đại đoàn kết giữa các bộ phận, tổ chức trong đơn vị.', NULL, NULL, NULL, N'- test 22', N'- test 22', 0, CAST(N'2024-12-02T18:23:47.7887381' AS DateTime2))
INSERT [dbo].[EvaluationAAE] ([Id], [EvaluationId], [UserId], [SupervisorId], [Advantages], [DisAdvantages], [AddReviews], [KetQuaHoatDongCoQuan], [NangLucLanhDaoQuanLy], [NangLucTapHopDoanKet], [NhanXetUuKhuyetDiem], [NhanDinhChieuHuongPhatTrien], [IsDeleted], [UpdatedAt]) VALUES (N'9b297b3c-95f5-46c9-84bb-f57ff32be94d', N'22aae825-e436-4532-b92b-5c8a1bcc88ad', N'55fc6d0e-50b3-4876-bf93-ee3937daeb62', NULL, N' -  Chấp hành tốt quy định về đạo đức nghề nghiệp, có phẩm chất đạo đức trong sáng giản dị, có thái độ hòa nhã, khiêm tốn với nhân đân khi giao tiếp trong công việc và lắng nghe ý kiến đóng góp của nhân dân.
 - Luôn chấp hành mọi chủ trương chính sách của Đảng, chính sách pháp luật của nhà nước, không vi phạm pháp luật, không mắc tệ nạn xã hội,có tinh thần đoàn kết,sẵn sàng giúp đỡ mọi người.
', N' - Chưa hòa đồng với đồng nghiệp.
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
+ Lãnh đạo thực hiện mọi nhiệm vụ trên nguyên tắc tập trung dân chủ, phát huy quyền làm chủ, xây dựng khối đại đoàn kết giữa các bộ phận, tổ chức trong đơn vị.', NULL, NULL, NULL, NULL, NULL, 0, CAST(N'2024-12-02T18:19:07.5800682' AS DateTime2))
GO
INSERT [dbo].[EvaluationConsolidationAndTransfer] ([Id], [UserId], [UnitId], [EvaluationConsolidationAndTransferName], [Status], [UpdatedAt]) VALUES (N'ed1519d7-4c34-49f8-ac36-c369b71ad795', N'70be578e-af27-4056-a6ad-55990f86b3e7', N'4402c619-783f-4580-83cd-86e50a47171d', N'Tổng hợp và chuyển tháng 12 - 2024 - THCS Lộc Ninh', 1, CAST(N'2024-12-02T18:26:35.6736733' AS DateTime2))
GO
INSERT [dbo].[EvaluationConsolidationAndTransferDetails] ([Id], [EvaluationConsolidationAndTransferId], [EvaluationId], [UpdatedAt]) VALUES (N'd442b954-5759-4aad-a4f3-7670611745a3', N'ed1519d7-4c34-49f8-ac36-c369b71ad795', N'22aae825-e436-4532-b92b-5c8a1bcc88ad', CAST(N'2024-12-02T18:24:09.1370711' AS DateTime2))
INSERT [dbo].[EvaluationConsolidationAndTransferDetails] ([Id], [EvaluationConsolidationAndTransferId], [EvaluationId], [UpdatedAt]) VALUES (N'0275776d-56ac-4a5f-af29-f98d7919b6ec', N'ed1519d7-4c34-49f8-ac36-c369b71ad795', N'114be4a4-f231-4d0d-8eb4-6ccac85798be', CAST(N'2024-12-02T18:24:09.2009667' AS DateTime2))
GO
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'5168f828-e8bc-4447-a74d-05fa2381352f', N'114be4a4-f231-4d0d-8eb4-6ccac85798be', N'41245dd4-b247-48cd-a67c-6f23c005a5fe', 0, CAST(N'2024-12-02T18:14:46.0766585' AS DateTime2), 13)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'1a419b16-146c-4fae-b892-0c4b24533c8f', N'22aae825-e436-4532-b92b-5c8a1bcc88ad', N'1fb789cf-87b0-43b0-a45e-e85e3891a9ee', 0, CAST(N'2024-12-01T09:52:20.4757730' AS DateTime2), 7)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'468e40c0-b593-4550-8b45-124c7968bccf', N'22aae825-e436-4532-b92b-5c8a1bcc88ad', N'acf13799-4766-4be0-a514-693c0d238f34', 0, CAST(N'2024-12-01T09:52:20.4191021' AS DateTime2), 25)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'4b1b71b1-9ac2-4f6a-b109-1568135e462e', N'22aae825-e436-4532-b92b-5c8a1bcc88ad', N'f4c06feb-eb3d-4f75-95f9-10c0289de995', 0, CAST(N'2024-12-01T09:52:20.4701871' AS DateTime2), 30)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'e566445c-5c44-4227-962f-1b24038423ac', N'22aae825-e436-4532-b92b-5c8a1bcc88ad', N'fb40ad8f-098f-4fd1-8870-c05d1d25fae2', 0, CAST(N'2024-12-01T09:52:20.4518676' AS DateTime2), 29)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'637f9abf-92d0-421a-96f0-1c4b1d352094', N'22aae825-e436-4532-b92b-5c8a1bcc88ad', N'da5e3dff-a649-4508-943d-0ecc32d4f7fc', 0, CAST(N'2024-12-01T09:52:20.4277580' AS DateTime2), 9)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'765efb49-e8dc-4934-9c97-2111ef09a7ff', N'22aae825-e436-4532-b92b-5c8a1bcc88ad', N'3c69d1e2-9204-431f-863f-a4ba07f3ac1d', 0, CAST(N'2024-12-01T09:52:20.5001661' AS DateTime2), 21)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'f6f0be0e-9328-41a4-b867-2c4cb3b8ac13', N'22aae825-e436-4532-b92b-5c8a1bcc88ad', N'bf0b9144-be3b-4213-8f3c-f744035ed4b5', 0, CAST(N'2024-12-01T09:52:20.4971212' AS DateTime2), 14)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'36472d1b-38a1-47a2-bb58-322b878ab68a', N'114be4a4-f231-4d0d-8eb4-6ccac85798be', N'99652497-2b73-4368-901c-05143fd3f8b1', 0, CAST(N'2024-12-02T18:14:46.0919432' AS DateTime2), 17)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'ffc8705e-6a39-4bb1-bec8-3d0f3ae6dedb', N'114be4a4-f231-4d0d-8eb4-6ccac85798be', N'4451add8-b5d1-483a-9fe8-254611d89e32', 0, CAST(N'2024-12-02T18:14:46.1235601' AS DateTime2), 6)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'86cd65a2-4d52-4823-8caa-422c558cbb70', N'22aae825-e436-4532-b92b-5c8a1bcc88ad', N'786e1a85-def5-4a2e-a70c-cfc2c0d8b239', 0, CAST(N'2024-12-01T09:52:20.4372017' AS DateTime2), 11)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'05f8587b-f452-45f1-98c6-52a8ca10fd3c', N'22aae825-e436-4532-b92b-5c8a1bcc88ad', N'b9ec64fd-8aac-44db-8541-67b1c6162676', 0, CAST(N'2024-12-01T09:52:20.4547084' AS DateTime2), 26)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'd9930f2a-d375-462d-a13b-574894e3edb6', N'114be4a4-f231-4d0d-8eb4-6ccac85798be', N'71cc2ca9-d338-4621-bb19-f4bd2abc9e06', 0, CAST(N'2024-12-02T18:14:46.1021117' AS DateTime2), 15)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'9618bcf6-b30b-476e-bc0d-5c5a1e10dae1', N'22aae825-e436-4532-b92b-5c8a1bcc88ad', N'ad4a5bce-f3c4-44a7-85c5-fdb1c2d19d12', 0, CAST(N'2024-12-01T09:52:20.4311481' AS DateTime2), 20)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'dba9b054-f8fc-4965-809e-5e64401bcb4d', N'114be4a4-f231-4d0d-8eb4-6ccac85798be', N'415eb223-1f18-4338-be5a-b6b2ce5496ed', 0, CAST(N'2024-12-02T18:14:46.1043357' AS DateTime2), 14)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'8ecaa2d7-0ab2-49ef-baf4-5fe3aaf95233', N'114be4a4-f231-4d0d-8eb4-6ccac85798be', N'b2360422-271d-47f6-8884-f734d48e2cf6', 0, CAST(N'2024-12-02T18:14:46.0786508' AS DateTime2), 7)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'c3f26296-f504-4a5e-9ede-6be6db0193a0', N'114be4a4-f231-4d0d-8eb4-6ccac85798be', N'39750d51-ea4d-4d9b-b871-6a65bb01b5a9', 0, CAST(N'2024-12-02T18:14:46.1167055' AS DateTime2), 19)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'97714905-29c4-490d-b1a7-735dfc9a01c4', N'22aae825-e436-4532-b92b-5c8a1bcc88ad', N'6f0a8890-c105-4fb4-874b-9d559847eca6', 0, CAST(N'2024-12-01T09:52:20.4659050' AS DateTime2), 23)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'5cc569ea-2d85-43bd-b5c8-7408822ff00a', N'22aae825-e436-4532-b92b-5c8a1bcc88ad', N'e296f2f3-e89c-49b9-b304-b76df59719ae', 0, CAST(N'2024-12-01T09:52:20.4783929' AS DateTime2), 10)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'b094cc23-99a5-46ee-ace9-7bdd5f67fa00', N'114be4a4-f231-4d0d-8eb4-6ccac85798be', N'1834d96f-f389-45f2-9006-f9d57b1ecf53', 0, CAST(N'2024-12-02T18:14:46.1064029' AS DateTime2), 20)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'615a9412-ee2c-4405-9b06-7ec5b82da0e0', N'22aae825-e436-4532-b92b-5c8a1bcc88ad', N'76f4c106-34b2-4175-a413-f0b67106218f', 0, CAST(N'2024-12-01T09:52:20.4627248' AS DateTime2), 16)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'4736ed72-3a31-4d06-b3df-87b22a202325', N'114be4a4-f231-4d0d-8eb4-6ccac85798be', N'abbcb306-3144-4c8a-8b98-eb07a3663ade', 0, CAST(N'2024-12-02T18:14:46.0863547' AS DateTime2), 8)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'b8868c33-8a79-48d5-afab-8a08a5abbc9b', N'114be4a4-f231-4d0d-8eb4-6ccac85798be', N'e9cfa38c-e121-46ce-aaf5-b454a6b9f128', 0, CAST(N'2024-12-02T18:14:46.1090329' AS DateTime2), 9)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'24689d73-403d-4533-93ef-8ad229d23ece', N'22aae825-e436-4532-b92b-5c8a1bcc88ad', N'3622e825-11bb-44fd-bc59-ce0c40aa9509', 0, CAST(N'2024-12-01T09:52:20.4834077' AS DateTime2), 18)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'0056bdf7-fcee-4f78-ae70-8b3bb17a2b74', N'114be4a4-f231-4d0d-8eb4-6ccac85798be', N'51ea330f-07af-4d54-adff-114bdd0e6057', 0, CAST(N'2024-12-02T18:14:46.0838862' AS DateTime2), 3)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'930f3d0b-64c8-4f26-adde-8fcbbba6fa76', N'22aae825-e436-4532-b92b-5c8a1bcc88ad', N'e6d88410-17f4-479b-8e2d-8b6d5c0324a7', 0, CAST(N'2024-12-01T09:52:20.4811246' AS DateTime2), 27)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'5c2b5ac5-9418-4d3d-8733-959647858649', N'114be4a4-f231-4d0d-8eb4-6ccac85798be', N'93b43166-bdad-4118-9bed-8176279fdf95', 0, CAST(N'2024-12-02T18:14:46.1115895' AS DateTime2), 4)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'f8f2699d-e368-48f9-b84b-a0f6c03987f4', N'22aae825-e436-4532-b92b-5c8a1bcc88ad', N'51ef79d2-b47e-41f1-a99d-f5c0e4f4416e', 0, CAST(N'2024-12-01T09:52:20.4889297' AS DateTime2), 15)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'37d51535-c0aa-4a9a-bb58-a1ca2ef11a81', N'22aae825-e436-4532-b92b-5c8a1bcc88ad', N'31314875-8f03-4874-be17-0f31c14f28ee', 0, CAST(N'2024-12-01T09:52:20.5026219' AS DateTime2), 6)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'7680a9be-09d6-4dc7-936a-a1f237622cbb', N'114be4a4-f231-4d0d-8eb4-6ccac85798be', N'f8c74f4e-94a2-4f75-9572-bf9c4692fae0', 0, CAST(N'2024-12-02T18:14:46.1139814' AS DateTime2), 18)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'1d001157-8381-415a-b376-a5694141b022', N'22aae825-e436-4532-b92b-5c8a1bcc88ad', N'0f8a3810-dc07-47e8-a089-7d6c08107382', 0, CAST(N'2024-12-01T09:52:20.4337405' AS DateTime2), 8)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'40a9e245-c3f6-463f-81ff-a872cea61351', N'22aae825-e436-4532-b92b-5c8a1bcc88ad', N'87fedc0d-caae-4890-80d9-a6e086d71a1c', 0, CAST(N'2024-12-01T09:52:20.4603243' AS DateTime2), 3)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'fbf2acbb-228b-4375-8ea0-a992383ab773', N'114be4a4-f231-4d0d-8eb4-6ccac85798be', N'8005ad2a-4d92-4101-9719-8e8364e57996', 0, CAST(N'2024-12-02T18:14:46.0953078' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'663347d6-490d-4d95-aca2-ad73e68b2b2d', N'22aae825-e436-4532-b92b-5c8a1bcc88ad', N'999d3424-6bad-4d7b-8bd0-2b462b55dd45', 0, CAST(N'2024-12-01T09:52:20.4947659' AS DateTime2), 4)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'e61d20d5-5c94-42eb-bc72-b06fd8a2203f', N'114be4a4-f231-4d0d-8eb4-6ccac85798be', N'7fe6502c-10e1-430f-bbbd-01943d0f5e98', 0, CAST(N'2024-12-02T18:14:46.0892751' AS DateTime2), 5)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'794bfb22-dbd9-4b4d-b979-b086fc0a34de', N'22aae825-e436-4532-b92b-5c8a1bcc88ad', N'8b678550-a782-4ed9-a61f-15887cf5a73e', 0, CAST(N'2024-12-01T09:52:20.4573757' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'620d9d5d-9440-4ad6-af3a-b32b6b61e843', N'114be4a4-f231-4d0d-8eb4-6ccac85798be', N'97787e25-9013-4175-a4e6-ca0d74509ac1', 0, CAST(N'2024-12-02T18:14:46.1188833' AS DateTime2), 16)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'ab33e386-e663-43aa-b6c8-b3d6a5ceaf0c', N'114be4a4-f231-4d0d-8eb4-6ccac85798be', N'418bf356-ca1e-4db7-9aec-0635713b688d', 0, CAST(N'2024-12-02T18:14:46.0996186' AS DateTime2), 2)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'ce21918e-90c6-4ae9-90e2-c832daa1404d', N'22aae825-e436-4532-b92b-5c8a1bcc88ad', N'c702e9e8-111b-4402-8ed0-5f939a7892a6', 0, CAST(N'2024-12-01T09:52:20.4865948' AS DateTime2), 19)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'e10ebebb-a683-471e-a207-c9659b061849', N'114be4a4-f231-4d0d-8eb4-6ccac85798be', N'c733b044-2ace-43ea-be34-251b9af672cf', 0, CAST(N'2024-12-02T18:14:46.0976191' AS DateTime2), 10)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'e13cf2ba-b420-49a0-bc9a-cc66b98837b8', N'114be4a4-f231-4d0d-8eb4-6ccac85798be', N'1746be1c-1adf-4f5d-8604-a711e2cc52f0', 0, CAST(N'2024-12-02T18:14:46.0320697' AS DateTime2), 12)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'a095027e-cca4-4ec6-a1cf-ce723380bcaf', N'22aae825-e436-4532-b92b-5c8a1bcc88ad', N'79459d60-5db6-48b6-94bf-2121d9839e15', 0, CAST(N'2024-12-01T09:52:20.4436619' AS DateTime2), 2)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'7000a6b6-c54e-4d13-a282-cf5d0a2b93bd', N'22aae825-e436-4532-b92b-5c8a1bcc88ad', N'3a9ab36e-b834-4a20-ba32-a0d34fdc47da', 0, CAST(N'2024-12-01T09:52:20.4139279' AS DateTime2), 12)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'6bad79c5-3c4a-4214-ae8d-d2702c9795b7', N'114be4a4-f231-4d0d-8eb4-6ccac85798be', N'45455dc8-4edc-4fd6-bc00-d5433173d947', 0, CAST(N'2024-12-02T18:14:46.0815540' AS DateTime2), 11)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'e0717241-b47c-45ce-81ae-d461d33c5870', N'22aae825-e436-4532-b92b-5c8a1bcc88ad', N'a7efdc67-aa93-46cb-8410-0ddcfe0d5853', 0, CAST(N'2024-12-01T09:52:20.4916225' AS DateTime2), 31)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'6adbb6bf-4a55-41b9-acc3-e13009d539cb', N'22aae825-e436-4532-b92b-5c8a1bcc88ad', N'b4ab63da-81d4-4ea1-8a5a-3c12154fa561', 0, CAST(N'2024-12-01T09:52:20.4403876' AS DateTime2), 5)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'547658ce-34aa-45b6-819b-ee6f54d9cc05', N'22aae825-e436-4532-b92b-5c8a1bcc88ad', N'35ca5805-aa8f-4dc0-a895-c2bae87a00eb', 0, CAST(N'2024-12-01T09:52:20.4253311' AS DateTime2), 22)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'a8951085-cac5-4783-8641-f1982d45be85', N'22aae825-e436-4532-b92b-5c8a1bcc88ad', N'ca2c80e4-c9e6-4bc1-a080-1c0505bccaba', 0, CAST(N'2024-12-01T09:52:20.4734835' AS DateTime2), 13)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'1a1eb457-4e8e-4333-8ab6-f1a2b7703b90', N'22aae825-e436-4532-b92b-5c8a1bcc88ad', N'efbe3ff8-a8cb-408b-b2de-f0cdc5f03d55', 0, CAST(N'2024-12-01T09:52:20.4222317' AS DateTime2), 17)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'129dab60-e17f-42c7-9a07-f73898085815', N'22aae825-e436-4532-b92b-5c8a1bcc88ad', N'4723cac1-52f7-43bb-8d3f-bfb3b6c28a96', 0, CAST(N'2024-12-01T09:52:20.4680588' AS DateTime2), 24)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'dbb97572-7ade-489f-a840-fc2eb1332d1f', N'114be4a4-f231-4d0d-8eb4-6ccac85798be', N'cdaf282b-23f7-42a5-b099-22cd38a5c8b1', 0, CAST(N'2024-12-02T18:14:46.1210161' AS DateTime2), 21)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'dc4b49c9-116f-4711-8f9b-fd0abb78ea80', N'22aae825-e436-4532-b92b-5c8a1bcc88ad', N'1b68a81a-b654-4896-9195-84abfb081103', 0, CAST(N'2024-12-01T09:52:20.4473296' AS DateTime2), 28)
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
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'398a3b0d-0cea-4d66-88a0-00b57bcd1957', N'22aae825-e436-4532-b92b-5c8a1bcc88ad', N'32f207a2-02ba-4b83-8c71-03af11657c63', N'1a419b16-146c-4fae-b892-0c4b24533c8f', 3, 0, CAST(N'2024-12-02T18:16:34.5478427' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'0d89cf2c-8a4c-4981-ad00-03a246f7c79b', N'22aae825-e436-4532-b92b-5c8a1bcc88ad', N'55fc6d0e-50b3-4876-bf93-ee3937daeb62', N'5cc569ea-2d85-43bd-b5c8-7408822ff00a', 3, 0, CAST(N'2024-12-02T18:19:07.4801438' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'a0cb00c5-8fbe-4af6-88af-090ddb98c0e6', N'114be4a4-f231-4d0d-8eb4-6ccac85798be', N'70be578e-af27-4056-a6ad-55990f86b3e7', N'e10ebebb-a683-471e-a207-c9659b061849', 15, 0, CAST(N'2024-12-02T18:22:23.4843803' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'1a658534-6840-491f-9571-09a9967ca604', N'22aae825-e436-4532-b92b-5c8a1bcc88ad', N'55fc6d0e-50b3-4876-bf93-ee3937daeb62', N'40a9e245-c3f6-463f-81ff-a872cea61351', 4, 0, CAST(N'2024-12-02T18:19:07.4439831' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'4934ac05-9fc2-4a68-a7b9-0a2c0a20c6ad', N'22aae825-e436-4532-b92b-5c8a1bcc88ad', N'32f207a2-02ba-4b83-8c71-03af11657c63', N'05f8587b-f452-45f1-98c6-52a8ca10fd3c', 9, 0, CAST(N'2024-12-02T18:16:34.6151291' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'a122b9d6-4d38-497a-811e-0b6c8144d2ec', N'22aae825-e436-4532-b92b-5c8a1bcc88ad', N'dd3c7e8b-3dc7-45d2-a2bd-282de7d5e2de', N'1a419b16-146c-4fae-b892-0c4b24533c8f', 3, 0, CAST(N'2024-12-02T18:17:36.4051006' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'79cce0c8-b88a-4c60-9145-0d2bcb31d8c2', N'22aae825-e436-4532-b92b-5c8a1bcc88ad', N'55fc6d0e-50b3-4876-bf93-ee3937daeb62', N'1a1eb457-4e8e-4333-8ab6-f1a2b7703b90', 2, 0, CAST(N'2024-12-02T18:19:07.5176952' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'0e5ee76f-67c2-443f-b37d-0d57b23b6a52', N'22aae825-e436-4532-b92b-5c8a1bcc88ad', N'dd3c7e8b-3dc7-45d2-a2bd-282de7d5e2de', N'5cc569ea-2d85-43bd-b5c8-7408822ff00a', 3, 0, CAST(N'2024-12-02T18:17:36.4206888' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'81294056-ee42-4684-ac38-0fa5d62930e8', N'22aae825-e436-4532-b92b-5c8a1bcc88ad', N'55fc6d0e-50b3-4876-bf93-ee3937daeb62', N'e0717241-b47c-45ce-81ae-d461d33c5870', 6, 0, CAST(N'2024-12-02T18:19:07.5687205' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'28ce5789-61bc-4615-b752-11a86636187c', N'22aae825-e436-4532-b92b-5c8a1bcc88ad', N'dd3c7e8b-3dc7-45d2-a2bd-282de7d5e2de', N'1d001157-8381-415a-b376-a5694141b022', 2, 0, CAST(N'2024-12-02T18:17:36.4098938' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'2beb362a-63f2-4212-b3b5-11d3d08a7588', N'22aae825-e436-4532-b92b-5c8a1bcc88ad', N'dd3c7e8b-3dc7-45d2-a2bd-282de7d5e2de', N'24689d73-403d-4533-93ef-8ad229d23ece', 0, 0, CAST(N'2024-12-02T18:17:36.4534234' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'ac61ffc7-63f5-4a01-b3e2-132d9f608981', N'22aae825-e436-4532-b92b-5c8a1bcc88ad', N'2d1c4b21-92b0-4105-9151-0980a4c924ad', N'e0717241-b47c-45ce-81ae-d461d33c5870', 6, 0, CAST(N'2024-12-02T18:18:14.4824091' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'0a7155e3-c435-4be5-adc9-19fd295b7146', N'22aae825-e436-4532-b92b-5c8a1bcc88ad', N'2d1c4b21-92b0-4105-9151-0980a4c924ad', N'5cc569ea-2d85-43bd-b5c8-7408822ff00a', 3, 0, CAST(N'2024-12-02T18:18:14.3957930' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'4f37cab5-8555-4124-8b78-1a25f3a20cdc', N'22aae825-e436-4532-b92b-5c8a1bcc88ad', N'2d1c4b21-92b0-4105-9151-0980a4c924ad', N'7000a6b6-c54e-4d13-a282-cf5d0a2b93bd', 3, 0, CAST(N'2024-12-02T18:18:14.4019393' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'f16b3b73-1a7d-4b6a-8d76-1b42af21c916', N'114be4a4-f231-4d0d-8eb4-6ccac85798be', N'70be578e-af27-4056-a6ad-55990f86b3e7', N'dba9b054-f8fc-4965-809e-5e64401bcb4d', 5, 0, CAST(N'2024-12-02T18:22:23.4936917' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'080c2cbd-f3b0-4ca0-8263-1c3b9fbffd57', N'22aae825-e436-4532-b92b-5c8a1bcc88ad', N'2d1c4b21-92b0-4105-9151-0980a4c924ad', N'1a419b16-146c-4fae-b892-0c4b24533c8f', 3, 0, CAST(N'2024-12-02T18:18:14.3760736' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'0bcafbb3-f52d-4646-a54e-1d56056e2b03', N'22aae825-e436-4532-b92b-5c8a1bcc88ad', N'32f207a2-02ba-4b83-8c71-03af11657c63', N'9618bcf6-b30b-476e-bc0d-5c5a1e10dae1', 2, 0, CAST(N'2024-12-02T18:16:34.5995955' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'669da2b0-be17-466a-9ebb-1d5859b63488', N'114be4a4-f231-4d0d-8eb4-6ccac85798be', N'd3f15e0a-7ac8-4f28-b93e-f8c11eee7fcf', N'dba9b054-f8fc-4965-809e-5e64401bcb4d', 5, 0, CAST(N'2024-12-02T18:23:47.7542839' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'94a07393-7d61-4697-97c1-1e7619fb5447', N'114be4a4-f231-4d0d-8eb4-6ccac85798be', N'70be578e-af27-4056-a6ad-55990f86b3e7', N'c3f26296-f504-4a5e-9ede-6be6db0193a0', 10, 0, CAST(N'2024-12-02T18:22:23.5037400' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'8c88b6da-ea7f-403a-8369-22450fa3a6b6', N'22aae825-e436-4532-b92b-5c8a1bcc88ad', N'32f207a2-02ba-4b83-8c71-03af11657c63', N'1d001157-8381-415a-b376-a5694141b022', 3, 0, CAST(N'2024-12-02T18:16:34.5519665' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'90e775a7-8b3a-42cf-9b09-232fca505bcd', N'22aae825-e436-4532-b92b-5c8a1bcc88ad', N'32f207a2-02ba-4b83-8c71-03af11657c63', N'dc4b49c9-116f-4711-8f9b-fd0abb78ea80', 6, 0, CAST(N'2024-12-02T18:16:34.6200765' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'd4ce6bd1-0cdd-4a4d-883e-25ba5bd07722', N'22aae825-e436-4532-b92b-5c8a1bcc88ad', N'55fc6d0e-50b3-4876-bf93-ee3937daeb62', N'a095027e-cca4-4ec6-a1cf-ce723380bcaf', 4, 0, CAST(N'2024-12-02T18:19:07.4360174' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'274491ef-5e5c-4276-a0a2-268e0752b90d', N'22aae825-e436-4532-b92b-5c8a1bcc88ad', N'55fc6d0e-50b3-4876-bf93-ee3937daeb62', N'1a419b16-146c-4fae-b892-0c4b24533c8f', 3, 0, CAST(N'2024-12-02T18:19:07.4601354' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'6352af4b-3054-4683-92f8-28bd78abb7b8', N'22aae825-e436-4532-b92b-5c8a1bcc88ad', N'55fc6d0e-50b3-4876-bf93-ee3937daeb62', N'637f9abf-92d0-421a-96f0-1c4b1d352094', 3, 0, CAST(N'2024-12-02T18:19:07.4728392' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'63c3d86d-97b4-43fe-b84b-31ea7f0062f7', N'22aae825-e436-4532-b92b-5c8a1bcc88ad', N'2d1c4b21-92b0-4105-9151-0980a4c924ad', N'dc4b49c9-116f-4711-8f9b-fd0abb78ea80', 0, 0, CAST(N'2024-12-02T18:18:14.4679545' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'f0889614-89bc-4677-bc2c-33c58886db5f', N'22aae825-e436-4532-b92b-5c8a1bcc88ad', N'dd3c7e8b-3dc7-45d2-a2bd-282de7d5e2de', N'9618bcf6-b30b-476e-bc0d-5c5a1e10dae1', 0, 0, CAST(N'2024-12-02T18:17:36.4653017' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'734b5127-3988-4265-b355-33e44ae74c85', N'114be4a4-f231-4d0d-8eb4-6ccac85798be', N'd3f15e0a-7ac8-4f28-b93e-f8c11eee7fcf', N'e13cf2ba-b420-49a0-bc9a-cc66b98837b8', 10, 0, CAST(N'2024-12-02T18:23:47.7469704' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'7ec77f8b-e5f5-4642-b0a9-33f58388effd', N'114be4a4-f231-4d0d-8eb4-6ccac85798be', N'70be578e-af27-4056-a6ad-55990f86b3e7', N'8ecaa2d7-0ab2-49ef-baf4-5fe3aaf95233', 10, 0, CAST(N'2024-12-02T18:22:23.4787573' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'de57bc13-35ff-4640-a7c2-3859906074a8', N'22aae825-e436-4532-b92b-5c8a1bcc88ad', N'2d1c4b21-92b0-4105-9151-0980a4c924ad', N'a095027e-cca4-4ec6-a1cf-ce723380bcaf', 4, 0, CAST(N'2024-12-02T18:18:14.3541824' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'3f12076f-08e9-426a-999b-3ceb2a00adf8', N'22aae825-e436-4532-b92b-5c8a1bcc88ad', N'55fc6d0e-50b3-4876-bf93-ee3937daeb62', N'468e40c0-b593-4550-8b45-124c7968bccf', 9, 0, CAST(N'2024-12-02T18:19:07.5446432' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'73265c34-dee5-469a-9a94-3fecf735b4bc', N'114be4a4-f231-4d0d-8eb4-6ccac85798be', N'd3f15e0a-7ac8-4f28-b93e-f8c11eee7fcf', N'36472d1b-38a1-47a2-bb58-322b878ab68a', 0, 0, CAST(N'2024-12-02T18:23:47.7598269' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'2048e4cb-2e4f-4c60-82fc-43579923d37b', N'22aae825-e436-4532-b92b-5c8a1bcc88ad', N'dd3c7e8b-3dc7-45d2-a2bd-282de7d5e2de', N'f6f0be0e-9328-41a4-b867-2c4cb3b8ac13', 3, 0, CAST(N'2024-12-02T18:17:36.4365895' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'c6e926b2-b8bb-4887-a515-436b8f5fbcc2', N'22aae825-e436-4532-b92b-5c8a1bcc88ad', N'2d1c4b21-92b0-4105-9151-0980a4c924ad', N'a8951085-cac5-4783-8641-f1982d45be85', 3, 0, CAST(N'2024-12-02T18:18:14.4091203' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'1f7e0b0b-cff4-4175-abef-44ca378c979b', N'22aae825-e436-4532-b92b-5c8a1bcc88ad', N'dd3c7e8b-3dc7-45d2-a2bd-282de7d5e2de', N'6adbb6bf-4a55-41b9-acc3-e13009d539cb', 4, 0, CAST(N'2024-12-02T18:17:36.3999592' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'c83981ee-c359-4c2e-ac23-495b05a1aa47', N'22aae825-e436-4532-b92b-5c8a1bcc88ad', N'55fc6d0e-50b3-4876-bf93-ee3937daeb62', N'97714905-29c4-490d-b1a7-735dfc9a01c4', 9, 0, CAST(N'2024-12-02T18:19:07.5398678' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'b1fd2a45-7629-423a-ab06-4d9db642153f', N'22aae825-e436-4532-b92b-5c8a1bcc88ad', N'32f207a2-02ba-4b83-8c71-03af11657c63', N'1a1eb457-4e8e-4333-8ab6-f1a2b7703b90', 0, 0, CAST(N'2024-12-02T18:16:34.5856121' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'b5e4ad75-dcf1-4a07-b28a-4e69057b1b12', N'22aae825-e436-4532-b92b-5c8a1bcc88ad', N'55fc6d0e-50b3-4876-bf93-ee3937daeb62', N'dc4b49c9-116f-4711-8f9b-fd0abb78ea80', 6, 0, CAST(N'2024-12-02T18:19:07.5548257' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'3bb8cef7-03a0-4278-b67e-4f03faef2dc9', N'22aae825-e436-4532-b92b-5c8a1bcc88ad', N'2d1c4b21-92b0-4105-9151-0980a4c924ad', N'24689d73-403d-4533-93ef-8ad229d23ece', 2, 0, CAST(N'2024-12-02T18:18:14.4345925' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'd571a1bb-7f4f-45a8-b34d-514f274ebace', N'114be4a4-f231-4d0d-8eb4-6ccac85798be', N'70be578e-af27-4056-a6ad-55990f86b3e7', N'36472d1b-38a1-47a2-bb58-322b878ab68a', 15, 0, CAST(N'2024-12-02T18:22:23.4991406' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'c88986d6-acf6-4d6c-874d-516f95191505', N'22aae825-e436-4532-b92b-5c8a1bcc88ad', N'32f207a2-02ba-4b83-8c71-03af11657c63', N'663347d6-490d-4d95-aca2-ad73e68b2b2d', 4, 0, CAST(N'2024-12-02T18:16:34.5374800' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'01c570ab-0ad1-4baa-ad58-51b16a1f7f22', N'114be4a4-f231-4d0d-8eb4-6ccac85798be', N'd3f15e0a-7ac8-4f28-b93e-f8c11eee7fcf', N'0056bdf7-fcee-4f78-ae70-8b3bb17a2b74', 0, 0, CAST(N'2024-12-02T18:23:47.7146578' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'c5bc29ef-1a9d-465e-8a0c-5277a1553bc7', N'22aae825-e436-4532-b92b-5c8a1bcc88ad', N'2d1c4b21-92b0-4105-9151-0980a4c924ad', N'468e40c0-b593-4550-8b45-124c7968bccf', 9, 0, CAST(N'2024-12-02T18:18:14.4562035' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'ba508cf4-c15c-44cf-a195-551b3d08ac89', N'22aae825-e436-4532-b92b-5c8a1bcc88ad', N'2d1c4b21-92b0-4105-9151-0980a4c924ad', N'f8f2699d-e368-48f9-b84b-a0f6c03987f4', 2, 0, CAST(N'2024-12-02T18:18:14.4245477' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'a3443e64-24dc-4335-8ece-57bdcab0908d', N'22aae825-e436-4532-b92b-5c8a1bcc88ad', N'55fc6d0e-50b3-4876-bf93-ee3937daeb62', N'e566445c-5c44-4227-962f-1b24038423ac', 6, 0, CAST(N'2024-12-02T18:19:07.5594795' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'ecd8f8a5-6b05-415d-a363-5bb7ca2e6e12', N'22aae825-e436-4532-b92b-5c8a1bcc88ad', N'55fc6d0e-50b3-4876-bf93-ee3937daeb62', N'f6f0be0e-9328-41a4-b867-2c4cb3b8ac13', 3, 0, CAST(N'2024-12-02T18:19:07.5061909' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'18db2d4f-cfdd-4cd4-b4e1-5ea9351f3df0', N'22aae825-e436-4532-b92b-5c8a1bcc88ad', N'55fc6d0e-50b3-4876-bf93-ee3937daeb62', N'663347d6-490d-4d95-aca2-ad73e68b2b2d', 4, 0, CAST(N'2024-12-02T18:19:07.4493730' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'e38cc1d6-e59d-4d3a-b45f-6187e1a2d867', N'22aae825-e436-4532-b92b-5c8a1bcc88ad', N'2d1c4b21-92b0-4105-9151-0980a4c924ad', N'97714905-29c4-490d-b1a7-735dfc9a01c4', 9, 0, CAST(N'2024-12-02T18:18:14.4517641' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'53e6dc83-7188-401b-aa41-6230a19a563e', N'22aae825-e436-4532-b92b-5c8a1bcc88ad', N'dd3c7e8b-3dc7-45d2-a2bd-282de7d5e2de', N'a095027e-cca4-4ec6-a1cf-ce723380bcaf', 4, 0, CAST(N'2024-12-02T18:17:36.3830957' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'23c0ad70-1dd7-4f09-a346-6259371a607d', N'114be4a4-f231-4d0d-8eb4-6ccac85798be', N'70be578e-af27-4056-a6ad-55990f86b3e7', N'e61d20d5-5c94-42eb-bc72-b06fd8a2203f', 15, 0, CAST(N'2024-12-02T18:22:23.4735932' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'35151698-8d33-4440-81d9-633cf9a96a3d', N'22aae825-e436-4532-b92b-5c8a1bcc88ad', N'dd3c7e8b-3dc7-45d2-a2bd-282de7d5e2de', N'1a1eb457-4e8e-4333-8ab6-f1a2b7703b90', 0, 0, CAST(N'2024-12-02T18:17:36.4469443' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'97caf1d0-869c-4b90-a1b3-66c865e58ed6', N'22aae825-e436-4532-b92b-5c8a1bcc88ad', N'dd3c7e8b-3dc7-45d2-a2bd-282de7d5e2de', N'663347d6-490d-4d95-aca2-ad73e68b2b2d', 4, 0, CAST(N'2024-12-02T18:17:36.3953878' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'3b9d9610-3cba-4c41-9ec8-673c203e79b9', N'22aae825-e436-4532-b92b-5c8a1bcc88ad', N'55fc6d0e-50b3-4876-bf93-ee3937daeb62', N'05f8587b-f452-45f1-98c6-52a8ca10fd3c', 9, 0, CAST(N'2024-12-02T18:19:07.5490890' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'82d7c5ce-d989-4ff3-898e-67f4a4bb27a2', N'114be4a4-f231-4d0d-8eb4-6ccac85798be', N'70be578e-af27-4056-a6ad-55990f86b3e7', N'dbb97572-7ade-489f-a840-fc2eb1332d1f', 5, 0, CAST(N'2024-12-02T18:22:23.5080523' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'0d5416ac-cd31-43c2-a668-6a3c905ebef6', N'22aae825-e436-4532-b92b-5c8a1bcc88ad', N'32f207a2-02ba-4b83-8c71-03af11657c63', N'97714905-29c4-490d-b1a7-735dfc9a01c4', 9, 0, CAST(N'2024-12-02T18:16:34.6042308' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'1c4cf486-c535-488b-a06b-6f6ac28d8085', N'22aae825-e436-4532-b92b-5c8a1bcc88ad', N'32f207a2-02ba-4b83-8c71-03af11657c63', N'ce21918e-90c6-4ae9-90e2-c832daa1404d', 3, 0, CAST(N'2024-12-02T18:16:34.5949257' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'b8694bdd-bb30-490c-ab87-6fb2f1ce6433', N'22aae825-e436-4532-b92b-5c8a1bcc88ad', N'dd3c7e8b-3dc7-45d2-a2bd-282de7d5e2de', N'a8951085-cac5-4783-8641-f1982d45be85', 3, 0, CAST(N'2024-12-02T18:17:36.4304512' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'fc724d9a-e4ba-4ff5-b8d5-702798e94a90', N'22aae825-e436-4532-b92b-5c8a1bcc88ad', N'dd3c7e8b-3dc7-45d2-a2bd-282de7d5e2de', N'637f9abf-92d0-421a-96f0-1c4b1d352094', 3, 0, CAST(N'2024-12-02T18:17:36.4154346' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'4aa82220-3ac1-4823-8abf-7273d344954b', N'22aae825-e436-4532-b92b-5c8a1bcc88ad', N'55fc6d0e-50b3-4876-bf93-ee3937daeb62', N'a8951085-cac5-4783-8641-f1982d45be85', 2, 0, CAST(N'2024-12-02T18:19:07.4970506' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'eced7710-63cf-4fe3-940a-760e757b7d28', N'114be4a4-f231-4d0d-8eb4-6ccac85798be', N'd3f15e0a-7ac8-4f28-b93e-f8c11eee7fcf', N'dbb97572-7ade-489f-a840-fc2eb1332d1f', 5, 0, CAST(N'2024-12-02T18:23:47.7715564' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'4b47bba6-877b-4314-b13f-76f235899727', N'22aae825-e436-4532-b92b-5c8a1bcc88ad', N'32f207a2-02ba-4b83-8c71-03af11657c63', N'e566445c-5c44-4227-962f-1b24038423ac', 2, 0, CAST(N'2024-12-02T18:16:34.6254939' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'580fc76c-6ad8-43e5-80b2-783121986ce1', N'22aae825-e436-4532-b92b-5c8a1bcc88ad', N'2d1c4b21-92b0-4105-9151-0980a4c924ad', N'663347d6-490d-4d95-aca2-ad73e68b2b2d', 4, 0, CAST(N'2024-12-02T18:18:14.3648335' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'84cf0eba-5623-462a-8214-7cef615cf4ca', N'22aae825-e436-4532-b92b-5c8a1bcc88ad', N'dd3c7e8b-3dc7-45d2-a2bd-282de7d5e2de', N'e0717241-b47c-45ce-81ae-d461d33c5870', 6, 0, CAST(N'2024-12-02T18:17:36.5012576' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'96402f5e-35f3-4d84-942d-7f348d0a37dc', N'22aae825-e436-4532-b92b-5c8a1bcc88ad', N'dd3c7e8b-3dc7-45d2-a2bd-282de7d5e2de', N'4b1b71b1-9ac2-4f6a-b109-1568135e462e', 6, 0, CAST(N'2024-12-02T18:17:36.4965670' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'beeae2ab-30f9-4520-9f8a-7f59360a6001', N'114be4a4-f231-4d0d-8eb4-6ccac85798be', N'd3f15e0a-7ac8-4f28-b93e-f8c11eee7fcf', N'e61d20d5-5c94-42eb-bc72-b06fd8a2203f', 15, 0, CAST(N'2024-12-02T18:23:47.7258028' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'f23a7a46-95ca-43e8-bfb4-7f80a4509bc8', N'22aae825-e436-4532-b92b-5c8a1bcc88ad', N'2d1c4b21-92b0-4105-9151-0980a4c924ad', N'4b1b71b1-9ac2-4f6a-b109-1568135e462e', 0, 0, CAST(N'2024-12-02T18:18:14.4777820' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'ae875339-c404-47ab-a56a-815ba7e9c2e6', N'22aae825-e436-4532-b92b-5c8a1bcc88ad', N'32f207a2-02ba-4b83-8c71-03af11657c63', N'4b1b71b1-9ac2-4f6a-b109-1568135e462e', 6, 0, CAST(N'2024-12-02T18:16:34.6296549' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'd376c306-2ac5-4cf9-b6d0-82934724137f', N'22aae825-e436-4532-b92b-5c8a1bcc88ad', N'2d1c4b21-92b0-4105-9151-0980a4c924ad', N'6adbb6bf-4a55-41b9-acc3-e13009d539cb', 4, 0, CAST(N'2024-12-02T18:18:14.3699842' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'28317354-5d44-4176-894c-83cf83634a7f', N'22aae825-e436-4532-b92b-5c8a1bcc88ad', N'32f207a2-02ba-4b83-8c71-03af11657c63', N'7000a6b6-c54e-4d13-a282-cf5d0a2b93bd', 0, 0, CAST(N'2024-12-02T18:16:34.5663979' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'571c9e53-acb8-4008-b9fd-861f2be1060a', N'22aae825-e436-4532-b92b-5c8a1bcc88ad', N'2d1c4b21-92b0-4105-9151-0980a4c924ad', N'637f9abf-92d0-421a-96f0-1c4b1d352094', 3, 0, CAST(N'2024-12-02T18:18:14.3870098' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'4c4ae26e-0c74-4d88-a192-8b66a55b37ef', N'22aae825-e436-4532-b92b-5c8a1bcc88ad', N'2d1c4b21-92b0-4105-9151-0980a4c924ad', N'1a1eb457-4e8e-4333-8ab6-f1a2b7703b90', 2, 0, CAST(N'2024-12-02T18:18:14.4298839' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'59782676-2acc-4cfd-8250-8bda10185b34', N'22aae825-e436-4532-b92b-5c8a1bcc88ad', N'32f207a2-02ba-4b83-8c71-03af11657c63', N'e0717241-b47c-45ce-81ae-d461d33c5870', 6, 0, CAST(N'2024-12-02T18:16:34.6343174' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'180d5fd0-1e90-419a-8ca0-8f20c19faa5d', N'22aae825-e436-4532-b92b-5c8a1bcc88ad', N'32f207a2-02ba-4b83-8c71-03af11657c63', N'f6f0be0e-9328-41a4-b867-2c4cb3b8ac13', 0, 0, CAST(N'2024-12-02T18:16:34.5769143' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'b5c90ea6-69b9-4683-bfb6-9404fd71df0e', N'22aae825-e436-4532-b92b-5c8a1bcc88ad', N'32f207a2-02ba-4b83-8c71-03af11657c63', N'40a9e245-c3f6-463f-81ff-a872cea61351', 4, 0, CAST(N'2024-12-02T18:16:34.5319508' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'b7e4e9f6-78ed-4901-ad18-952206cd138b', N'22aae825-e436-4532-b92b-5c8a1bcc88ad', N'55fc6d0e-50b3-4876-bf93-ee3937daeb62', N'9618bcf6-b30b-476e-bc0d-5c5a1e10dae1', 2, 0, CAST(N'2024-12-02T18:19:07.5343957' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'eb50b2ee-98fc-4935-b0a4-98fe74399dc5', N'22aae825-e436-4532-b92b-5c8a1bcc88ad', N'32f207a2-02ba-4b83-8c71-03af11657c63', N'a8951085-cac5-4783-8641-f1982d45be85', 0, 0, CAST(N'2024-12-02T18:16:34.5712874' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'9be72fa1-1861-4351-a7ad-9ae7c05283d8', N'22aae825-e436-4532-b92b-5c8a1bcc88ad', N'55fc6d0e-50b3-4876-bf93-ee3937daeb62', N'f8f2699d-e368-48f9-b84b-a0f6c03987f4', 3, 0, CAST(N'2024-12-02T18:19:07.5119848' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'35f07812-829a-4d3b-b6ef-9f5055dea8a7', N'22aae825-e436-4532-b92b-5c8a1bcc88ad', N'dd3c7e8b-3dc7-45d2-a2bd-282de7d5e2de', N'e566445c-5c44-4227-962f-1b24038423ac', 6, 0, CAST(N'2024-12-02T18:17:36.4914820' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'61303d30-cdd4-4de7-bff8-a21ad4c8adba', N'22aae825-e436-4532-b92b-5c8a1bcc88ad', N'dd3c7e8b-3dc7-45d2-a2bd-282de7d5e2de', N'468e40c0-b593-4550-8b45-124c7968bccf', 6, 0, CAST(N'2024-12-02T18:17:36.4758608' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'7347efb0-c55a-4210-8091-a8884c2ab1da', N'22aae825-e436-4532-b92b-5c8a1bcc88ad', N'32f207a2-02ba-4b83-8c71-03af11657c63', N'f8f2699d-e368-48f9-b84b-a0f6c03987f4', 0, 0, CAST(N'2024-12-02T18:16:34.5808640' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'27437798-b922-42b4-a9fa-abd74730b28c', N'22aae825-e436-4532-b92b-5c8a1bcc88ad', N'32f207a2-02ba-4b83-8c71-03af11657c63', N'468e40c0-b593-4550-8b45-124c7968bccf', 9, 0, CAST(N'2024-12-02T18:16:34.6088721' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'dd95fa45-92c6-46fa-a4f7-aea1ef779ae5', N'22aae825-e436-4532-b92b-5c8a1bcc88ad', N'2d1c4b21-92b0-4105-9151-0980a4c924ad', N'9618bcf6-b30b-476e-bc0d-5c5a1e10dae1', 2, 0, CAST(N'2024-12-02T18:18:14.4465402' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'1dfe36cd-9943-4802-abb8-b1f4c353aa03', N'22aae825-e436-4532-b92b-5c8a1bcc88ad', N'dd3c7e8b-3dc7-45d2-a2bd-282de7d5e2de', N'7000a6b6-c54e-4d13-a282-cf5d0a2b93bd', 3, 0, CAST(N'2024-12-02T18:17:36.4251721' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'e858865f-a9f3-4abb-b894-b290b342fb1e', N'22aae825-e436-4532-b92b-5c8a1bcc88ad', N'32f207a2-02ba-4b83-8c71-03af11657c63', N'5cc569ea-2d85-43bd-b5c8-7408822ff00a', 0, 0, CAST(N'2024-12-02T18:16:34.5621705' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'a2279dc8-cfb9-4233-bedc-b2a0a1697b06', N'22aae825-e436-4532-b92b-5c8a1bcc88ad', N'32f207a2-02ba-4b83-8c71-03af11657c63', N'637f9abf-92d0-421a-96f0-1c4b1d352094', 1, 0, CAST(N'2024-12-02T18:16:34.5568822' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'ef2479ac-cf2f-4603-882d-b57d0a8af357', N'22aae825-e436-4532-b92b-5c8a1bcc88ad', N'55fc6d0e-50b3-4876-bf93-ee3937daeb62', N'6adbb6bf-4a55-41b9-acc3-e13009d539cb', 4, 0, CAST(N'2024-12-02T18:19:07.4547126' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'19bd6977-e5a3-443f-b986-b6449f914efc', N'22aae825-e436-4532-b92b-5c8a1bcc88ad', N'dd3c7e8b-3dc7-45d2-a2bd-282de7d5e2de', N'f8f2699d-e368-48f9-b84b-a0f6c03987f4', 3, 0, CAST(N'2024-12-02T18:17:36.4417161' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'3b6be041-9ef7-4241-a0ac-b99df07cb52c', N'22aae825-e436-4532-b92b-5c8a1bcc88ad', N'32f207a2-02ba-4b83-8c71-03af11657c63', N'24689d73-403d-4533-93ef-8ad229d23ece', 0, 0, CAST(N'2024-12-02T18:16:34.5905930' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'0c952595-8892-447e-9608-c10e366140d4', N'22aae825-e436-4532-b92b-5c8a1bcc88ad', N'dd3c7e8b-3dc7-45d2-a2bd-282de7d5e2de', N'ce21918e-90c6-4ae9-90e2-c832daa1404d', 0, 0, CAST(N'2024-12-02T18:17:36.4591997' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'81bcc45b-469d-49a0-96a1-c12c883e2309', N'22aae825-e436-4532-b92b-5c8a1bcc88ad', N'55fc6d0e-50b3-4876-bf93-ee3937daeb62', N'24689d73-403d-4533-93ef-8ad229d23ece', 2, 0, CAST(N'2024-12-02T18:19:07.5246972' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'493818f4-bf7b-4483-862d-c2493dc49920', N'22aae825-e436-4532-b92b-5c8a1bcc88ad', N'55fc6d0e-50b3-4876-bf93-ee3937daeb62', N'4b1b71b1-9ac2-4f6a-b109-1568135e462e', 6, 0, CAST(N'2024-12-02T18:19:07.5634864' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'0c314f63-f75c-472c-ab6c-c3e99e30976c', N'114be4a4-f231-4d0d-8eb4-6ccac85798be', N'd3f15e0a-7ac8-4f28-b93e-f8c11eee7fcf', N'8ecaa2d7-0ab2-49ef-baf4-5fe3aaf95233', 10, 0, CAST(N'2024-12-02T18:23:47.7324003' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'd3c294d8-410e-4fe9-8a2b-c8e8e559131b', N'22aae825-e436-4532-b92b-5c8a1bcc88ad', N'dd3c7e8b-3dc7-45d2-a2bd-282de7d5e2de', N'dc4b49c9-116f-4711-8f9b-fd0abb78ea80', 6, 0, CAST(N'2024-12-02T18:17:36.4859856' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'ba59ae4d-e8c5-48af-90ee-cb5225a916b7', N'22aae825-e436-4532-b92b-5c8a1bcc88ad', N'55fc6d0e-50b3-4876-bf93-ee3937daeb62', N'ce21918e-90c6-4ae9-90e2-c832daa1404d', 3, 0, CAST(N'2024-12-02T18:19:07.5291417' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'c1448ade-763b-461d-82b3-cb6ea21a998a', N'22aae825-e436-4532-b92b-5c8a1bcc88ad', N'55fc6d0e-50b3-4876-bf93-ee3937daeb62', N'1d001157-8381-415a-b376-a5694141b022', 3, 0, CAST(N'2024-12-02T18:19:07.4663187' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'a7852c8f-0ade-43b2-ad9c-cbc5f2f62eeb', N'22aae825-e436-4532-b92b-5c8a1bcc88ad', N'2d1c4b21-92b0-4105-9151-0980a4c924ad', N'e566445c-5c44-4227-962f-1b24038423ac', 0, 0, CAST(N'2024-12-02T18:18:14.4731051' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'2e6fc564-3a0c-44b2-a3c7-d355b6c1a4b7', N'114be4a4-f231-4d0d-8eb4-6ccac85798be', N'd3f15e0a-7ac8-4f28-b93e-f8c11eee7fcf', N'e10ebebb-a683-471e-a207-c9659b061849', 15, 0, CAST(N'2024-12-02T18:23:47.7407429' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'd4d1e064-640a-4dcd-b9a0-da9710d6e908', N'22aae825-e436-4532-b92b-5c8a1bcc88ad', N'2d1c4b21-92b0-4105-9151-0980a4c924ad', N'ce21918e-90c6-4ae9-90e2-c832daa1404d', 3, 0, CAST(N'2024-12-02T18:18:14.4414690' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'92eb557f-e634-4061-9e96-dd077cf06e67', N'22aae825-e436-4532-b92b-5c8a1bcc88ad', N'2d1c4b21-92b0-4105-9151-0980a4c924ad', N'1d001157-8381-415a-b376-a5694141b022', 3, 0, CAST(N'2024-12-02T18:18:14.3810438' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'4fbf772e-a4db-49bf-9353-e492c9a4d075', N'22aae825-e436-4532-b92b-5c8a1bcc88ad', N'dd3c7e8b-3dc7-45d2-a2bd-282de7d5e2de', N'40a9e245-c3f6-463f-81ff-a872cea61351', 2, 0, CAST(N'2024-12-02T18:17:36.3900026' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'83c8f2b6-4932-40c9-90a9-ea1e8e389091', N'114be4a4-f231-4d0d-8eb4-6ccac85798be', N'70be578e-af27-4056-a6ad-55990f86b3e7', N'0056bdf7-fcee-4f78-ae70-8b3bb17a2b74', 15, 0, CAST(N'2024-12-02T18:22:23.4656797' AS DateTime2), 2)
GO
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'0e922823-1e9f-4ac3-b0da-ead19c0e96fe', N'114be4a4-f231-4d0d-8eb4-6ccac85798be', N'70be578e-af27-4056-a6ad-55990f86b3e7', N'e13cf2ba-b420-49a0-bc9a-cc66b98837b8', 10, 0, CAST(N'2024-12-02T18:22:23.4889152' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'12491454-f3f6-4e81-bc36-eba6a1f2a88b', N'22aae825-e436-4532-b92b-5c8a1bcc88ad', N'2d1c4b21-92b0-4105-9151-0980a4c924ad', N'f6f0be0e-9328-41a4-b867-2c4cb3b8ac13', 3, 0, CAST(N'2024-12-02T18:18:14.4175511' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'9c67d7ef-87ce-40e2-97b1-ebf686c63b0c', N'114be4a4-f231-4d0d-8eb4-6ccac85798be', N'd3f15e0a-7ac8-4f28-b93e-f8c11eee7fcf', N'c3f26296-f504-4a5e-9ede-6be6db0193a0', 10, 0, CAST(N'2024-12-02T18:23:47.7657709' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'9570a6fd-f583-43df-b3ef-f4c42fb26285', N'22aae825-e436-4532-b92b-5c8a1bcc88ad', N'dd3c7e8b-3dc7-45d2-a2bd-282de7d5e2de', N'97714905-29c4-490d-b1a7-735dfc9a01c4', 0, 0, CAST(N'2024-12-02T18:17:36.4707148' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'31f52f47-0c38-4b75-adad-f61947bf25fa', N'22aae825-e436-4532-b92b-5c8a1bcc88ad', N'dd3c7e8b-3dc7-45d2-a2bd-282de7d5e2de', N'05f8587b-f452-45f1-98c6-52a8ca10fd3c', 9, 0, CAST(N'2024-12-02T18:17:36.4805841' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'c271306f-e05c-40db-b9d1-f7a0d22e2716', N'22aae825-e436-4532-b92b-5c8a1bcc88ad', N'2d1c4b21-92b0-4105-9151-0980a4c924ad', N'05f8587b-f452-45f1-98c6-52a8ca10fd3c', 9, 0, CAST(N'2024-12-02T18:18:14.4615678' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'4498b29e-ff49-40cc-8c69-f8783e2f0109', N'22aae825-e436-4532-b92b-5c8a1bcc88ad', N'32f207a2-02ba-4b83-8c71-03af11657c63', N'6adbb6bf-4a55-41b9-acc3-e13009d539cb', 4, 0, CAST(N'2024-12-02T18:16:34.5425501' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'd8975066-0af5-4691-9e4e-fa83d718cf21', N'22aae825-e436-4532-b92b-5c8a1bcc88ad', N'2d1c4b21-92b0-4105-9151-0980a4c924ad', N'40a9e245-c3f6-463f-81ff-a872cea61351', 4, 0, CAST(N'2024-12-02T18:18:14.3591720' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'b0a53f1b-3d01-4996-adb0-fab6604703e5', N'22aae825-e436-4532-b92b-5c8a1bcc88ad', N'55fc6d0e-50b3-4876-bf93-ee3937daeb62', N'7000a6b6-c54e-4d13-a282-cf5d0a2b93bd', 3, 0, CAST(N'2024-12-02T18:19:07.4880712' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'e772017d-faa1-44bf-9ac7-ffb388ffd288', N'22aae825-e436-4532-b92b-5c8a1bcc88ad', N'32f207a2-02ba-4b83-8c71-03af11657c63', N'a095027e-cca4-4ec6-a1cf-ce723380bcaf', 4, 0, CAST(N'2024-12-02T18:16:34.5019113' AS DateTime2), 2)
GO
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'cfa9c99f-8be8-4d0b-bc03-0321eb3ed1a0', N'22aae825-e436-4532-b92b-5c8a1bcc88ad', N'70be578e-af27-4056-a6ad-55990f86b3e7', N'96402f5e-35f3-4d84-942d-7f348d0a37dc', 6, 0, CAST(N'2024-12-02T18:21:29.8684431' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'7c030d73-360e-4073-aa52-051d47da8cf2', N'22aae825-e436-4532-b92b-5c8a1bcc88ad', N'55fc6d0e-50b3-4876-bf93-ee3937daeb62', N'28ce5789-61bc-4615-b752-11a86636187c', 2, 0, CAST(N'2024-12-02T18:20:04.0215809' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'f0267bc5-a9eb-458d-945d-06e3d7b538c0', N'22aae825-e436-4532-b92b-5c8a1bcc88ad', N'55fc6d0e-50b3-4876-bf93-ee3937daeb62', N'2048e4cb-2e4f-4c60-82fc-43579923d37b', 3, 0, CAST(N'2024-12-02T18:20:04.0455590' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'9fe15fa6-7449-4ab7-bed6-06fd60d6ade1', N'22aae825-e436-4532-b92b-5c8a1bcc88ad', N'70be578e-af27-4056-a6ad-55990f86b3e7', N'4934ac05-9fc2-4a68-a7b9-0a2c0a20c6ad', 9, 0, CAST(N'2024-12-02T18:20:52.7547169' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'43e79eba-390b-4dd1-972f-093196a55487', N'22aae825-e436-4532-b92b-5c8a1bcc88ad', N'55fc6d0e-50b3-4876-bf93-ee3937daeb62', N'3b6be041-9ef7-4241-a0ac-b99df07cb52c', 0, 0, CAST(N'2024-12-02T18:19:52.6508071' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'c3c126e9-f502-4906-a5d8-097180918e68', N'22aae825-e436-4532-b92b-5c8a1bcc88ad', N'70be578e-af27-4056-a6ad-55990f86b3e7', N'7347efb0-c55a-4210-8091-a8884c2ab1da', 0, 0, CAST(N'2024-12-02T18:20:52.7189054' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'0707cdcc-812a-46c5-884a-0a16c2383924', N'22aae825-e436-4532-b92b-5c8a1bcc88ad', N'55fc6d0e-50b3-4876-bf93-ee3937daeb62', N'c271306f-e05c-40db-b9d1-f7a0d22e2716', 9, 0, CAST(N'2024-12-02T18:20:11.8129755' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'c6dc463f-e0d4-49d0-b88c-0aebcdf7c3e1', N'22aae825-e436-4532-b92b-5c8a1bcc88ad', N'55fc6d0e-50b3-4876-bf93-ee3937daeb62', N'1f7e0b0b-cff4-4175-abef-44ca378c979b', 4, 0, CAST(N'2024-12-02T18:20:04.0113705' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'b6b81e2f-7c78-4b3e-b57c-0c0760d20190', N'22aae825-e436-4532-b92b-5c8a1bcc88ad', N'55fc6d0e-50b3-4876-bf93-ee3937daeb62', N'c88986d6-acf6-4d6c-874d-516f95191505', 4, 0, CAST(N'2024-12-02T18:19:52.5992434' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'476aea54-ff27-4ce6-93a0-0e3c64280f1b', N'22aae825-e436-4532-b92b-5c8a1bcc88ad', N'70be578e-af27-4056-a6ad-55990f86b3e7', N'e38cc1d6-e59d-4d3a-b45f-6187e1a2d867', 9, 0, CAST(N'2024-12-02T18:21:42.8024729' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'22d13ebe-40ae-4da5-aa88-0ea0e7b2d87b', N'22aae825-e436-4532-b92b-5c8a1bcc88ad', N'55fc6d0e-50b3-4876-bf93-ee3937daeb62', N'28317354-5d44-4176-894c-83cf83634a7f', 0, 0, CAST(N'2024-12-02T18:19:52.6295386' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'74169942-8400-4f3b-b30f-0f33d2bff1ce', N'22aae825-e436-4532-b92b-5c8a1bcc88ad', N'55fc6d0e-50b3-4876-bf93-ee3937daeb62', N'27437798-b922-42b4-a9fa-abd74730b28c', 9, 0, CAST(N'2024-12-02T18:19:52.6692629' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'0532b6c4-c074-4258-98fd-108a79faa373', N'22aae825-e436-4532-b92b-5c8a1bcc88ad', N'70be578e-af27-4056-a6ad-55990f86b3e7', N'8c88b6da-ea7f-403a-8369-22450fa3a6b6', 3, 0, CAST(N'2024-12-02T18:20:52.6890746' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'37c58eea-eb2c-41da-b1c7-12f87360baff', N'22aae825-e436-4532-b92b-5c8a1bcc88ad', N'55fc6d0e-50b3-4876-bf93-ee3937daeb62', N'96402f5e-35f3-4d84-942d-7f348d0a37dc', 6, 0, CAST(N'2024-12-02T18:20:04.1048320' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'6f2648b3-05f4-4b19-b017-133e40328b5a', N'22aae825-e436-4532-b92b-5c8a1bcc88ad', N'55fc6d0e-50b3-4876-bf93-ee3937daeb62', N'c6e926b2-b8bb-4887-a515-436b8f5fbcc2', 3, 0, CAST(N'2024-12-02T18:20:11.7644513' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'b20d9906-1ea0-45b4-93c8-17b8b1b4a33b', N'22aae825-e436-4532-b92b-5c8a1bcc88ad', N'55fc6d0e-50b3-4876-bf93-ee3937daeb62', N'19bd6977-e5a3-443f-b986-b6449f914efc', 3, 0, CAST(N'2024-12-02T18:20:04.0505462' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'49f67ea1-8c81-4cd3-ae15-18713862fcfd', N'22aae825-e436-4532-b92b-5c8a1bcc88ad', N'70be578e-af27-4056-a6ad-55990f86b3e7', N'2048e4cb-2e4f-4c60-82fc-43579923d37b', 3, 0, CAST(N'2024-12-02T18:21:29.8134353' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'13fb8314-ad5c-4a2f-a934-1ac021b69ace', N'22aae825-e436-4532-b92b-5c8a1bcc88ad', N'70be578e-af27-4056-a6ad-55990f86b3e7', N'4f37cab5-8555-4124-8b78-1a25f3a20cdc', 3, 0, CAST(N'2024-12-02T18:21:42.7587845' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'b4451c04-22a0-4126-98de-1ac26bbdf05a', N'22aae825-e436-4532-b92b-5c8a1bcc88ad', N'55fc6d0e-50b3-4876-bf93-ee3937daeb62', N'580fc76c-6ad8-43e5-80b2-783121986ce1', 4, 0, CAST(N'2024-12-02T18:20:11.7295299' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'66a69678-0dc4-48cf-8ccc-1b51c274a3a6', N'22aae825-e436-4532-b92b-5c8a1bcc88ad', N'55fc6d0e-50b3-4876-bf93-ee3937daeb62', N'4fbf772e-a4db-49bf-9353-e492c9a4d075', 2, 0, CAST(N'2024-12-02T18:20:04.0017365' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'53cee9ab-f293-4b29-94fc-1f2cfec7c10d', N'22aae825-e436-4532-b92b-5c8a1bcc88ad', N'55fc6d0e-50b3-4876-bf93-ee3937daeb62', N'f0889614-89bc-4677-bc2c-33c58886db5f', 0, 0, CAST(N'2024-12-02T18:20:04.0690218' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'14c892d9-04d5-4b6c-9c73-202084705001', N'22aae825-e436-4532-b92b-5c8a1bcc88ad', N'70be578e-af27-4056-a6ad-55990f86b3e7', N'dd95fa45-92c6-46fa-a4f7-aea1ef779ae5', 2, 0, CAST(N'2024-12-02T18:21:42.7969890' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'8e741246-9659-4a21-ab84-206d4fd21aec', N'22aae825-e436-4532-b92b-5c8a1bcc88ad', N'70be578e-af27-4056-a6ad-55990f86b3e7', N'fc724d9a-e4ba-4ff5-b8d5-702798e94a90', 3, 0, CAST(N'2024-12-02T18:21:29.7931395' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'eec33347-a4af-404f-ac99-20c2d7e90d9b', N'22aae825-e436-4532-b92b-5c8a1bcc88ad', N'70be578e-af27-4056-a6ad-55990f86b3e7', N'b5c90ea6-69b9-4683-bfb6-9404fd71df0e', 4, 0, CAST(N'2024-12-02T18:20:52.6680880' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'023dd4b4-9920-4b20-9097-22597b43d67d', N'22aae825-e436-4532-b92b-5c8a1bcc88ad', N'70be578e-af27-4056-a6ad-55990f86b3e7', N'35f07812-829a-4d3b-b6ef-9f5055dea8a7', 6, 0, CAST(N'2024-12-02T18:21:29.8628969' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'cbf55ec9-c987-4285-9c7b-22eccbf35dd3', N'22aae825-e436-4532-b92b-5c8a1bcc88ad', N'70be578e-af27-4056-a6ad-55990f86b3e7', N'59782676-2acc-4cfd-8250-8bda10185b34', 6, 0, CAST(N'2024-12-02T18:20:52.7750253' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'94245042-3721-4e4c-a445-23707004d06f', N'22aae825-e436-4532-b92b-5c8a1bcc88ad', N'70be578e-af27-4056-a6ad-55990f86b3e7', N'b0a53f1b-3d01-4996-adb0-fab6604703e5', 3, 0, CAST(N'2024-12-02T18:21:12.4166375' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'5c86fa23-47d6-4bcf-8e65-2462f77df7ca', N'22aae825-e436-4532-b92b-5c8a1bcc88ad', N'70be578e-af27-4056-a6ad-55990f86b3e7', N'19bd6977-e5a3-443f-b986-b6449f914efc', 3, 0, CAST(N'2024-12-02T18:21:29.8178579' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'53f29d36-f053-4791-8ec9-287d05d69a98', N'22aae825-e436-4532-b92b-5c8a1bcc88ad', N'70be578e-af27-4056-a6ad-55990f86b3e7', N'b8694bdd-bb30-490c-ab87-6fb2f1ce6433', 3, 0, CAST(N'2024-12-02T18:21:29.8082574' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'73845ec5-587a-404a-95c9-2c6408cc4a8f', N'22aae825-e436-4532-b92b-5c8a1bcc88ad', N'55fc6d0e-50b3-4876-bf93-ee3937daeb62', N'0a7155e3-c435-4be5-adc9-19fd295b7146', 3, 0, CAST(N'2024-12-02T18:20:11.7547385' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'a909c571-4fff-47e1-9a8e-2e6c6f580b18', N'22aae825-e436-4532-b92b-5c8a1bcc88ad', N'55fc6d0e-50b3-4876-bf93-ee3937daeb62', N'1c4cf486-c535-488b-a06b-6f6ac28d8085', 3, 0, CAST(N'2024-12-02T18:19:52.6558058' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'24c49923-408a-4159-b015-30c820d281bc', N'22aae825-e436-4532-b92b-5c8a1bcc88ad', N'70be578e-af27-4056-a6ad-55990f86b3e7', N'd3c294d8-410e-4fe9-8a2b-c8e8e559131b', 6, 0, CAST(N'2024-12-02T18:21:29.8579147' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'1642178c-c7a4-48ab-b563-30e9f44ba668', N'114be4a4-f231-4d0d-8eb4-6ccac85798be', N'cdb5713c-fcb9-4105-8140-033fc2ac032e', N'0c314f63-f75c-472c-ab6c-c3e99e30976c', 10, 0, CAST(N'2024-12-02T18:25:46.5313701' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'f20ac318-443e-4389-9a6d-311ce7ec5da9', N'22aae825-e436-4532-b92b-5c8a1bcc88ad', N'70be578e-af27-4056-a6ad-55990f86b3e7', N'ecd8f8a5-6b05-415d-a363-5bb7ca2e6e12', 3, 0, CAST(N'2024-12-02T18:21:12.4264585' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'76b7d7d9-e1dd-4c7b-9853-341b4ace85d7', N'114be4a4-f231-4d0d-8eb4-6ccac85798be', N'cdb5713c-fcb9-4105-8140-033fc2ac032e', N'01c570ab-0ad1-4baa-ad58-51b16a1f7f22', 0, 0, CAST(N'2024-12-02T18:25:46.5158735' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'61ed6036-a1d8-43c8-b679-349043a64a07', N'22aae825-e436-4532-b92b-5c8a1bcc88ad', N'55fc6d0e-50b3-4876-bf93-ee3937daeb62', N'180d5fd0-1e90-419a-8ca0-8f20c19faa5d', 0, 0, CAST(N'2024-12-02T18:19:52.6385743' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'de0c5c71-71f4-44a1-82be-350358befc5d', N'22aae825-e436-4532-b92b-5c8a1bcc88ad', N'55fc6d0e-50b3-4876-bf93-ee3937daeb62', N'8c88b6da-ea7f-403a-8369-22450fa3a6b6', 3, 0, CAST(N'2024-12-02T18:19:52.6147242' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'7720c15a-d71e-49f0-89ba-351a12ce87fb', N'22aae825-e436-4532-b92b-5c8a1bcc88ad', N'70be578e-af27-4056-a6ad-55990f86b3e7', N'1dfe36cd-9943-4802-abb8-b1f4c353aa03', 3, 0, CAST(N'2024-12-02T18:21:29.8026316' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'a266c057-05e8-4c47-8331-35b68ee41659', N'114be4a4-f231-4d0d-8eb4-6ccac85798be', N'cdb5713c-fcb9-4105-8140-033fc2ac032e', N'82d7c5ce-d989-4ff3-898e-67f4a4bb27a2', 5, 0, CAST(N'2024-12-02T18:23:00.8705722' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'f82e0dd8-3cfa-4c6b-b528-35f50f07b6ca', N'22aae825-e436-4532-b92b-5c8a1bcc88ad', N'55fc6d0e-50b3-4876-bf93-ee3937daeb62', N'de57bc13-35ff-4640-a7c2-3859906074a8', 4, 0, CAST(N'2024-12-02T18:20:11.7194339' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'4f7df16a-3b2f-4c1c-b2cf-36ad7fc7d6e4', N'22aae825-e436-4532-b92b-5c8a1bcc88ad', N'55fc6d0e-50b3-4876-bf93-ee3937daeb62', N'e772017d-faa1-44bf-9ac7-ffb388ffd288', 4, 0, CAST(N'2024-12-02T18:19:52.5871036' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'a5043119-b460-489d-8e08-37fc6f5a2dd2', N'22aae825-e436-4532-b92b-5c8a1bcc88ad', N'70be578e-af27-4056-a6ad-55990f86b3e7', N'f23a7a46-95ca-43e8-bfb4-7f80a4509bc8', 0, 0, CAST(N'2024-12-02T18:21:42.8271648' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'676ec57a-3a96-45a7-bbac-399b35e33c71', N'114be4a4-f231-4d0d-8eb4-6ccac85798be', N'cdb5713c-fcb9-4105-8140-033fc2ac032e', N'83c8f2b6-4932-40c9-90a9-ea1e8e389091', 15, 0, CAST(N'2024-12-02T18:23:00.8217045' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'375f6167-49cc-4a86-afb8-3c0aedf20dd5', N'22aae825-e436-4532-b92b-5c8a1bcc88ad', N'70be578e-af27-4056-a6ad-55990f86b3e7', N'0bcafbb3-f52d-4646-a54e-1d56056e2b03', 2, 0, CAST(N'2024-12-02T18:20:52.7388899' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'8c48e925-0ada-4b0e-a0a3-3f6d23aff63c', N'22aae825-e436-4532-b92b-5c8a1bcc88ad', N'70be578e-af27-4056-a6ad-55990f86b3e7', N'18db2d4f-cfdd-4cd4-b4e1-5ea9351f3df0', 4, 0, CAST(N'2024-12-02T18:21:12.3873017' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'31a12fa0-1826-4f57-92be-41fb481d62a7', N'22aae825-e436-4532-b92b-5c8a1bcc88ad', N'55fc6d0e-50b3-4876-bf93-ee3937daeb62', N'0c952595-8892-447e-9608-c10e366140d4', 0, 0, CAST(N'2024-12-02T18:20:04.0645555' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'e4b8da00-5ab9-4d0f-8fbd-42b10b7e954c', N'114be4a4-f231-4d0d-8eb4-6ccac85798be', N'cdb5713c-fcb9-4105-8140-033fc2ac032e', N'73265c34-dee5-469a-9a94-3fecf735b4bc', 0, 0, CAST(N'2024-12-02T18:25:46.5502067' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'd175a7b5-f286-4de7-91cc-4768cdd6d4d2', N'114be4a4-f231-4d0d-8eb4-6ccac85798be', N'cdb5713c-fcb9-4105-8140-033fc2ac032e', N'd571a1bb-7f4f-45a8-b34d-514f274ebace', 15, 0, CAST(N'2024-12-02T18:23:00.8582493' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'3632d5de-ca9b-4e91-84c1-49d8a1726022', N'22aae825-e436-4532-b92b-5c8a1bcc88ad', N'55fc6d0e-50b3-4876-bf93-ee3937daeb62', N'd8975066-0af5-4691-9e4e-fa83d718cf21', 4, 0, CAST(N'2024-12-02T18:20:11.7245873' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'c24f3271-96d4-40f0-8f9d-4adea4868110', N'22aae825-e436-4532-b92b-5c8a1bcc88ad', N'70be578e-af27-4056-a6ad-55990f86b3e7', N'12491454-f3f6-4e81-bc36-eba6a1f2a88b', 3, 0, CAST(N'2024-12-02T18:21:42.7705388' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'1d6b4828-4770-4b5d-b37c-4b718031cd02', N'22aae825-e436-4532-b92b-5c8a1bcc88ad', N'55fc6d0e-50b3-4876-bf93-ee3937daeb62', N'61303d30-cdd4-4de7-bff8-a21ad4c8adba', 9, 0, CAST(N'2024-12-02T18:20:04.0789823' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'9fe3a7d3-1537-427a-86f1-4baceb60e2ad', N'22aae825-e436-4532-b92b-5c8a1bcc88ad', N'55fc6d0e-50b3-4876-bf93-ee3937daeb62', N'a7852c8f-0ade-43b2-ad9c-cbc5f2f62eeb', 6, 0, CAST(N'2024-12-02T18:20:11.8227030' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'c1511fa5-cc22-4474-ad4f-4bf2302725c3', N'22aae825-e436-4532-b92b-5c8a1bcc88ad', N'70be578e-af27-4056-a6ad-55990f86b3e7', N'4b47bba6-877b-4314-b13f-76f235899727', 6, 0, CAST(N'2024-12-02T18:20:52.7644789' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'4f149e12-987c-4f2a-90b7-4c41fe410eb8', N'22aae825-e436-4532-b92b-5c8a1bcc88ad', N'70be578e-af27-4056-a6ad-55990f86b3e7', N'ef2479ac-cf2f-4603-882d-b57d0a8af357', 4, 0, CAST(N'2024-12-02T18:21:12.3917274' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'952e885c-c615-4894-bed7-4c966a7ec675', N'22aae825-e436-4532-b92b-5c8a1bcc88ad', N'55fc6d0e-50b3-4876-bf93-ee3937daeb62', N'ac61ffc7-63f5-4a01-b3e2-132d9f608981', 6, 0, CAST(N'2024-12-02T18:20:11.8321448' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'107f9b96-0806-4c51-a1a7-4d58f26386bf', N'22aae825-e436-4532-b92b-5c8a1bcc88ad', N'70be578e-af27-4056-a6ad-55990f86b3e7', N'b7e4e9f6-78ed-4901-ad18-952206cd138b', 2, 0, CAST(N'2024-12-02T18:21:12.4534633' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'7bd9b631-ed24-4b48-8e2d-4eb05c4b8e6d', N'22aae825-e436-4532-b92b-5c8a1bcc88ad', N'55fc6d0e-50b3-4876-bf93-ee3937daeb62', N'ae875339-c404-47ab-a56a-815ba7e9c2e6', 6, 0, CAST(N'2024-12-02T18:19:52.6870107' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'806386e8-7770-435a-bd06-50e241e82e05', N'22aae825-e436-4532-b92b-5c8a1bcc88ad', N'70be578e-af27-4056-a6ad-55990f86b3e7', N'f0889614-89bc-4677-bc2c-33c58886db5f', 0, 0, CAST(N'2024-12-02T18:21:29.8377640' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'29e191d0-fcbb-49aa-bef7-51b6cbef37b1', N'22aae825-e436-4532-b92b-5c8a1bcc88ad', N'55fc6d0e-50b3-4876-bf93-ee3937daeb62', N'b8694bdd-bb30-490c-ab87-6fb2f1ce6433', 3, 0, CAST(N'2024-12-02T18:20:04.0400367' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'b87aa027-5592-4d7f-9f44-56e62878e8ac', N'22aae825-e436-4532-b92b-5c8a1bcc88ad', N'55fc6d0e-50b3-4876-bf93-ee3937daeb62', N'd4d1e064-640a-4dcd-b9a0-da9710d6e908', 3, 0, CAST(N'2024-12-02T18:20:11.7894383' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'56275bb1-f228-4466-acec-57df8faa761c', N'22aae825-e436-4532-b92b-5c8a1bcc88ad', N'70be578e-af27-4056-a6ad-55990f86b3e7', N'84cf0eba-5623-462a-8214-7cef615cf4ca', 6, 0, CAST(N'2024-12-02T18:21:29.8735665' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'898a7234-b25f-4838-88ea-5804822896cd', N'22aae825-e436-4532-b92b-5c8a1bcc88ad', N'55fc6d0e-50b3-4876-bf93-ee3937daeb62', N'12491454-f3f6-4e81-bc36-eba6a1f2a88b', 3, 0, CAST(N'2024-12-02T18:20:11.7689329' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'949be71b-0527-4281-9044-5874417ad1a0', N'22aae825-e436-4532-b92b-5c8a1bcc88ad', N'70be578e-af27-4056-a6ad-55990f86b3e7', N'571c9e53-acb8-4008-b9fd-861f2be1060a', 3, 0, CAST(N'2024-12-02T18:21:42.7473217' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'c370b065-9555-4d41-915d-587c96482cbe', N'22aae825-e436-4532-b92b-5c8a1bcc88ad', N'70be578e-af27-4056-a6ad-55990f86b3e7', N'35151698-8d33-4440-81d9-633cf9a96a3d', 0, 0, CAST(N'2024-12-02T18:21:29.8227883' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'4be8e128-22fa-4309-9191-589d01fa4b36', N'22aae825-e436-4532-b92b-5c8a1bcc88ad', N'55fc6d0e-50b3-4876-bf93-ee3937daeb62', N'b1fd2a45-7629-423a-ab06-4d9db642153f', 0, 0, CAST(N'2024-12-02T18:19:52.6471423' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'44d3681e-c196-4c31-b4ee-58c9da29f42e', N'22aae825-e436-4532-b92b-5c8a1bcc88ad', N'70be578e-af27-4056-a6ad-55990f86b3e7', N'28317354-5d44-4176-894c-83cf83634a7f', 0, 0, CAST(N'2024-12-02T18:20:52.7042964' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'ff6228ac-cb03-4e36-998d-5b8fd87b6f8e', N'22aae825-e436-4532-b92b-5c8a1bcc88ad', N'55fc6d0e-50b3-4876-bf93-ee3937daeb62', N'c5bc29ef-1a9d-465e-8a0c-5277a1553bc7', 9, 0, CAST(N'2024-12-02T18:20:11.8079922' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'3c3ae512-21c3-4e16-9a02-5bd6442bd35e', N'22aae825-e436-4532-b92b-5c8a1bcc88ad', N'70be578e-af27-4056-a6ad-55990f86b3e7', N'3b6be041-9ef7-4241-a0ac-b99df07cb52c', 0, 0, CAST(N'2024-12-02T18:20:52.7292062' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'e2670c45-8248-4011-8ee4-5c193a6b0a47', N'22aae825-e436-4532-b92b-5c8a1bcc88ad', N'70be578e-af27-4056-a6ad-55990f86b3e7', N'c5bc29ef-1a9d-465e-8a0c-5277a1553bc7', 9, 0, CAST(N'2024-12-02T18:21:42.8075897' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'91a279d2-62c2-4476-bace-5dd34ab57717', N'22aae825-e436-4532-b92b-5c8a1bcc88ad', N'70be578e-af27-4056-a6ad-55990f86b3e7', N'9570a6fd-f583-43df-b3ef-f4c42fb26285', 0, 0, CAST(N'2024-12-02T18:21:29.8428133' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'40c63aca-356d-4138-a0c8-5e5b1375b623', N'22aae825-e436-4532-b92b-5c8a1bcc88ad', N'55fc6d0e-50b3-4876-bf93-ee3937daeb62', N'59782676-2acc-4cfd-8250-8bda10185b34', 6, 0, CAST(N'2024-12-02T18:19:52.6914845' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'03789ef8-ae4a-4d14-8b13-5f923bd7096f', N'22aae825-e436-4532-b92b-5c8a1bcc88ad', N'70be578e-af27-4056-a6ad-55990f86b3e7', N'0d5416ac-cd31-43c2-a668-6a3c905ebef6', 9, 0, CAST(N'2024-12-02T18:20:52.7442851' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'd89e0e41-73b5-487e-9404-603d7677d550', N'22aae825-e436-4532-b92b-5c8a1bcc88ad', N'55fc6d0e-50b3-4876-bf93-ee3937daeb62', N'9570a6fd-f583-43df-b3ef-f4c42fb26285', 0, 0, CAST(N'2024-12-02T18:20:04.0738038' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'45594eae-ecf5-4a89-b0bf-617e460a392c', N'114be4a4-f231-4d0d-8eb4-6ccac85798be', N'cdb5713c-fcb9-4105-8140-033fc2ac032e', N'0e922823-1e9f-4ac3-b0da-ead19c0e96fe', 10, 0, CAST(N'2024-12-02T18:23:00.8458826' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'846bca70-a23f-4378-a612-65ec7af82ce2', N'114be4a4-f231-4d0d-8eb4-6ccac85798be', N'cdb5713c-fcb9-4105-8140-033fc2ac032e', N'734b5127-3988-4265-b355-33e44ae74c85', 10, 0, CAST(N'2024-12-02T18:25:46.5407827' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'67ab9dda-4e31-440f-af8b-6723677b7c63', N'22aae825-e436-4532-b92b-5c8a1bcc88ad', N'70be578e-af27-4056-a6ad-55990f86b3e7', N'c1448ade-763b-461d-82b3-cb6ea21a998a', 3, 0, CAST(N'2024-12-02T18:21:12.4015358' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'aae66299-893d-4eb5-bc45-6730370171a2', N'22aae825-e436-4532-b92b-5c8a1bcc88ad', N'70be578e-af27-4056-a6ad-55990f86b3e7', N'28ce5789-61bc-4615-b752-11a86636187c', 2, 0, CAST(N'2024-12-02T18:21:29.7879040' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'431c46e4-37f9-4c85-9a56-678062c13de9', N'22aae825-e436-4532-b92b-5c8a1bcc88ad', N'70be578e-af27-4056-a6ad-55990f86b3e7', N'ac61ffc7-63f5-4a01-b3e2-132d9f608981', 6, 0, CAST(N'2024-12-02T18:21:42.8314282' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'd097a2b4-d9f1-40be-8a76-698a645332b0', N'22aae825-e436-4532-b92b-5c8a1bcc88ad', N'70be578e-af27-4056-a6ad-55990f86b3e7', N'274491ef-5e5c-4276-a0a2-268e0752b90d', 3, 0, CAST(N'2024-12-02T18:21:12.3968188' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'5aa35fb6-de5b-42ad-a082-69a9aa1346c7', N'22aae825-e436-4532-b92b-5c8a1bcc88ad', N'70be578e-af27-4056-a6ad-55990f86b3e7', N'580fc76c-6ad8-43e5-80b2-783121986ce1', 4, 0, CAST(N'2024-12-02T18:21:42.7259002' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'46b80b51-1b59-4c91-8a55-6a46a43628cd', N'22aae825-e436-4532-b92b-5c8a1bcc88ad', N'70be578e-af27-4056-a6ad-55990f86b3e7', N'61303d30-cdd4-4de7-bff8-a21ad4c8adba', 6, 0, CAST(N'2024-12-02T18:21:29.8479701' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'06c70163-dfb9-4d3a-bb7e-6af4f28ec7c8', N'22aae825-e436-4532-b92b-5c8a1bcc88ad', N'55fc6d0e-50b3-4876-bf93-ee3937daeb62', N'92eb557f-e634-4061-9e96-dd077cf06e67', 3, 0, CAST(N'2024-12-02T18:20:11.7449639' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'f63d3260-7568-4cbe-aeda-6f44386bd176', N'22aae825-e436-4532-b92b-5c8a1bcc88ad', N'70be578e-af27-4056-a6ad-55990f86b3e7', N'81bcc45b-469d-49a0-96a1-c12c883e2309', 2, 0, CAST(N'2024-12-02T18:21:12.4438431' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'97dfec78-7240-441a-903d-6fdf0daf948f', N'22aae825-e436-4532-b92b-5c8a1bcc88ad', N'70be578e-af27-4056-a6ad-55990f86b3e7', N'6352af4b-3054-4683-92f8-28bd78abb7b8', 3, 0, CAST(N'2024-12-02T18:21:12.4059254' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'2f90a122-dbc1-46f0-8c9e-708df84c23fa', N'22aae825-e436-4532-b92b-5c8a1bcc88ad', N'70be578e-af27-4056-a6ad-55990f86b3e7', N'a3443e64-24dc-4335-8ece-57bdcab0908d', 6, 0, CAST(N'2024-12-02T18:21:12.4795144' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'cb47f1bf-e689-4363-a227-7110835a1265', N'22aae825-e436-4532-b92b-5c8a1bcc88ad', N'70be578e-af27-4056-a6ad-55990f86b3e7', N'c83981ee-c359-4c2e-ac23-495b05a1aa47', 9, 0, CAST(N'2024-12-02T18:21:12.4594811' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'a293f333-efe5-4e75-8912-72bac6027f19', N'22aae825-e436-4532-b92b-5c8a1bcc88ad', N'55fc6d0e-50b3-4876-bf93-ee3937daeb62', N'e38cc1d6-e59d-4d3a-b45f-6187e1a2d867', 9, 0, CAST(N'2024-12-02T18:20:11.8024451' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'ae434a19-d56a-4fd2-be5c-738920142e4c', N'22aae825-e436-4532-b92b-5c8a1bcc88ad', N'70be578e-af27-4056-a6ad-55990f86b3e7', N'd8975066-0af5-4691-9e4e-fa83d718cf21', 4, 0, CAST(N'2024-12-02T18:21:42.7204000' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'4ef62888-f7cb-49e9-a365-769435246323', N'22aae825-e436-4532-b92b-5c8a1bcc88ad', N'55fc6d0e-50b3-4876-bf93-ee3937daeb62', N'31f52f47-0c38-4b75-adad-f61947bf25fa', 9, 0, CAST(N'2024-12-02T18:20:04.0872773' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'e54aa6d2-03c7-4655-a097-77694d330f6d', N'22aae825-e436-4532-b92b-5c8a1bcc88ad', N'55fc6d0e-50b3-4876-bf93-ee3937daeb62', N'e858865f-a9f3-4abb-b894-b290b342fb1e', 0, 0, CAST(N'2024-12-02T18:19:52.6245592' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'ac62ca29-80c1-44e2-b47a-797d7cc57657', N'114be4a4-f231-4d0d-8eb4-6ccac85798be', N'cdb5713c-fcb9-4105-8140-033fc2ac032e', N'beeae2ab-30f9-4520-9f8a-7f59360a6001', 15, 0, CAST(N'2024-12-02T18:25:46.5262033' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'55020746-fc7c-4810-ac11-7a850ee9da26', N'22aae825-e436-4532-b92b-5c8a1bcc88ad', N'55fc6d0e-50b3-4876-bf93-ee3937daeb62', N'080c2cbd-f3b0-4ca0-8263-1c3b9fbffd57', 3, 0, CAST(N'2024-12-02T18:20:11.7394464' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'cb31f865-9b4d-42ae-afd9-7b1316610997', N'22aae825-e436-4532-b92b-5c8a1bcc88ad', N'55fc6d0e-50b3-4876-bf93-ee3937daeb62', N'b5c90ea6-69b9-4683-bfb6-9404fd71df0e', 4, 0, CAST(N'2024-12-02T18:19:52.5932869' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'56a694e7-72fa-4188-a944-7bd68bad4e44', N'114be4a4-f231-4d0d-8eb4-6ccac85798be', N'cdb5713c-fcb9-4105-8140-033fc2ac032e', N'23c0ad70-1dd7-4f09-a346-6259371a607d', 15, 0, CAST(N'2024-12-02T18:23:00.8290047' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'1f111573-7ff9-4195-82d7-7fc234fac487', N'22aae825-e436-4532-b92b-5c8a1bcc88ad', N'55fc6d0e-50b3-4876-bf93-ee3937daeb62', N'3bb8cef7-03a0-4278-b67e-4f03faef2dc9', 2, 0, CAST(N'2024-12-02T18:20:11.7829711' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'fa587200-9b73-4ab6-8877-81975516e48a', N'22aae825-e436-4532-b92b-5c8a1bcc88ad', N'55fc6d0e-50b3-4876-bf93-ee3937daeb62', N'4c4ae26e-0c74-4d88-a192-8b66a55b37ef', 2, 0, CAST(N'2024-12-02T18:20:11.7785980' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'2775807c-a9d0-46b5-a092-82903a02698e', N'22aae825-e436-4532-b92b-5c8a1bcc88ad', N'70be578e-af27-4056-a6ad-55990f86b3e7', N'e858865f-a9f3-4abb-b894-b290b342fb1e', 0, 0, CAST(N'2024-12-02T18:20:52.6997437' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'44169101-a106-43f5-aac1-83df93c1db1d', N'22aae825-e436-4532-b92b-5c8a1bcc88ad', N'70be578e-af27-4056-a6ad-55990f86b3e7', N'c271306f-e05c-40db-b9d1-f7a0d22e2716', 9, 0, CAST(N'2024-12-02T18:21:42.8120792' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'ebcff781-be38-44dc-8cf8-88feb671b49a', N'22aae825-e436-4532-b92b-5c8a1bcc88ad', N'70be578e-af27-4056-a6ad-55990f86b3e7', N'd4d1e064-640a-4dcd-b9a0-da9710d6e908', 3, 0, CAST(N'2024-12-02T18:21:42.7921073' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'1fd3d31c-484b-4edc-9215-8a2b74c3c232', N'22aae825-e436-4532-b92b-5c8a1bcc88ad', N'70be578e-af27-4056-a6ad-55990f86b3e7', N'180d5fd0-1e90-419a-8ca0-8f20c19faa5d', 0, 0, CAST(N'2024-12-02T18:20:52.7142357' AS DateTime2), 2)
GO
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'1e0741c6-a417-4517-abd0-8b970b39924a', N'22aae825-e436-4532-b92b-5c8a1bcc88ad', N'70be578e-af27-4056-a6ad-55990f86b3e7', N'b5e4ad75-dcf1-4a07-b28a-4e69057b1b12', 6, 0, CAST(N'2024-12-02T18:21:12.4745972' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'db817039-0fb8-4af0-bf62-8bfc78d08845', N'22aae825-e436-4532-b92b-5c8a1bcc88ad', N'70be578e-af27-4056-a6ad-55990f86b3e7', N'90e775a7-8b3a-42cf-9b09-232fca505bcd', 6, 0, CAST(N'2024-12-02T18:20:52.7592986' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'897d1f0b-fa12-41f0-b0ca-8de9468d2c9f', N'22aae825-e436-4532-b92b-5c8a1bcc88ad', N'70be578e-af27-4056-a6ad-55990f86b3e7', N'a7852c8f-0ade-43b2-ad9c-cbc5f2f62eeb', 0, 0, CAST(N'2024-12-02T18:21:42.8224431' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'03e8ebb8-a4ef-4158-818b-8efdf523213f', N'22aae825-e436-4532-b92b-5c8a1bcc88ad', N'55fc6d0e-50b3-4876-bf93-ee3937daeb62', N'ba508cf4-c15c-44cf-a195-551b3d08ac89', 2, 0, CAST(N'2024-12-02T18:20:11.7739701' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'32ef165c-e9a8-48c9-8649-8fc768fbe462', N'22aae825-e436-4532-b92b-5c8a1bcc88ad', N'55fc6d0e-50b3-4876-bf93-ee3937daeb62', N'571c9e53-acb8-4008-b9fd-861f2be1060a', 3, 0, CAST(N'2024-12-02T18:20:11.7493206' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'f9b40c4e-58c5-4ce6-a9d3-8fe5701df5ab', N'22aae825-e436-4532-b92b-5c8a1bcc88ad', N'55fc6d0e-50b3-4876-bf93-ee3937daeb62', N'63c3d86d-97b4-43fe-b84b-31ea7f0062f7', 0, 0, CAST(N'2024-12-02T18:20:11.8176011' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'2585d1dd-83ce-4670-bba7-902d592d08d7', N'22aae825-e436-4532-b92b-5c8a1bcc88ad', N'70be578e-af27-4056-a6ad-55990f86b3e7', N'd4ce6bd1-0cdd-4a4d-883e-25ba5bd07722', 4, 0, CAST(N'2024-12-02T18:21:12.3776188' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'c3a3ee49-48b5-4fae-9ab7-9393045aa8c3', N'22aae825-e436-4532-b92b-5c8a1bcc88ad', N'70be578e-af27-4056-a6ad-55990f86b3e7', N'0c952595-8892-447e-9608-c10e366140d4', 0, 0, CAST(N'2024-12-02T18:21:29.8327328' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'1fa5fd1b-4878-49bd-900b-94f6b689c279', N'22aae825-e436-4532-b92b-5c8a1bcc88ad', N'70be578e-af27-4056-a6ad-55990f86b3e7', N'ba508cf4-c15c-44cf-a195-551b3d08ac89', 2, 0, CAST(N'2024-12-02T18:21:42.7769169' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'7ad8757f-c446-4c40-904a-962e9f331c3d', N'22aae825-e436-4532-b92b-5c8a1bcc88ad', N'55fc6d0e-50b3-4876-bf93-ee3937daeb62', N'4f37cab5-8555-4124-8b78-1a25f3a20cdc', 3, 0, CAST(N'2024-12-02T18:20:11.7599993' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'789234bd-13f2-4552-8b71-982b881d959a', N'22aae825-e436-4532-b92b-5c8a1bcc88ad', N'70be578e-af27-4056-a6ad-55990f86b3e7', N'9be72fa1-1861-4351-a7ad-9ae7c05283d8', 3, 0, CAST(N'2024-12-02T18:21:12.4320558' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'94ff4b95-d664-473f-8bc6-9a57a7e932b7', N'22aae825-e436-4532-b92b-5c8a1bcc88ad', N'70be578e-af27-4056-a6ad-55990f86b3e7', N'97caf1d0-869c-4b90-a1b3-66c865e58ed6', 4, 0, CAST(N'2024-12-02T18:21:29.7732271' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'f12fdbc7-dda5-4671-8586-9c12c8f6f8a1', N'22aae825-e436-4532-b92b-5c8a1bcc88ad', N'70be578e-af27-4056-a6ad-55990f86b3e7', N'1f7e0b0b-cff4-4175-abef-44ca378c979b', 4, 0, CAST(N'2024-12-02T18:21:29.7786177' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'1b94e458-8241-47d4-8db9-9e5518e39070', N'114be4a4-f231-4d0d-8eb4-6ccac85798be', N'cdb5713c-fcb9-4105-8140-033fc2ac032e', N'669da2b0-be17-466a-9ebb-1d5859b63488', 5, 0, CAST(N'2024-12-02T18:25:46.5455742' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'c6056a3f-0348-41e4-8867-9ebeeffb6ca9', N'22aae825-e436-4532-b92b-5c8a1bcc88ad', N'70be578e-af27-4056-a6ad-55990f86b3e7', N'53e6dc83-7188-401b-aa41-6230a19a563e', 4, 0, CAST(N'2024-12-02T18:21:29.7634285' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'd6102ab5-99b2-4205-8e48-9f770ed85b48', N'114be4a4-f231-4d0d-8eb4-6ccac85798be', N'cdb5713c-fcb9-4105-8140-033fc2ac032e', N'9c67d7ef-87ce-40e2-97b1-ebf686c63b0c', 10, 0, CAST(N'2024-12-02T18:25:46.5554204' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'047171ef-86cf-47d7-a3d5-9f93d8b9b1b9', N'22aae825-e436-4532-b92b-5c8a1bcc88ad', N'70be578e-af27-4056-a6ad-55990f86b3e7', N'4fbf772e-a4db-49bf-9353-e492c9a4d075', 2, 0, CAST(N'2024-12-02T18:21:29.7679275' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'9e7d12d0-3a4e-41aa-915c-a18e9c091581', N'22aae825-e436-4532-b92b-5c8a1bcc88ad', N'70be578e-af27-4056-a6ad-55990f86b3e7', N'398a3b0d-0cea-4d66-88a0-00b57bcd1957', 3, 0, CAST(N'2024-12-02T18:20:52.6845387' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'60240bdb-6a72-4bea-a4cb-a47f79b537fa', N'22aae825-e436-4532-b92b-5c8a1bcc88ad', N'70be578e-af27-4056-a6ad-55990f86b3e7', N'e772017d-faa1-44bf-9ac7-ffb388ffd288', 4, 0, CAST(N'2024-12-02T18:20:52.6610156' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'a2913a45-3270-46fc-9660-ab45f02291b0', N'22aae825-e436-4532-b92b-5c8a1bcc88ad', N'55fc6d0e-50b3-4876-bf93-ee3937daeb62', N'a122b9d6-4d38-497a-811e-0b6c8144d2ec', 3, 0, CAST(N'2024-12-02T18:20:04.0169195' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'551f0a2d-a557-413c-9925-ac15e0e7c198', N'22aae825-e436-4532-b92b-5c8a1bcc88ad', N'70be578e-af27-4056-a6ad-55990f86b3e7', N'2beb362a-63f2-4212-b3b5-11d3d08a7588', 0, 0, CAST(N'2024-12-02T18:21:29.8279196' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'0fda4da4-0af0-4b92-a610-acb5f652a36c', N'22aae825-e436-4532-b92b-5c8a1bcc88ad', N'55fc6d0e-50b3-4876-bf93-ee3937daeb62', N'fc724d9a-e4ba-4ff5-b8d5-702798e94a90', 3, 0, CAST(N'2024-12-02T18:20:04.0256956' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'c61326e2-df89-4fb6-ad0e-acc9c2defdd9', N'22aae825-e436-4532-b92b-5c8a1bcc88ad', N'70be578e-af27-4056-a6ad-55990f86b3e7', N'ae875339-c404-47ab-a56a-815ba7e9c2e6', 6, 0, CAST(N'2024-12-02T18:20:52.7697578' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'6f78d0b9-6e0f-446a-b514-aecf75011945', N'22aae825-e436-4532-b92b-5c8a1bcc88ad', N'70be578e-af27-4056-a6ad-55990f86b3e7', N'b1fd2a45-7629-423a-ab06-4d9db642153f', 0, 0, CAST(N'2024-12-02T18:20:52.7234059' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'cff0f05f-0fd6-4691-9cae-b0ac626a8663', N'114be4a4-f231-4d0d-8eb4-6ccac85798be', N'cdb5713c-fcb9-4105-8140-033fc2ac032e', N'2e6fc564-3a0c-44b2-a3c7-d355b6c1a4b7', 15, 0, CAST(N'2024-12-02T18:25:46.5357739' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'5b23d4b0-6ddd-4a34-b675-b251285b6bef', N'22aae825-e436-4532-b92b-5c8a1bcc88ad', N'55fc6d0e-50b3-4876-bf93-ee3937daeb62', N'eb50b2ee-98fc-4935-b0a4-98fe74399dc5', 0, 0, CAST(N'2024-12-02T18:19:52.6341142' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'a432e35a-4684-46ee-9490-b46e1f00f7e3', N'22aae825-e436-4532-b92b-5c8a1bcc88ad', N'55fc6d0e-50b3-4876-bf93-ee3937daeb62', N'4498b29e-ff49-40cc-8c69-f8783e2f0109', 4, 0, CAST(N'2024-12-02T18:19:52.6046626' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'd42dee49-c62c-41c6-98c9-b53f2a257f1b', N'22aae825-e436-4532-b92b-5c8a1bcc88ad', N'55fc6d0e-50b3-4876-bf93-ee3937daeb62', N'd376c306-2ac5-4cf9-b6d0-82934724137f', 4, 0, CAST(N'2024-12-02T18:20:11.7342756' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'4f2af278-2245-43a9-b236-b65ce48e4f94', N'22aae825-e436-4532-b92b-5c8a1bcc88ad', N'55fc6d0e-50b3-4876-bf93-ee3937daeb62', N'f23a7a46-95ca-43e8-bfb4-7f80a4509bc8', 6, 0, CAST(N'2024-12-02T18:20:11.8274441' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'42bc08b6-e94f-4f0f-8db7-b67f65656a08', N'22aae825-e436-4532-b92b-5c8a1bcc88ad', N'55fc6d0e-50b3-4876-bf93-ee3937daeb62', N'398a3b0d-0cea-4d66-88a0-00b57bcd1957', 3, 0, CAST(N'2024-12-02T18:19:52.6100545' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'18539dcc-0fe7-4a01-b160-b8e646ca8929', N'22aae825-e436-4532-b92b-5c8a1bcc88ad', N'70be578e-af27-4056-a6ad-55990f86b3e7', N'493818f4-bf7b-4483-862d-c2493dc49920', 6, 0, CAST(N'2024-12-02T18:21:12.4841517' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'ceb2f975-487b-41cc-96be-bc0537019483', N'22aae825-e436-4532-b92b-5c8a1bcc88ad', N'55fc6d0e-50b3-4876-bf93-ee3937daeb62', N'4934ac05-9fc2-4a68-a7b9-0a2c0a20c6ad', 9, 0, CAST(N'2024-12-02T18:19:52.6740735' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'17bf6d6d-1ed5-4ebb-b153-bc367821a1ea', N'22aae825-e436-4532-b92b-5c8a1bcc88ad', N'70be578e-af27-4056-a6ad-55990f86b3e7', N'3bb8cef7-03a0-4278-b67e-4f03faef2dc9', 2, 0, CAST(N'2024-12-02T18:21:42.7870480' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'8e3f649a-eb12-47b0-8abd-bc5d23fd39a3', N'22aae825-e436-4532-b92b-5c8a1bcc88ad', N'70be578e-af27-4056-a6ad-55990f86b3e7', N'0a7155e3-c435-4be5-adc9-19fd295b7146', 3, 0, CAST(N'2024-12-02T18:21:42.7531079' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'4b30c8f5-5bfb-4ca5-8cd2-beedc5dee1db', N'22aae825-e436-4532-b92b-5c8a1bcc88ad', N'70be578e-af27-4056-a6ad-55990f86b3e7', N'3f12076f-08e9-426a-999b-3ceb2a00adf8', 9, 0, CAST(N'2024-12-02T18:21:12.4647348' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'c0cc047f-6be0-49d1-a1f4-beff3a59fb8b', N'22aae825-e436-4532-b92b-5c8a1bcc88ad', N'70be578e-af27-4056-a6ad-55990f86b3e7', N'c88986d6-acf6-4d6c-874d-516f95191505', 4, 0, CAST(N'2024-12-02T18:20:52.6737856' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'6c04c8f7-f64f-4d05-911a-c1d30c3de448', N'22aae825-e436-4532-b92b-5c8a1bcc88ad', N'55fc6d0e-50b3-4876-bf93-ee3937daeb62', N'84cf0eba-5623-462a-8214-7cef615cf4ca', 6, 0, CAST(N'2024-12-02T18:20:04.1093999' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'bd9bca46-89d1-4974-80cf-c2a1f5477771', N'22aae825-e436-4532-b92b-5c8a1bcc88ad', N'70be578e-af27-4056-a6ad-55990f86b3e7', N'a2279dc8-cfb9-4233-bedc-b2a0a1697b06', 1, 0, CAST(N'2024-12-02T18:20:52.6943750' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'f3e62883-52ca-4dbf-aa1a-c3c7430739e4', N'22aae825-e436-4532-b92b-5c8a1bcc88ad', N'55fc6d0e-50b3-4876-bf93-ee3937daeb62', N'4b47bba6-877b-4314-b13f-76f235899727', 2, 0, CAST(N'2024-12-02T18:19:52.6825548' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'9daa3cca-297f-4883-913d-c3e29b2e895e', N'22aae825-e436-4532-b92b-5c8a1bcc88ad', N'55fc6d0e-50b3-4876-bf93-ee3937daeb62', N'a2279dc8-cfb9-4233-bedc-b2a0a1697b06', 1, 0, CAST(N'2024-12-02T18:19:52.6194174' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'9a80f473-3590-4a0b-9c02-c49315bbf36f', N'22aae825-e436-4532-b92b-5c8a1bcc88ad', N'55fc6d0e-50b3-4876-bf93-ee3937daeb62', N'0bcafbb3-f52d-4646-a54e-1d56056e2b03', 2, 0, CAST(N'2024-12-02T18:19:52.6606694' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'707f4e9a-5c8b-47c8-8af5-c56970391e97', N'22aae825-e436-4532-b92b-5c8a1bcc88ad', N'70be578e-af27-4056-a6ad-55990f86b3e7', N'92eb557f-e634-4061-9e96-dd077cf06e67', 3, 0, CAST(N'2024-12-02T18:21:42.7425366' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'a22c7425-4a39-40ba-a38a-c76f410cf28c', N'22aae825-e436-4532-b92b-5c8a1bcc88ad', N'55fc6d0e-50b3-4876-bf93-ee3937daeb62', N'dd95fa45-92c6-46fa-a4f7-aea1ef779ae5', 2, 0, CAST(N'2024-12-02T18:20:11.7960109' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'd6f68f5e-e073-4984-a7b8-c8e3b564b5ec', N'22aae825-e436-4532-b92b-5c8a1bcc88ad', N'70be578e-af27-4056-a6ad-55990f86b3e7', N'27437798-b922-42b4-a9fa-abd74730b28c', 9, 0, CAST(N'2024-12-02T18:20:52.7496422' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'3f979bb8-59c4-425a-a7a3-c93177b4930b', N'22aae825-e436-4532-b92b-5c8a1bcc88ad', N'55fc6d0e-50b3-4876-bf93-ee3937daeb62', N'53e6dc83-7188-401b-aa41-6230a19a563e', 4, 0, CAST(N'2024-12-02T18:20:03.9951131' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'c2bb5706-a54c-4f41-a462-c939ef8c30a4', N'22aae825-e436-4532-b92b-5c8a1bcc88ad', N'70be578e-af27-4056-a6ad-55990f86b3e7', N'a122b9d6-4d38-497a-811e-0b6c8144d2ec', 3, 0, CAST(N'2024-12-02T18:21:29.7834141' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'9a39e8f3-537e-409a-a70f-ca54f73d02d0', N'22aae825-e436-4532-b92b-5c8a1bcc88ad', N'70be578e-af27-4056-a6ad-55990f86b3e7', N'd376c306-2ac5-4cf9-b6d0-82934724137f', 4, 0, CAST(N'2024-12-02T18:21:42.7322109' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'fa948a47-b7f9-4377-aa39-cd1c57d517fe', N'22aae825-e436-4532-b92b-5c8a1bcc88ad', N'70be578e-af27-4056-a6ad-55990f86b3e7', N'eb50b2ee-98fc-4935-b0a4-98fe74399dc5', 0, 0, CAST(N'2024-12-02T18:20:52.7089451' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'31dfcbad-4515-4803-aaee-cd2ba323b352', N'22aae825-e436-4532-b92b-5c8a1bcc88ad', N'55fc6d0e-50b3-4876-bf93-ee3937daeb62', N'1dfe36cd-9943-4802-abb8-b1f4c353aa03', 3, 0, CAST(N'2024-12-02T18:20:04.0360812' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'41b358f4-e654-4435-9bdf-cfc67b2da1f1', N'22aae825-e436-4532-b92b-5c8a1bcc88ad', N'70be578e-af27-4056-a6ad-55990f86b3e7', N'79cce0c8-b88a-4c60-9145-0d2bcb31d8c2', 2, 0, CAST(N'2024-12-02T18:21:12.4382249' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'27753c3c-e566-4793-813c-d01c767be5fe', N'22aae825-e436-4532-b92b-5c8a1bcc88ad', N'70be578e-af27-4056-a6ad-55990f86b3e7', N'080c2cbd-f3b0-4ca0-8263-1c3b9fbffd57', 3, 0, CAST(N'2024-12-02T18:21:42.7378873' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'8714ab0a-da6f-47d5-8b59-d259c80fdeee', N'114be4a4-f231-4d0d-8eb4-6ccac85798be', N'cdb5713c-fcb9-4105-8140-033fc2ac032e', N'94a07393-7d61-4697-97c1-1e7619fb5447', 10, 0, CAST(N'2024-12-02T18:23:00.8638333' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'cbe22920-9751-4fa7-ac1c-d315eac27006', N'22aae825-e436-4532-b92b-5c8a1bcc88ad', N'70be578e-af27-4056-a6ad-55990f86b3e7', N'1a658534-6840-491f-9571-09a9967ca604', 4, 0, CAST(N'2024-12-02T18:21:12.3826627' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'29b35a15-119e-4e5b-a629-d71e1c01ed40', N'114be4a4-f231-4d0d-8eb4-6ccac85798be', N'cdb5713c-fcb9-4105-8140-033fc2ac032e', N'7ec77f8b-e5f5-4642-b0a9-33f58388effd', 10, 0, CAST(N'2024-12-02T18:23:00.8350128' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'6a46590e-53a9-4d28-86ec-d8e52a54f4e6', N'22aae825-e436-4532-b92b-5c8a1bcc88ad', N'55fc6d0e-50b3-4876-bf93-ee3937daeb62', N'2beb362a-63f2-4212-b3b5-11d3d08a7588', 0, 0, CAST(N'2024-12-02T18:20:04.0594751' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'50f5aaa9-7a79-4580-a1a7-da4d5a38752b', N'22aae825-e436-4532-b92b-5c8a1bcc88ad', N'70be578e-af27-4056-a6ad-55990f86b3e7', N'c6e926b2-b8bb-4887-a515-436b8f5fbcc2', 3, 0, CAST(N'2024-12-02T18:21:42.7648155' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'34abb33b-7315-4f7b-972a-dca9179d7112', N'22aae825-e436-4532-b92b-5c8a1bcc88ad', N'70be578e-af27-4056-a6ad-55990f86b3e7', N'4aa82220-3ac1-4823-8abf-7273d344954b', 2, 0, CAST(N'2024-12-02T18:21:12.4213073' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'a9468424-5f7d-434e-a86c-dd1f43fa6226', N'22aae825-e436-4532-b92b-5c8a1bcc88ad', N'55fc6d0e-50b3-4876-bf93-ee3937daeb62', N'35151698-8d33-4440-81d9-633cf9a96a3d', 0, 0, CAST(N'2024-12-02T18:20:04.0547917' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'551e7a24-6b48-4d5e-9cd7-dd577cee6ddb', N'22aae825-e436-4532-b92b-5c8a1bcc88ad', N'70be578e-af27-4056-a6ad-55990f86b3e7', N'4498b29e-ff49-40cc-8c69-f8783e2f0109', 4, 0, CAST(N'2024-12-02T18:20:52.6795405' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'361e5d57-40f0-4afc-80ed-df8a9117769c', N'22aae825-e436-4532-b92b-5c8a1bcc88ad', N'70be578e-af27-4056-a6ad-55990f86b3e7', N'81294056-ee42-4684-ac38-0fa5d62930e8', 6, 0, CAST(N'2024-12-02T18:21:12.4888022' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'3bcaffdf-62c6-4195-b91c-e23f3dc0d45d', N'114be4a4-f231-4d0d-8eb4-6ccac85798be', N'cdb5713c-fcb9-4105-8140-033fc2ac032e', N'a0cb00c5-8fbe-4af6-88af-090ddb98c0e6', 15, 0, CAST(N'2024-12-02T18:23:00.8406554' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'24ada48e-3675-494d-8c9c-e5302f91f8ea', N'22aae825-e436-4532-b92b-5c8a1bcc88ad', N'70be578e-af27-4056-a6ad-55990f86b3e7', N'63c3d86d-97b4-43fe-b84b-31ea7f0062f7', 0, 0, CAST(N'2024-12-02T18:21:42.8170864' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'957c5970-64a5-48b1-acc6-e5852aa8abbd', N'22aae825-e436-4532-b92b-5c8a1bcc88ad', N'70be578e-af27-4056-a6ad-55990f86b3e7', N'4c4ae26e-0c74-4d88-a192-8b66a55b37ef', 2, 0, CAST(N'2024-12-02T18:21:42.7817423' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'0674cfac-eaae-466e-950e-e642eccc970e', N'22aae825-e436-4532-b92b-5c8a1bcc88ad', N'55fc6d0e-50b3-4876-bf93-ee3937daeb62', N'0e5ee76f-67c2-443f-b37d-0d57b23b6a52', 3, 0, CAST(N'2024-12-02T18:20:04.0312097' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'e7191089-8c32-4da2-9d51-e64b1514ba05', N'22aae825-e436-4532-b92b-5c8a1bcc88ad', N'70be578e-af27-4056-a6ad-55990f86b3e7', N'31f52f47-0c38-4b75-adad-f61947bf25fa', 9, 0, CAST(N'2024-12-02T18:21:29.8524249' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'0c504619-9c7a-4940-b0d6-e6e2a9fa387e', N'22aae825-e436-4532-b92b-5c8a1bcc88ad', N'55fc6d0e-50b3-4876-bf93-ee3937daeb62', N'97caf1d0-869c-4b90-a1b3-66c865e58ed6', 4, 0, CAST(N'2024-12-02T18:20:04.0066931' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'a21d412f-a24e-4bb6-a54d-e75f933c6860', N'22aae825-e436-4532-b92b-5c8a1bcc88ad', N'70be578e-af27-4056-a6ad-55990f86b3e7', N'1c4cf486-c535-488b-a06b-6f6ac28d8085', 3, 0, CAST(N'2024-12-02T18:20:52.7343000' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'a737db4e-7cf3-449b-9bfc-e7bb4182e2b5', N'22aae825-e436-4532-b92b-5c8a1bcc88ad', N'55fc6d0e-50b3-4876-bf93-ee3937daeb62', N'0d5416ac-cd31-43c2-a668-6a3c905ebef6', 9, 0, CAST(N'2024-12-02T18:19:52.6647590' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'ee4beb0e-cdf4-4f34-88f4-e9617965fbf7', N'22aae825-e436-4532-b92b-5c8a1bcc88ad', N'70be578e-af27-4056-a6ad-55990f86b3e7', N'de57bc13-35ff-4640-a7c2-3859906074a8', 4, 0, CAST(N'2024-12-02T18:21:42.7158080' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'5aafd146-3d91-479c-bbc1-ebe573fde3f4', N'22aae825-e436-4532-b92b-5c8a1bcc88ad', N'55fc6d0e-50b3-4876-bf93-ee3937daeb62', N'90e775a7-8b3a-42cf-9b09-232fca505bcd', 6, 0, CAST(N'2024-12-02T18:19:52.6777803' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'0ccf3e2e-049a-453f-b257-ef800df7ea62', N'114be4a4-f231-4d0d-8eb4-6ccac85798be', N'cdb5713c-fcb9-4105-8140-033fc2ac032e', N'eced7710-63cf-4fe3-940a-760e757b7d28', 5, 0, CAST(N'2024-12-02T18:25:46.5617709' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'e53424b9-93b5-4c15-bf69-f82e94963b94', N'22aae825-e436-4532-b92b-5c8a1bcc88ad', N'55fc6d0e-50b3-4876-bf93-ee3937daeb62', N'35f07812-829a-4d3b-b6ef-9f5055dea8a7', 6, 0, CAST(N'2024-12-02T18:20:04.0989307' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'd2729ec6-0275-4aa7-967a-f9b56435d42c', N'22aae825-e436-4532-b92b-5c8a1bcc88ad', N'70be578e-af27-4056-a6ad-55990f86b3e7', N'ba59ae4d-e8c5-48af-90ee-cb5225a916b7', 3, 0, CAST(N'2024-12-02T18:21:12.4482038' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'74f6c28c-c261-4cca-8547-fa80f07279b9', N'22aae825-e436-4532-b92b-5c8a1bcc88ad', N'70be578e-af27-4056-a6ad-55990f86b3e7', N'0e5ee76f-67c2-443f-b37d-0d57b23b6a52', 3, 0, CAST(N'2024-12-02T18:21:29.7980370' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'9a0e7dd4-f1a5-425b-a615-fb26422a5517', N'114be4a4-f231-4d0d-8eb4-6ccac85798be', N'cdb5713c-fcb9-4105-8140-033fc2ac032e', N'f16b3b73-1a7d-4b6a-8d76-1b42af21c916', 5, 0, CAST(N'2024-12-02T18:23:00.8510505' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'a6eaa354-9995-4841-871a-fdd5b0f3fe31', N'22aae825-e436-4532-b92b-5c8a1bcc88ad', N'55fc6d0e-50b3-4876-bf93-ee3937daeb62', N'd3c294d8-410e-4fe9-8a2b-c8e8e559131b', 6, 0, CAST(N'2024-12-02T18:20:04.0938674' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'92c9225d-fc6d-45bc-9bb0-fe7047a79dee', N'22aae825-e436-4532-b92b-5c8a1bcc88ad', N'70be578e-af27-4056-a6ad-55990f86b3e7', N'0d89cf2c-8a4c-4981-ad00-03a246f7c79b', 3, 0, CAST(N'2024-12-02T18:21:12.4112575' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'c1437d2f-2e68-4bf6-813d-fe90ba8d6b46', N'22aae825-e436-4532-b92b-5c8a1bcc88ad', N'70be578e-af27-4056-a6ad-55990f86b3e7', N'3b9d9610-3cba-4c41-9ec8-673c203e79b9', 9, 0, CAST(N'2024-12-02T18:21:12.4688039' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'8d3cb00e-0d18-49db-bdac-ff3a3a2cdecd', N'22aae825-e436-4532-b92b-5c8a1bcc88ad', N'55fc6d0e-50b3-4876-bf93-ee3937daeb62', N'7347efb0-c55a-4210-8091-a8884c2ab1da', 0, 0, CAST(N'2024-12-02T18:19:52.6424355' AS DateTime2), 2)
GO
INSERT [dbo].[EvaluationExplaint] ([Id], [EvaluationId], [UserId], [SupervisorId], [CategoryCriteriaId], [Note], [FileAttachments], [IsDeleted], [UpdatedAt]) VALUES (N'f911d5bb-fb64-4865-8f55-4376ce78ed9d', N'22aae825-e436-4532-b92b-5c8a1bcc88ad', N'2d1c4b21-92b0-4105-9151-0980a4c924ad', N'55fc6d0e-50b3-4876-bf93-ee3937daeb62', N'79459d60-5db6-48b6-94bf-2121d9839e15', N'Test', NULL, 0, CAST(N'2024-12-02T14:25:27.2996678' AS DateTime2))
GO
INSERT [dbo].[EvaluationSample] ([Id], [EvaluationSampleName], [IsDeleted], [UpdatedAt]) VALUES (N'9a245d3a-088b-4831-b3bf-77dc93c5ea1d', N'Mẫu 2 - Phiếu đánh giá dành cho nhóm đối tượng chung', 0, CAST(N'2024-11-23T13:09:47.0232562' AS DateTime2))
INSERT [dbo].[EvaluationSample] ([Id], [EvaluationSampleName], [IsDeleted], [UpdatedAt]) VALUES (N'b621540f-6142-42f3-8ec1-8f3cd8167a24', N'Mẫu 1 - Phiếu đánh giá dành cho HT PHT', 0, CAST(N'2024-11-23T13:09:09.4585816' AS DateTime2))
GO
INSERT [dbo].[EvaluationUser] ([Id], [EvaluationId], [UserId], [Type], [Sort], [IsDeleted], [UpdatedAt], [IsManager]) VALUES (N'743dd25a-648e-48de-84a2-03b1b5cdabe6', N'114be4a4-f231-4d0d-8eb4-6ccac85798be', N'70be578e-af27-4056-a6ad-55990f86b3e7', 1, 0, 0, CAST(N'2024-12-02T18:15:03.4975592' AS DateTime2), NULL)
INSERT [dbo].[EvaluationUser] ([Id], [EvaluationId], [UserId], [Type], [Sort], [IsDeleted], [UpdatedAt], [IsManager]) VALUES (N'e63c0278-4055-46d2-a052-4e8bc58bcd68', N'22aae825-e436-4532-b92b-5c8a1bcc88ad', N'dd3c7e8b-3dc7-45d2-a2bd-282de7d5e2de', 1, 0, 0, CAST(N'2024-12-01T09:52:42.6785163' AS DateTime2), NULL)
INSERT [dbo].[EvaluationUser] ([Id], [EvaluationId], [UserId], [Type], [Sort], [IsDeleted], [UpdatedAt], [IsManager]) VALUES (N'bcc1f40b-a465-47ab-b62f-720258ac6f80', N'22aae825-e436-4532-b92b-5c8a1bcc88ad', N'2d1c4b21-92b0-4105-9151-0980a4c924ad', 1, 0, 0, CAST(N'2024-12-01T09:52:42.6814300' AS DateTime2), NULL)
INSERT [dbo].[EvaluationUser] ([Id], [EvaluationId], [UserId], [Type], [Sort], [IsDeleted], [UpdatedAt], [IsManager]) VALUES (N'afcda0f6-f5c3-4ddb-81e3-72e29b560b68', N'22aae825-e436-4532-b92b-5c8a1bcc88ad', N'70be578e-af27-4056-a6ad-55990f86b3e7', 2, 2, 0, CAST(N'2024-12-01T09:53:34.9788783' AS DateTime2), 1)
INSERT [dbo].[EvaluationUser] ([Id], [EvaluationId], [UserId], [Type], [Sort], [IsDeleted], [UpdatedAt], [IsManager]) VALUES (N'2e0deaa4-ed44-470b-8839-789c479fd3c2', N'22aae825-e436-4532-b92b-5c8a1bcc88ad', N'55fc6d0e-50b3-4876-bf93-ee3937daeb62', 1, 0, 0, CAST(N'2024-12-01T09:52:42.6370560' AS DateTime2), NULL)
INSERT [dbo].[EvaluationUser] ([Id], [EvaluationId], [UserId], [Type], [Sort], [IsDeleted], [UpdatedAt], [IsManager]) VALUES (N'a1d7ec7c-5d4f-4abb-9cfd-b0928fc3177b', N'22aae825-e436-4532-b92b-5c8a1bcc88ad', N'55fc6d0e-50b3-4876-bf93-ee3937daeb62', 2, 1, 0, CAST(N'2024-12-01T09:53:27.4932907' AS DateTime2), 0)
INSERT [dbo].[EvaluationUser] ([Id], [EvaluationId], [UserId], [Type], [Sort], [IsDeleted], [UpdatedAt], [IsManager]) VALUES (N'551c4de2-ab05-4d27-8a90-ba8e2e4c6748', N'22aae825-e436-4532-b92b-5c8a1bcc88ad', N'32f207a2-02ba-4b83-8c71-03af11657c63', 1, 0, 0, CAST(N'2024-12-01T09:52:42.6757511' AS DateTime2), NULL)
INSERT [dbo].[EvaluationUser] ([Id], [EvaluationId], [UserId], [Type], [Sort], [IsDeleted], [UpdatedAt], [IsManager]) VALUES (N'eb2ab28f-4f25-44ae-aba1-c0ce1882818a', N'114be4a4-f231-4d0d-8eb4-6ccac85798be', N'cdb5713c-fcb9-4105-8140-033fc2ac032e', 2, 1, 0, CAST(N'2024-12-02T18:15:15.6083601' AS DateTime2), 1)
INSERT [dbo].[EvaluationUser] ([Id], [EvaluationId], [UserId], [Type], [Sort], [IsDeleted], [UpdatedAt], [IsManager]) VALUES (N'a7edde74-e49c-4863-a5b0-e481f071f9ee', N'114be4a4-f231-4d0d-8eb4-6ccac85798be', N'd3f15e0a-7ac8-4f28-b93e-f8c11eee7fcf', 1, 0, 0, CAST(N'2024-12-02T18:15:03.4445840' AS DateTime2), NULL)
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
INSERT [dbo].[RefreshToken] ([Id], [UserId], [Token], [JwtId], [IsUsed], [IsRevoked], [IssuedAt], [ExpiredAt]) VALUES (N'98734eba-51ce-495b-ac6e-1bb4fe51e881', N'd3f15e0a-7ac8-4f28-b93e-f8c11eee7fcf', N'8gkqeqkdSnKotvP8YaT8Ghv0H/DNc4I+AttV3BsXgFk=', N'a2cdad59-f803-4407-b983-2b5157cce2d3', 0, 0, CAST(N'2024-12-02T18:23:21.8715233' AS DateTime2), CAST(N'2024-12-09T18:23:21.8715233' AS DateTime2))
INSERT [dbo].[RefreshToken] ([Id], [UserId], [Token], [JwtId], [IsUsed], [IsRevoked], [IssuedAt], [ExpiredAt]) VALUES (N'0a0e986e-24f4-42d1-bac7-39a1513093d2', N'55fc6d0e-50b3-4876-bf93-ee3937daeb62', N'NgorHQk24bR7Plnu+lZZl7Tjt1GE+4OFl0nWvTETqNA=', N'6c1b34e8-91c6-4f2c-96d7-1ca266e6643e', 0, 0, CAST(N'2024-12-02T18:18:20.8192572' AS DateTime2), CAST(N'2024-12-09T18:18:20.8192573' AS DateTime2))
INSERT [dbo].[RefreshToken] ([Id], [UserId], [Token], [JwtId], [IsUsed], [IsRevoked], [IssuedAt], [ExpiredAt]) VALUES (N'47a40f38-4d3f-429c-8d07-44f0b2f10155', N'2d1c4b21-92b0-4105-9151-0980a4c924ad', N'gGO3lQIDUut6IiNFwXOh5rs9m1DE794K6tMdQlNcU4g=', N'77e5d30f-66f9-4af2-961d-cdadd1d6b9c0', 0, 0, CAST(N'2024-12-02T18:17:42.4968868' AS DateTime2), CAST(N'2024-12-09T18:17:42.4968869' AS DateTime2))
INSERT [dbo].[RefreshToken] ([Id], [UserId], [Token], [JwtId], [IsUsed], [IsRevoked], [IssuedAt], [ExpiredAt]) VALUES (N'8295377e-3952-43af-93a1-6a4b1dda5bc9', N'4b986f5b-4e1d-4016-b771-14dab0c7af11', N'Gbw/TK3wtqQaNuOkteNApwxpOWvVGyg15m+c7PUrL0Y=', N'7ac67685-629f-4179-8ced-f97d9d38adec', 0, 0, CAST(N'2024-11-23T18:51:39.6830662' AS DateTime2), CAST(N'2024-11-30T18:51:39.6830662' AS DateTime2))
INSERT [dbo].[RefreshToken] ([Id], [UserId], [Token], [JwtId], [IsUsed], [IsRevoked], [IssuedAt], [ExpiredAt]) VALUES (N'4933c5da-2b12-41d6-ab1d-722788d10c60', N'0630cc13-3e54-4ba7-bdfe-f1ff42051257', N'Mom27FbqSKgAmxCRJ9dlQGeXsD362mGjVFshri7h6TA=', N'84353c0a-6645-48a7-a343-7cc6b29d52b5', 0, 0, CAST(N'2024-11-23T18:52:23.4983169' AS DateTime2), CAST(N'2024-11-30T18:52:23.4983169' AS DateTime2))
INSERT [dbo].[RefreshToken] ([Id], [UserId], [Token], [JwtId], [IsUsed], [IsRevoked], [IssuedAt], [ExpiredAt]) VALUES (N'51365e95-22ce-41d8-8566-7a166c655a15', N'c778e7e0-b970-4533-96a0-5091f4c57114', N'uZctZYb1XGUN/dSDZH735NbIAaLUxhGUXMW9DhF1rI0=', N'13a154d7-0eb3-45ac-9c92-d5b5a97ad058', 0, 0, CAST(N'2024-11-24T13:51:48.9952326' AS DateTime2), CAST(N'2024-12-01T13:51:48.9952329' AS DateTime2))
INSERT [dbo].[RefreshToken] ([Id], [UserId], [Token], [JwtId], [IsUsed], [IsRevoked], [IssuedAt], [ExpiredAt]) VALUES (N'3dab8e90-4a46-4402-84a3-a1389551b708', N'a6ba15f2-d668-4059-a1c4-5b0deda85c47', N'imLz5Ty6z4tRZGuiR2TnUoK1tZtK2PFKUtA3rAvBJjc=', N'b9aa2dfb-309b-4c9f-96e6-f018d2fc393f', 0, 0, CAST(N'2024-12-02T15:10:06.3834931' AS DateTime2), CAST(N'2024-12-09T15:10:06.3834932' AS DateTime2))
INSERT [dbo].[RefreshToken] ([Id], [UserId], [Token], [JwtId], [IsUsed], [IsRevoked], [IssuedAt], [ExpiredAt]) VALUES (N'46cf5ce6-50e9-48a4-a44a-c237699473b7', N'dd3c7e8b-3dc7-45d2-a2bd-282de7d5e2de', N'7sSBBf2XPv/d5AmhQF4yas/5lqNIxGJH4JnDi32o6JM=', N'e1abd0f4-1b6f-4430-a541-94a9285a4275', 0, 0, CAST(N'2024-12-02T18:17:04.6243607' AS DateTime2), CAST(N'2024-12-09T18:17:04.6243608' AS DateTime2))
INSERT [dbo].[RefreshToken] ([Id], [UserId], [Token], [JwtId], [IsUsed], [IsRevoked], [IssuedAt], [ExpiredAt]) VALUES (N'e4cb31ed-0f2a-45b0-8527-c9a5f31187b3', N'110aa824-4b97-4fac-972c-b66f2c478dca', N'hmzfcxTzMSZaoVUyqMYf4w/Ia1WdCGzl5cNQKU3hnRk=', N'b341cd32-7d05-4fe7-b75a-5fc7f0fc7002', 0, 0, CAST(N'2024-11-23T18:53:40.5645420' AS DateTime2), CAST(N'2024-11-30T18:53:40.5645421' AS DateTime2))
INSERT [dbo].[RefreshToken] ([Id], [UserId], [Token], [JwtId], [IsUsed], [IsRevoked], [IssuedAt], [ExpiredAt]) VALUES (N'a74b2709-5f54-428e-bbd1-ca957ee0e470', N'32f207a2-02ba-4b83-8c71-03af11657c63', N'aSpYsvDrEXlxluS1KQBLWeXrcfJZGAP/HCFSL42PlrE=', N'97782f88-98d2-4810-9cf1-158a9d56d90f', 0, 0, CAST(N'2024-12-02T18:28:52.5998925' AS DateTime2), CAST(N'2024-12-09T18:28:52.5998927' AS DateTime2))
INSERT [dbo].[RefreshToken] ([Id], [UserId], [Token], [JwtId], [IsUsed], [IsRevoked], [IssuedAt], [ExpiredAt]) VALUES (N'a9cc33e6-9632-49cf-886e-e0ee914c4dc9', N'cdb5713c-fcb9-4105-8140-033fc2ac032e', N'0OAboPfAlQ7N7pc5TVL4ECrqQewuGIO1L6GSROKCKjU=', N'66865989-57a8-4bc6-9dc1-f1dae367f01d', 0, 0, CAST(N'2024-12-02T18:27:11.8744622' AS DateTime2), CAST(N'2024-12-09T18:27:11.8744623' AS DateTime2))
INSERT [dbo].[RefreshToken] ([Id], [UserId], [Token], [JwtId], [IsUsed], [IsRevoked], [IssuedAt], [ExpiredAt]) VALUES (N'cfbda2e6-6bbc-4e6c-9573-ecc5231d040d', N'70be578e-af27-4056-a6ad-55990f86b3e7', N'phL8We3nyTqjNkWGG4Ac076932LEIIFEQQdY9XS0tlA=', N'd5be4944-8a2d-4df2-b5c1-9e91e0ac975c', 0, 0, CAST(N'2024-12-02T18:25:54.7604357' AS DateTime2), CAST(N'2024-12-09T18:25:54.7604357' AS DateTime2))
INSERT [dbo].[RefreshToken] ([Id], [UserId], [Token], [JwtId], [IsUsed], [IsRevoked], [IssuedAt], [ExpiredAt]) VALUES (N'41041e28-8b49-40d7-9036-f348fa15d5c2', N'ce648ca9-fee9-40e7-8aff-03869bb6b010', N'kdDeUS06tYO9IzTgAyRSl2XSRt25f1hXllFwHcdYW/c=', N'66316663-bb45-4e59-90b3-b79efc2e52a2', 0, 0, CAST(N'2024-11-23T19:01:53.2826883' AS DateTime2), CAST(N'2024-11-30T19:01:53.2826884' AS DateTime2))
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
INSERT [dbo].[RoleMenuItems] ([Id], [RoleId], [MenuItemId]) VALUES (N'9f54312a-3b2c-4cc0-99a7-99f6edb53644', N'20a6ddc3-0e72-400e-80e0-dd5256182a9a', N'f0a0148d-7e05-4873-b5bd-37e61c626887')
INSERT [dbo].[RoleMenuItems] ([Id], [RoleId], [MenuItemId]) VALUES (N'2063f038-6dda-4974-9c15-9d776359b095', N'fa00a51d-a46e-4d10-926e-5ba8ba68d432', N'fa70e2f4-8d7f-479d-a12a-f91508b8c33e')
INSERT [dbo].[RoleMenuItems] ([Id], [RoleId], [MenuItemId]) VALUES (N'b8a93947-c888-4005-bba4-a017d3ceff68', N'a6204804-82cf-4f94-a3e1-07cd10a8e579', N'f9518f77-2b01-4131-b229-f1f675f5ceca')
INSERT [dbo].[RoleMenuItems] ([Id], [RoleId], [MenuItemId]) VALUES (N'939c8abe-2b62-4c8e-a195-a058fe4a239c', N'20a6ddc3-0e72-400e-80e0-dd5256182a9a', N'd0a617ce-7a4a-4556-a2d0-82503dfef228')
INSERT [dbo].[RoleMenuItems] ([Id], [RoleId], [MenuItemId]) VALUES (N'110bb42b-c86f-4496-9478-a2d206a67658', N'a6204804-82cf-4f94-a3e1-07cd10a8e579', N'3172d91d-37cf-46ec-9eb8-62fd2a01e691')
INSERT [dbo].[RoleMenuItems] ([Id], [RoleId], [MenuItemId]) VALUES (N'e19a979a-5be7-4075-a92a-a695228bab32', N'a6204804-82cf-4f94-a3e1-07cd10a8e579', N'51b36720-d531-4648-9efb-e80c5bdd04a5')
INSERT [dbo].[RoleMenuItems] ([Id], [RoleId], [MenuItemId]) VALUES (N'b6d91f67-a085-431c-ad69-a79159cfdb68', N'bc4ce45e-b29f-4f21-8c68-9e1cff35614e', N'f0a0148d-7e05-4873-b5bd-37e61c626887')
INSERT [dbo].[RoleMenuItems] ([Id], [RoleId], [MenuItemId]) VALUES (N'e6230b3e-52e8-4d13-94b1-a7c19515f971', N'fa00a51d-a46e-4d10-926e-5ba8ba68d432', N'b67dc630-6c6f-4dd1-88a1-1380ddf043f6')
INSERT [dbo].[RoleMenuItems] ([Id], [RoleId], [MenuItemId]) VALUES (N'e1f9c69d-6976-4684-bec0-ab15382c63fe', N'a6204804-82cf-4f94-a3e1-07cd10a8e579', N'b67dc630-6c6f-4dd1-88a1-1380ddf043f6')
INSERT [dbo].[RoleMenuItems] ([Id], [RoleId], [MenuItemId]) VALUES (N'3d409a8f-15cf-4902-b6fb-b100c196f0ae', N'a6204804-82cf-4f94-a3e1-07cd10a8e579', N'b519f203-6a8c-48c5-800e-2b673aadec05')
INSERT [dbo].[RoleMenuItems] ([Id], [RoleId], [MenuItemId]) VALUES (N'a8cfe41a-c3c6-45f6-91e7-bcec817819fa', N'20a6ddc3-0e72-400e-80e0-dd5256182a9a', N'e73b567f-c830-41d4-ac5c-e299543cf95a')
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
INSERT [dbo].[Roles] ([Id], [RoleName], [UpdatedAt], [IsDeleted]) VALUES (N'20a6ddc3-0e72-400e-80e0-dd5256182a9a', N'NGƯỜI ĐÁNH GIÁ', CAST(N'2024-11-30T21:35:58.0254236' AS DateTime2), 0)
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
