USE [SA_DEMO_1]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 12/20/2024 1:59:31 PM ******/
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
/****** Object:  Table [dbo].[CategoryComment]    Script Date: 12/20/2024 1:59:31 PM ******/
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
/****** Object:  Table [dbo].[CategoryCriteria]    Script Date: 12/20/2024 1:59:31 PM ******/
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
/****** Object:  Table [dbo].[CategoryProsCons]    Script Date: 12/20/2024 1:59:31 PM ******/
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
/****** Object:  Table [dbo].[CategoryRating]    Script Date: 12/20/2024 1:59:31 PM ******/
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
/****** Object:  Table [dbo].[CategoryTimeType]    Script Date: 12/20/2024 1:59:31 PM ******/
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
/****** Object:  Table [dbo].[ElectronicSignature]    Script Date: 12/20/2024 1:59:31 PM ******/
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
/****** Object:  Table [dbo].[Evaluation]    Script Date: 12/20/2024 1:59:31 PM ******/
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
/****** Object:  Table [dbo].[EvaluationAAE]    Script Date: 12/20/2024 1:59:31 PM ******/
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
/****** Object:  Table [dbo].[EvaluationConsolidationAndTransfer]    Script Date: 12/20/2024 1:59:31 PM ******/
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
/****** Object:  Table [dbo].[EvaluationConsolidationAndTransferDetails]    Script Date: 12/20/2024 1:59:31 PM ******/
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
/****** Object:  Table [dbo].[EvaluationCriteria]    Script Date: 12/20/2024 1:59:31 PM ******/
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
/****** Object:  Table [dbo].[EvaluationCriteriaSample]    Script Date: 12/20/2024 1:59:31 PM ******/
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
/****** Object:  Table [dbo].[EvaluationDetailsPersonal]    Script Date: 12/20/2024 1:59:31 PM ******/
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
/****** Object:  Table [dbo].[EvaluationDetailsSupervisor]    Script Date: 12/20/2024 1:59:31 PM ******/
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
/****** Object:  Table [dbo].[EvaluationExplaint]    Script Date: 12/20/2024 1:59:31 PM ******/
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
/****** Object:  Table [dbo].[EvaluationSample]    Script Date: 12/20/2024 1:59:31 PM ******/
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
/****** Object:  Table [dbo].[EvaluationUser]    Script Date: 12/20/2024 1:59:31 PM ******/
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
/****** Object:  Table [dbo].[MenuItems]    Script Date: 12/20/2024 1:59:31 PM ******/
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
/****** Object:  Table [dbo].[RefreshToken]    Script Date: 12/20/2024 1:59:31 PM ******/
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
/****** Object:  Table [dbo].[RoleMenuItems]    Script Date: 12/20/2024 1:59:31 PM ******/
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
/****** Object:  Table [dbo].[Roles]    Script Date: 12/20/2024 1:59:31 PM ******/
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
/****** Object:  Table [dbo].[Unit]    Script Date: 12/20/2024 1:59:31 PM ******/
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
/****** Object:  Table [dbo].[User]    Script Date: 12/20/2024 1:59:31 PM ******/
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
/****** Object:  Table [dbo].[UserRoles]    Script Date: 12/20/2024 1:59:31 PM ******/
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
/****** Object:  Table [dbo].[UserType]    Script Date: 12/20/2024 1:59:31 PM ******/
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
INSERT [dbo].[CategoryCriteria] ([Id], [ParentId], [CategoryRatingId], [UnitId], [CriteriaName], [IsDistinct], [IsDeleted], [UpdatedAt]) VALUES (N'651f5449-d99f-4577-9b7c-1158628ba153', NULL, NULL, N'fe6717f3-92c1-48dd-acf6-a65dbefdb04e', N'test', 0, 0, CAST(N'2024-12-20T11:08:14.5344116' AS DateTime2))
INSERT [dbo].[CategoryCriteria] ([Id], [ParentId], [CategoryRatingId], [UnitId], [CriteriaName], [IsDistinct], [IsDeleted], [UpdatedAt]) VALUES (N'8b678550-a782-4ed9-a61f-15887cf5a73e', NULL, NULL, N'4402c619-783f-4580-83cd-86e50a47171d', N'Chính trị tư tưởng', 0, 0, CAST(N'2024-11-23T08:36:42.1540004' AS DateTime2))
INSERT [dbo].[CategoryCriteria] ([Id], [ParentId], [CategoryRatingId], [UnitId], [CriteriaName], [IsDistinct], [IsDeleted], [UpdatedAt]) VALUES (N'ca2c80e4-c9e6-4bc1-a080-1c0505bccaba', N'786e1a85-def5-4a2e-a70c-cfc2c0d8b239', N'0164939d-6db7-40f9-8d73-064a33cccd6b', N'4402c619-783f-4580-83cd-86e50a47171d', N'Thực hiện các quy định, quy chế, nội quy của cơ quan, tổ chức, đơn vị nơi công tác.', 0, 0, CAST(N'2024-11-03T15:03:56.0350066' AS DateTime2))
INSERT [dbo].[CategoryCriteria] ([Id], [ParentId], [CategoryRatingId], [UnitId], [CriteriaName], [IsDistinct], [IsDeleted], [UpdatedAt]) VALUES (N'5995b240-62ec-484e-a75e-1d1c035bb8b3', N'651f5449-d99f-4577-9b7c-1158628ba153', N'dcbd5ccb-31d8-4cd6-8b79-cbe359f071f2', N'fe6717f3-92c1-48dd-acf6-a65dbefdb04e', N'test 1', 0, 0, CAST(N'2024-12-20T11:08:23.4079647' AS DateTime2))
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
INSERT [dbo].[CategoryCriteria] ([Id], [ParentId], [CategoryRatingId], [UnitId], [CriteriaName], [IsDistinct], [IsDeleted], [UpdatedAt]) VALUES (N'79ce8883-2f70-4062-a9da-7c8243aa0b18', N'd187b691-5061-4f71-b087-8b13a61f8419', N'420d9abb-dce5-43cc-a2e0-a5fb3a954973', N'93684774-0d94-42c9-ac77-078b6e3d2366', N'Con 1', 0, 1, CAST(N'2024-12-10T16:54:36.7791213' AS DateTime2))
INSERT [dbo].[CategoryCriteria] ([Id], [ParentId], [CategoryRatingId], [UnitId], [CriteriaName], [IsDistinct], [IsDeleted], [UpdatedAt]) VALUES (N'0f8a3810-dc07-47e8-a089-7d6c08107382', N'31314875-8f03-4874-be17-0f31c14f28ee', N'0164939d-6db7-40f9-8d73-064a33cccd6b', N'4402c619-783f-4580-83cd-86e50a47171d', N'Phương pháp làm việc khoa học, dân chủ, đúng nguyên tắc.', 0, 0, CAST(N'2024-11-03T15:02:50.4423472' AS DateTime2))
INSERT [dbo].[CategoryCriteria] ([Id], [ParentId], [CategoryRatingId], [UnitId], [CriteriaName], [IsDistinct], [IsDeleted], [UpdatedAt]) VALUES (N'b7448f10-a0ca-4081-87b6-7e08932e5ade', N'8005ad2a-4d92-4101-9719-8e8364e57996', N'dcbd5ccb-31d8-4cd6-8b79-cbe359f071f2', N'fe6717f3-92c1-48dd-acf6-a65dbefdb04e', N'asdsadasd', 0, 1, CAST(N'2024-11-30T21:21:54.7004805' AS DateTime2))
INSERT [dbo].[CategoryCriteria] ([Id], [ParentId], [CategoryRatingId], [UnitId], [CriteriaName], [IsDistinct], [IsDeleted], [UpdatedAt]) VALUES (N'204a1bdb-ddc7-4832-a266-7feb0dd0df1b', N'8005ad2a-4d92-4101-9719-8e8364e57996', N'dcbd5ccb-31d8-4cd6-8b79-cbe359f071f2', N'fe6717f3-92c1-48dd-acf6-a65dbefdb04e', N'test', 0, 1, CAST(N'2024-11-30T21:36:37.8737557' AS DateTime2))
INSERT [dbo].[CategoryCriteria] ([Id], [ParentId], [CategoryRatingId], [UnitId], [CriteriaName], [IsDistinct], [IsDeleted], [UpdatedAt]) VALUES (N'93b43166-bdad-4118-9bed-8176279fdf95', N'8005ad2a-4d92-4101-9719-8e8364e57996', NULL, N'fe6717f3-92c1-48dd-acf6-a65dbefdb04e', N'Quản lý tổ chức và nhân sự', 0, 0, CAST(N'2024-11-23T13:15:48.8626312' AS DateTime2))
INSERT [dbo].[CategoryCriteria] ([Id], [ParentId], [CategoryRatingId], [UnitId], [CriteriaName], [IsDistinct], [IsDeleted], [UpdatedAt]) VALUES (N'1b68a81a-b654-4896-9195-84abfb081103', N'e6d88410-17f4-479b-8e2d-8b6d5c0324a7', N'0273a6e8-6078-4383-81f2-bbbf6fe016f4', N'4402c619-783f-4580-83cd-86e50a47171d', N'Quán triệt, thể chế hóa và thực hiện chủ trương, đường lối của Đảng, chính sách, pháp luật của Nhà nước tại cơ quan, tổ chức, đơn vị.', 0, 0, CAST(N'2024-11-03T15:06:16.9008104' AS DateTime2))
INSERT [dbo].[CategoryCriteria] ([Id], [ParentId], [CategoryRatingId], [UnitId], [CriteriaName], [IsDistinct], [IsDeleted], [UpdatedAt]) VALUES (N'd187b691-5061-4f71-b087-8b13a61f8419', NULL, NULL, N'93684774-0d94-42c9-ac77-078b6e3d2366', N'Cha', 0, 1, CAST(N'2024-12-10T16:54:36.7791700' AS DateTime2))
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
INSERT [dbo].[CategoryRating] ([Id], [UnitId], [RatingName], [StartValue], [EndValue], [IsDeleted], [UpdatedAt]) VALUES (N'420d9abb-dce5-43cc-a2e0-a5fb3a954973', N'93684774-0d94-42c9-ac77-078b6e3d2366', N'Thang điểm 0 - 10', 0, 10, 0, CAST(N'2024-12-04T13:39:32.2622014' AS DateTime2))
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
INSERT [dbo].[CategoryTimeType] ([Id], [UnitId], [TimeTypeName], [FromDate], [ToDate], [IsDeleted], [UpdatedAt]) VALUES (N'c6eccafb-0c17-451a-9e30-baadf3fbb01b', N'fe6717f3-92c1-48dd-acf6-a65dbefdb04e', N'Đánh giá Quý 4 - Văn Phòng Sở - 2024', CAST(N'2024-12-01T00:00:00.0000000' AS DateTime2), CAST(N'2024-12-31T00:00:00.0000000' AS DateTime2), 0, CAST(N'2024-12-20T11:09:05.8928012' AS DateTime2))
INSERT [dbo].[CategoryTimeType] ([Id], [UnitId], [TimeTypeName], [FromDate], [ToDate], [IsDeleted], [UpdatedAt]) VALUES (N'0ec736da-795b-4bc3-9b92-f4e0242d18e0', N'fe6717f3-92c1-48dd-acf6-a65dbefdb04e', N'Kỳ đánh giá tháng 1 - 2025', CAST(N'2025-01-01T00:00:00.0000000' AS DateTime2), CAST(N'2025-01-31T00:00:00.0000000' AS DateTime2), 0, CAST(N'2024-11-03T13:01:48.2535009' AS DateTime2))
GO
INSERT [dbo].[ElectronicSignature] ([Id], [UserId], [Status], [PublicKey], [PrivateKey], [UpdatedAt]) VALUES (N'ef66be0d-b061-4850-84a8-1ce089ddb466', N'0630cc13-3e54-4ba7-bdfe-f1ff42051257', 0, N'MIIBCgKCAQEAvdl5+9zOFJmeq222RfReVjE1rF3KrMN01EtvSycICuF4vLvH3MlxPkdzDJ77m+3r2EBofjN6ghiGnewPuMx6XezOCh5VorqmSkrSgbGo7AQly0CnsZdwOjurGq8+NHOgDaJfjYVmUVl0iYyw1VbfPUULvS8D16uwxX6IFwZShna+aG66hJKEN0H9aJGYtSmFIqRCYoBBUIJog3UmXh9ru1aSbf1b4iwMqwXSwhIUb9sdP6RWraHrKXFzYtaWqxeJFiWrYCNIx/xxLXiXqda+Yqn0c7gzf3HzijhYQXQF3B83E0IItEL/fni9QBgeb3DFtNszR23DaMTjGOtJhkoi4QIDAQAB', N'MIIEpQIBAAKCAQEAvdl5+9zOFJmeq222RfReVjE1rF3KrMN01EtvSycICuF4vLvH3MlxPkdzDJ77m+3r2EBofjN6ghiGnewPuMx6XezOCh5VorqmSkrSgbGo7AQly0CnsZdwOjurGq8+NHOgDaJfjYVmUVl0iYyw1VbfPUULvS8D16uwxX6IFwZShna+aG66hJKEN0H9aJGYtSmFIqRCYoBBUIJog3UmXh9ru1aSbf1b4iwMqwXSwhIUb9sdP6RWraHrKXFzYtaWqxeJFiWrYCNIx/xxLXiXqda+Yqn0c7gzf3HzijhYQXQF3B83E0IItEL/fni9QBgeb3DFtNszR23DaMTjGOtJhkoi4QIDAQABAoIBACHAPvpyt8RbxySM3aG0Hu1N1E/vYK+0E9oGCyQeLUTZ7sAG1jI/Mb2zsBVnUi3Xb11DnhAJkNb+CziaFfVxjLOT/NE5sVm7uwJsKN5buj8zQZDPzsA4vv/rSbD1xKZIhATIgBpFw/nkYF5vv6Q9zHQ1CTA54oH+CPAjXYhSXGuA89PwOW7sJVkmVzQwxVhUiDNgwgyLGvTgTbkz3kU/FHBKy3pH4jVkSNEJzG39T2PbqxGIEnPTzD+e0ZYC/12TtDvQ00O0/uPP0kcTeOgNi4G72Kv18vzE4Ick64fT2rgOakgem0oplXGboiX04wh2IOWvzapQLHtNA3x71OONuz0CgYEAxJIACR1Az+sBFCCsXjRBqktFWJioFBgGY6agPYbosCvdjaDt6C2rrk8qeNyx+y1cVRaRwIFmFv6O+jerpbsHxtvInGaWVxGSAup4qdiZwVbQnPo/d0jYS3vp9ssOrhSo8aBfDBc7IsRUpQK5ZS/Q8dLLfPQ6kc5O5Mpco3TODDsCgYEA9z9OKmyUbawU9XEdusxGCeh3Vk2nO7NqAq0d3o4aow2Wxj55SDc55g2T6KIUauIlKIE+npzFSUVhwTKgIipJaxic164+3P8xzlO/h0LCb7EjqlCGAfWyZA0LPYVwQErrcUWapQ8BDzcj27yiF1OX+cR4n1x/cT8y5PvYpLgyh5MCgYEAhzDmh14wIg89SauDALMt6kIkal9rUY6Ibma91DMBu5AfqvVgSguHBLX7vu4CFn7G/tor2drk7LGcgehhy/TKz3B/E1nW0gEKi6jY3e9TJ85eYWgW2CIoaBnL+mkDKqSY4L1sQTOE/09J68bo3Pe622Yff0u1MGxUhDPM7Lo7r9sCgYEAl7dx6Jh+MBozNjU2MATfSX8rk3rNDtZWS9QdCw8aC0nwZi+5znWNArz8MPkcHEYu1P8SBNRgP0ji5mGBX9Wg/aW5wKN8kbHKxzgexApUM6N4Ji+JO7SfxcM3TYYPTnRqqzQx4+0kEkkcqN7EfBngnPRRrEBfN4e3XEmqM9GPuB8CgYEArOHDp5BgEgt/F+APbAnKWdxCKWg7lRL5LworHfSqwBLxK7eC3UjL3Av9RjsSvjO31S2SLmQU4+OLOimm6pwP6mZC4O+26qtcihkO2Nudsd3ha1BbdHuek9PMEJ6yTErEoppCAVWCRNbKcLPjkM/8ZVbttufqfbIrp2IOLyuJCW8=', CAST(N'2024-11-23T14:16:10.3206624' AS DateTime2))
INSERT [dbo].[ElectronicSignature] ([Id], [UserId], [Status], [PublicKey], [PrivateKey], [UpdatedAt]) VALUES (N'3e531a06-9c5a-418b-b4d0-24b4d74bc856', N'c778e7e0-b970-4533-96a0-5091f4c57114', 0, N'MIIBCgKCAQEAu2qKuRWmFCvzreuhT26DtdSQq8X2dyIobbGYOpCpLh77zW1m4QM9kHjgeaTM0EBYdCDqUP/abM8jWd+qFF+Byl6ECMLGcMGIJJgCdv/9Sp7AuGkgH0xsYpj9PKery8HjadYw/qA3Jk948lJFalT9VDqn2vOr9rJTbEleDSfakBhtZ2MrLMMAoxadiiRUzQuarC64n3QynLff7m/CbnuyPNBzWMiiu3v1CJr6i2Cc+MvWCWK6aLn0KGKrKHcWO+uoxUDXi8Qm/R1TW8HKb//V4pWsmGvgKX0HarzzhCyC89rhcArI9O2imld6uLN+Q1kWyNnBIjKwArMmFbQDVkTo1QIDAQAB', N'MIIEpAIBAAKCAQEAu2qKuRWmFCvzreuhT26DtdSQq8X2dyIobbGYOpCpLh77zW1m4QM9kHjgeaTM0EBYdCDqUP/abM8jWd+qFF+Byl6ECMLGcMGIJJgCdv/9Sp7AuGkgH0xsYpj9PKery8HjadYw/qA3Jk948lJFalT9VDqn2vOr9rJTbEleDSfakBhtZ2MrLMMAoxadiiRUzQuarC64n3QynLff7m/CbnuyPNBzWMiiu3v1CJr6i2Cc+MvWCWK6aLn0KGKrKHcWO+uoxUDXi8Qm/R1TW8HKb//V4pWsmGvgKX0HarzzhCyC89rhcArI9O2imld6uLN+Q1kWyNnBIjKwArMmFbQDVkTo1QIDAQABAoIBADIRUGYJpoiVBVBdNobl20HkO5HoHOPOuEY1v5lFtCyiElra8zUBjJzf7fgRUrX/uqGreW2SLGQNIkCMQ/+VVDMf9N3yStksmpZMFbx8vsoEhy+8xdwWqo3cmSpvELIqZfqMQiKD4rfVW1ZBLFIvyk2KLfWMS1Boa2juYLXbA8SijOhiyqLbDibr1a9XToH0Vgy+kKHS3H0Usew2ssZJq3T/j/IgfXEwzPJ8cTZDjfeJwu6Y/waFgrqAwuAD60ez4j/RDwCQu2Htcm8GJ+UBDysZawZzR5t4RexGrDJRmeBrq6i463rVt1fam06RMWCaY7pCU8lYbpsysuFlU6KgJLECgYEA1nWrPfNfSZmjjPiBM53Efms4Px3O+h1ZL8jpEEH4wVwl52yu9Arzb7zG5bkISq3FJjA21tHu+jvX/BEX1mveonsmwrnc3lWJtmh9Z8XMSpfedxvRSR34fPRaUCLrjKhnD89aUc4fDLYC3HeUyoC+CzE2i5NhNsWEJssKzh7ca6MCgYEA37fg8NOJt5fHdBF5/GCoffh82+B2C8FikBUGCcYX4hmHyomozsZQ/BhH1SXLp9CslHiNElPgEm4ZX5hpyY5wqKfAJQ5EOKYLNv/kTmHHoc6nrb0y64TwjAiYcJkkPemUgyG0Upm3r16ZeGVRAJYolI+JRPHkmYePh5/uywD1oScCgYEAyPA1g3Utmctfh20ruY4gFocli1XFoWmwL+qiHL6DccCCL0UQ484C63XIMmPdFgOdDjvslfjbXhCGPUJSwHAPiNO0rIzzGkqxHnzmyz10PYvwQE+LF2QCeCmHGUCuzPrYneKdcLqdMw6yvZk5i0d3SQtSXRK46lXEjYh+1kPqKNsCgYEAn6CqZevqdg9ch5r4uXWWg9vL62+rixO/aiM2Hb80x2WEGKZExtWGb3o7twCy4djpaz7hGdSzKzNX83fi86gpBo47cbVOREVl9yZ7Ftp6ASBdUICRVq+Sm7h+XMlIrMx/5VklO1LnV8BeLSPNumdqKSaJwaH/hPTPGuypDDxxBz0CgYAPtf2pZZOG9Mo+ZrY88pqMyx4gOpO1Jzx2uMN2iMMp0Xq8DdXBZ5XyPNPq0EIJEHo2mhqFJGnxjq3LlrOHq46v/ClnRNQP9jjrzxSuqVgEqSBbUKzrNMolKx5vJQg/DuDJv8TGXsfEmdoV+lT8YznXt0dhriUw83dsko7M4kRTog==', CAST(N'2024-11-23T14:15:06.3370272' AS DateTime2))
INSERT [dbo].[ElectronicSignature] ([Id], [UserId], [Status], [PublicKey], [PrivateKey], [UpdatedAt]) VALUES (N'10295182-84c5-4735-aba3-3b5c4b6ba787', N'7ba6c795-d331-4f3a-8c5a-0647d53d8298', 0, N'MIIBCgKCAQEAv14PU7bbJi9xAkN8YUk6+wa+z0ToYtsz/jgSUJl7YgGfCC8J7i7+BcIclJBLScqG8bus8dOPMG4AYj/mnzLxF6i90AENEv3+KO0MfQnZJM+C0yRaQ+6TNEDiFkBdsVco5EKFn9pn1Sj6i4s08WJ3mU9Q4R2fAxlGeymmCwF097akMYDp4stWUvvUijEb00GSJ5EhUfJD2xyWw74rzSFQnmyTPc0+NY0JEM/3+t5PwvszyRJMZyUgAEeBpNJA62x8e7A+5kMiqmacz+81gtMtGdyIhjmZ9iN4OV27smSCZJ1geALEz5vN9WP3AzeKmDjhYoUM6KI8S+NCRW5iNFDXSQIDAQAB', N'MIIEpAIBAAKCAQEAv14PU7bbJi9xAkN8YUk6+wa+z0ToYtsz/jgSUJl7YgGfCC8J7i7+BcIclJBLScqG8bus8dOPMG4AYj/mnzLxF6i90AENEv3+KO0MfQnZJM+C0yRaQ+6TNEDiFkBdsVco5EKFn9pn1Sj6i4s08WJ3mU9Q4R2fAxlGeymmCwF097akMYDp4stWUvvUijEb00GSJ5EhUfJD2xyWw74rzSFQnmyTPc0+NY0JEM/3+t5PwvszyRJMZyUgAEeBpNJA62x8e7A+5kMiqmacz+81gtMtGdyIhjmZ9iN4OV27smSCZJ1geALEz5vN9WP3AzeKmDjhYoUM6KI8S+NCRW5iNFDXSQIDAQABAoIBAF0QIgYFE9gjFCMUrKUnFr7DDgIAMb75ePR1UjrOGRmVTkCNl5e0VKZ6Oqno7iQpkKx4J2fHCYh0xk0BZGchP+vQjNZd3HzS9kny1bLtGiNzotyJfjgxCndL4mcN0EKQ73rp+s+9R+d6sTUxcoK87wqobt27KPw5y3PT0kLh538bBBw/Alz9byUBu6tIFWvR9mBmEh2+Hwx/PlK3ty7fC+R7B+263ocHr6FH6a4RbC4ksTcyRoEX0VTU0fxHca/ssZ+Y3AormHeH8zBaEXzlJ3h9K4OBi/IfQG+O4AcSdyV9m7tDa8viP6i46WOu+eIRtJB+Q8Kqp8EzBvWqdzRRpz0CgYEAzNweciqPD06p6NTkTqNudDMlivSRUqlrlpXI58M5ZHggd4y+wf9I4poLt7SgD+XQbBA7IeWFDcPLA1hZ5D8N343bhLr792BIu7TsAYNXSVG4TpcEUW0eDNTjEWmARqvk/D9idJIDl0xTRe/ZxcRI13Pf7WU87D3kFvh78UyDp+sCgYEA7yOv9YwCw7VADy/mdI7sy4HsUXTa/OJgmReepTe+sbOm2MBuo4X0KJOjfs5+4EIL+yuaa2evppCl+2kHpNVQyvv/B1X9Nbj57brhAKWzbDbzek76TEXgfXuiTuzDotmCq0z+v+mPOI5ov/Jj8wFz0it5wRXMcfHH33o0weXPhJsCgYA90S5exPjmZZZf69343Ng3uDdb9vDjQLx2dDxrsz1eU+F4McBeSep0doeSp66lHXQHJ96wG9JKlQptt/toJJ7LFsNnCgV+YE+SVMXirv9n4ID9NhTXfVXUCWl7l5pduQEgHQBYrLbosN9v+zB7vP8+BHlN6X64yvRI+jJsXepcgQKBgQCTzLG/CFbZEJfUCx3bIk7WBKnDOn7yVxOu6vtBT+/LMqbHRj/bTzo1LfKZuBSQlCGFjlB1W3Mjdjkv5p0z0ieKHS9lIE9MOdQ2iw7vcHoxQtE+4bsvEu0JgTUypIDRkK+DIiY9BKRhJxs0ryH5Gge0eOxaWxetwOpwg75BrMCSSwKBgQCzNI7moU0IP8KVEDCef1EoWgaQA9uaTqdOjjRAj04rRctX3u68JBHZAEjNZbSCZAgv5EWVzz5HMMkt02HR9eDJfhV9JKaYK6XE65xpy2XlXsrwLnz4k7TJsEwBENgIENdQZYxh9nr/ns5u9mt/iPgG+XDGfYnSWheyFHnRoB3eKg==', CAST(N'2024-12-20T11:10:41.2646240' AS DateTime2))
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
INSERT [dbo].[Evaluation] ([Id], [UnitId], [CategoryTimeTypeId], [EvaluationName], [Status], [IsDeleted], [UpdatedAt]) VALUES (N'44fd7eff-2866-48b2-a9cd-67f89406c5e3', N'4402c619-783f-4580-83cd-86e50a47171d', N'cbd1e5ab-0498-460c-823d-0acfde1bc2d3', N'Phiếu đánh giá tháng 12- 2024', 1, 0, CAST(N'2024-12-20T11:24:29.5129886' AS DateTime2))
INSERT [dbo].[Evaluation] ([Id], [UnitId], [CategoryTimeTypeId], [EvaluationName], [Status], [IsDeleted], [UpdatedAt]) VALUES (N'd6309271-88d3-4c70-8f3f-a89634cc81d9', N'93684774-0d94-42c9-ac77-078b6e3d2366', N'cbd1e5ab-0498-460c-823d-0acfde1bc2d3', N'Phiếu đánh giá tháng 12- 2024 - VCQL', 0, 0, CAST(N'2024-12-12T22:55:32.5351268' AS DateTime2))
INSERT [dbo].[Evaluation] ([Id], [UnitId], [CategoryTimeTypeId], [EvaluationName], [Status], [IsDeleted], [UpdatedAt]) VALUES (N'3e805b41-1adc-426c-93a4-cfb6b7be3f9a', N'4402c619-783f-4580-83cd-86e50a47171d', N'cbd1e5ab-0498-460c-823d-0acfde1bc2d3', N'Phiếu đánh giá tháng 12- 2024 - VCQL', 1, 0, CAST(N'2024-12-20T11:24:29.5649892' AS DateTime2))
INSERT [dbo].[Evaluation] ([Id], [UnitId], [CategoryTimeTypeId], [EvaluationName], [Status], [IsDeleted], [UpdatedAt]) VALUES (N'533e2aa7-6661-43fb-9be2-d23340a9cc52', N'93684774-0d94-42c9-ac77-078b6e3d2366', N'cbd1e5ab-0498-460c-823d-0acfde1bc2d3', N'Phiếu đánh giá tháng 12- 2024', 0, 0, CAST(N'2024-12-03T22:30:25.3119903' AS DateTime2))
GO
INSERT [dbo].[EvaluationAAE] ([Id], [EvaluationId], [UserId], [SupervisorId], [Advantages], [DisAdvantages], [AddReviews], [KetQuaHoatDongCoQuan], [NangLucLanhDaoQuanLy], [NangLucTapHopDoanKet], [NhanXetUuKhuyetDiem], [NhanDinhChieuHuongPhatTrien], [IsDeleted], [UpdatedAt]) VALUES (N'b228650f-bfcf-41c9-bfef-0b819e613279', N'3e805b41-1adc-426c-93a4-cfb6b7be3f9a', N'd3f15e0a-7ac8-4f28-b93e-f8c11eee7fcf', N'cdb5713c-fcb9-4105-8140-033fc2ac032e', N' - Có ý thức học hỏi, tiếp thu kinh nghiệm, lắng nghe ý kiến hướng dẫn, góp ý của lãnh đạo và các đồng nghiệp trong cơ quan. Tự nâng cao trình độ, không ngại những những nhiệm vụ mới có áp lực công việc cao do cơ quan, đơn vị, tổ chức giao phó.
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
+ Lãnh đạo thực hiện mọi nhiệm vụ trên nguyên tắc tập trung dân chủ, phát huy quyền làm chủ, xây dựng khối đại đoàn kết giữa các bộ phận, tổ chức trong đơn vị.', NULL, NULL, NULL, N'- nx 1', N'- nx 2', 0, CAST(N'2024-12-20T11:21:46.9000705' AS DateTime2))
INSERT [dbo].[EvaluationAAE] ([Id], [EvaluationId], [UserId], [SupervisorId], [Advantages], [DisAdvantages], [AddReviews], [KetQuaHoatDongCoQuan], [NangLucLanhDaoQuanLy], [NangLucTapHopDoanKet], [NhanXetUuKhuyetDiem], [NhanDinhChieuHuongPhatTrien], [IsDeleted], [UpdatedAt]) VALUES (N'b567b7db-5248-4458-a218-6bd9834177bb', N'44fd7eff-2866-48b2-a9cd-67f89406c5e3', N'2d1c4b21-92b0-4105-9151-0980a4c924ad', N'70be578e-af27-4056-a6ad-55990f86b3e7', N' - Có ý thức học hỏi, tiếp thu kinh nghiệm, lắng nghe ý kiến hướng dẫn, góp ý của lãnh đạo và các đồng nghiệp trong cơ quan. Tự nâng cao trình độ, không ngại những những nhiệm vụ mới có áp lực công việc cao do cơ quan, đơn vị, tổ chức giao phó.
 -  Chấp hành tốt quy định về đạo đức nghề nghiệp, có phẩm chất đạo đức trong sáng giản dị, có thái độ hòa nhã, khiêm tốn với nhân đân khi giao tiếp trong công việc và lắng nghe ý kiến đóng góp của nhân dân.
', N' - Đôi khi chưa đảm bảo ngày, giờ công lao động.
 - Ít phát biểu trong cuộc họp, chưa mạnh dạn trong tự phê bình và phê bình.
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
+ Lãnh đạo thực hiện mọi nhiệm vụ trên nguyên tắc tập trung dân chủ, phát huy quyền làm chủ, xây dựng khối đại đoàn kết giữa các bộ phận, tổ chức trong đơn vị.', NULL, NULL, NULL, N'- test 1233', N'- test 2133', 0, CAST(N'2024-12-20T11:18:26.6084173' AS DateTime2))
INSERT [dbo].[EvaluationAAE] ([Id], [EvaluationId], [UserId], [SupervisorId], [Advantages], [DisAdvantages], [AddReviews], [KetQuaHoatDongCoQuan], [NangLucLanhDaoQuanLy], [NangLucTapHopDoanKet], [NhanXetUuKhuyetDiem], [NhanDinhChieuHuongPhatTrien], [IsDeleted], [UpdatedAt]) VALUES (N'549c9a81-b769-465d-a210-82e65c1b4129', N'3e805b41-1adc-426c-93a4-cfb6b7be3f9a', N'70be578e-af27-4056-a6ad-55990f86b3e7', N'cdb5713c-fcb9-4105-8140-033fc2ac032e', N' - Có ý thức học hỏi, tiếp thu kinh nghiệm, lắng nghe ý kiến hướng dẫn, góp ý của lãnh đạo và các đồng nghiệp trong cơ quan. Tự nâng cao trình độ, không ngại những những nhiệm vụ mới có áp lực công việc cao do cơ quan, đơn vị, tổ chức giao phó.
 -  Chấp hành tốt quy định về đạo đức nghề nghiệp, có phẩm chất đạo đức trong sáng giản dị, có thái độ hòa nhã, khiêm tốn với nhân đân khi giao tiếp trong công việc và lắng nghe ý kiến đóng góp của nhân dân.
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
+ Lãnh đạo thực hiện mọi nhiệm vụ trên nguyên tắc tập trung dân chủ, phát huy quyền làm chủ, xây dựng khối đại đoàn kết giữa các bộ phận, tổ chức trong đơn vị.', N'- 1', N'- 2', N'- 3', N'- nx 13', N'- nx 23', 0, CAST(N'2024-12-20T11:22:18.5068250' AS DateTime2))
INSERT [dbo].[EvaluationAAE] ([Id], [EvaluationId], [UserId], [SupervisorId], [Advantages], [DisAdvantages], [AddReviews], [KetQuaHoatDongCoQuan], [NangLucLanhDaoQuanLy], [NangLucTapHopDoanKet], [NhanXetUuKhuyetDiem], [NhanDinhChieuHuongPhatTrien], [IsDeleted], [UpdatedAt]) VALUES (N'499267a9-544e-44ec-aa9d-b504d5a4f0e5', N'44fd7eff-2866-48b2-a9cd-67f89406c5e3', N'32f207a2-02ba-4b83-8c71-03af11657c63', N'70be578e-af27-4056-a6ad-55990f86b3e7', N' - Có năng lực trình độ chuyên môn nghiệp vụ vững vàng, đảm bảo được những nhiệm vụ công việc được cấp trên giao phó.
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
+ Lãnh đạo thực hiện mọi nhiệm vụ trên nguyên tắc tập trung dân chủ, phát huy quyền làm chủ, xây dựng khối đại đoàn kết giữa các bộ phận, tổ chức trong đơn vị.', NULL, NULL, NULL, N'- test 1', N'- test 21', 0, CAST(N'2024-12-20T11:16:26.0177387' AS DateTime2))
INSERT [dbo].[EvaluationAAE] ([Id], [EvaluationId], [UserId], [SupervisorId], [Advantages], [DisAdvantages], [AddReviews], [KetQuaHoatDongCoQuan], [NangLucLanhDaoQuanLy], [NangLucTapHopDoanKet], [NhanXetUuKhuyetDiem], [NhanDinhChieuHuongPhatTrien], [IsDeleted], [UpdatedAt]) VALUES (N'd902aaf9-b5e5-4174-997b-cc4069b27997', N'3e805b41-1adc-426c-93a4-cfb6b7be3f9a', N'd3f15e0a-7ac8-4f28-b93e-f8c11eee7fcf', NULL, N' - Tích cực, tận tụy, có ý thức trách nhiệm với công việc.
 - Có năng lực trình độ chuyên môn nghiệp vụ vững vàng, đảm bảo được những nhiệm vụ công việc được cấp trên giao phó.
', N' - Chưa hòa đồng với đồng nghiệp.
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
+ Lãnh đạo thực hiện mọi nhiệm vụ trên nguyên tắc tập trung dân chủ, phát huy quyền làm chủ, xây dựng khối đại đoàn kết giữa các bộ phận, tổ chức trong đơn vị.', NULL, NULL, NULL, NULL, NULL, 0, CAST(N'2024-12-18T15:08:07.4405568' AS DateTime2))
INSERT [dbo].[EvaluationAAE] ([Id], [EvaluationId], [UserId], [SupervisorId], [Advantages], [DisAdvantages], [AddReviews], [KetQuaHoatDongCoQuan], [NangLucLanhDaoQuanLy], [NangLucTapHopDoanKet], [NhanXetUuKhuyetDiem], [NhanDinhChieuHuongPhatTrien], [IsDeleted], [UpdatedAt]) VALUES (N'a0ac9d27-3e2e-4010-9344-d52b8b87b17b', N'44fd7eff-2866-48b2-a9cd-67f89406c5e3', N'dd3c7e8b-3dc7-45d2-a2bd-282de7d5e2de', N'70be578e-af27-4056-a6ad-55990f86b3e7', N' - Không vi phạm về nhân cách danh dự, nhân phẩm làm ảnh hưởng xấu đến ngành, đơn vị nơi công tác.
 - Thực hiện đóng góp đầy đủ các loại quỹ và các nghĩa vụ khác của viên chức.
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
+ Lãnh đạo thực hiện mọi nhiệm vụ trên nguyên tắc tập trung dân chủ, phát huy quyền làm chủ, xây dựng khối đại đoàn kết giữa các bộ phận, tổ chức trong đơn vị.', NULL, NULL, NULL, N'- test 123', N'- test 213', 0, CAST(N'2024-12-20T11:17:59.4327878' AS DateTime2))
INSERT [dbo].[EvaluationAAE] ([Id], [EvaluationId], [UserId], [SupervisorId], [Advantages], [DisAdvantages], [AddReviews], [KetQuaHoatDongCoQuan], [NangLucLanhDaoQuanLy], [NangLucTapHopDoanKet], [NhanXetUuKhuyetDiem], [NhanDinhChieuHuongPhatTrien], [IsDeleted], [UpdatedAt]) VALUES (N'5f1f07c9-e7e5-4e71-83ab-d5db231b9795', N'44fd7eff-2866-48b2-a9cd-67f89406c5e3', N'55fc6d0e-50b3-4876-bf93-ee3937daeb62', N'70be578e-af27-4056-a6ad-55990f86b3e7', N' - Có ý thức học hỏi, tiếp thu kinh nghiệm, lắng nghe ý kiến hướng dẫn, góp ý của lãnh đạo và các đồng nghiệp trong cơ quan. Tự nâng cao trình độ, không ngại những những nhiệm vụ mới có áp lực công việc cao do cơ quan, đơn vị, tổ chức giao phó.
 - Luôn chấp hành mọi chủ trương chính sách của Đảng, chính sách pháp luật của nhà nước, không vi phạm pháp luật, không mắc tệ nạn xã hội,có tinh thần đoàn kết,sẵn sàng giúp đỡ mọi người.
', N' - Chưa hòa đồng với đồng nghiệp.
 - Ít phát biểu trong cuộc họp, chưa mạnh dạn trong tự phê bình và phê bình.
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
+ Lãnh đạo thực hiện mọi nhiệm vụ trên nguyên tắc tập trung dân chủ, phát huy quyền làm chủ, xây dựng khối đại đoàn kết giữa các bộ phận, tổ chức trong đơn vị.', NULL, NULL, NULL, N'- test 12', N'- test 21', 0, CAST(N'2024-12-20T11:19:04.2161746' AS DateTime2))
GO
INSERT [dbo].[EvaluationConsolidationAndTransfer] ([Id], [UserId], [UnitId], [EvaluationConsolidationAndTransferName], [Status], [UpdatedAt]) VALUES (N'6d4d14b7-6e2c-4b72-a18f-81070d6ebeba', N'70be578e-af27-4056-a6ad-55990f86b3e7', N'4402c619-783f-4580-83cd-86e50a47171d', N'Tổng hợp và chuyển tháng 12 - 2024 - THCS Lộc Ninh', 1, CAST(N'2024-12-20T11:24:29.6877450' AS DateTime2))
GO
INSERT [dbo].[EvaluationConsolidationAndTransferDetails] ([Id], [EvaluationConsolidationAndTransferId], [EvaluationId], [UpdatedAt]) VALUES (N'f1ba4126-8885-4a7d-9f14-9b2df9509ae4', N'6d4d14b7-6e2c-4b72-a18f-81070d6ebeba', N'44fd7eff-2866-48b2-a9cd-67f89406c5e3', CAST(N'2024-12-20T11:23:37.1041675' AS DateTime2))
INSERT [dbo].[EvaluationConsolidationAndTransferDetails] ([Id], [EvaluationConsolidationAndTransferId], [EvaluationId], [UpdatedAt]) VALUES (N'70722fe5-a067-4521-8599-ed6345e544ae', N'6d4d14b7-6e2c-4b72-a18f-81070d6ebeba', N'3e805b41-1adc-426c-93a4-cfb6b7be3f9a', CAST(N'2024-12-20T11:23:37.1205654' AS DateTime2))
GO
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'57df4c30-1c1d-4d6d-9b4e-00ad48f7bff3', N'44fd7eff-2866-48b2-a9cd-67f89406c5e3', N'ca2c80e4-c9e6-4bc1-a080-1c0505bccaba', 0, CAST(N'2024-12-03T22:10:12.5714914' AS DateTime2), 13)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'2407afd2-a31b-495b-8a1d-07869538be14', N'3e805b41-1adc-426c-93a4-cfb6b7be3f9a', N'b2360422-271d-47f6-8884-f734d48e2cf6', 0, CAST(N'2024-12-20T11:12:58.8546816' AS DateTime2), 21)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'2ff5d04e-8d1e-4d6b-9eec-09c3948166ef', N'3e805b41-1adc-426c-93a4-cfb6b7be3f9a', N'4451add8-b5d1-483a-9fe8-254611d89e32', 0, CAST(N'2024-12-20T11:12:58.8504468' AS DateTime2), 20)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'9f0b0494-0ed3-4589-b53c-0b1e622a3caf', N'44fd7eff-2866-48b2-a9cd-67f89406c5e3', N'51ef79d2-b47e-41f1-a99d-f5c0e4f4416e', 0, CAST(N'2024-12-03T22:10:12.5893467' AS DateTime2), 15)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'3cdfbcec-afa7-45fc-8d27-11d944265c2a', N'3e805b41-1adc-426c-93a4-cfb6b7be3f9a', N'71cc2ca9-d338-4621-bb19-f4bd2abc9e06', 0, CAST(N'2024-12-20T11:12:58.7931020' AS DateTime2), 8)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'fdb0c7a2-dd1e-466b-9fd8-12d8a9719335', N'44fd7eff-2866-48b2-a9cd-67f89406c5e3', N'b9ec64fd-8aac-44db-8541-67b1c6162676', 0, CAST(N'2024-12-03T22:10:12.5517949' AS DateTime2), 26)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'a584acfe-7b3d-4cd6-b52c-14bf55d9e746', N'533e2aa7-6661-43fb-9be2-d23340a9cc52', N'6f0a8890-c105-4fb4-874b-9d559847eca6', 0, CAST(N'2024-12-03T22:10:12.6559107' AS DateTime2), 23)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'4d8176e0-0b32-4b94-9555-1a41f45f0bdb', N'd6309271-88d3-4c70-8f3f-a89634cc81d9', N'1834d96f-f389-45f2-9006-f9d57b1ecf53', 0, CAST(N'2024-12-12T22:55:25.3102939' AS DateTime2), 20)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'e72bf27f-1885-4da2-a1cb-1a4e6d247fb4', N'd6309271-88d3-4c70-8f3f-a89634cc81d9', N'7fe6502c-10e1-430f-bbbd-01943d0f5e98', 0, CAST(N'2024-12-12T22:55:25.2884834' AS DateTime2), 5)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'262b67f8-828f-4f09-983d-1ad7cd3f0d51', N'44fd7eff-2866-48b2-a9cd-67f89406c5e3', N'e6d88410-17f4-479b-8e2d-8b6d5c0324a7', 0, CAST(N'2024-12-03T22:10:12.5811605' AS DateTime2), 27)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'b9051419-5b11-4a6f-92e8-1b2c35fc032d', N'44fd7eff-2866-48b2-a9cd-67f89406c5e3', N'da5e3dff-a649-4508-943d-0ecc32d4f7fc', 0, CAST(N'2024-12-03T22:10:12.5284030' AS DateTime2), 9)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'fe2d2114-2e2d-4181-9a16-1bfc86ddb362', N'533e2aa7-6661-43fb-9be2-d23340a9cc52', N'ad4a5bce-f3c4-44a7-85c5-fdb1c2d19d12', 0, CAST(N'2024-12-03T22:10:12.6236940' AS DateTime2), 20)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'17845e21-e160-40e9-be02-1d9274f32d10', N'44fd7eff-2866-48b2-a9cd-67f89406c5e3', N'8b678550-a782-4ed9-a61f-15887cf5a73e', 0, CAST(N'2024-12-03T22:10:12.5545132' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'17492331-7f8c-4788-8568-1de60eabeb13', N'533e2aa7-6661-43fb-9be2-d23340a9cc52', N'79459d60-5db6-48b6-94bf-2121d9839e15', 0, CAST(N'2024-12-03T22:10:12.6352885' AS DateTime2), 2)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'ba441ea2-ce78-4a4b-a99b-1f4ca7b16afe', N'3e805b41-1adc-426c-93a4-cfb6b7be3f9a', N'415eb223-1f18-4338-be5a-b6b2ce5496ed', 0, CAST(N'2024-12-20T11:12:58.7886459' AS DateTime2), 7)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'ca63cdc0-b117-44ea-af03-20b10f001c95', N'3e805b41-1adc-426c-93a4-cfb6b7be3f9a', N'1746be1c-1adf-4f5d-8604-a711e2cc52f0', 0, CAST(N'2024-12-20T11:12:58.7796902' AS DateTime2), 5)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'f8518716-91d1-4f85-9855-20fa32d80593', N'd6309271-88d3-4c70-8f3f-a89634cc81d9', N'c733b044-2ace-43ea-be34-251b9af672cf', 0, CAST(N'2024-12-12T22:55:25.2972622' AS DateTime2), 10)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'6ebe05f5-ef1a-405b-a1d6-26ab0010411b', N'533e2aa7-6661-43fb-9be2-d23340a9cc52', N'c702e9e8-111b-4402-8ed0-5f939a7892a6', 0, CAST(N'2024-12-03T22:10:12.6795083' AS DateTime2), 19)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'11c1291f-4d8f-4fb0-833e-29020c8c20b9', N'd6309271-88d3-4c70-8f3f-a89634cc81d9', N'93b43166-bdad-4118-9bed-8176279fdf95', 0, CAST(N'2024-12-12T22:55:25.3167150' AS DateTime2), 4)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'140c88bf-340f-4c19-b26d-2be71e3f2276', N'533e2aa7-6661-43fb-9be2-d23340a9cc52', N'3c69d1e2-9204-431f-863f-a4ba07f3ac1d', 0, CAST(N'2024-12-03T22:10:12.6946350' AS DateTime2), 21)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'abc2d041-7da7-44c3-bad2-2dd5dc4d52f8', N'd6309271-88d3-4c70-8f3f-a89634cc81d9', N'45455dc8-4edc-4fd6-bc00-d5433173d947', 0, CAST(N'2024-12-12T22:55:25.2784103' AS DateTime2), 11)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'ab730722-8e74-4799-95c0-2faec8990d02', N'44fd7eff-2866-48b2-a9cd-67f89406c5e3', N'efbe3ff8-a8cb-408b-b2de-f0cdc5f03d55', 0, CAST(N'2024-12-03T22:10:12.5225505' AS DateTime2), 17)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'dc3d5294-14a3-4692-adef-33e6ce38d2a4', N'3e805b41-1adc-426c-93a4-cfb6b7be3f9a', N'39750d51-ea4d-4d9b-b871-6a65bb01b5a9', 0, CAST(N'2024-12-20T11:12:58.8122746' AS DateTime2), 12)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'f09f10f7-cdd0-426d-9bf6-34d1ca9dcc0a', N'44fd7eff-2866-48b2-a9cd-67f89406c5e3', N'35ca5805-aa8f-4dc0-a895-c2bae87a00eb', 0, CAST(N'2024-12-03T22:10:12.5252622' AS DateTime2), 22)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'c9a47ecd-ed29-4ffb-ae53-38581da16f40', N'd6309271-88d3-4c70-8f3f-a89634cc81d9', N'415eb223-1f18-4338-be5a-b6b2ce5496ed', 0, CAST(N'2024-12-12T22:55:25.3074325' AS DateTime2), 14)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'966a23c7-23e5-4167-892a-3f554f3260f2', N'44fd7eff-2866-48b2-a9cd-67f89406c5e3', N'3a9ab36e-b834-4a20-ba32-a0d34fdc47da', 0, CAST(N'2024-12-03T22:10:12.5115876' AS DateTime2), 12)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'cca5fade-de7a-42cc-8825-43031121439f', N'533e2aa7-6661-43fb-9be2-d23340a9cc52', N'51ef79d2-b47e-41f1-a99d-f5c0e4f4416e', 0, CAST(N'2024-12-03T22:10:12.6821867' AS DateTime2), 15)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'ee34c9b2-0f26-4a74-b160-4492f8364464', N'533e2aa7-6661-43fb-9be2-d23340a9cc52', N'35ca5805-aa8f-4dc0-a895-c2bae87a00eb', 0, CAST(N'2024-12-03T22:10:12.6182079' AS DateTime2), 22)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'c8351048-7b24-482b-80b0-463ffa8242b6', N'd6309271-88d3-4c70-8f3f-a89634cc81d9', N'abbcb306-3144-4c8a-8b98-eb07a3663ade', 0, CAST(N'2024-12-12T22:55:25.2850267' AS DateTime2), 8)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'abba5e5a-ebe9-4347-8e3f-521fa57dad3a', N'd6309271-88d3-4c70-8f3f-a89634cc81d9', N'39750d51-ea4d-4d9b-b871-6a65bb01b5a9', 0, CAST(N'2024-12-12T22:55:25.3237914' AS DateTime2), 19)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'a3d76683-0bcb-4a09-9740-54cd28ab31eb', N'3e805b41-1adc-426c-93a4-cfb6b7be3f9a', N'97787e25-9013-4175-a4e6-ca0d74509ac1', 0, CAST(N'2024-12-20T11:12:58.7984790' AS DateTime2), 9)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'15fae869-b77e-486a-9f9c-556c6dcfca39', N'd6309271-88d3-4c70-8f3f-a89634cc81d9', N'51ea330f-07af-4d54-adff-114bdd0e6057', 0, CAST(N'2024-12-12T22:55:25.2816305' AS DateTime2), 3)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'322dc0ed-8275-48b6-8264-57d1ffd10aeb', N'533e2aa7-6661-43fb-9be2-d23340a9cc52', N'a7efdc67-aa93-46cb-8410-0ddcfe0d5853', 0, CAST(N'2024-12-03T22:10:12.6850978' AS DateTime2), 31)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'95aec639-b24f-44ca-a649-5912e7158a51', N'44fd7eff-2866-48b2-a9cd-67f89406c5e3', N'f4c06feb-eb3d-4f75-95f9-10c0289de995', 0, CAST(N'2024-12-03T22:10:12.5689650' AS DateTime2), 30)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'80c4bc56-48c8-4786-a4e2-5934ac40e22a', N'44fd7eff-2866-48b2-a9cd-67f89406c5e3', N'3622e825-11bb-44fd-bc59-ce0c40aa9509', 0, CAST(N'2024-12-03T22:10:12.5840468' AS DateTime2), 18)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'cd6e4af8-7f74-4f26-8e3a-5a5f8101e88e', N'3e805b41-1adc-426c-93a4-cfb6b7be3f9a', N'93b43166-bdad-4118-9bed-8176279fdf95', 0, CAST(N'2024-12-20T11:12:58.8406479' AS DateTime2), 18)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'11da88c3-b2cf-44c9-929f-5bd53a44cf15', N'44fd7eff-2866-48b2-a9cd-67f89406c5e3', N'bf0b9144-be3b-4213-8f3c-f744035ed4b5', 0, CAST(N'2024-12-03T22:10:12.5978290' AS DateTime2), 14)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'caf38587-40fe-48fe-a85d-5d0e5c2338f6', N'533e2aa7-6661-43fb-9be2-d23340a9cc52', N'e296f2f3-e89c-49b9-b304-b76df59719ae', 0, CAST(N'2024-12-03T22:10:12.6704707' AS DateTime2), 10)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'4f4ad443-8673-47e0-afb1-616195b9457d', N'd6309271-88d3-4c70-8f3f-a89634cc81d9', N'99652497-2b73-4368-901c-05143fd3f8b1', 0, CAST(N'2024-12-12T22:55:25.2913891' AS DateTime2), 17)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'64d2a960-f87b-4ba3-abe0-6489aaf97d8e', N'd6309271-88d3-4c70-8f3f-a89634cc81d9', N'8005ad2a-4d92-4101-9719-8e8364e57996', 0, CAST(N'2024-12-12T22:55:25.2944055' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'7e479085-a43c-4f92-b4b4-67e2cb64b817', N'533e2aa7-6661-43fb-9be2-d23340a9cc52', N'76f4c106-34b2-4175-a413-f0b67106218f', 0, CAST(N'2024-12-03T22:10:12.6532590' AS DateTime2), 16)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'72b9fdd4-8a6d-4192-9613-6875c8ee3bab', N'533e2aa7-6661-43fb-9be2-d23340a9cc52', N'b9ec64fd-8aac-44db-8541-67b1c6162676', 0, CAST(N'2024-12-03T22:10:12.6441845' AS DateTime2), 26)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'c316e1eb-5d82-44e4-88ac-6b349f08450c', N'533e2aa7-6661-43fb-9be2-d23340a9cc52', N'e6d88410-17f4-479b-8e2d-8b6d5c0324a7', 0, CAST(N'2024-12-03T22:10:12.6733145' AS DateTime2), 27)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'c6f177a1-ec45-4301-a98c-6be90ccd312e', N'533e2aa7-6661-43fb-9be2-d23340a9cc52', N'786e1a85-def5-4a2e-a70c-cfc2c0d8b239', 0, CAST(N'2024-12-03T22:10:12.6299879' AS DateTime2), 11)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'6521d845-4f9e-4864-b79f-70b8eecca698', N'533e2aa7-6661-43fb-9be2-d23340a9cc52', N'fb40ad8f-098f-4fd1-8870-c05d1d25fae2', 0, CAST(N'2024-12-03T22:10:12.6406315' AS DateTime2), 29)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'1c27e5ff-afed-4002-8fa0-712de0fb1947', N'533e2aa7-6661-43fb-9be2-d23340a9cc52', N'8b678550-a782-4ed9-a61f-15887cf5a73e', 0, CAST(N'2024-12-03T22:10:12.6478944' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'5b56175b-fafd-48c1-8a67-71be50301514', N'3e805b41-1adc-426c-93a4-cfb6b7be3f9a', N'cdaf282b-23f7-42a5-b099-22cd38a5c8b1', 0, CAST(N'2024-12-20T11:12:58.8212474' AS DateTime2), 14)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'82660276-5d20-4418-bc22-71da3efe99b0', N'44fd7eff-2866-48b2-a9cd-67f89406c5e3', N'1fb789cf-87b0-43b0-a45e-e85e3891a9ee', 0, CAST(N'2024-12-03T22:10:12.5748039' AS DateTime2), 7)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'eeb36b13-7a6d-4dbf-8e36-73e3de7132b0', N'44fd7eff-2866-48b2-a9cd-67f89406c5e3', N'76f4c106-34b2-4175-a413-f0b67106218f', 0, CAST(N'2024-12-03T22:10:12.5602902' AS DateTime2), 16)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'2f5b0efd-0cc1-4a88-9cb2-75de73334a14', N'533e2aa7-6661-43fb-9be2-d23340a9cc52', N'acf13799-4766-4be0-a514-693c0d238f34', 0, CAST(N'2024-12-03T22:10:12.6128440' AS DateTime2), 25)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'5f4a2cdb-2044-4557-a4e7-76bfc2398683', N'3e805b41-1adc-426c-93a4-cfb6b7be3f9a', N'41245dd4-b247-48cd-a67c-6f23c005a5fe', 0, CAST(N'2024-12-20T11:12:58.7842465' AS DateTime2), 6)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'30135b17-ad6b-44e1-af20-76f14613555b', N'533e2aa7-6661-43fb-9be2-d23340a9cc52', N'efbe3ff8-a8cb-408b-b2de-f0cdc5f03d55', 0, CAST(N'2024-12-03T22:10:12.6156236' AS DateTime2), 17)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'01bad5fb-807f-458b-8ee3-7bcfa14a8884', N'44fd7eff-2866-48b2-a9cd-67f89406c5e3', N'999d3424-6bad-4d7b-8bd0-2b462b55dd45', 0, CAST(N'2024-12-03T22:10:12.5950731' AS DateTime2), 4)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'f805866e-a2a3-4047-93a1-7ccea05c7b01', N'd6309271-88d3-4c70-8f3f-a89634cc81d9', N'97787e25-9013-4175-a4e6-ca0d74509ac1', 0, CAST(N'2024-12-12T22:55:25.3271179' AS DateTime2), 16)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'6b171dfb-a02f-4076-8ed7-7d223902e1b0', N'44fd7eff-2866-48b2-a9cd-67f89406c5e3', N'6f0a8890-c105-4fb4-874b-9d559847eca6', 0, CAST(N'2024-12-03T22:10:12.5633268' AS DateTime2), 23)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'78986923-5a5e-4185-896f-7d53f2251744', N'44fd7eff-2866-48b2-a9cd-67f89406c5e3', N'87fedc0d-caae-4890-80d9-a6e086d71a1c', 0, CAST(N'2024-12-03T22:10:12.5571854' AS DateTime2), 3)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'7020e1f6-96f2-4302-a060-80fdd2a6b0a0', N'533e2aa7-6661-43fb-9be2-d23340a9cc52', N'3622e825-11bb-44fd-bc59-ce0c40aa9509', 0, CAST(N'2024-12-03T22:10:12.6764056' AS DateTime2), 18)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'0a2e4e41-1e97-40a2-a05c-810073669c20', N'3e805b41-1adc-426c-93a4-cfb6b7be3f9a', N'8005ad2a-4d92-4101-9719-8e8364e57996', 0, CAST(N'2024-12-20T11:12:58.8258059' AS DateTime2), 15)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'044ff3e9-f65f-413d-b3d0-86857c121bc9', N'44fd7eff-2866-48b2-a9cd-67f89406c5e3', N'786e1a85-def5-4a2e-a70c-cfc2c0d8b239', 0, CAST(N'2024-12-03T22:10:12.5360435' AS DateTime2), 11)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'08fee703-228b-4073-8fdf-8935fe55f28d', N'44fd7eff-2866-48b2-a9cd-67f89406c5e3', N'3c69d1e2-9204-431f-863f-a4ba07f3ac1d', 0, CAST(N'2024-12-03T22:10:12.6004677' AS DateTime2), 21)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'af386a97-a6b5-4f81-a8eb-8b3abb0459e4', N'44fd7eff-2866-48b2-a9cd-67f89406c5e3', N'fb40ad8f-098f-4fd1-8870-c05d1d25fae2', 0, CAST(N'2024-12-03T22:10:12.5488111' AS DateTime2), 29)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'c5e3394b-a256-48f2-8ff0-8c35427fd056', N'533e2aa7-6661-43fb-9be2-d23340a9cc52', N'f4c06feb-eb3d-4f75-95f9-10c0289de995', 0, CAST(N'2024-12-03T22:10:12.6619073' AS DateTime2), 30)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'6270bc81-85fa-44c4-89da-8e94ce543402', N'd6309271-88d3-4c70-8f3f-a89634cc81d9', N'4451add8-b5d1-483a-9fe8-254611d89e32', 0, CAST(N'2024-12-12T22:55:25.3339865' AS DateTime2), 6)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'a1ad7350-bb54-4dbb-ad30-909fefae59df', N'3e805b41-1adc-426c-93a4-cfb6b7be3f9a', N'1834d96f-f389-45f2-9006-f9d57b1ecf53', 0, CAST(N'2024-12-20T11:12:58.8168638' AS DateTime2), 13)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'e7b7e340-9e22-4cf2-8136-97f121f8bb8b', N'3e805b41-1adc-426c-93a4-cfb6b7be3f9a', N'51ea330f-07af-4d54-adff-114bdd0e6057', 0, CAST(N'2024-12-20T11:12:58.8355442' AS DateTime2), 17)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'7d6b91a4-c2c4-4888-811b-9987c5254811', N'3e805b41-1adc-426c-93a4-cfb6b7be3f9a', N'7fe6502c-10e1-430f-bbbd-01943d0f5e98', 0, CAST(N'2024-12-20T11:12:58.8461239' AS DateTime2), 19)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'3f584452-d607-4c23-8840-99c0941b08c1', N'44fd7eff-2866-48b2-a9cd-67f89406c5e3', N'ad4a5bce-f3c4-44a7-85c5-fdb1c2d19d12', 0, CAST(N'2024-12-03T22:10:12.5307578' AS DateTime2), 20)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'ac363092-7279-4426-8f5e-9a4e6cfb583c', N'd6309271-88d3-4c70-8f3f-a89634cc81d9', N'b2360422-271d-47f6-8884-f734d48e2cf6', 0, CAST(N'2024-12-12T22:55:25.2747770' AS DateTime2), 7)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'9c521f0d-4bfb-48a3-82d4-9a796dc24b19', N'44fd7eff-2866-48b2-a9cd-67f89406c5e3', N'1b68a81a-b654-4896-9195-84abfb081103', 0, CAST(N'2024-12-03T22:10:12.5462809' AS DateTime2), 28)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'd7c1bad1-b72f-486f-98cd-9b0747073282', N'd6309271-88d3-4c70-8f3f-a89634cc81d9', N'1746be1c-1adf-4f5d-8604-a711e2cc52f0', 0, CAST(N'2024-12-12T22:55:25.2466982' AS DateTime2), 12)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'1d8a1274-27fd-43e0-8677-9b0b68a4a446', N'3e805b41-1adc-426c-93a4-cfb6b7be3f9a', N'f8c74f4e-94a2-4f75-9572-bf9c4692fae0', 0, CAST(N'2024-12-20T11:12:58.8073040' AS DateTime2), 11)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'80928549-1e68-4a59-aa69-9c1ae7675612', N'3e805b41-1adc-426c-93a4-cfb6b7be3f9a', N'45455dc8-4edc-4fd6-bc00-d5433173d947', 0, CAST(N'2024-12-20T11:12:58.7747473' AS DateTime2), 4)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'67284ccb-b621-4e23-b914-9cb6c5a5b106', N'd6309271-88d3-4c70-8f3f-a89634cc81d9', N'41245dd4-b247-48cd-a67c-6f23c005a5fe', 0, CAST(N'2024-12-12T22:55:25.2711662' AS DateTime2), 13)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'8d1420d4-4596-481a-89ae-9fcb5b5918df', N'533e2aa7-6661-43fb-9be2-d23340a9cc52', N'0f8a3810-dc07-47e8-a089-7d6c08107382', 0, CAST(N'2024-12-03T22:10:12.6270669' AS DateTime2), 8)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'86deefef-3565-4cdf-a48b-a3ab0d54c843', N'd6309271-88d3-4c70-8f3f-a89634cc81d9', N'e9cfa38c-e121-46ce-aaf5-b454a6b9f128', 0, CAST(N'2024-12-12T22:55:25.3133505' AS DateTime2), 9)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'28c4dc70-a101-4d24-bcc1-a73f018fc1d5', N'44fd7eff-2866-48b2-a9cd-67f89406c5e3', N'79459d60-5db6-48b6-94bf-2121d9839e15', 0, CAST(N'2024-12-03T22:10:12.5427437' AS DateTime2), 2)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'cc41c59d-36ed-46a9-9654-a81452057427', N'3e805b41-1adc-426c-93a4-cfb6b7be3f9a', N'c733b044-2ace-43ea-be34-251b9af672cf', 0, CAST(N'2024-12-20T11:12:58.7704950' AS DateTime2), 3)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'd3746061-fb94-4cef-ac6d-aa794308589b', N'533e2aa7-6661-43fb-9be2-d23340a9cc52', N'4723cac1-52f7-43bb-8d3f-bfb3b6c28a96', 0, CAST(N'2024-12-03T22:10:12.6587083' AS DateTime2), 24)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'3084de06-f23b-4fec-82f3-b4018d55fed8', N'533e2aa7-6661-43fb-9be2-d23340a9cc52', N'da5e3dff-a649-4508-943d-0ecc32d4f7fc', 0, CAST(N'2024-12-03T22:10:12.6208986' AS DateTime2), 9)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'6e9250f5-af27-490f-80b0-b4ce441723c4', N'3e805b41-1adc-426c-93a4-cfb6b7be3f9a', N'e9cfa38c-e121-46ce-aaf5-b454a6b9f128', 0, CAST(N'2024-12-20T11:12:58.7664391' AS DateTime2), 2)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'ff9db5c1-14f4-49a6-bb08-b838e17cefbf', N'533e2aa7-6661-43fb-9be2-d23340a9cc52', N'31314875-8f03-4874-be17-0f31c14f28ee', 0, CAST(N'2024-12-03T22:10:12.6976388' AS DateTime2), 6)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'b85b7897-34d1-4c88-9051-bb285ea9e5ff', N'44fd7eff-2866-48b2-a9cd-67f89406c5e3', N'a7efdc67-aa93-46cb-8410-0ddcfe0d5853', 0, CAST(N'2024-12-03T22:10:12.5920660' AS DateTime2), 31)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'ed1b2619-85bf-4554-854e-c26bc0d1235c', N'44fd7eff-2866-48b2-a9cd-67f89406c5e3', N'e296f2f3-e89c-49b9-b304-b76df59719ae', 0, CAST(N'2024-12-03T22:10:12.5782542' AS DateTime2), 10)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'a298ab23-2f06-400d-9b96-cb4412ef0b5c', N'3e805b41-1adc-426c-93a4-cfb6b7be3f9a', N'418bf356-ca1e-4db7-9aec-0635713b688d', 0, CAST(N'2024-12-20T11:12:58.8313341' AS DateTime2), 16)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'f8cf8c1a-0274-4009-8eba-cc75d0d2b075', N'44fd7eff-2866-48b2-a9cd-67f89406c5e3', N'4723cac1-52f7-43bb-8d3f-bfb3b6c28a96', 0, CAST(N'2024-12-03T22:10:12.5662068' AS DateTime2), 24)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'20909076-a95d-4283-bb09-cd1048cc78ed', N'd6309271-88d3-4c70-8f3f-a89634cc81d9', N'cdaf282b-23f7-42a5-b099-22cd38a5c8b1', 0, CAST(N'2024-12-12T22:55:25.3300231' AS DateTime2), 21)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'1af86d18-b45a-4507-b14b-d03b1112cdad', N'533e2aa7-6661-43fb-9be2-d23340a9cc52', N'ca2c80e4-c9e6-4bc1-a080-1c0505bccaba', 0, CAST(N'2024-12-03T22:10:12.6646304' AS DateTime2), 13)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'970e062c-5bfc-4a90-b5d1-d22df2566304', N'533e2aa7-6661-43fb-9be2-d23340a9cc52', N'87fedc0d-caae-4890-80d9-a6e086d71a1c', 0, CAST(N'2024-12-03T22:10:12.6507013' AS DateTime2), 3)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'28dd1225-99c3-4bcf-9b7b-dafbb102b297', N'533e2aa7-6661-43fb-9be2-d23340a9cc52', N'bf0b9144-be3b-4213-8f3c-f744035ed4b5', 0, CAST(N'2024-12-03T22:10:12.6913121' AS DateTime2), 14)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'334897f3-377a-4d2d-bbad-dc3c87539f16', N'3e805b41-1adc-426c-93a4-cfb6b7be3f9a', N'99652497-2b73-4368-901c-05143fd3f8b1', 0, CAST(N'2024-12-20T11:12:58.8029340' AS DateTime2), 10)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'fc7650fc-b4d5-4ea9-8e77-ddbf84a50d38', N'44fd7eff-2866-48b2-a9cd-67f89406c5e3', N'b4ab63da-81d4-4ea1-8a5a-3c12154fa561', 0, CAST(N'2024-12-03T22:10:12.5392379' AS DateTime2), 5)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'2859ead7-c57b-48f2-af10-de462a847fc3', N'533e2aa7-6661-43fb-9be2-d23340a9cc52', N'3a9ab36e-b834-4a20-ba32-a0d34fdc47da', 0, CAST(N'2024-12-03T22:10:12.6094558' AS DateTime2), 12)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'0469f91f-85cc-4c73-8afb-e601b9080dde', N'533e2aa7-6661-43fb-9be2-d23340a9cc52', N'1fb789cf-87b0-43b0-a45e-e85e3891a9ee', 0, CAST(N'2024-12-03T22:10:12.6676495' AS DateTime2), 7)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'8b0e2101-5a4d-405b-9749-e957875c4082', N'533e2aa7-6661-43fb-9be2-d23340a9cc52', N'999d3424-6bad-4d7b-8bd0-2b462b55dd45', 0, CAST(N'2024-12-03T22:10:12.6882070' AS DateTime2), 4)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'69a0b169-5ca7-4909-8ea3-eac52230c55c', N'44fd7eff-2866-48b2-a9cd-67f89406c5e3', N'acf13799-4766-4be0-a514-693c0d238f34', 0, CAST(N'2024-12-03T22:10:12.5194651' AS DateTime2), 25)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'a8207543-354b-4887-82e7-ebb04f8e62ba', N'd6309271-88d3-4c70-8f3f-a89634cc81d9', N'71cc2ca9-d338-4621-bb19-f4bd2abc9e06', 0, CAST(N'2024-12-12T22:55:25.3043898' AS DateTime2), 15)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'd909408e-fcea-46fd-8e84-ebd405348047', N'd6309271-88d3-4c70-8f3f-a89634cc81d9', N'418bf356-ca1e-4db7-9aec-0635713b688d', 0, CAST(N'2024-12-12T22:55:25.3010342' AS DateTime2), 2)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'59026674-ef72-4e06-9c8a-ec18856fe87c', N'd6309271-88d3-4c70-8f3f-a89634cc81d9', N'f8c74f4e-94a2-4f75-9572-bf9c4692fae0', 0, CAST(N'2024-12-12T22:55:25.3205450' AS DateTime2), 18)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'eeb02309-6fa1-4ae1-9ce3-f3028c38dc71', N'3e805b41-1adc-426c-93a4-cfb6b7be3f9a', N'abbcb306-3144-4c8a-8b98-eb07a3663ade', 0, CAST(N'2024-12-20T11:12:58.7433717' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'db80fb51-f221-4d69-937a-f503fdf15d03', N'533e2aa7-6661-43fb-9be2-d23340a9cc52', N'b4ab63da-81d4-4ea1-8a5a-3c12154fa561', 0, CAST(N'2024-12-03T22:10:12.6327064' AS DateTime2), 5)
GO
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'48392db0-15e2-4d8a-96b7-f57fdd16f82e', N'44fd7eff-2866-48b2-a9cd-67f89406c5e3', N'0f8a3810-dc07-47e8-a089-7d6c08107382', 0, CAST(N'2024-12-03T22:10:12.5331189' AS DateTime2), 8)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'64f06a78-f82a-4287-bfcb-f588841d2d0b', N'533e2aa7-6661-43fb-9be2-d23340a9cc52', N'1b68a81a-b654-4896-9195-84abfb081103', 0, CAST(N'2024-12-03T22:10:12.6379972' AS DateTime2), 28)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'5550d927-934d-4d9a-814a-f6ee0128df55', N'44fd7eff-2866-48b2-a9cd-67f89406c5e3', N'31314875-8f03-4874-be17-0f31c14f28ee', 0, CAST(N'2024-12-03T22:10:12.6032877' AS DateTime2), 6)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'b20b677e-b923-423b-b952-fa1886df1475', N'44fd7eff-2866-48b2-a9cd-67f89406c5e3', N'c702e9e8-111b-4402-8ed0-5f939a7892a6', 0, CAST(N'2024-12-03T22:10:12.5868301' AS DateTime2), 19)
GO
INSERT [dbo].[EvaluationCriteriaSample] ([Id], [EvaluationSampleId], [CategoryCriteriaId], [Sort], [IsDeleted], [UpdatedAt]) VALUES (N'805b5dcb-b864-4340-8362-00bd9ba5e068', N'9a245d3a-088b-4831-b3bf-77dc93c5ea1d', N'3a9ab36e-b834-4a20-ba32-a0d34fdc47da', 12, 0, CAST(N'2024-11-23T13:10:36.4584410' AS DateTime2))
INSERT [dbo].[EvaluationCriteriaSample] ([Id], [EvaluationSampleId], [CategoryCriteriaId], [Sort], [IsDeleted], [UpdatedAt]) VALUES (N'ac9a3d43-750e-43af-a8f0-07f6a59d83ac', N'9a245d3a-088b-4831-b3bf-77dc93c5ea1d', N'acf13799-4766-4be0-a514-693c0d238f34', 25, 0, CAST(N'2024-11-23T13:10:36.5117625' AS DateTime2))
INSERT [dbo].[EvaluationCriteriaSample] ([Id], [EvaluationSampleId], [CategoryCriteriaId], [Sort], [IsDeleted], [UpdatedAt]) VALUES (N'41c9bab1-e4b6-4d9f-8b8e-0bc0c6742118', N'9a245d3a-088b-4831-b3bf-77dc93c5ea1d', N'efbe3ff8-a8cb-408b-b2de-f0cdc5f03d55', 17, 0, CAST(N'2024-11-23T13:10:36.4797631' AS DateTime2))
INSERT [dbo].[EvaluationCriteriaSample] ([Id], [EvaluationSampleId], [CategoryCriteriaId], [Sort], [IsDeleted], [UpdatedAt]) VALUES (N'2c00a8ee-62db-414c-a47c-0cc09e603f44', N'b621540f-6142-42f3-8ec1-8f3cd8167a24', N'1834d96f-f389-45f2-9006-f9d57b1ecf53', 16, 0, CAST(N'2024-12-20T11:12:26.3974873' AS DateTime2))
INSERT [dbo].[EvaluationCriteriaSample] ([Id], [EvaluationSampleId], [CategoryCriteriaId], [Sort], [IsDeleted], [UpdatedAt]) VALUES (N'42256331-7895-48e6-bbdf-113d9952b580', N'9a245d3a-088b-4831-b3bf-77dc93c5ea1d', N'35ca5805-aa8f-4dc0-a895-c2bae87a00eb', 22, 0, CAST(N'2024-11-23T13:10:36.4999402' AS DateTime2))
INSERT [dbo].[EvaluationCriteriaSample] ([Id], [EvaluationSampleId], [CategoryCriteriaId], [Sort], [IsDeleted], [UpdatedAt]) VALUES (N'da5e296b-0d87-458d-8b83-125e09f93110', N'9a245d3a-088b-4831-b3bf-77dc93c5ea1d', N'da5e3dff-a649-4508-943d-0ecc32d4f7fc', 9, 0, CAST(N'2024-11-23T13:10:36.4376619' AS DateTime2))
INSERT [dbo].[EvaluationCriteriaSample] ([Id], [EvaluationSampleId], [CategoryCriteriaId], [Sort], [IsDeleted], [UpdatedAt]) VALUES (N'628b6a1e-04a1-46b8-83da-166110d73c0a', N'9a245d3a-088b-4831-b3bf-77dc93c5ea1d', N'ad4a5bce-f3c4-44a7-85c5-fdb1c2d19d12', 20, 0, CAST(N'2024-11-23T13:10:36.4922913' AS DateTime2))
INSERT [dbo].[EvaluationCriteriaSample] ([Id], [EvaluationSampleId], [CategoryCriteriaId], [Sort], [IsDeleted], [UpdatedAt]) VALUES (N'6631fe5b-8562-410f-ad30-1cc8a275f448', N'b621540f-6142-42f3-8ec1-8f3cd8167a24', N'415eb223-1f18-4338-be5a-b6b2ce5496ed', 12, 0, CAST(N'2024-12-20T11:12:26.3767015' AS DateTime2))
INSERT [dbo].[EvaluationCriteriaSample] ([Id], [EvaluationSampleId], [CategoryCriteriaId], [Sort], [IsDeleted], [UpdatedAt]) VALUES (N'1bd107ce-f8a7-4dd5-b6c3-221db4ea74fc', N'9a245d3a-088b-4831-b3bf-77dc93c5ea1d', N'0f8a3810-dc07-47e8-a089-7d6c08107382', 8, 0, CAST(N'2024-11-23T13:10:36.4336182' AS DateTime2))
INSERT [dbo].[EvaluationCriteriaSample] ([Id], [EvaluationSampleId], [CategoryCriteriaId], [Sort], [IsDeleted], [UpdatedAt]) VALUES (N'761bba42-b672-4949-8c0d-230ebeff8ba4', N'b621540f-6142-42f3-8ec1-8f3cd8167a24', N'45455dc8-4edc-4fd6-bc00-d5433173d947', 9, 0, CAST(N'2024-12-20T11:12:26.3617890' AS DateTime2))
INSERT [dbo].[EvaluationCriteriaSample] ([Id], [EvaluationSampleId], [CategoryCriteriaId], [Sort], [IsDeleted], [UpdatedAt]) VALUES (N'f58810a1-ab21-4aa6-a8b1-249462dc3882', N'9a245d3a-088b-4831-b3bf-77dc93c5ea1d', N'786e1a85-def5-4a2e-a70c-cfc2c0d8b239', 11, 0, CAST(N'2024-11-23T13:10:36.4533082' AS DateTime2))
INSERT [dbo].[EvaluationCriteriaSample] ([Id], [EvaluationSampleId], [CategoryCriteriaId], [Sort], [IsDeleted], [UpdatedAt]) VALUES (N'0dee933f-389c-4e2b-97ee-2f068a3eee7b', N'b621540f-6142-42f3-8ec1-8f3cd8167a24', N'97787e25-9013-4175-a4e6-ca0d74509ac1', 18, 0, CAST(N'2024-12-20T11:12:26.4082831' AS DateTime2))
INSERT [dbo].[EvaluationCriteriaSample] ([Id], [EvaluationSampleId], [CategoryCriteriaId], [Sort], [IsDeleted], [UpdatedAt]) VALUES (N'dd90671f-5654-4b13-ae94-37e62a5dde07', N'9a245d3a-088b-4831-b3bf-77dc93c5ea1d', N'b4ab63da-81d4-4ea1-8a5a-3c12154fa561', 5, 0, CAST(N'2024-11-23T13:10:36.4215026' AS DateTime2))
INSERT [dbo].[EvaluationCriteriaSample] ([Id], [EvaluationSampleId], [CategoryCriteriaId], [Sort], [IsDeleted], [UpdatedAt]) VALUES (N'ef422cd0-6daf-407e-819a-3ae8c58adce0', N'9a245d3a-088b-4831-b3bf-77dc93c5ea1d', N'79459d60-5db6-48b6-94bf-2121d9839e15', 2, 0, CAST(N'2024-11-23T13:10:36.4067674' AS DateTime2))
INSERT [dbo].[EvaluationCriteriaSample] ([Id], [EvaluationSampleId], [CategoryCriteriaId], [Sort], [IsDeleted], [UpdatedAt]) VALUES (N'a996ff9a-52a6-4a0c-ad30-43d6878f8377', N'b621540f-6142-42f3-8ec1-8f3cd8167a24', N'1746be1c-1adf-4f5d-8604-a711e2cc52f0', 10, 0, CAST(N'2024-12-20T11:12:26.3666929' AS DateTime2))
INSERT [dbo].[EvaluationCriteriaSample] ([Id], [EvaluationSampleId], [CategoryCriteriaId], [Sort], [IsDeleted], [UpdatedAt]) VALUES (N'88b4b98e-200f-4128-8081-4521aaf873b6', N'9a245d3a-088b-4831-b3bf-77dc93c5ea1d', N'1b68a81a-b654-4896-9195-84abfb081103', 28, 0, CAST(N'2024-11-23T13:10:36.5259812' AS DateTime2))
INSERT [dbo].[EvaluationCriteriaSample] ([Id], [EvaluationSampleId], [CategoryCriteriaId], [Sort], [IsDeleted], [UpdatedAt]) VALUES (N'562a7b6d-4496-422f-b952-46ffb1e07a4d', N'b621540f-6142-42f3-8ec1-8f3cd8167a24', N'51ea330f-07af-4d54-adff-114bdd0e6057', 3, 0, CAST(N'2024-12-20T11:12:26.3315316' AS DateTime2))
INSERT [dbo].[EvaluationCriteriaSample] ([Id], [EvaluationSampleId], [CategoryCriteriaId], [Sort], [IsDeleted], [UpdatedAt]) VALUES (N'73d2a464-8061-4801-8817-4d09fa294cdf', N'9a245d3a-088b-4831-b3bf-77dc93c5ea1d', N'fb40ad8f-098f-4fd1-8870-c05d1d25fae2', 29, 0, CAST(N'2024-11-23T13:10:36.5320481' AS DateTime2))
INSERT [dbo].[EvaluationCriteriaSample] ([Id], [EvaluationSampleId], [CategoryCriteriaId], [Sort], [IsDeleted], [UpdatedAt]) VALUES (N'4e16a9fa-3fb6-4ae0-ba6e-4fc56db95b6a', N'b621540f-6142-42f3-8ec1-8f3cd8167a24', N'f8c74f4e-94a2-4f75-9572-bf9c4692fae0', 20, 0, CAST(N'2024-12-20T11:12:26.4192476' AS DateTime2))
INSERT [dbo].[EvaluationCriteriaSample] ([Id], [EvaluationSampleId], [CategoryCriteriaId], [Sort], [IsDeleted], [UpdatedAt]) VALUES (N'80826631-3f0c-4117-8f65-60244e87b75f', N'9a245d3a-088b-4831-b3bf-77dc93c5ea1d', N'b9ec64fd-8aac-44db-8541-67b1c6162676', 26, 0, CAST(N'2024-11-23T13:10:36.5158513' AS DateTime2))
INSERT [dbo].[EvaluationCriteriaSample] ([Id], [EvaluationSampleId], [CategoryCriteriaId], [Sort], [IsDeleted], [UpdatedAt]) VALUES (N'06bdcca9-bb1f-4651-b559-620398ce5f06', N'9a245d3a-088b-4831-b3bf-77dc93c5ea1d', N'8b678550-a782-4ed9-a61f-15887cf5a73e', 1, 0, CAST(N'2024-11-23T13:10:36.3962028' AS DateTime2))
INSERT [dbo].[EvaluationCriteriaSample] ([Id], [EvaluationSampleId], [CategoryCriteriaId], [Sort], [IsDeleted], [UpdatedAt]) VALUES (N'40c08901-50ba-4b42-ae8c-65868cda1328', N'9a245d3a-088b-4831-b3bf-77dc93c5ea1d', N'87fedc0d-caae-4890-80d9-a6e086d71a1c', 3, 0, CAST(N'2024-11-23T13:10:36.4117608' AS DateTime2))
INSERT [dbo].[EvaluationCriteriaSample] ([Id], [EvaluationSampleId], [CategoryCriteriaId], [Sort], [IsDeleted], [UpdatedAt]) VALUES (N'7633ab93-99c3-4bd8-8f89-69bcf136dcd6', N'b621540f-6142-42f3-8ec1-8f3cd8167a24', N'8005ad2a-4d92-4101-9719-8e8364e57996', 1, 0, CAST(N'2024-12-20T11:12:26.3067837' AS DateTime2))
INSERT [dbo].[EvaluationCriteriaSample] ([Id], [EvaluationSampleId], [CategoryCriteriaId], [Sort], [IsDeleted], [UpdatedAt]) VALUES (N'b62a16a2-3171-4590-b6a4-6e3de792d980', N'b621540f-6142-42f3-8ec1-8f3cd8167a24', N'b2360422-271d-47f6-8884-f734d48e2cf6', 7, 0, CAST(N'2024-12-20T11:12:26.3524277' AS DateTime2))
INSERT [dbo].[EvaluationCriteriaSample] ([Id], [EvaluationSampleId], [CategoryCriteriaId], [Sort], [IsDeleted], [UpdatedAt]) VALUES (N'66310358-f374-4551-b3f7-77bad7375919', N'9a245d3a-088b-4831-b3bf-77dc93c5ea1d', N'76f4c106-34b2-4175-a413-f0b67106218f', 16, 0, CAST(N'2024-11-23T13:10:36.4759786' AS DateTime2))
INSERT [dbo].[EvaluationCriteriaSample] ([Id], [EvaluationSampleId], [CategoryCriteriaId], [Sort], [IsDeleted], [UpdatedAt]) VALUES (N'47b3196d-0e4d-4e21-8458-83e9e6ed0168', N'b621540f-6142-42f3-8ec1-8f3cd8167a24', N'41245dd4-b247-48cd-a67c-6f23c005a5fe', 11, 0, CAST(N'2024-12-20T11:12:26.3718558' AS DateTime2))
INSERT [dbo].[EvaluationCriteriaSample] ([Id], [EvaluationSampleId], [CategoryCriteriaId], [Sort], [IsDeleted], [UpdatedAt]) VALUES (N'ca8245e9-077e-4027-a27d-845a00144237', N'9a245d3a-088b-4831-b3bf-77dc93c5ea1d', N'6f0a8890-c105-4fb4-874b-9d559847eca6', 23, 0, CAST(N'2024-11-23T13:10:36.5038483' AS DateTime2))
INSERT [dbo].[EvaluationCriteriaSample] ([Id], [EvaluationSampleId], [CategoryCriteriaId], [Sort], [IsDeleted], [UpdatedAt]) VALUES (N'989bec30-d16c-42d4-b187-9783307cccad', N'9a245d3a-088b-4831-b3bf-77dc93c5ea1d', N'4723cac1-52f7-43bb-8d3f-bfb3b6c28a96', 24, 0, CAST(N'2024-11-23T13:10:36.5074989' AS DateTime2))
INSERT [dbo].[EvaluationCriteriaSample] ([Id], [EvaluationSampleId], [CategoryCriteriaId], [Sort], [IsDeleted], [UpdatedAt]) VALUES (N'40923c20-00f7-4320-911d-97c9425294b5', N'b621540f-6142-42f3-8ec1-8f3cd8167a24', N'71cc2ca9-d338-4621-bb19-f4bd2abc9e06', 15, 0, CAST(N'2024-12-20T11:12:26.3915297' AS DateTime2))
INSERT [dbo].[EvaluationCriteriaSample] ([Id], [EvaluationSampleId], [CategoryCriteriaId], [Sort], [IsDeleted], [UpdatedAt]) VALUES (N'aab5ada4-11f9-4f42-9f71-9c3ed28e140a', N'b621540f-6142-42f3-8ec1-8f3cd8167a24', N'418bf356-ca1e-4db7-9aec-0635713b688d', 2, 0, CAST(N'2024-12-20T11:12:26.3244537' AS DateTime2))
INSERT [dbo].[EvaluationCriteriaSample] ([Id], [EvaluationSampleId], [CategoryCriteriaId], [Sort], [IsDeleted], [UpdatedAt]) VALUES (N'0ed82894-b5f3-43b9-81f2-a5ae1cd6a547', N'b621540f-6142-42f3-8ec1-8f3cd8167a24', N'93b43166-bdad-4118-9bed-8176279fdf95', 4, 0, CAST(N'2024-12-20T11:12:26.3364649' AS DateTime2))
INSERT [dbo].[EvaluationCriteriaSample] ([Id], [EvaluationSampleId], [CategoryCriteriaId], [Sort], [IsDeleted], [UpdatedAt]) VALUES (N'a6d6e9c0-e42a-43de-93ad-aa10c5691c87', N'b621540f-6142-42f3-8ec1-8f3cd8167a24', N'cdaf282b-23f7-42a5-b099-22cd38a5c8b1', 17, 0, CAST(N'2024-12-20T11:12:26.4025294' AS DateTime2))
INSERT [dbo].[EvaluationCriteriaSample] ([Id], [EvaluationSampleId], [CategoryCriteriaId], [Sort], [IsDeleted], [UpdatedAt]) VALUES (N'7b59d65e-83f5-4bf3-81d2-afcb2b8e278f', N'b621540f-6142-42f3-8ec1-8f3cd8167a24', N'abbcb306-3144-4c8a-8b98-eb07a3663ade', 8, 0, CAST(N'2024-12-20T11:12:26.3568547' AS DateTime2))
INSERT [dbo].[EvaluationCriteriaSample] ([Id], [EvaluationSampleId], [CategoryCriteriaId], [Sort], [IsDeleted], [UpdatedAt]) VALUES (N'ffb08596-d534-491e-b4ab-b10b39dda731', N'b621540f-6142-42f3-8ec1-8f3cd8167a24', N'c733b044-2ace-43ea-be34-251b9af672cf', 14, 0, CAST(N'2024-12-20T11:12:26.3871500' AS DateTime2))
INSERT [dbo].[EvaluationCriteriaSample] ([Id], [EvaluationSampleId], [CategoryCriteriaId], [Sort], [IsDeleted], [UpdatedAt]) VALUES (N'c63a45f7-2850-4dad-a957-b2e3cd8a1bbe', N'b621540f-6142-42f3-8ec1-8f3cd8167a24', N'e9cfa38c-e121-46ce-aaf5-b454a6b9f128', 13, 0, CAST(N'2024-12-20T11:12:26.3825962' AS DateTime2))
INSERT [dbo].[EvaluationCriteriaSample] ([Id], [EvaluationSampleId], [CategoryCriteriaId], [Sort], [IsDeleted], [UpdatedAt]) VALUES (N'6ae169b4-7ba7-4765-ae12-b4c46672d7b7', N'b621540f-6142-42f3-8ec1-8f3cd8167a24', N'4451add8-b5d1-483a-9fe8-254611d89e32', 6, 0, CAST(N'2024-12-20T11:12:26.3477120' AS DateTime2))
INSERT [dbo].[EvaluationCriteriaSample] ([Id], [EvaluationSampleId], [CategoryCriteriaId], [Sort], [IsDeleted], [UpdatedAt]) VALUES (N'4a931a23-0681-4530-9021-b5a27319ecd8', N'9a245d3a-088b-4831-b3bf-77dc93c5ea1d', N'f4c06feb-eb3d-4f75-95f9-10c0289de995', 30, 0, CAST(N'2024-11-23T13:10:36.5365322' AS DateTime2))
INSERT [dbo].[EvaluationCriteriaSample] ([Id], [EvaluationSampleId], [CategoryCriteriaId], [Sort], [IsDeleted], [UpdatedAt]) VALUES (N'0db405c2-2d90-4442-a93e-b8d0a4865b7c', N'9a245d3a-088b-4831-b3bf-77dc93c5ea1d', N'ca2c80e4-c9e6-4bc1-a080-1c0505bccaba', 13, 0, CAST(N'2024-11-23T13:10:36.4627794' AS DateTime2))
INSERT [dbo].[EvaluationCriteriaSample] ([Id], [EvaluationSampleId], [CategoryCriteriaId], [Sort], [IsDeleted], [UpdatedAt]) VALUES (N'1e77d474-aae5-47ad-89df-bb0f51df0d6e', N'b621540f-6142-42f3-8ec1-8f3cd8167a24', N'99652497-2b73-4368-901c-05143fd3f8b1', 19, 0, CAST(N'2024-12-20T11:12:26.4138497' AS DateTime2))
INSERT [dbo].[EvaluationCriteriaSample] ([Id], [EvaluationSampleId], [CategoryCriteriaId], [Sort], [IsDeleted], [UpdatedAt]) VALUES (N'c3525b4a-bd39-4a9c-a3a9-c0e6c0cc2248', N'9a245d3a-088b-4831-b3bf-77dc93c5ea1d', N'1fb789cf-87b0-43b0-a45e-e85e3891a9ee', 7, 0, CAST(N'2024-11-23T13:10:36.4297517' AS DateTime2))
INSERT [dbo].[EvaluationCriteriaSample] ([Id], [EvaluationSampleId], [CategoryCriteriaId], [Sort], [IsDeleted], [UpdatedAt]) VALUES (N'066a9a3c-eb5f-4e42-9d4d-c490b2619b8b', N'b621540f-6142-42f3-8ec1-8f3cd8167a24', N'39750d51-ea4d-4d9b-b871-6a65bb01b5a9', 21, 0, CAST(N'2024-12-20T11:12:26.4241029' AS DateTime2))
INSERT [dbo].[EvaluationCriteriaSample] ([Id], [EvaluationSampleId], [CategoryCriteriaId], [Sort], [IsDeleted], [UpdatedAt]) VALUES (N'93573a80-ad8e-4b68-abe2-d271ca7be4f5', N'9a245d3a-088b-4831-b3bf-77dc93c5ea1d', N'e296f2f3-e89c-49b9-b304-b76df59719ae', 10, 0, CAST(N'2024-11-23T13:10:36.4418626' AS DateTime2))
INSERT [dbo].[EvaluationCriteriaSample] ([Id], [EvaluationSampleId], [CategoryCriteriaId], [Sort], [IsDeleted], [UpdatedAt]) VALUES (N'de1ea98b-9d7e-4b97-a4b6-d5bad2cca938', N'9a245d3a-088b-4831-b3bf-77dc93c5ea1d', N'e6d88410-17f4-479b-8e2d-8b6d5c0324a7', 27, 0, CAST(N'2024-11-23T13:10:36.5206534' AS DateTime2))
INSERT [dbo].[EvaluationCriteriaSample] ([Id], [EvaluationSampleId], [CategoryCriteriaId], [Sort], [IsDeleted], [UpdatedAt]) VALUES (N'14a5340b-0bbe-4f52-ad0c-d81e3a0cc681', N'9a245d3a-088b-4831-b3bf-77dc93c5ea1d', N'3622e825-11bb-44fd-bc59-ce0c40aa9509', 18, 0, CAST(N'2024-11-23T13:10:36.4841044' AS DateTime2))
INSERT [dbo].[EvaluationCriteriaSample] ([Id], [EvaluationSampleId], [CategoryCriteriaId], [Sort], [IsDeleted], [UpdatedAt]) VALUES (N'74c875af-6bd4-4b5b-afb9-db2cf854ba17', N'9a245d3a-088b-4831-b3bf-77dc93c5ea1d', N'c702e9e8-111b-4402-8ed0-5f939a7892a6', 19, 0, CAST(N'2024-11-23T13:10:36.4876894' AS DateTime2))
INSERT [dbo].[EvaluationCriteriaSample] ([Id], [EvaluationSampleId], [CategoryCriteriaId], [Sort], [IsDeleted], [UpdatedAt]) VALUES (N'bdc58a3f-e56d-4b12-8bc9-ddbb80a099a8', N'b621540f-6142-42f3-8ec1-8f3cd8167a24', N'7fe6502c-10e1-430f-bbbd-01943d0f5e98', 5, 0, CAST(N'2024-12-20T11:12:26.3416699' AS DateTime2))
INSERT [dbo].[EvaluationCriteriaSample] ([Id], [EvaluationSampleId], [CategoryCriteriaId], [Sort], [IsDeleted], [UpdatedAt]) VALUES (N'018b48c0-1b97-45e4-9dc1-e383ff9595fd', N'9a245d3a-088b-4831-b3bf-77dc93c5ea1d', N'51ef79d2-b47e-41f1-a99d-f5c0e4f4416e', 15, 0, CAST(N'2024-11-23T13:10:36.4715138' AS DateTime2))
INSERT [dbo].[EvaluationCriteriaSample] ([Id], [EvaluationSampleId], [CategoryCriteriaId], [Sort], [IsDeleted], [UpdatedAt]) VALUES (N'dc2b64aa-7e51-4358-88ca-e6fa72713048', N'9a245d3a-088b-4831-b3bf-77dc93c5ea1d', N'a7efdc67-aa93-46cb-8410-0ddcfe0d5853', 31, 0, CAST(N'2024-11-23T13:10:36.5432490' AS DateTime2))
INSERT [dbo].[EvaluationCriteriaSample] ([Id], [EvaluationSampleId], [CategoryCriteriaId], [Sort], [IsDeleted], [UpdatedAt]) VALUES (N'7e92c47a-4428-4d81-bf47-eb700beab66e', N'9a245d3a-088b-4831-b3bf-77dc93c5ea1d', N'999d3424-6bad-4d7b-8bd0-2b462b55dd45', 4, 0, CAST(N'2024-11-23T13:10:36.4168317' AS DateTime2))
INSERT [dbo].[EvaluationCriteriaSample] ([Id], [EvaluationSampleId], [CategoryCriteriaId], [Sort], [IsDeleted], [UpdatedAt]) VALUES (N'93902193-7a81-4da9-b097-f055a9866926', N'9a245d3a-088b-4831-b3bf-77dc93c5ea1d', N'bf0b9144-be3b-4213-8f3c-f744035ed4b5', 14, 0, CAST(N'2024-11-23T13:10:36.4670397' AS DateTime2))
INSERT [dbo].[EvaluationCriteriaSample] ([Id], [EvaluationSampleId], [CategoryCriteriaId], [Sort], [IsDeleted], [UpdatedAt]) VALUES (N'63568c4b-9721-4a41-9228-f0f5936a35b8', N'9a245d3a-088b-4831-b3bf-77dc93c5ea1d', N'3c69d1e2-9204-431f-863f-a4ba07f3ac1d', 21, 0, CAST(N'2024-11-23T13:10:36.4960473' AS DateTime2))
INSERT [dbo].[EvaluationCriteriaSample] ([Id], [EvaluationSampleId], [CategoryCriteriaId], [Sort], [IsDeleted], [UpdatedAt]) VALUES (N'f3686d85-0dc2-4a9f-88b7-ff78dbe8e624', N'9a245d3a-088b-4831-b3bf-77dc93c5ea1d', N'31314875-8f03-4874-be17-0f31c14f28ee', 6, 0, CAST(N'2024-11-23T13:10:36.4251612' AS DateTime2))
GO
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'ed56103f-dc7c-40fe-b4a5-00912028744e', N'44fd7eff-2866-48b2-a9cd-67f89406c5e3', N'55fc6d0e-50b3-4876-bf93-ee3937daeb62', N'6b171dfb-a02f-4076-8ed7-7d223902e1b0', 0, 0, CAST(N'2024-12-20T11:19:04.1676953' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'b7fadd76-f462-4a24-a602-00d61272e09f', N'3e805b41-1adc-426c-93a4-cfb6b7be3f9a', N'70be578e-af27-4056-a6ad-55990f86b3e7', N'cc41c59d-36ed-46a9-9654-a81452057427', 15, 0, CAST(N'2024-12-20T11:22:18.4430770' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'cc4075e1-fc2c-4102-89c3-00dc74da39e9', N'44fd7eff-2866-48b2-a9cd-67f89406c5e3', N'55fc6d0e-50b3-4876-bf93-ee3937daeb62', N'3f584452-d607-4c23-8840-99c0941b08c1', 0, 0, CAST(N'2024-12-20T11:19:04.1595408' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'7de0a811-6b3d-4de9-b65a-0170294a75ae', N'44fd7eff-2866-48b2-a9cd-67f89406c5e3', N'32f207a2-02ba-4b83-8c71-03af11657c63', N'3f584452-d607-4c23-8840-99c0941b08c1', 0, 0, CAST(N'2024-12-20T11:16:25.9430146' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'50b5f176-0fdf-44fc-a83d-0217f9d6af74', N'44fd7eff-2866-48b2-a9cd-67f89406c5e3', N'dd3c7e8b-3dc7-45d2-a2bd-282de7d5e2de', N'95aec639-b24f-44ca-a649-5912e7158a51', 6, 0, CAST(N'2024-12-20T11:17:59.4087678' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'f590e724-86bf-4b75-9ddb-02c64e6cd3f0', N'44fd7eff-2866-48b2-a9cd-67f89406c5e3', N'32f207a2-02ba-4b83-8c71-03af11657c63', N'966a23c7-23e5-4167-892a-3f554f3260f2', 3, 0, CAST(N'2024-12-20T11:16:25.8954360' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'a3b91318-c74f-4fc1-8c0e-0904597b9729', N'44fd7eff-2866-48b2-a9cd-67f89406c5e3', N'55fc6d0e-50b3-4876-bf93-ee3937daeb62', N'57df4c30-1c1d-4d6d-9b4e-00ad48f7bff3', 3, 0, CAST(N'2024-12-20T11:19:04.1248956' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'd260be67-845c-4307-9ab0-0a705dba8954', N'44fd7eff-2866-48b2-a9cd-67f89406c5e3', N'dd3c7e8b-3dc7-45d2-a2bd-282de7d5e2de', N'11da88c3-b2cf-44c9-929f-5bd53a44cf15', 0, 0, CAST(N'2024-12-20T11:17:59.3432982' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'd549b37c-bfd8-41fa-816a-11b52df46d53', N'44fd7eff-2866-48b2-a9cd-67f89406c5e3', N'32f207a2-02ba-4b83-8c71-03af11657c63', N'ab730722-8e74-4799-95c0-2faec8990d02', 0, 0, CAST(N'2024-12-20T11:16:25.9230742' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'05b9df91-4e0d-4dab-b214-138b39db60f1', N'44fd7eff-2866-48b2-a9cd-67f89406c5e3', N'2d1c4b21-92b0-4105-9151-0980a4c924ad', N'3f584452-d607-4c23-8840-99c0941b08c1', 0, 0, CAST(N'2024-12-20T11:18:26.5550227' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'c1b0cb28-4e74-45e9-a6e3-19658ab54cb8', N'44fd7eff-2866-48b2-a9cd-67f89406c5e3', N'dd3c7e8b-3dc7-45d2-a2bd-282de7d5e2de', N'57df4c30-1c1d-4d6d-9b4e-00ad48f7bff3', 0, 0, CAST(N'2024-12-20T11:17:59.3372691' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'590de912-a0d7-421f-bf63-25623d50aa4f', N'44fd7eff-2866-48b2-a9cd-67f89406c5e3', N'32f207a2-02ba-4b83-8c71-03af11657c63', N'af386a97-a6b5-4f81-a8eb-8b3abb0459e4', 6, 0, CAST(N'2024-12-20T11:16:25.9756963' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'938db4b1-6446-4a51-8c18-259199249139', N'44fd7eff-2866-48b2-a9cd-67f89406c5e3', N'32f207a2-02ba-4b83-8c71-03af11657c63', N'9c521f0d-4bfb-48a3-82d4-9a796dc24b19', 6, 0, CAST(N'2024-12-20T11:16:25.9699403' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'3b4f11a5-900f-49de-a416-2bed29a293a9', N'44fd7eff-2866-48b2-a9cd-67f89406c5e3', N'32f207a2-02ba-4b83-8c71-03af11657c63', N'48392db0-15e2-4d8a-96b7-f57fdd16f82e', 3, 0, CAST(N'2024-12-20T11:16:25.8745150' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'da8bbd01-aecc-4388-8a94-35851f61bcfc', N'3e805b41-1adc-426c-93a4-cfb6b7be3f9a', N'd3f15e0a-7ac8-4f28-b93e-f8c11eee7fcf', N'ba441ea2-ce78-4a4b-a99b-1f4ca7b16afe', 5, 0, CAST(N'2024-12-20T11:21:46.8508989' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'7ab2ac76-6039-4c0b-8dbe-3a07684d3663', N'44fd7eff-2866-48b2-a9cd-67f89406c5e3', N'2d1c4b21-92b0-4105-9151-0980a4c924ad', N'80c4bc56-48c8-4786-a4e2-5934ac40e22a', 0, 0, CAST(N'2024-12-20T11:18:26.5420398' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'b1637b7e-095f-436f-856f-3d9d2bfc69e2', N'44fd7eff-2866-48b2-a9cd-67f89406c5e3', N'dd3c7e8b-3dc7-45d2-a2bd-282de7d5e2de', N'b85b7897-34d1-4c88-9051-bb285ea9e5ff', 6, 0, CAST(N'2024-12-20T11:17:59.4163392' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'ef90d1d5-9eae-48eb-a36d-4062d6dc5ce8', N'44fd7eff-2866-48b2-a9cd-67f89406c5e3', N'32f207a2-02ba-4b83-8c71-03af11657c63', N'01bad5fb-807f-458b-8ee3-7bcfa14a8884', 4, 0, CAST(N'2024-12-20T11:16:25.8546069' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'd416e3a1-4960-496c-8afc-42bf97ffb53e', N'44fd7eff-2866-48b2-a9cd-67f89406c5e3', N'32f207a2-02ba-4b83-8c71-03af11657c63', N'69a0b169-5ca7-4909-8ea3-eac52230c55c', 0, 0, CAST(N'2024-12-20T11:16:25.9566178' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'467d8679-adb0-43eb-9086-435989134bc3', N'44fd7eff-2866-48b2-a9cd-67f89406c5e3', N'55fc6d0e-50b3-4876-bf93-ee3937daeb62', N'95aec639-b24f-44ca-a649-5912e7158a51', 6, 0, CAST(N'2024-12-20T11:19:04.1940423' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'387f589d-a00c-4ae8-9cc2-437da0611bc5', N'44fd7eff-2866-48b2-a9cd-67f89406c5e3', N'dd3c7e8b-3dc7-45d2-a2bd-282de7d5e2de', N'fdb0c7a2-dd1e-466b-9fd8-12d8a9719335', 0, 0, CAST(N'2024-12-20T11:17:59.3906201' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'1dd4cb39-53d0-4f52-813f-450733e7917e', N'3e805b41-1adc-426c-93a4-cfb6b7be3f9a', N'd3f15e0a-7ac8-4f28-b93e-f8c11eee7fcf', N'ca63cdc0-b117-44ea-af03-20b10f001c95', 10, 0, CAST(N'2024-12-20T11:21:46.8424098' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'026f14ce-8140-4e9a-b4bf-4861201f8277', N'44fd7eff-2866-48b2-a9cd-67f89406c5e3', N'55fc6d0e-50b3-4876-bf93-ee3937daeb62', N'fdb0c7a2-dd1e-466b-9fd8-12d8a9719335', 9, 0, CAST(N'2024-12-20T11:19:04.1770230' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'0e4d9792-5506-485e-99da-4a37df8ffa58', N'44fd7eff-2866-48b2-a9cd-67f89406c5e3', N'32f207a2-02ba-4b83-8c71-03af11657c63', N'b20b677e-b923-423b-b952-fa1886df1475', 0, 0, CAST(N'2024-12-20T11:16:25.9376337' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'6c01ad1d-30ae-4305-a378-5237ef7fccc4', N'44fd7eff-2866-48b2-a9cd-67f89406c5e3', N'2d1c4b21-92b0-4105-9151-0980a4c924ad', N'fc7650fc-b4d5-4ea9-8e77-ddbf84a50d38', 4, 0, CAST(N'2024-12-20T11:18:26.4768403' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'05d0a036-bf00-4f21-b037-528113fe7bce', N'44fd7eff-2866-48b2-a9cd-67f89406c5e3', N'55fc6d0e-50b3-4876-bf93-ee3937daeb62', N'966a23c7-23e5-4167-892a-3f554f3260f2', 3, 0, CAST(N'2024-12-20T11:19:04.1205799' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'3d69b27d-a8c8-4779-95a1-53811f07dabc', N'3e805b41-1adc-426c-93a4-cfb6b7be3f9a', N'd3f15e0a-7ac8-4f28-b93e-f8c11eee7fcf', N'2407afd2-a31b-495b-8a1d-07869538be14', 10, 0, CAST(N'2024-12-20T11:21:46.8857815' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'8c0a5b20-0ea9-476b-b5a7-54d99fa3b879', N'44fd7eff-2866-48b2-a9cd-67f89406c5e3', N'2d1c4b21-92b0-4105-9151-0980a4c924ad', N'28c4dc70-a101-4d24-bcc1-a73f018fc1d5', 4, 0, CAST(N'2024-12-20T11:18:26.4582644' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'530a6d7f-3f97-467a-a43c-54f5b1541913', N'44fd7eff-2866-48b2-a9cd-67f89406c5e3', N'2d1c4b21-92b0-4105-9151-0980a4c924ad', N'82660276-5d20-4418-bc22-71da3efe99b0', 0, 0, CAST(N'2024-12-20T11:18:26.4844664' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'f54d82d7-2a0f-47cc-a2ea-578addc613db', N'44fd7eff-2866-48b2-a9cd-67f89406c5e3', N'dd3c7e8b-3dc7-45d2-a2bd-282de7d5e2de', N'3f584452-d607-4c23-8840-99c0941b08c1', 0, 0, CAST(N'2024-12-20T11:17:59.3729876' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'79dbf9da-cb85-438a-8f88-579a120c6c4a', N'44fd7eff-2866-48b2-a9cd-67f89406c5e3', N'55fc6d0e-50b3-4876-bf93-ee3937daeb62', N'b20b677e-b923-423b-b952-fa1886df1475', 0, 0, CAST(N'2024-12-20T11:19:04.1545308' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'88f949fe-e2d1-4195-b71e-57f8b0eedc82', N'3e805b41-1adc-426c-93a4-cfb6b7be3f9a', N'd3f15e0a-7ac8-4f28-b93e-f8c11eee7fcf', N'5b56175b-fafd-48c1-8a67-71be50301514', 5, 0, CAST(N'2024-12-20T11:21:46.8677979' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'eb93cb7a-87e0-492b-a0d0-58204847d7fa', N'3e805b41-1adc-426c-93a4-cfb6b7be3f9a', N'70be578e-af27-4056-a6ad-55990f86b3e7', N'dc3d5294-14a3-4692-adef-33e6ce38d2a4', 10, 0, CAST(N'2024-12-20T11:22:18.4713754' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'7920ef42-80ec-4ac7-87d3-59015435820b', N'44fd7eff-2866-48b2-a9cd-67f89406c5e3', N'55fc6d0e-50b3-4876-bf93-ee3937daeb62', N'9c521f0d-4bfb-48a3-82d4-9a796dc24b19', 6, 0, CAST(N'2024-12-20T11:19:04.1838437' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'1411041b-34ff-4bb7-bc53-59cac119625d', N'3e805b41-1adc-426c-93a4-cfb6b7be3f9a', N'70be578e-af27-4056-a6ad-55990f86b3e7', N'2407afd2-a31b-495b-8a1d-07869538be14', 10, 0, CAST(N'2024-12-20T11:22:18.4929034' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'3e1dff5a-5a65-49c0-aa88-5bff0cf56f3d', N'3e805b41-1adc-426c-93a4-cfb6b7be3f9a', N'70be578e-af27-4056-a6ad-55990f86b3e7', N'e7b7e340-9e22-4cf2-8136-97f121f8bb8b', 15, 0, CAST(N'2024-12-20T11:22:18.4838259' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'39a5625d-38f5-4717-9daa-5cbf4d450e93', N'44fd7eff-2866-48b2-a9cd-67f89406c5e3', N'32f207a2-02ba-4b83-8c71-03af11657c63', N'28c4dc70-a101-4d24-bcc1-a73f018fc1d5', 4, 0, CAST(N'2024-12-20T11:16:25.8156584' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'57ceda7e-014f-42bc-9d3a-5e5ad96fd373', N'44fd7eff-2866-48b2-a9cd-67f89406c5e3', N'32f207a2-02ba-4b83-8c71-03af11657c63', N'78986923-5a5e-4185-896f-7d53f2251744', 4, 0, CAST(N'2024-12-20T11:16:25.8480947' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'abea6415-0397-4e76-9cda-622e0614152c', N'44fd7eff-2866-48b2-a9cd-67f89406c5e3', N'2d1c4b21-92b0-4105-9151-0980a4c924ad', N'ed1b2619-85bf-4554-854e-c26bc0d1235c', 0, 0, CAST(N'2024-12-20T11:18:26.5031547' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'80e580b8-1959-4350-afaf-6a0d6c525d7a', N'44fd7eff-2866-48b2-a9cd-67f89406c5e3', N'32f207a2-02ba-4b83-8c71-03af11657c63', N'fc7650fc-b4d5-4ea9-8e77-ddbf84a50d38', 4, 0, CAST(N'2024-12-20T11:16:25.8595670' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'fa724e0a-43d7-40e0-bb9c-6b08536b0e2e', N'44fd7eff-2866-48b2-a9cd-67f89406c5e3', N'55fc6d0e-50b3-4876-bf93-ee3937daeb62', N'fc7650fc-b4d5-4ea9-8e77-ddbf84a50d38', 4, 0, CAST(N'2024-12-20T11:19:04.0911798' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'17dad294-1dbb-42cd-9a12-6c8ca5a71cec', N'44fd7eff-2866-48b2-a9cd-67f89406c5e3', N'32f207a2-02ba-4b83-8c71-03af11657c63', N'6b171dfb-a02f-4076-8ed7-7d223902e1b0', 0, 0, CAST(N'2024-12-20T11:16:25.9512411' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'f200d055-f35a-4856-94f6-6db29f2102b0', N'3e805b41-1adc-426c-93a4-cfb6b7be3f9a', N'd3f15e0a-7ac8-4f28-b93e-f8c11eee7fcf', N'7d6b91a4-c2c4-4888-811b-9987c5254811', 15, 0, CAST(N'2024-12-20T11:21:46.8792763' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'c1c18225-6cd4-4a01-a9bf-6e5d56a398b4', N'44fd7eff-2866-48b2-a9cd-67f89406c5e3', N'55fc6d0e-50b3-4876-bf93-ee3937daeb62', N'80c4bc56-48c8-4786-a4e2-5934ac40e22a', 0, 0, CAST(N'2024-12-20T11:19:04.1491183' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'c2a12fae-ef94-4ea6-8c12-7027d5b697be', N'44fd7eff-2866-48b2-a9cd-67f89406c5e3', N'dd3c7e8b-3dc7-45d2-a2bd-282de7d5e2de', N'ed1b2619-85bf-4554-854e-c26bc0d1235c', 0, 0, CAST(N'2024-12-20T11:17:59.3255030' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'54ce584b-3479-4f90-a081-71b4cc17e37c', N'44fd7eff-2866-48b2-a9cd-67f89406c5e3', N'2d1c4b21-92b0-4105-9151-0980a4c924ad', N'af386a97-a6b5-4f81-a8eb-8b3abb0459e4', 0, 0, CAST(N'2024-12-20T11:18:26.5858020' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'a3bd9101-eafb-4d51-8205-73ae7898da92', N'44fd7eff-2866-48b2-a9cd-67f89406c5e3', N'2d1c4b21-92b0-4105-9151-0980a4c924ad', N'78986923-5a5e-4185-896f-7d53f2251744', 4, 0, CAST(N'2024-12-20T11:18:26.4652675' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'bc455747-2c49-431a-aec4-76c4cf7cc113', N'44fd7eff-2866-48b2-a9cd-67f89406c5e3', N'32f207a2-02ba-4b83-8c71-03af11657c63', N'9f0b0494-0ed3-4589-b53c-0b1e622a3caf', 3, 0, CAST(N'2024-12-20T11:16:25.9161628' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'54e1a9e0-af30-4119-94bc-7809205918be', N'44fd7eff-2866-48b2-a9cd-67f89406c5e3', N'32f207a2-02ba-4b83-8c71-03af11657c63', N'b9051419-5b11-4a6f-92e8-1b2c35fc032d', 3, 0, CAST(N'2024-12-20T11:16:25.8820066' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'0804969e-8111-4ff6-a05a-7d9d472c53cb', N'44fd7eff-2866-48b2-a9cd-67f89406c5e3', N'dd3c7e8b-3dc7-45d2-a2bd-282de7d5e2de', N'28c4dc70-a101-4d24-bcc1-a73f018fc1d5', 4, 0, CAST(N'2024-12-20T11:17:59.2825673' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'28403309-3f45-4487-8984-92ad78f338cd', N'44fd7eff-2866-48b2-a9cd-67f89406c5e3', N'2d1c4b21-92b0-4105-9151-0980a4c924ad', N'b9051419-5b11-4a6f-92e8-1b2c35fc032d', 0, 0, CAST(N'2024-12-20T11:18:26.4962902' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'51c01df3-9a66-4d7c-836a-92f23c33e39e', N'44fd7eff-2866-48b2-a9cd-67f89406c5e3', N'2d1c4b21-92b0-4105-9151-0980a4c924ad', N'95aec639-b24f-44ca-a649-5912e7158a51', 0, 0, CAST(N'2024-12-20T11:18:26.5909257' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'8951365b-434b-45df-8f07-94b4ad1623c8', N'44fd7eff-2866-48b2-a9cd-67f89406c5e3', N'dd3c7e8b-3dc7-45d2-a2bd-282de7d5e2de', N'fc7650fc-b4d5-4ea9-8e77-ddbf84a50d38', 4, 0, CAST(N'2024-12-20T11:17:59.3023116' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'ab95bef1-69b4-4ba3-9827-9513b61a47c7', N'44fd7eff-2866-48b2-a9cd-67f89406c5e3', N'2d1c4b21-92b0-4105-9151-0980a4c924ad', N'6b171dfb-a02f-4076-8ed7-7d223902e1b0', 0, 0, CAST(N'2024-12-20T11:18:26.5602187' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'f789fd82-193d-41c8-8b45-96c64470627c', N'44fd7eff-2866-48b2-a9cd-67f89406c5e3', N'dd3c7e8b-3dc7-45d2-a2bd-282de7d5e2de', N'78986923-5a5e-4185-896f-7d53f2251744', 4, 0, CAST(N'2024-12-20T11:17:59.2900763' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'236f1a7f-2626-40dc-b36d-97355bd91451', N'44fd7eff-2866-48b2-a9cd-67f89406c5e3', N'55fc6d0e-50b3-4876-bf93-ee3937daeb62', N'01bad5fb-807f-458b-8ee3-7bcfa14a8884', 4, 0, CAST(N'2024-12-20T11:19:04.0861779' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'633e3ab5-5059-46be-9427-97feaa74b1a3', N'44fd7eff-2866-48b2-a9cd-67f89406c5e3', N'55fc6d0e-50b3-4876-bf93-ee3937daeb62', N'b9051419-5b11-4a6f-92e8-1b2c35fc032d', 3, 0, CAST(N'2024-12-20T11:19:04.1082399' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'92032529-c03d-44c2-92ea-980d8af057b2', N'3e805b41-1adc-426c-93a4-cfb6b7be3f9a', N'd3f15e0a-7ac8-4f28-b93e-f8c11eee7fcf', N'e7b7e340-9e22-4cf2-8136-97f121f8bb8b', 15, 0, CAST(N'2024-12-20T11:21:46.8726106' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'14644db8-1f51-4baf-b6a2-9e29ef567fda', N'44fd7eff-2866-48b2-a9cd-67f89406c5e3', N'32f207a2-02ba-4b83-8c71-03af11657c63', N'11da88c3-b2cf-44c9-929f-5bd53a44cf15', 3, 0, CAST(N'2024-12-20T11:16:25.9084175' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'96e54c05-16cb-46c7-ba72-a4299b5923df', N'44fd7eff-2866-48b2-a9cd-67f89406c5e3', N'55fc6d0e-50b3-4876-bf93-ee3937daeb62', N'11da88c3-b2cf-44c9-929f-5bd53a44cf15', 3, 0, CAST(N'2024-12-20T11:19:04.1314736' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'792df25a-f58f-4912-8956-a81cee3bc7e8', N'44fd7eff-2866-48b2-a9cd-67f89406c5e3', N'55fc6d0e-50b3-4876-bf93-ee3937daeb62', N'ed1b2619-85bf-4554-854e-c26bc0d1235c', 3, 0, CAST(N'2024-12-20T11:19:04.1151071' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'ea1b3018-21ce-4ea3-9177-a872b3cdff2c', N'44fd7eff-2866-48b2-a9cd-67f89406c5e3', N'55fc6d0e-50b3-4876-bf93-ee3937daeb62', N'82660276-5d20-4418-bc22-71da3efe99b0', 3, 0, CAST(N'2024-12-20T11:19:04.0980353' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'7eb63617-b78b-4e7f-855d-a8c752cd8eaa', N'44fd7eff-2866-48b2-a9cd-67f89406c5e3', N'dd3c7e8b-3dc7-45d2-a2bd-282de7d5e2de', N'9c521f0d-4bfb-48a3-82d4-9a796dc24b19', 6, 0, CAST(N'2024-12-20T11:17:59.3979534' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'82c5828b-d38a-4db6-acd3-a90135a3673b', N'44fd7eff-2866-48b2-a9cd-67f89406c5e3', N'2d1c4b21-92b0-4105-9151-0980a4c924ad', N'48392db0-15e2-4d8a-96b7-f57fdd16f82e', 0, 0, CAST(N'2024-12-20T11:18:26.4903989' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'2628c139-d8de-471d-92ab-a9ee70e4b3e6', N'44fd7eff-2866-48b2-a9cd-67f89406c5e3', N'dd3c7e8b-3dc7-45d2-a2bd-282de7d5e2de', N'01bad5fb-807f-458b-8ee3-7bcfa14a8884', 4, 0, CAST(N'2024-12-20T11:17:59.2974626' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'b43024de-72c3-4ead-9983-af8bc596fb38', N'44fd7eff-2866-48b2-a9cd-67f89406c5e3', N'55fc6d0e-50b3-4876-bf93-ee3937daeb62', N'b85b7897-34d1-4c88-9051-bb285ea9e5ff', 6, 0, CAST(N'2024-12-20T11:19:04.2013901' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'19981663-dc49-4e4d-9ebd-b0638e0f4bf6', N'44fd7eff-2866-48b2-a9cd-67f89406c5e3', N'32f207a2-02ba-4b83-8c71-03af11657c63', N'57df4c30-1c1d-4d6d-9b4e-00ad48f7bff3', 2, 0, CAST(N'2024-12-20T11:16:25.9032423' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'677eea81-0b72-484b-a7f1-b14b27c002ea', N'44fd7eff-2866-48b2-a9cd-67f89406c5e3', N'32f207a2-02ba-4b83-8c71-03af11657c63', N'b85b7897-34d1-4c88-9051-bb285ea9e5ff', 6, 0, CAST(N'2024-12-20T11:16:25.9900819' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'8e726f5f-cdcb-41cf-accd-b192f1ebd788', N'3e805b41-1adc-426c-93a4-cfb6b7be3f9a', N'70be578e-af27-4056-a6ad-55990f86b3e7', N'5b56175b-fafd-48c1-8a67-71be50301514', 5, 0, CAST(N'2024-12-20T11:22:18.4762136' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'00b4746c-7fe7-47e8-b128-b1bbaeb626da', N'44fd7eff-2866-48b2-a9cd-67f89406c5e3', N'55fc6d0e-50b3-4876-bf93-ee3937daeb62', N'9f0b0494-0ed3-4589-b53c-0b1e622a3caf', 3, 0, CAST(N'2024-12-20T11:19:04.1372486' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'9d9b8b6a-5fb9-4b0b-a153-b33c6c0d45e5', N'44fd7eff-2866-48b2-a9cd-67f89406c5e3', N'2d1c4b21-92b0-4105-9151-0980a4c924ad', N'ab730722-8e74-4799-95c0-2faec8990d02', 0, 0, CAST(N'2024-12-20T11:18:26.5364934' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'76e671ed-ae48-4b6b-8656-b54772d3cc18', N'44fd7eff-2866-48b2-a9cd-67f89406c5e3', N'55fc6d0e-50b3-4876-bf93-ee3937daeb62', N'69a0b169-5ca7-4909-8ea3-eac52230c55c', 9, 0, CAST(N'2024-12-20T11:19:04.1726633' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'40f04361-ebfb-4900-80c5-b879658fd551', N'44fd7eff-2866-48b2-a9cd-67f89406c5e3', N'55fc6d0e-50b3-4876-bf93-ee3937daeb62', N'48392db0-15e2-4d8a-96b7-f57fdd16f82e', 3, 0, CAST(N'2024-12-20T11:19:04.1031897' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'6df99cf8-5fba-4834-82ff-b8a4652a41ee', N'3e805b41-1adc-426c-93a4-cfb6b7be3f9a', N'd3f15e0a-7ac8-4f28-b93e-f8c11eee7fcf', N'dc3d5294-14a3-4692-adef-33e6ce38d2a4', 10, 0, CAST(N'2024-12-20T11:21:46.8609473' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'139cbc42-cee8-4bf7-9d41-ba605209b861', N'3e805b41-1adc-426c-93a4-cfb6b7be3f9a', N'70be578e-af27-4056-a6ad-55990f86b3e7', N'ca63cdc0-b117-44ea-af03-20b10f001c95', 10, 0, CAST(N'2024-12-20T11:22:18.4539882' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'c15fbb70-b450-4f56-a0f5-bc5c00369f11', N'44fd7eff-2866-48b2-a9cd-67f89406c5e3', N'2d1c4b21-92b0-4105-9151-0980a4c924ad', N'966a23c7-23e5-4167-892a-3f554f3260f2', 0, 0, CAST(N'2024-12-20T11:18:26.5088701' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'159efa75-335f-4916-844f-bd25545545c6', N'44fd7eff-2866-48b2-a9cd-67f89406c5e3', N'dd3c7e8b-3dc7-45d2-a2bd-282de7d5e2de', N'82660276-5d20-4418-bc22-71da3efe99b0', 0, 0, CAST(N'2024-12-20T11:17:59.3072579' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'a7c9a1fa-1bad-4bb9-abeb-bd93654dce7e', N'44fd7eff-2866-48b2-a9cd-67f89406c5e3', N'2d1c4b21-92b0-4105-9151-0980a4c924ad', N'9c521f0d-4bfb-48a3-82d4-9a796dc24b19', 0, 0, CAST(N'2024-12-20T11:18:26.5781991' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'105e0c48-0bda-448e-85ca-c12f2fe7aa92', N'44fd7eff-2866-48b2-a9cd-67f89406c5e3', N'32f207a2-02ba-4b83-8c71-03af11657c63', N'ed1b2619-85bf-4554-854e-c26bc0d1235c', 3, 0, CAST(N'2024-12-20T11:16:25.8893474' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'55e6f2a4-b307-4a33-80ba-c19f8ca2f920', N'44fd7eff-2866-48b2-a9cd-67f89406c5e3', N'dd3c7e8b-3dc7-45d2-a2bd-282de7d5e2de', N'9f0b0494-0ed3-4589-b53c-0b1e622a3caf', 0, 0, CAST(N'2024-12-20T11:17:59.3503974' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'caedb606-c0e1-40d0-bbee-c589964d8d9b', N'44fd7eff-2866-48b2-a9cd-67f89406c5e3', N'55fc6d0e-50b3-4876-bf93-ee3937daeb62', N'af386a97-a6b5-4f81-a8eb-8b3abb0459e4', 6, 0, CAST(N'2024-12-20T11:19:04.1886623' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'4bb6227e-fcb5-4d71-9a88-c603b3e01934', N'44fd7eff-2866-48b2-a9cd-67f89406c5e3', N'2d1c4b21-92b0-4105-9151-0980a4c924ad', N'69a0b169-5ca7-4909-8ea3-eac52230c55c', 0, 0, CAST(N'2024-12-20T11:18:26.5677107' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'7ef5e6e1-fa0d-4093-88ef-c882bc0a0d59', N'44fd7eff-2866-48b2-a9cd-67f89406c5e3', N'2d1c4b21-92b0-4105-9151-0980a4c924ad', N'fdb0c7a2-dd1e-466b-9fd8-12d8a9719335', 0, 0, CAST(N'2024-12-20T11:18:26.5728883' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'3a4b42be-1707-4a83-bb9f-ca0f38ee2db0', N'44fd7eff-2866-48b2-a9cd-67f89406c5e3', N'55fc6d0e-50b3-4876-bf93-ee3937daeb62', N'78986923-5a5e-4185-896f-7d53f2251744', 4, 0, CAST(N'2024-12-20T11:19:04.0804528' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'5f3e2e3b-4294-4dae-9afa-cdc9d7b6b699', N'44fd7eff-2866-48b2-a9cd-67f89406c5e3', N'2d1c4b21-92b0-4105-9151-0980a4c924ad', N'b20b677e-b923-423b-b952-fa1886df1475', 0, 0, CAST(N'2024-12-20T11:18:26.5490123' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'490994da-72ac-4734-b07d-cfcae3004827', N'44fd7eff-2866-48b2-a9cd-67f89406c5e3', N'dd3c7e8b-3dc7-45d2-a2bd-282de7d5e2de', N'b9051419-5b11-4a6f-92e8-1b2c35fc032d', 0, 0, CAST(N'2024-12-20T11:17:59.3200513' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'af6fb6a1-7b09-4a83-8f5d-d0a671132c80', N'44fd7eff-2866-48b2-a9cd-67f89406c5e3', N'dd3c7e8b-3dc7-45d2-a2bd-282de7d5e2de', N'48392db0-15e2-4d8a-96b7-f57fdd16f82e', 0, 0, CAST(N'2024-12-20T11:17:59.3145466' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'5e537c59-6a66-4557-ad2b-d14405158805', N'44fd7eff-2866-48b2-a9cd-67f89406c5e3', N'2d1c4b21-92b0-4105-9151-0980a4c924ad', N'57df4c30-1c1d-4d6d-9b4e-00ad48f7bff3', 0, 0, CAST(N'2024-12-20T11:18:26.5156729' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'fcf403b4-2bb1-4658-8ff8-d212a73afd76', N'44fd7eff-2866-48b2-a9cd-67f89406c5e3', N'2d1c4b21-92b0-4105-9151-0980a4c924ad', N'11da88c3-b2cf-44c9-929f-5bd53a44cf15', 0, 0, CAST(N'2024-12-20T11:18:26.5220156' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'd17ff7c3-70d4-492f-bde7-d3bbfdaf6c5e', N'44fd7eff-2866-48b2-a9cd-67f89406c5e3', N'32f207a2-02ba-4b83-8c71-03af11657c63', N'80c4bc56-48c8-4786-a4e2-5934ac40e22a', 0, 0, CAST(N'2024-12-20T11:16:25.9309751' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'4d91ef16-b3d2-4b61-876a-d65ef857fb43', N'44fd7eff-2866-48b2-a9cd-67f89406c5e3', N'dd3c7e8b-3dc7-45d2-a2bd-282de7d5e2de', N'af386a97-a6b5-4f81-a8eb-8b3abb0459e4', 6, 0, CAST(N'2024-12-20T11:17:59.4032598' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'cc62cdda-7a37-4be4-a106-d7443465f1db', N'44fd7eff-2866-48b2-a9cd-67f89406c5e3', N'dd3c7e8b-3dc7-45d2-a2bd-282de7d5e2de', N'966a23c7-23e5-4167-892a-3f554f3260f2', 0, 0, CAST(N'2024-12-20T11:17:59.3324487' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'013a6c37-4afb-4929-8503-d97314ef1cc5', N'44fd7eff-2866-48b2-a9cd-67f89406c5e3', N'2d1c4b21-92b0-4105-9151-0980a4c924ad', N'01bad5fb-807f-458b-8ee3-7bcfa14a8884', 4, 0, CAST(N'2024-12-20T11:18:26.4716601' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'155cb0b8-5e90-45a7-b9b7-d9941bcbb24f', N'44fd7eff-2866-48b2-a9cd-67f89406c5e3', N'55fc6d0e-50b3-4876-bf93-ee3937daeb62', N'28c4dc70-a101-4d24-bcc1-a73f018fc1d5', 4, 0, CAST(N'2024-12-20T11:19:04.0723306' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'bb8d1001-b2f1-4738-9aef-df1000f15402', N'44fd7eff-2866-48b2-a9cd-67f89406c5e3', N'32f207a2-02ba-4b83-8c71-03af11657c63', N'82660276-5d20-4418-bc22-71da3efe99b0', 3, 0, CAST(N'2024-12-20T11:16:25.8685924' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'feed9501-5246-4a26-81a4-e1b2fb6b86ce', N'3e805b41-1adc-426c-93a4-cfb6b7be3f9a', N'd3f15e0a-7ac8-4f28-b93e-f8c11eee7fcf', N'cc41c59d-36ed-46a9-9654-a81452057427', 15, 0, CAST(N'2024-12-20T11:21:46.8359380' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'79436bee-e67d-4c25-b80f-e2b26c14919c', N'44fd7eff-2866-48b2-a9cd-67f89406c5e3', N'2d1c4b21-92b0-4105-9151-0980a4c924ad', N'b85b7897-34d1-4c88-9051-bb285ea9e5ff', 0, 0, CAST(N'2024-12-20T11:18:26.5977378' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'81f2cdde-b905-4b1a-91b3-e2bed2d8dbd5', N'44fd7eff-2866-48b2-a9cd-67f89406c5e3', N'dd3c7e8b-3dc7-45d2-a2bd-282de7d5e2de', N'6b171dfb-a02f-4076-8ed7-7d223902e1b0', 0, 0, CAST(N'2024-12-20T11:17:59.3797963' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'88e51c24-3b92-4246-a27d-e5ade41f6c17', N'44fd7eff-2866-48b2-a9cd-67f89406c5e3', N'dd3c7e8b-3dc7-45d2-a2bd-282de7d5e2de', N'69a0b169-5ca7-4909-8ea3-eac52230c55c', 0, 0, CAST(N'2024-12-20T11:17:59.3850680' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'da57566f-5bca-4a13-a345-e60e85b74996', N'44fd7eff-2866-48b2-a9cd-67f89406c5e3', N'dd3c7e8b-3dc7-45d2-a2bd-282de7d5e2de', N'80c4bc56-48c8-4786-a4e2-5934ac40e22a', 0, 0, CAST(N'2024-12-20T11:17:59.3616709' AS DateTime2), 2)
GO
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'3f1ec33a-a180-4d4a-b6f1-eb2c3ee0260d', N'44fd7eff-2866-48b2-a9cd-67f89406c5e3', N'dd3c7e8b-3dc7-45d2-a2bd-282de7d5e2de', N'b20b677e-b923-423b-b952-fa1886df1475', 0, 0, CAST(N'2024-12-20T11:17:59.3679357' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'033635d7-95b7-4db4-b9d9-edac8ffb2f9f', N'44fd7eff-2866-48b2-a9cd-67f89406c5e3', N'55fc6d0e-50b3-4876-bf93-ee3937daeb62', N'ab730722-8e74-4799-95c0-2faec8990d02', 0, 0, CAST(N'2024-12-20T11:19:04.1421893' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'a381eed3-e755-4307-a27f-f30913118a7e', N'44fd7eff-2866-48b2-a9cd-67f89406c5e3', N'32f207a2-02ba-4b83-8c71-03af11657c63', N'fdb0c7a2-dd1e-466b-9fd8-12d8a9719335', 0, 0, CAST(N'2024-12-20T11:16:25.9630860' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'de5cecec-c137-4daf-adcc-f456dfb838b2', N'3e805b41-1adc-426c-93a4-cfb6b7be3f9a', N'70be578e-af27-4056-a6ad-55990f86b3e7', N'ba441ea2-ce78-4a4b-a99b-1f4ca7b16afe', 5, 0, CAST(N'2024-12-20T11:22:18.4585633' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'27d3fa72-e4f4-4a11-98c5-f63a3b71e400', N'44fd7eff-2866-48b2-a9cd-67f89406c5e3', N'32f207a2-02ba-4b83-8c71-03af11657c63', N'95aec639-b24f-44ca-a649-5912e7158a51', 6, 0, CAST(N'2024-12-20T11:16:25.9839204' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'57846d44-b492-4267-9df3-f752f7b04f4b', N'3e805b41-1adc-426c-93a4-cfb6b7be3f9a', N'70be578e-af27-4056-a6ad-55990f86b3e7', N'7d6b91a4-c2c4-4888-811b-9987c5254811', 15, 0, CAST(N'2024-12-20T11:22:18.4885116' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'bfb94139-2562-4a4d-bcbd-f9cad0b008b9', N'3e805b41-1adc-426c-93a4-cfb6b7be3f9a', N'70be578e-af27-4056-a6ad-55990f86b3e7', N'334897f3-377a-4d2d-bbad-dc3c87539f16', 15, 0, CAST(N'2024-12-20T11:22:18.4659155' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'cb2e5b34-d565-401b-8370-fc97f5c27cb4', N'3e805b41-1adc-426c-93a4-cfb6b7be3f9a', N'd3f15e0a-7ac8-4f28-b93e-f8c11eee7fcf', N'334897f3-377a-4d2d-bbad-dc3c87539f16', 15, 0, CAST(N'2024-12-20T11:21:46.8557166' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'bb7b936d-2b4e-4444-9a85-ff735ddb5af0', N'44fd7eff-2866-48b2-a9cd-67f89406c5e3', N'dd3c7e8b-3dc7-45d2-a2bd-282de7d5e2de', N'ab730722-8e74-4799-95c0-2faec8990d02', 0, 0, CAST(N'2024-12-20T11:17:59.3553316' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'f6cf99f1-bf66-4fc5-b17f-fff68593493c', N'44fd7eff-2866-48b2-a9cd-67f89406c5e3', N'2d1c4b21-92b0-4105-9151-0980a4c924ad', N'9f0b0494-0ed3-4589-b53c-0b1e622a3caf', 0, 0, CAST(N'2024-12-20T11:18:26.5282226' AS DateTime2), 2)
GO
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'140d16e5-cb62-4448-883c-02ef5c2a7a4e', N'44fd7eff-2866-48b2-a9cd-67f89406c5e3', N'55fc6d0e-50b3-4876-bf93-ee3937daeb62', N'd416e3a1-4960-496c-8afc-42bf97ffb53e', 0, 0, CAST(N'2024-12-20T11:19:22.4201318' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'8bada3dc-737f-4f52-bec5-0378888e3605', N'44fd7eff-2866-48b2-a9cd-67f89406c5e3', N'70be578e-af27-4056-a6ad-55990f86b3e7', N'b1637b7e-095f-436f-856f-3d9d2bfc69e2', 6, 0, CAST(N'2024-12-20T11:20:30.6920856' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'1aff7c51-764d-4bf5-89c3-04ff73754f76', N'44fd7eff-2866-48b2-a9cd-67f89406c5e3', N'70be578e-af27-4056-a6ad-55990f86b3e7', N'490994da-72ac-4734-b07d-cfcae3004827', 0, 0, CAST(N'2024-12-20T11:20:30.5987537' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'163a2b76-2487-400d-b9dd-0533dca49ee5', N'44fd7eff-2866-48b2-a9cd-67f89406c5e3', N'55fc6d0e-50b3-4876-bf93-ee3937daeb62', N'55e6f2a4-b307-4a33-80ba-c19f8ca2f920', 0, 0, CAST(N'2024-12-20T11:19:32.5942587' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'e4577447-8c91-4d42-a7f0-0642863402e6', N'44fd7eff-2866-48b2-a9cd-67f89406c5e3', N'70be578e-af27-4056-a6ad-55990f86b3e7', N'ed56103f-dc7c-40fe-b4a5-00912028744e', 0, 0, CAST(N'2024-12-20T11:20:22.5606624' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'472ed19c-78e1-46f3-9baa-0654a91913aa', N'44fd7eff-2866-48b2-a9cd-67f89406c5e3', N'55fc6d0e-50b3-4876-bf93-ee3937daeb62', N'159efa75-335f-4916-844f-bd25545545c6', 0, 0, CAST(N'2024-12-20T11:19:32.5520066' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'02a70d33-1497-4ae5-a8f5-06f2c6884ef4', N'44fd7eff-2866-48b2-a9cd-67f89406c5e3', N'70be578e-af27-4056-a6ad-55990f86b3e7', N'633e3ab5-5059-46be-9427-97feaa74b1a3', 3, 0, CAST(N'2024-12-20T11:20:22.5014597' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'f6496c9b-009c-4bfd-a62f-07cde9705a51', N'44fd7eff-2866-48b2-a9cd-67f89406c5e3', N'70be578e-af27-4056-a6ad-55990f86b3e7', N'27d3fa72-e4f4-4a11-98c5-f63a3b71e400', 6, 0, CAST(N'2024-12-20T11:20:10.9298152' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'dcc82aba-f2ae-4a59-adcf-0c34b81b8e4a', N'44fd7eff-2866-48b2-a9cd-67f89406c5e3', N'70be578e-af27-4056-a6ad-55990f86b3e7', N'bc455747-2c49-431a-aec4-76c4cf7cc113', 3, 0, CAST(N'2024-12-20T11:20:10.8469792' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'980e0d7f-18d7-491f-a914-0d1d7be5e889', N'44fd7eff-2866-48b2-a9cd-67f89406c5e3', N'55fc6d0e-50b3-4876-bf93-ee3937daeb62', N'c1b0cb28-4e74-45e9-a6e3-19658ab54cb8', 0, 0, CAST(N'2024-12-20T11:19:32.5825209' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'84b3171c-633d-4930-9840-10ce071db21c', N'44fd7eff-2866-48b2-a9cd-67f89406c5e3', N'55fc6d0e-50b3-4876-bf93-ee3937daeb62', N'8951365b-434b-45df-8f07-94b4ad1623c8', 4, 0, CAST(N'2024-12-20T11:19:32.5460042' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'016a72a6-5723-41fa-b069-1177892da8be', N'44fd7eff-2866-48b2-a9cd-67f89406c5e3', N'70be578e-af27-4056-a6ad-55990f86b3e7', N'677eea81-0b72-484b-a7f1-b14b27c002ea', 6, 0, CAST(N'2024-12-20T11:20:10.9367945' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'5760a735-91ea-4c92-a69f-122e0b1b4c71', N'3e805b41-1adc-426c-93a4-cfb6b7be3f9a', N'cdb5713c-fcb9-4105-8140-033fc2ac032e', N'b7fadd76-f462-4a24-a602-00d61272e09f', 15, 0, CAST(N'2024-12-20T11:22:59.5611111' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'9f62a7e1-7382-4b63-a04e-12a170e0328f', N'44fd7eff-2866-48b2-a9cd-67f89406c5e3', N'55fc6d0e-50b3-4876-bf93-ee3937daeb62', N'79436bee-e67d-4c25-b80f-e2b26c14919c', 0, 0, CAST(N'2024-12-20T11:19:39.5933711' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'e1e51b45-2405-4a96-acf5-149f8559c407', N'44fd7eff-2866-48b2-a9cd-67f89406c5e3', N'55fc6d0e-50b3-4876-bf93-ee3937daeb62', N'a7c9a1fa-1bad-4bb9-abeb-bd93654dce7e', 0, 0, CAST(N'2024-12-20T11:19:39.5761127' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'708ad915-b4aa-4dea-ad46-18bdf6781e4c', N'44fd7eff-2866-48b2-a9cd-67f89406c5e3', N'55fc6d0e-50b3-4876-bf93-ee3937daeb62', N'105e0c48-0bda-448e-85ca-c12f2fe7aa92', 3, 0, CAST(N'2024-12-20T11:19:22.3597650' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'1825d911-6dfd-43e6-97bc-192ade471175', N'3e805b41-1adc-426c-93a4-cfb6b7be3f9a', N'cdb5713c-fcb9-4105-8140-033fc2ac032e', N'eb93cb7a-87e0-492b-a0d0-58204847d7fa', 10, 0, CAST(N'2024-12-20T11:22:59.5837591' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'd2f3ca7c-c8e1-485c-bbe8-1a26eadbd8f9', N'44fd7eff-2866-48b2-a9cd-67f89406c5e3', N'55fc6d0e-50b3-4876-bf93-ee3937daeb62', N'0e4d9792-5506-485e-99da-4a37df8ffa58', 0, 0, CAST(N'2024-12-20T11:19:22.4032256' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'7b7f9b27-fb12-430a-9b1b-1c1a0bfe5961', N'44fd7eff-2866-48b2-a9cd-67f89406c5e3', N'70be578e-af27-4056-a6ad-55990f86b3e7', N'7ab2ac76-6039-4c0b-8dbe-3a07684d3663', 0, 0, CAST(N'2024-12-20T11:20:39.7507717' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'263db671-4f29-4e74-a2b6-1cc9d4d935b3', N'44fd7eff-2866-48b2-a9cd-67f89406c5e3', N'55fc6d0e-50b3-4876-bf93-ee3937daeb62', N'51c01df3-9a66-4d7c-836a-92f23c33e39e', 0, 0, CAST(N'2024-12-20T11:19:39.5886492' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'372e4180-be27-400a-9410-1d9f3863d371', N'44fd7eff-2866-48b2-a9cd-67f89406c5e3', N'55fc6d0e-50b3-4876-bf93-ee3937daeb62', N'd549b37c-bfd8-41fa-816a-11b52df46d53', 0, 0, CAST(N'2024-12-20T11:19:22.3901856' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'ccede931-2781-42ff-8b50-1daa7ab4862b', N'44fd7eff-2866-48b2-a9cd-67f89406c5e3', N'70be578e-af27-4056-a6ad-55990f86b3e7', N'8951365b-434b-45df-8f07-94b4ad1623c8', 4, 0, CAST(N'2024-12-20T11:20:30.5820776' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'ebc45642-b3e3-46bc-9dea-1edbd2a7cbc6', N'44fd7eff-2866-48b2-a9cd-67f89406c5e3', N'70be578e-af27-4056-a6ad-55990f86b3e7', N'387f589d-a00c-4ae8-9cc2-437da0611bc5', 0, 0, CAST(N'2024-12-20T11:20:30.6696024' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'38506d5e-d3aa-4ce8-a36f-216ed7502a2d', N'44fd7eff-2866-48b2-a9cd-67f89406c5e3', N'70be578e-af27-4056-a6ad-55990f86b3e7', N'f54d82d7-2a0f-47cc-a2ea-578addc613db', 0, 0, CAST(N'2024-12-20T11:20:30.6517935' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'd79c6f45-aa89-4194-b6c7-256da7aa5674', N'44fd7eff-2866-48b2-a9cd-67f89406c5e3', N'70be578e-af27-4056-a6ad-55990f86b3e7', N'54ce584b-3479-4f90-a081-71b4cc17e37c', 0, 0, CAST(N'2024-12-20T11:20:39.7955948' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'ecded42e-7e72-4a64-901f-28fb180c1a28', N'44fd7eff-2866-48b2-a9cd-67f89406c5e3', N'70be578e-af27-4056-a6ad-55990f86b3e7', N'c15fbb70-b450-4f56-a0f5-bc5c00369f11', 0, 0, CAST(N'2024-12-20T11:20:39.7198535' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'c14e57b4-83be-41a3-a7eb-2deb9dd2f0a4', N'44fd7eff-2866-48b2-a9cd-67f89406c5e3', N'55fc6d0e-50b3-4876-bf93-ee3937daeb62', N'2628c139-d8de-471d-92ab-a9ee70e4b3e6', 4, 0, CAST(N'2024-12-20T11:19:32.5401445' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'8fc1e87f-d9f0-4e4f-9d19-2f32be36a5ae', N'44fd7eff-2866-48b2-a9cd-67f89406c5e3', N'70be578e-af27-4056-a6ad-55990f86b3e7', N'6c01ad1d-30ae-4305-a378-5237ef7fccc4', 4, 0, CAST(N'2024-12-20T11:20:39.6881422' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'01e57064-7a83-4f25-8c25-2f49b122b69b', N'3e805b41-1adc-426c-93a4-cfb6b7be3f9a', N'cdb5713c-fcb9-4105-8140-033fc2ac032e', N'6df99cf8-5fba-4834-82ff-b8a4652a41ee', 10, 0, CAST(N'2024-12-20T11:22:53.1690275' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'974e001b-ff99-4ee5-83c2-30ed06ed5559', N'44fd7eff-2866-48b2-a9cd-67f89406c5e3', N'70be578e-af27-4056-a6ad-55990f86b3e7', N'57ceda7e-014f-42bc-9d3a-5e5ad96fd373', 4, 0, CAST(N'2024-12-20T11:20:10.7844507' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'6faca414-c077-435b-b7bc-32594d182887', N'44fd7eff-2866-48b2-a9cd-67f89406c5e3', N'55fc6d0e-50b3-4876-bf93-ee3937daeb62', N'19981663-dc49-4e4d-9ebd-b0638e0f4bf6', 2, 0, CAST(N'2024-12-20T11:19:22.3716244' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'03643244-632a-444a-96f4-328d6bcfc85b', N'44fd7eff-2866-48b2-a9cd-67f89406c5e3', N'70be578e-af27-4056-a6ad-55990f86b3e7', N'bb8d1001-b2f1-4738-9aef-df1000f15402', 3, 0, CAST(N'2024-12-20T11:20:10.8037287' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'8a833ac6-a426-45c2-9e4f-32fd74c72663', N'44fd7eff-2866-48b2-a9cd-67f89406c5e3', N'70be578e-af27-4056-a6ad-55990f86b3e7', N'79436bee-e67d-4c25-b80f-e2b26c14919c', 0, 0, CAST(N'2024-12-20T11:20:39.8090850' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'a6180365-517d-4df0-b1f6-3422addd83d0', N'3e805b41-1adc-426c-93a4-cfb6b7be3f9a', N'cdb5713c-fcb9-4105-8140-033fc2ac032e', N'8e726f5f-cdcb-41cf-accd-b192f1ebd788', 5, 0, CAST(N'2024-12-20T11:22:59.5880249' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'38168ccb-2843-4459-ae14-3452fdbe57c1', N'3e805b41-1adc-426c-93a4-cfb6b7be3f9a', N'cdb5713c-fcb9-4105-8140-033fc2ac032e', N'92032529-c03d-44c2-92ea-980d8af057b2', 15, 0, CAST(N'2024-12-20T11:22:53.1830569' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'48497000-822c-4dda-86ba-3bcc543a0ef7', N'44fd7eff-2866-48b2-a9cd-67f89406c5e3', N'70be578e-af27-4056-a6ad-55990f86b3e7', N'4d91ef16-b3d2-4b61-876a-d65ef857fb43', 6, 0, CAST(N'2024-12-20T11:20:30.6810176' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'9066f8b8-eb4e-4b6a-8362-3bfd62040c5e', N'44fd7eff-2866-48b2-a9cd-67f89406c5e3', N'55fc6d0e-50b3-4876-bf93-ee3937daeb62', N'9d9b8b6a-5fb9-4b0b-a153-b33c6c0d45e5', 0, 0, CAST(N'2024-12-20T11:19:39.5350898' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'a0cf7409-9418-4e4c-a164-3ce113d32fa7', N'44fd7eff-2866-48b2-a9cd-67f89406c5e3', N'55fc6d0e-50b3-4876-bf93-ee3937daeb62', N'17dad294-1dbb-42cd-9a12-6c8ca5a71cec', 0, 0, CAST(N'2024-12-20T11:19:22.4149677' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'f7daa445-a304-4376-9d10-3dbab10f4c83', N'44fd7eff-2866-48b2-a9cd-67f89406c5e3', N'70be578e-af27-4056-a6ad-55990f86b3e7', N'19981663-dc49-4e4d-9ebd-b0638e0f4bf6', 2, 0, CAST(N'2024-12-20T11:20:10.8332009' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'a9ad337f-7836-4793-bc2e-3e78782d12f8', N'44fd7eff-2866-48b2-a9cd-67f89406c5e3', N'70be578e-af27-4056-a6ad-55990f86b3e7', N'3b4f11a5-900f-49de-a416-2bed29a293a9', 3, 0, CAST(N'2024-12-20T11:20:10.8090437' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'dcacc152-0c2c-46d9-9e8e-41559b31fb32', N'44fd7eff-2866-48b2-a9cd-67f89406c5e3', N'70be578e-af27-4056-a6ad-55990f86b3e7', N'7920ef42-80ec-4ac7-87d3-59015435820b', 6, 0, CAST(N'2024-12-20T11:20:22.5795745' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'54ddf2b0-bb62-42de-8894-41aaa11b41af', N'44fd7eff-2866-48b2-a9cd-67f89406c5e3', N'55fc6d0e-50b3-4876-bf93-ee3937daeb62', N'fcf403b4-2bb1-4658-8ff8-d212a73afd76', 0, 0, CAST(N'2024-12-20T11:19:39.5224114' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'2df5d4b9-5d59-46e4-bf49-41adedf02907', N'44fd7eff-2866-48b2-a9cd-67f89406c5e3', N'55fc6d0e-50b3-4876-bf93-ee3937daeb62', N'490994da-72ac-4734-b07d-cfcae3004827', 0, 0, CAST(N'2024-12-20T11:19:32.5655826' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'07ff450f-54fa-416c-b128-448a703a6e5e', N'44fd7eff-2866-48b2-a9cd-67f89406c5e3', N'70be578e-af27-4056-a6ad-55990f86b3e7', N'55e6f2a4-b307-4a33-80ba-c19f8ca2f920', 0, 0, CAST(N'2024-12-20T11:20:30.6263994' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'd2238efb-bd92-4dbf-bc74-454c8816dfcb', N'44fd7eff-2866-48b2-a9cd-67f89406c5e3', N'70be578e-af27-4056-a6ad-55990f86b3e7', N'3f1ec33a-a180-4d4a-b6f1-eb2c3ee0260d', 0, 0, CAST(N'2024-12-20T11:20:30.6447504' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'cb223b3a-0bbc-48dc-9a18-4626ec01ff61', N'44fd7eff-2866-48b2-a9cd-67f89406c5e3', N'70be578e-af27-4056-a6ad-55990f86b3e7', N'f6cf99f1-bf66-4fc5-b17f-fff68593493c', 0, 0, CAST(N'2024-12-20T11:20:39.7375694' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'975e67e9-7789-4a81-a667-4688d873fb8f', N'44fd7eff-2866-48b2-a9cd-67f89406c5e3', N'70be578e-af27-4056-a6ad-55990f86b3e7', N'cc62cdda-7a37-4be4-a106-d7443465f1db', 0, 0, CAST(N'2024-12-20T11:20:30.6097956' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'495d51bd-6a01-46de-b491-472376d1a126', N'44fd7eff-2866-48b2-a9cd-67f89406c5e3', N'70be578e-af27-4056-a6ad-55990f86b3e7', N'88e51c24-3b92-4246-a27d-e5ade41f6c17', 0, 0, CAST(N'2024-12-20T11:20:30.6627327' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'181b7146-8a0b-451d-ab1d-47ff82f69b03', N'44fd7eff-2866-48b2-a9cd-67f89406c5e3', N'70be578e-af27-4056-a6ad-55990f86b3e7', N'cc4075e1-fc2c-4102-89c3-00dc74da39e9', 0, 0, CAST(N'2024-12-20T11:20:22.5545214' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'bda8e076-6a5a-4f91-9c90-48094c83e034', N'44fd7eff-2866-48b2-a9cd-67f89406c5e3', N'70be578e-af27-4056-a6ad-55990f86b3e7', N'76e671ed-ae48-4b6b-8656-b54772d3cc18', 9, 0, CAST(N'2024-12-20T11:20:22.5668052' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'0059a45f-ce85-4c60-8266-4bb70a19ec3b', N'44fd7eff-2866-48b2-a9cd-67f89406c5e3', N'55fc6d0e-50b3-4876-bf93-ee3937daeb62', N'530a6d7f-3f97-467a-a43c-54f5b1541913', 0, 0, CAST(N'2024-12-20T11:19:39.4877725' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'9a05050f-e2e3-488e-9699-4cdd70f73a2d', N'44fd7eff-2866-48b2-a9cd-67f89406c5e3', N'55fc6d0e-50b3-4876-bf93-ee3937daeb62', N'ab95bef1-69b4-4ba3-9827-9513b61a47c7', 0, 0, CAST(N'2024-12-20T11:19:39.5590221' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'fe820455-7f9f-471d-a0ce-4f2f7f14a8ef', N'44fd7eff-2866-48b2-a9cd-67f89406c5e3', N'55fc6d0e-50b3-4876-bf93-ee3937daeb62', N'bc455747-2c49-431a-aec4-76c4cf7cc113', 3, 0, CAST(N'2024-12-20T11:19:22.3849152' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'8b9ff658-8e47-4c18-a9ad-4fdac75d12f5', N'44fd7eff-2866-48b2-a9cd-67f89406c5e3', N'55fc6d0e-50b3-4876-bf93-ee3937daeb62', N'013a6c37-4afb-4929-8503-d97314ef1cc5', 4, 0, CAST(N'2024-12-20T11:19:39.4753850' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'6f382ed1-92c4-481d-ae89-50619301395f', N'44fd7eff-2866-48b2-a9cd-67f89406c5e3', N'55fc6d0e-50b3-4876-bf93-ee3937daeb62', N'c15fbb70-b450-4f56-a0f5-bc5c00369f11', 0, 0, CAST(N'2024-12-20T11:19:39.5093525' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'2cc2d741-a121-4bb1-90c2-513724b9d16b', N'44fd7eff-2866-48b2-a9cd-67f89406c5e3', N'55fc6d0e-50b3-4876-bf93-ee3937daeb62', N'f590e724-86bf-4b75-9ddb-02c64e6cd3f0', 3, 0, CAST(N'2024-12-20T11:19:22.3672277' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'5513b28e-dbbb-4e41-941b-521dfd8bfba5', N'44fd7eff-2866-48b2-a9cd-67f89406c5e3', N'55fc6d0e-50b3-4876-bf93-ee3937daeb62', N'05b9df91-4e0d-4dab-b214-138b39db60f1', 0, 0, CAST(N'2024-12-20T11:19:39.5535854' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'88e0c3f5-1264-4b78-8ac5-5226383c2276', N'44fd7eff-2866-48b2-a9cd-67f89406c5e3', N'55fc6d0e-50b3-4876-bf93-ee3937daeb62', N'af6fb6a1-7b09-4a83-8f5d-d0a671132c80', 0, 0, CAST(N'2024-12-20T11:19:32.5585793' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'73b5d404-63ac-4fb5-b69f-530fc8005705', N'44fd7eff-2866-48b2-a9cd-67f89406c5e3', N'55fc6d0e-50b3-4876-bf93-ee3937daeb62', N'c2a12fae-ef94-4ea6-8c12-7027d5b697be', 0, 0, CAST(N'2024-12-20T11:19:32.5713233' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'579e2645-b4f5-442e-803d-54a95a4a7c75', N'44fd7eff-2866-48b2-a9cd-67f89406c5e3', N'70be578e-af27-4056-a6ad-55990f86b3e7', N'033635d7-95b7-4db4-b9d9-edac8ffb2f9f', 0, 0, CAST(N'2024-12-20T11:20:22.5369658' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'eaf83218-57d6-4d73-bd94-58f30b3ce107', N'44fd7eff-2866-48b2-a9cd-67f89406c5e3', N'55fc6d0e-50b3-4876-bf93-ee3937daeb62', N'88e51c24-3b92-4246-a27d-e5ade41f6c17', 0, 0, CAST(N'2024-12-20T11:19:32.6310653' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'33710bfc-37a8-4fe9-b70f-5b6bfe19d11f', N'44fd7eff-2866-48b2-a9cd-67f89406c5e3', N'55fc6d0e-50b3-4876-bf93-ee3937daeb62', N'f54d82d7-2a0f-47cc-a2ea-578addc613db', 0, 0, CAST(N'2024-12-20T11:19:32.6176031' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'380b9fcc-668f-4751-93dd-5c20442dd7b4', N'44fd7eff-2866-48b2-a9cd-67f89406c5e3', N'55fc6d0e-50b3-4876-bf93-ee3937daeb62', N'4bb6227e-fcb5-4d71-9a88-c603b3e01934', 0, 0, CAST(N'2024-12-20T11:19:39.5660316' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'c0cf5ddd-e731-43b0-92d1-5d054bdee27f', N'3e805b41-1adc-426c-93a4-cfb6b7be3f9a', N'cdb5713c-fcb9-4105-8140-033fc2ac032e', N'139cbc42-cee8-4bf7-9d41-ba605209b861', 10, 0, CAST(N'2024-12-20T11:22:59.5671512' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'e92b716e-c207-41db-8d52-6143ea37a388', N'44fd7eff-2866-48b2-a9cd-67f89406c5e3', N'55fc6d0e-50b3-4876-bf93-ee3937daeb62', N'50b5f176-0fdf-44fc-a83d-0217f9d6af74', 6, 0, CAST(N'2024-12-20T11:19:32.6558715' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'00208b75-9609-40d8-b3e1-62890ae59eae', N'44fd7eff-2866-48b2-a9cd-67f89406c5e3', N'55fc6d0e-50b3-4876-bf93-ee3937daeb62', N'590de912-a0d7-421f-bf63-25623d50aa4f', 6, 0, CAST(N'2024-12-20T11:19:22.4367631' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'e1350ac8-6241-4200-9383-62e5d615e82a', N'3e805b41-1adc-426c-93a4-cfb6b7be3f9a', N'cdb5713c-fcb9-4105-8140-033fc2ac032e', N'3d69b27d-a8c8-4779-95a1-53811f07dabc', 10, 0, CAST(N'2024-12-20T11:22:53.1951714' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'5a442c00-af75-4b8e-a77e-63071e532ea3', N'44fd7eff-2866-48b2-a9cd-67f89406c5e3', N'70be578e-af27-4056-a6ad-55990f86b3e7', N'5f3e2e3b-4294-4dae-9afa-cdc9d7b6b699', 0, 0, CAST(N'2024-12-20T11:20:39.7554776' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'ca2d67ba-b695-43a4-a953-6427adf11bf5', N'44fd7eff-2866-48b2-a9cd-67f89406c5e3', N'70be578e-af27-4056-a6ad-55990f86b3e7', N'28403309-3f45-4487-8984-92ad78f338cd', 0, 0, CAST(N'2024-12-20T11:20:39.7071827' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'ce896bcc-e25b-431a-9825-64f995011773', N'44fd7eff-2866-48b2-a9cd-67f89406c5e3', N'70be578e-af27-4056-a6ad-55990f86b3e7', N'82c5828b-d38a-4db6-acd3-a90135a3673b', 0, 0, CAST(N'2024-12-20T11:20:39.7014160' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'85dcf72e-aefe-4dbe-834b-656983ae8d8d', N'44fd7eff-2866-48b2-a9cd-67f89406c5e3', N'70be578e-af27-4056-a6ad-55990f86b3e7', N'0804969e-8111-4ff6-a05a-7d9d472c53cb', 4, 0, CAST(N'2024-12-20T11:20:30.5647334' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'1771cd2f-3440-40d9-9c81-65e69369f824', N'44fd7eff-2866-48b2-a9cd-67f89406c5e3', N'70be578e-af27-4056-a6ad-55990f86b3e7', N'd549b37c-bfd8-41fa-816a-11b52df46d53', 0, 0, CAST(N'2024-12-20T11:20:10.8536613' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'ef4a40d1-c3ca-47cc-98db-694c8ca4b3c4', N'44fd7eff-2866-48b2-a9cd-67f89406c5e3', N'55fc6d0e-50b3-4876-bf93-ee3937daeb62', N'81f2cdde-b905-4b1a-91b3-e2bed2d8dbd5', 0, 0, CAST(N'2024-12-20T11:19:32.6242357' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'0b04ecc4-7a26-4e17-9e44-6ad99efb8488', N'3e805b41-1adc-426c-93a4-cfb6b7be3f9a', N'cdb5713c-fcb9-4105-8140-033fc2ac032e', N'bfb94139-2562-4a4d-bcbd-f9cad0b008b9', 15, 0, CAST(N'2024-12-20T11:22:59.5782555' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'be06c059-98ac-4092-9fde-6beffaa0cf7f', N'44fd7eff-2866-48b2-a9cd-67f89406c5e3', N'70be578e-af27-4056-a6ad-55990f86b3e7', N'a3b91318-c74f-4fc1-8c0e-0904597b9729', 3, 0, CAST(N'2024-12-20T11:20:22.5184274' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'3d0d6d3e-35e7-4fb9-a0c7-6cc282f9dfcc', N'44fd7eff-2866-48b2-a9cd-67f89406c5e3', N'70be578e-af27-4056-a6ad-55990f86b3e7', N'2628c139-d8de-471d-92ab-a9ee70e4b3e6', 4, 0, CAST(N'2024-12-20T11:20:30.5753391' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'f8bf8a8d-acd8-459e-a750-6ec1f69f85d0', N'44fd7eff-2866-48b2-a9cd-67f89406c5e3', N'70be578e-af27-4056-a6ad-55990f86b3e7', N'a7c9a1fa-1bad-4bb9-abeb-bd93654dce7e', 0, 0, CAST(N'2024-12-20T11:20:39.7876133' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'f3d73581-97c8-431f-855a-715342781f3d', N'44fd7eff-2866-48b2-a9cd-67f89406c5e3', N'70be578e-af27-4056-a6ad-55990f86b3e7', N'17dad294-1dbb-42cd-9a12-6c8ca5a71cec', 0, 0, CAST(N'2024-12-20T11:20:10.8824277' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'd75ba830-7efd-4c7b-bfa4-73538acbc456', N'44fd7eff-2866-48b2-a9cd-67f89406c5e3', N'70be578e-af27-4056-a6ad-55990f86b3e7', N'9d9b8b6a-5fb9-4b0b-a153-b33c6c0d45e5', 0, 0, CAST(N'2024-12-20T11:20:39.7447268' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'106cc89e-0b49-412f-808a-752d36f006b0', N'44fd7eff-2866-48b2-a9cd-67f89406c5e3', N'70be578e-af27-4056-a6ad-55990f86b3e7', N'05b9df91-4e0d-4dab-b214-138b39db60f1', 0, 0, CAST(N'2024-12-20T11:20:39.7629440' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'8c1b134f-d096-40c0-a196-75d728db54fc', N'44fd7eff-2866-48b2-a9cd-67f89406c5e3', N'70be578e-af27-4056-a6ad-55990f86b3e7', N'51c01df3-9a66-4d7c-836a-92f23c33e39e', 0, 0, CAST(N'2024-12-20T11:20:39.8023019' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'5e90ea2f-c659-4178-9c80-76b2b533ffce', N'44fd7eff-2866-48b2-a9cd-67f89406c5e3', N'70be578e-af27-4056-a6ad-55990f86b3e7', N'013a6c37-4afb-4929-8503-d97314ef1cc5', 4, 0, CAST(N'2024-12-20T11:20:39.6822340' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'4c92b3a3-6e98-4de1-a2a8-77062d654d5a', N'44fd7eff-2866-48b2-a9cd-67f89406c5e3', N'55fc6d0e-50b3-4876-bf93-ee3937daeb62', N'ef90d1d5-9eae-48eb-a36d-4062d6dc5ce8', 4, 0, CAST(N'2024-12-20T11:19:22.3322896' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'8e82612b-7798-4a07-9f9b-7abe034af0e1', N'44fd7eff-2866-48b2-a9cd-67f89406c5e3', N'70be578e-af27-4056-a6ad-55990f86b3e7', N'105e0c48-0bda-448e-85ca-c12f2fe7aa92', 3, 0, CAST(N'2024-12-20T11:20:10.8210330' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'0156bc94-f90f-4096-b16a-7cef45c7965c', N'44fd7eff-2866-48b2-a9cd-67f89406c5e3', N'55fc6d0e-50b3-4876-bf93-ee3937daeb62', N'54e1a9e0-af30-4119-94bc-7809205918be', 3, 0, CAST(N'2024-12-20T11:19:22.3552496' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'1337352b-02b4-4a9d-b4d6-7d7ef36a19c3', N'44fd7eff-2866-48b2-a9cd-67f89406c5e3', N'70be578e-af27-4056-a6ad-55990f86b3e7', N'f590e724-86bf-4b75-9ddb-02c64e6cd3f0', 3, 0, CAST(N'2024-12-20T11:20:10.8267861' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'72a1a84a-61aa-42f8-9e13-7f45127e203e', N'44fd7eff-2866-48b2-a9cd-67f89406c5e3', N'70be578e-af27-4056-a6ad-55990f86b3e7', N'96e54c05-16cb-46c7-ba72-a4299b5923df', 3, 0, CAST(N'2024-12-20T11:20:22.5251978' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'fc1bbddf-f380-43f7-9426-80734206ec23', N'44fd7eff-2866-48b2-a9cd-67f89406c5e3', N'70be578e-af27-4056-a6ad-55990f86b3e7', N'00b4746c-7fe7-47e8-b128-b1bbaeb626da', 3, 0, CAST(N'2024-12-20T11:20:22.5319127' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'37b69730-23d6-408b-9528-8079b6bfcfac', N'44fd7eff-2866-48b2-a9cd-67f89406c5e3', N'55fc6d0e-50b3-4876-bf93-ee3937daeb62', N'28403309-3f45-4487-8984-92ad78f338cd', 0, 0, CAST(N'2024-12-20T11:19:39.4999815' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'd2fa7b5c-ed56-4e24-a80d-81db08981e33', N'44fd7eff-2866-48b2-a9cd-67f89406c5e3', N'55fc6d0e-50b3-4876-bf93-ee3937daeb62', N'39a5625d-38f5-4717-9daa-5cbf4d450e93', 4, 0, CAST(N'2024-12-20T11:19:22.3040859' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'e2e52f59-63c5-47de-aeaa-82c608b4c2e2', N'44fd7eff-2866-48b2-a9cd-67f89406c5e3', N'55fc6d0e-50b3-4876-bf93-ee3937daeb62', N'82c5828b-d38a-4db6-acd3-a90135a3673b', 0, 0, CAST(N'2024-12-20T11:19:39.4926998' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'52bbfbcd-b050-4632-89b2-887dd0758a33', N'44fd7eff-2866-48b2-a9cd-67f89406c5e3', N'70be578e-af27-4056-a6ad-55990f86b3e7', N'7ef5e6e1-fa0d-4093-88ef-c882bc0a0d59', 0, 0, CAST(N'2024-12-20T11:20:39.7817067' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'9925dfc6-2948-4977-8d6d-8b0b50a36b4c', N'44fd7eff-2866-48b2-a9cd-67f89406c5e3', N'70be578e-af27-4056-a6ad-55990f86b3e7', N'236f1a7f-2626-40dc-b36d-97355bd91451', 4, 0, CAST(N'2024-12-20T11:20:22.4805931' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'40e4d0c9-b1e2-439c-ba0d-8c5aea38a4b9', N'3e805b41-1adc-426c-93a4-cfb6b7be3f9a', N'cdb5713c-fcb9-4105-8140-033fc2ac032e', N'f200d055-f35a-4856-94f6-6db29f2102b0', 15, 0, CAST(N'2024-12-20T11:22:53.1892419' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'f226ca79-d8c8-4e0b-9360-8c5b27a0211f', N'44fd7eff-2866-48b2-a9cd-67f89406c5e3', N'70be578e-af27-4056-a6ad-55990f86b3e7', N'40f04361-ebfb-4900-80c5-b879658fd551', 3, 0, CAST(N'2024-12-20T11:20:22.4965041' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'b150fb7b-483c-491b-a8a4-8f3d13e53229', N'44fd7eff-2866-48b2-a9cd-67f89406c5e3', N'70be578e-af27-4056-a6ad-55990f86b3e7', N'a381eed3-e755-4307-a27f-f30913118a7e', 0, 0, CAST(N'2024-12-20T11:20:10.8957935' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'1567fe92-b56a-4b4f-b21f-91e83bd71e35', N'44fd7eff-2866-48b2-a9cd-67f89406c5e3', N'70be578e-af27-4056-a6ad-55990f86b3e7', N'7de0a811-6b3d-4de9-b65a-0170294a75ae', 0, 0, CAST(N'2024-12-20T11:20:10.8750146' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'd0cb6ac1-51c5-4134-a731-925f77215271', N'44fd7eff-2866-48b2-a9cd-67f89406c5e3', N'55fc6d0e-50b3-4876-bf93-ee3937daeb62', N'3f1ec33a-a180-4d4a-b6f1-eb2c3ee0260d', 0, 0, CAST(N'2024-12-20T11:19:32.6116268' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'1e2dab42-6ce0-45e1-b186-9330f000ca60', N'44fd7eff-2866-48b2-a9cd-67f89406c5e3', N'55fc6d0e-50b3-4876-bf93-ee3937daeb62', N'abea6415-0397-4e76-9cda-622e0614152c', 0, 0, CAST(N'2024-12-20T11:19:39.5049818' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'f9235b83-bf95-4dce-9756-93d9f1bbddc1', N'44fd7eff-2866-48b2-a9cd-67f89406c5e3', N'70be578e-af27-4056-a6ad-55990f86b3e7', N'39a5625d-38f5-4717-9daa-5cbf4d450e93', 4, 0, CAST(N'2024-12-20T11:20:10.7769716' AS DateTime2), 2)
GO
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'ea080a0a-ce01-4236-a2c8-97b0c4407a63', N'44fd7eff-2866-48b2-a9cd-67f89406c5e3', N'70be578e-af27-4056-a6ad-55990f86b3e7', N'c1c18225-6cd4-4a01-a9bf-6e5d56a398b4', 0, 0, CAST(N'2024-12-20T11:20:22.5428583' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'f5725cd5-02fc-4dde-9fd4-983c9df944fa', N'3e805b41-1adc-426c-93a4-cfb6b7be3f9a', N'cdb5713c-fcb9-4105-8140-033fc2ac032e', N'de5cecec-c137-4daf-adcc-f456dfb838b2', 5, 0, CAST(N'2024-12-20T11:22:59.5718135' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'7cab95a9-4e22-449d-891c-98e8c37a185f', N'44fd7eff-2866-48b2-a9cd-67f89406c5e3', N'55fc6d0e-50b3-4876-bf93-ee3937daeb62', N'677eea81-0b72-484b-a7f1-b14b27c002ea', 6, 0, CAST(N'2024-12-20T11:19:22.4492366' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'677c4b1f-daf7-4435-95fe-9d9b0beae6ee', N'44fd7eff-2866-48b2-a9cd-67f89406c5e3', N'70be578e-af27-4056-a6ad-55990f86b3e7', N'a3bd9101-eafb-4d51-8205-73ae7898da92', 4, 0, CAST(N'2024-12-20T11:20:39.6749726' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'd1d11562-e0a4-4d62-891b-9ea9a2d2782c', N'44fd7eff-2866-48b2-a9cd-67f89406c5e3', N'70be578e-af27-4056-a6ad-55990f86b3e7', N'b43024de-72c3-4ead-9983-af8bc596fb38', 6, 0, CAST(N'2024-12-20T11:20:22.5967345' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'14d64ad7-5220-4879-ac54-9ecdbd9b3eba', N'44fd7eff-2866-48b2-a9cd-67f89406c5e3', N'70be578e-af27-4056-a6ad-55990f86b3e7', N'50b5f176-0fdf-44fc-a83d-0217f9d6af74', 6, 0, CAST(N'2024-12-20T11:20:30.6871124' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'0ace08b6-c805-4e9c-88a2-a00b33d4ee98', N'44fd7eff-2866-48b2-a9cd-67f89406c5e3', N'70be578e-af27-4056-a6ad-55990f86b3e7', N'da57566f-5bca-4a13-a345-e60e85b74996', 0, 0, CAST(N'2024-12-20T11:20:30.6393224' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'488c88c7-249d-4d01-9d0b-a0f26944f7a9', N'44fd7eff-2866-48b2-a9cd-67f89406c5e3', N'55fc6d0e-50b3-4876-bf93-ee3937daeb62', N'7ab2ac76-6039-4c0b-8dbe-3a07684d3663', 0, 0, CAST(N'2024-12-20T11:19:39.5401038' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'78be56f0-5190-4ccd-8577-a1172491f497', N'44fd7eff-2866-48b2-a9cd-67f89406c5e3', N'55fc6d0e-50b3-4876-bf93-ee3937daeb62', N'57ceda7e-014f-42bc-9d3a-5e5ad96fd373', 4, 0, CAST(N'2024-12-20T11:19:22.3253945' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'2a211c46-376d-41b5-889f-a1b40ded3379', N'3e805b41-1adc-426c-93a4-cfb6b7be3f9a', N'cdb5713c-fcb9-4105-8140-033fc2ac032e', N'57846d44-b492-4267-9df3-f752f7b04f4b', 15, 0, CAST(N'2024-12-20T11:22:59.6002401' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'bdf47f3a-09db-45af-b7a3-a3bf6ff19613', N'44fd7eff-2866-48b2-a9cd-67f89406c5e3', N'70be578e-af27-4056-a6ad-55990f86b3e7', N'd17ff7c3-70d4-492f-bde7-d3bbfdaf6c5e', 0, 0, CAST(N'2024-12-20T11:20:10.8596876' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'53900c03-6266-47c9-abf4-a3de997afae7', N'44fd7eff-2866-48b2-a9cd-67f89406c5e3', N'55fc6d0e-50b3-4876-bf93-ee3937daeb62', N'80e580b8-1959-4350-afaf-6a0d6c525d7a', 4, 0, CAST(N'2024-12-20T11:19:22.3377786' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'8878c1c1-fbad-447c-a52b-a4496c75e48d', N'44fd7eff-2866-48b2-a9cd-67f89406c5e3', N'70be578e-af27-4056-a6ad-55990f86b3e7', N'026f14ce-8140-4e9a-b4bf-4861201f8277', 9, 0, CAST(N'2024-12-20T11:20:22.5718203' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'eb7d797b-305c-46eb-9bbb-a4e11defb67b', N'3e805b41-1adc-426c-93a4-cfb6b7be3f9a', N'cdb5713c-fcb9-4105-8140-033fc2ac032e', N'1dd4cb39-53d0-4f52-813f-450733e7917e', 10, 0, CAST(N'2024-12-20T11:22:53.1458370' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'b8c727ee-a015-4304-88be-a61063ef570d', N'44fd7eff-2866-48b2-a9cd-67f89406c5e3', N'70be578e-af27-4056-a6ad-55990f86b3e7', N'c2a12fae-ef94-4ea6-8c12-7027d5b697be', 0, 0, CAST(N'2024-12-20T11:20:30.6043976' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'96c32d50-dae0-46c1-aa34-a6b47de0b861', N'44fd7eff-2866-48b2-a9cd-67f89406c5e3', N'70be578e-af27-4056-a6ad-55990f86b3e7', N'81f2cdde-b905-4b1a-91b3-e2bed2d8dbd5', 0, 0, CAST(N'2024-12-20T11:20:30.6569338' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'114daf51-a364-4805-a460-a6f2991ed59f', N'3e805b41-1adc-426c-93a4-cfb6b7be3f9a', N'cdb5713c-fcb9-4105-8140-033fc2ac032e', N'1411041b-34ff-4bb7-bc53-59cac119625d', 10, 0, CAST(N'2024-12-20T11:22:59.6047270' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'cbca7c65-8780-4769-bea4-a717796eccc8', N'44fd7eff-2866-48b2-a9cd-67f89406c5e3', N'70be578e-af27-4056-a6ad-55990f86b3e7', N'fa724e0a-43d7-40e0-bb9c-6b08536b0e2e', 4, 0, CAST(N'2024-12-20T11:20:22.4851686' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'ee8def7f-9c16-4a47-b632-a839f69906bf', N'3e805b41-1adc-426c-93a4-cfb6b7be3f9a', N'cdb5713c-fcb9-4105-8140-033fc2ac032e', N'cb2e5b34-d565-401b-8370-fc97f5c27cb4', 15, 0, CAST(N'2024-12-20T11:22:53.1597824' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'd8b839ca-322d-42aa-8f7d-a83ed9706bd4', N'44fd7eff-2866-48b2-a9cd-67f89406c5e3', N'70be578e-af27-4056-a6ad-55990f86b3e7', N'ea1b3018-21ce-4ea3-9177-a872b3cdff2c', 3, 0, CAST(N'2024-12-20T11:20:22.4902254' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'831f6de7-8254-413c-8806-acc731192d0e', N'44fd7eff-2866-48b2-a9cd-67f89406c5e3', N'70be578e-af27-4056-a6ad-55990f86b3e7', N'05d0a036-bf00-4f21-b037-528113fe7bce', 3, 0, CAST(N'2024-12-20T11:20:22.5130782' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'f2492a06-d5c2-4fa1-b92f-ad94b9245832', N'44fd7eff-2866-48b2-a9cd-67f89406c5e3', N'55fc6d0e-50b3-4876-bf93-ee3937daeb62', N'b1637b7e-095f-436f-856f-3d9d2bfc69e2', 6, 0, CAST(N'2024-12-20T11:19:32.6631509' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'780278e6-8649-441d-b44b-ae9c9f9b567f', N'44fd7eff-2866-48b2-a9cd-67f89406c5e3', N'55fc6d0e-50b3-4876-bf93-ee3937daeb62', N'387f589d-a00c-4ae8-9cc2-437da0611bc5', 0, 0, CAST(N'2024-12-20T11:19:32.6370121' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'0ee83583-2ad2-482a-b680-af28fe28b320', N'44fd7eff-2866-48b2-a9cd-67f89406c5e3', N'70be578e-af27-4056-a6ad-55990f86b3e7', N'caedb606-c0e1-40d0-bbee-c589964d8d9b', 6, 0, CAST(N'2024-12-20T11:20:22.5845921' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'27b97080-4618-4be8-af3f-afc2ba24fd21', N'3e805b41-1adc-426c-93a4-cfb6b7be3f9a', N'cdb5713c-fcb9-4105-8140-033fc2ac032e', N'feed9501-5246-4a26-81a4-e1b2fb6b86ce', 15, 0, CAST(N'2024-12-20T11:22:53.1382488' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'a73f3f15-8783-4729-af40-affbfec1324e', N'3e805b41-1adc-426c-93a4-cfb6b7be3f9a', N'cdb5713c-fcb9-4105-8140-033fc2ac032e', N'da8bbd01-aecc-4388-8a94-35851f61bcfc', 5, 0, CAST(N'2024-12-20T11:22:53.1535980' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'534da083-4288-4157-89b3-b062d293781c', N'44fd7eff-2866-48b2-a9cd-67f89406c5e3', N'70be578e-af27-4056-a6ad-55990f86b3e7', N'80e580b8-1959-4350-afaf-6a0d6c525d7a', 4, 0, CAST(N'2024-12-20T11:20:10.7972792' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'2e6d43b6-5325-4cd6-8bd0-b06d19706b65', N'44fd7eff-2866-48b2-a9cd-67f89406c5e3', N'55fc6d0e-50b3-4876-bf93-ee3937daeb62', N'cc62cdda-7a37-4be4-a106-d7443465f1db', 0, 0, CAST(N'2024-12-20T11:19:32.5766572' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'6366bb44-2d0e-4767-a3f7-b17c2c61e10e', N'44fd7eff-2866-48b2-a9cd-67f89406c5e3', N'70be578e-af27-4056-a6ad-55990f86b3e7', N'f789fd82-193d-41c8-8b45-96c64470627c', 4, 0, CAST(N'2024-12-20T11:20:30.5705740' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'40c75ef3-a8c9-4cd5-affb-b17d9960356b', N'44fd7eff-2866-48b2-a9cd-67f89406c5e3', N'70be578e-af27-4056-a6ad-55990f86b3e7', N'fcf403b4-2bb1-4658-8ff8-d212a73afd76', 0, 0, CAST(N'2024-12-20T11:20:39.7323820' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'7ddfe4f6-1398-41c9-b75c-b3bda2a5fb42', N'44fd7eff-2866-48b2-a9cd-67f89406c5e3', N'70be578e-af27-4056-a6ad-55990f86b3e7', N'54e1a9e0-af30-4119-94bc-7809205918be', 3, 0, CAST(N'2024-12-20T11:20:10.8149869' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'08cdb4e3-0a53-4273-9845-b48a5462768f', N'44fd7eff-2866-48b2-a9cd-67f89406c5e3', N'70be578e-af27-4056-a6ad-55990f86b3e7', N'530a6d7f-3f97-467a-a43c-54f5b1541913', 0, 0, CAST(N'2024-12-20T11:20:39.6962651' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'7e92e401-de63-466e-8ad9-bb98ef4a2164', N'44fd7eff-2866-48b2-a9cd-67f89406c5e3', N'55fc6d0e-50b3-4876-bf93-ee3937daeb62', N'0804969e-8111-4ff6-a05a-7d9d472c53cb', 4, 0, CAST(N'2024-12-20T11:19:32.5297720' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'43c25b89-937f-4c54-929e-bddc465a97ad', N'44fd7eff-2866-48b2-a9cd-67f89406c5e3', N'55fc6d0e-50b3-4876-bf93-ee3937daeb62', N'da57566f-5bca-4a13-a345-e60e85b74996', 0, 0, CAST(N'2024-12-20T11:19:32.6055851' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'a2c4817d-41a2-4205-92a7-bf3f904ce216', N'44fd7eff-2866-48b2-a9cd-67f89406c5e3', N'70be578e-af27-4056-a6ad-55990f86b3e7', N'5e537c59-6a66-4557-ad2b-d14405158805', 0, 0, CAST(N'2024-12-20T11:20:39.7259711' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'db77ff33-1bf5-48bc-91a4-c0c5a5fcdf1b', N'44fd7eff-2866-48b2-a9cd-67f89406c5e3', N'70be578e-af27-4056-a6ad-55990f86b3e7', N'79dbf9da-cb85-438a-8f88-579a120c6c4a', 0, 0, CAST(N'2024-12-20T11:20:22.5495387' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'b49902ee-17a0-4547-b3c2-c2de723a53ff', N'44fd7eff-2866-48b2-a9cd-67f89406c5e3', N'70be578e-af27-4056-a6ad-55990f86b3e7', N'c1b0cb28-4e74-45e9-a6e3-19658ab54cb8', 0, 0, CAST(N'2024-12-20T11:20:30.6163522' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'c182f8b9-d7f8-4c3b-ae6a-c3cd12711a2a', N'3e805b41-1adc-426c-93a4-cfb6b7be3f9a', N'cdb5713c-fcb9-4105-8140-033fc2ac032e', N'3e1dff5a-5a65-49c0-aa88-5bff0cf56f3d', 15, 0, CAST(N'2024-12-20T11:22:59.5932281' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'7769a316-7146-457c-ac99-c408bad013cb', N'44fd7eff-2866-48b2-a9cd-67f89406c5e3', N'70be578e-af27-4056-a6ad-55990f86b3e7', N'bb7b936d-2b4e-4444-9a85-ff735ddb5af0', 0, 0, CAST(N'2024-12-20T11:20:30.6341602' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'da3398a6-641e-40dc-a5fc-c47fedad0c05', N'44fd7eff-2866-48b2-a9cd-67f89406c5e3', N'70be578e-af27-4056-a6ad-55990f86b3e7', N'14644db8-1f51-4baf-b6a2-9e29ef567fda', 3, 0, CAST(N'2024-12-20T11:20:10.8399392' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'0e7855db-4cdb-4f4b-8f21-c4d431243f40', N'44fd7eff-2866-48b2-a9cd-67f89406c5e3', N'55fc6d0e-50b3-4876-bf93-ee3937daeb62', N'54ce584b-3479-4f90-a081-71b4cc17e37c', 0, 0, CAST(N'2024-12-20T11:19:39.5836502' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'b91d808d-f057-4003-8c60-c56b040d04c2', N'44fd7eff-2866-48b2-a9cd-67f89406c5e3', N'55fc6d0e-50b3-4876-bf93-ee3937daeb62', N'8c0a5b20-0ea9-476b-b5a7-54d99fa3b879', 4, 0, CAST(N'2024-12-20T11:19:39.4656574' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'5693cf78-2d40-41c0-a8c0-c695bed39728', N'44fd7eff-2866-48b2-a9cd-67f89406c5e3', N'70be578e-af27-4056-a6ad-55990f86b3e7', N'abea6415-0397-4e76-9cda-622e0614152c', 0, 0, CAST(N'2024-12-20T11:20:39.7143064' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'ab4b4ffa-19d8-4acb-9ab3-caaa26cf0b1a', N'44fd7eff-2866-48b2-a9cd-67f89406c5e3', N'70be578e-af27-4056-a6ad-55990f86b3e7', N'd260be67-845c-4307-9ab0-0a705dba8954', 0, 0, CAST(N'2024-12-20T11:20:30.6217562' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'a68cd1c4-509e-4c25-ad32-cde12cd8414d', N'44fd7eff-2866-48b2-a9cd-67f89406c5e3', N'70be578e-af27-4056-a6ad-55990f86b3e7', N'155cb0b8-5e90-45a7-b9b7-d9941bcbb24f', 4, 0, CAST(N'2024-12-20T11:20:22.4689728' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'610118df-8355-4574-bb3b-ce84efd97345', N'44fd7eff-2866-48b2-a9cd-67f89406c5e3', N'55fc6d0e-50b3-4876-bf93-ee3937daeb62', N'14644db8-1f51-4baf-b6a2-9e29ef567fda', 3, 0, CAST(N'2024-12-20T11:19:22.3765228' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'efab84d6-681f-4d66-9839-cf740cfd7f69', N'44fd7eff-2866-48b2-a9cd-67f89406c5e3', N'70be578e-af27-4056-a6ad-55990f86b3e7', N'ab95bef1-69b4-4ba3-9827-9513b61a47c7', 0, 0, CAST(N'2024-12-20T11:20:39.7679900' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'1f0f6b93-3fd9-48dc-9e9d-cfc2623789d9', N'44fd7eff-2866-48b2-a9cd-67f89406c5e3', N'70be578e-af27-4056-a6ad-55990f86b3e7', N'467d8679-adb0-43eb-9086-435989134bc3', 6, 0, CAST(N'2024-12-20T11:20:22.5899455' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'a42a0523-8240-4d0d-9539-d13c766c369f', N'44fd7eff-2866-48b2-a9cd-67f89406c5e3', N'55fc6d0e-50b3-4876-bf93-ee3937daeb62', N'5f3e2e3b-4294-4dae-9afa-cdc9d7b6b699', 0, 0, CAST(N'2024-12-20T11:19:39.5463280' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'34d0c4e0-47f4-47f9-acd7-d2010d812a1b', N'44fd7eff-2866-48b2-a9cd-67f89406c5e3', N'55fc6d0e-50b3-4876-bf93-ee3937daeb62', N'7ef5e6e1-fa0d-4093-88ef-c882bc0a0d59', 0, 0, CAST(N'2024-12-20T11:19:39.5710475' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'20fb8ca3-afcc-4ac7-82cc-d3a019f0611d', N'44fd7eff-2866-48b2-a9cd-67f89406c5e3', N'55fc6d0e-50b3-4876-bf93-ee3937daeb62', N'6c01ad1d-30ae-4305-a378-5237ef7fccc4', 4, 0, CAST(N'2024-12-20T11:19:39.4824378' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'1df7441c-f3aa-4177-be07-d61015aa2e63', N'44fd7eff-2866-48b2-a9cd-67f89406c5e3', N'55fc6d0e-50b3-4876-bf93-ee3937daeb62', N'938db4b1-6446-4a51-8c18-259199249139', 6, 0, CAST(N'2024-12-20T11:19:22.4319195' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'15a76604-9fde-4a75-aca3-d6a098e1456f', N'44fd7eff-2866-48b2-a9cd-67f89406c5e3', N'55fc6d0e-50b3-4876-bf93-ee3937daeb62', N'4d91ef16-b3d2-4b61-876a-d65ef857fb43', 6, 0, CAST(N'2024-12-20T11:19:32.6493475' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'aef45979-f316-48ab-85ee-da12d54dd533', N'44fd7eff-2866-48b2-a9cd-67f89406c5e3', N'70be578e-af27-4056-a6ad-55990f86b3e7', N'0e4d9792-5506-485e-99da-4a37df8ffa58', 0, 0, CAST(N'2024-12-20T11:20:10.8682332' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'68750107-c723-4ed4-ae4e-db2ee367f4ca', N'44fd7eff-2866-48b2-a9cd-67f89406c5e3', N'55fc6d0e-50b3-4876-bf93-ee3937daeb62', N'bb8d1001-b2f1-4738-9aef-df1000f15402', 3, 0, CAST(N'2024-12-20T11:19:22.3423742' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'fbfbc36f-17fe-4289-8de2-dd0e7cc4a5d4', N'44fd7eff-2866-48b2-a9cd-67f89406c5e3', N'55fc6d0e-50b3-4876-bf93-ee3937daeb62', N'd17ff7c3-70d4-492f-bde7-d3bbfdaf6c5e', 0, 0, CAST(N'2024-12-20T11:19:22.3965391' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'4f26fc68-c434-42e4-90d9-df3d5cdcfa74', N'44fd7eff-2866-48b2-a9cd-67f89406c5e3', N'55fc6d0e-50b3-4876-bf93-ee3937daeb62', N'5e537c59-6a66-4557-ad2b-d14405158805', 0, 0, CAST(N'2024-12-20T11:19:39.5170690' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'ad7da178-663b-4f2f-b9fd-dfd33ba419f6', N'44fd7eff-2866-48b2-a9cd-67f89406c5e3', N'70be578e-af27-4056-a6ad-55990f86b3e7', N'af6fb6a1-7b09-4a83-8f5d-d0a671132c80', 0, 0, CAST(N'2024-12-20T11:20:30.5923611' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'3ac15a9b-6ef0-4e23-846b-e020d0328317', N'44fd7eff-2866-48b2-a9cd-67f89406c5e3', N'55fc6d0e-50b3-4876-bf93-ee3937daeb62', N'a3bd9101-eafb-4d51-8205-73ae7898da92', 4, 0, CAST(N'2024-12-20T11:19:39.4709798' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'07e5cf6e-0029-4f24-b67a-e308331e3e59', N'44fd7eff-2866-48b2-a9cd-67f89406c5e3', N'55fc6d0e-50b3-4876-bf93-ee3937daeb62', N'bb7b936d-2b4e-4444-9a85-ff735ddb5af0', 0, 0, CAST(N'2024-12-20T11:19:32.5999135' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'd4b1b237-d07d-4919-a69f-e36ba01d48e3', N'44fd7eff-2866-48b2-a9cd-67f89406c5e3', N'55fc6d0e-50b3-4876-bf93-ee3937daeb62', N'7eb63617-b78b-4e7f-855d-a8c752cd8eaa', 6, 0, CAST(N'2024-12-20T11:19:32.6432784' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'a94a5884-7a38-488f-9718-e4cc8f3c05ac', N'44fd7eff-2866-48b2-a9cd-67f89406c5e3', N'70be578e-af27-4056-a6ad-55990f86b3e7', N'3a4b42be-1707-4a83-bb9f-ca0f38ee2db0', 4, 0, CAST(N'2024-12-20T11:20:22.4741090' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'030d53b0-f7a0-471b-a7bb-e773336a6493', N'3e805b41-1adc-426c-93a4-cfb6b7be3f9a', N'cdb5713c-fcb9-4105-8140-033fc2ac032e', N'88f949fe-e2d1-4195-b71e-57f8b0eedc82', 5, 0, CAST(N'2024-12-20T11:22:53.1748398' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'51598f62-160b-43ff-83d1-e9bbbf345208', N'44fd7eff-2866-48b2-a9cd-67f89406c5e3', N'55fc6d0e-50b3-4876-bf93-ee3937daeb62', N'f6cf99f1-bf66-4fc5-b17f-fff68593493c', 0, 0, CAST(N'2024-12-20T11:19:39.5277332' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'990c6682-3d5b-4714-86b2-ebb9790bbda5', N'44fd7eff-2866-48b2-a9cd-67f89406c5e3', N'70be578e-af27-4056-a6ad-55990f86b3e7', N'590de912-a0d7-421f-bf63-25623d50aa4f', 6, 0, CAST(N'2024-12-20T11:20:10.9095378' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'865b0230-43e0-43d4-8e95-ed34b05ac11b', N'44fd7eff-2866-48b2-a9cd-67f89406c5e3', N'70be578e-af27-4056-a6ad-55990f86b3e7', N'792df25a-f58f-4912-8956-a81cee3bc7e8', 3, 0, CAST(N'2024-12-20T11:20:22.5063681' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'356ff21e-1e6f-43e4-96af-ed9816174c6d', N'44fd7eff-2866-48b2-a9cd-67f89406c5e3', N'70be578e-af27-4056-a6ad-55990f86b3e7', N'7eb63617-b78b-4e7f-855d-a8c752cd8eaa', 6, 0, CAST(N'2024-12-20T11:20:30.6745992' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'94b10ca7-b66a-441c-a14d-ee435e4253ba', N'44fd7eff-2866-48b2-a9cd-67f89406c5e3', N'55fc6d0e-50b3-4876-bf93-ee3937daeb62', N'a381eed3-e755-4307-a27f-f30913118a7e', 0, 0, CAST(N'2024-12-20T11:19:22.4246034' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'2ddb6dcc-cd6b-42b4-a18c-ef3237e1b1d7', N'44fd7eff-2866-48b2-a9cd-67f89406c5e3', N'70be578e-af27-4056-a6ad-55990f86b3e7', N'8c0a5b20-0ea9-476b-b5a7-54d99fa3b879', 4, 0, CAST(N'2024-12-20T11:20:39.6669843' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'672e5a71-b789-469f-99f1-ef8b34e5a3a6', N'44fd7eff-2866-48b2-a9cd-67f89406c5e3', N'70be578e-af27-4056-a6ad-55990f86b3e7', N'ef90d1d5-9eae-48eb-a36d-4062d6dc5ce8', 4, 0, CAST(N'2024-12-20T11:20:10.7903027' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'f4d140bc-7c90-4236-827e-f08a6b4c3285', N'44fd7eff-2866-48b2-a9cd-67f89406c5e3', N'70be578e-af27-4056-a6ad-55990f86b3e7', N'159efa75-335f-4916-844f-bd25545545c6', 0, 0, CAST(N'2024-12-20T11:20:30.5875558' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'de69eec4-563e-4e57-b0ca-f3b90ac30ab0', N'44fd7eff-2866-48b2-a9cd-67f89406c5e3', N'55fc6d0e-50b3-4876-bf93-ee3937daeb62', N'27d3fa72-e4f4-4a11-98c5-f63a3b71e400', 6, 0, CAST(N'2024-12-20T11:19:22.4417751' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'fd5cfa58-bbe7-430c-a57c-f444d68b0bb0', N'44fd7eff-2866-48b2-a9cd-67f89406c5e3', N'70be578e-af27-4056-a6ad-55990f86b3e7', N'938db4b1-6446-4a51-8c18-259199249139', 6, 0, CAST(N'2024-12-20T11:20:10.9033821' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'0cc842f8-59b6-4247-8108-f5b079a4adf8', N'44fd7eff-2866-48b2-a9cd-67f89406c5e3', N'70be578e-af27-4056-a6ad-55990f86b3e7', N'4bb6227e-fcb5-4d71-9a88-c603b3e01934', 0, 0, CAST(N'2024-12-20T11:20:39.7746109' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'5e1062a5-3203-442d-90b4-f5d8feffe3a0', N'44fd7eff-2866-48b2-a9cd-67f89406c5e3', N'55fc6d0e-50b3-4876-bf93-ee3937daeb62', N'3b4f11a5-900f-49de-a416-2bed29a293a9', 3, 0, CAST(N'2024-12-20T11:19:22.3494739' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'74b6ea72-5f0a-4ce9-a31a-f5db730fa8f2', N'44fd7eff-2866-48b2-a9cd-67f89406c5e3', N'55fc6d0e-50b3-4876-bf93-ee3937daeb62', N'd260be67-845c-4307-9ab0-0a705dba8954', 0, 0, CAST(N'2024-12-20T11:19:32.5883050' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'41c857d1-b270-4585-bdbb-f6cbd0b50aeb', N'44fd7eff-2866-48b2-a9cd-67f89406c5e3', N'55fc6d0e-50b3-4876-bf93-ee3937daeb62', N'f789fd82-193d-41c8-8b45-96c64470627c', 4, 0, CAST(N'2024-12-20T11:19:32.5343867' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'f3577a9e-13c2-4cda-b6b2-f868e1d88fd7', N'44fd7eff-2866-48b2-a9cd-67f89406c5e3', N'55fc6d0e-50b3-4876-bf93-ee3937daeb62', N'7de0a811-6b3d-4de9-b65a-0170294a75ae', 0, 0, CAST(N'2024-12-20T11:19:22.4076137' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'297e39c6-2e3a-4657-90e9-f89f8bbb2147', N'44fd7eff-2866-48b2-a9cd-67f89406c5e3', N'70be578e-af27-4056-a6ad-55990f86b3e7', N'd416e3a1-4960-496c-8afc-42bf97ffb53e', 0, 0, CAST(N'2024-12-20T11:20:10.8894996' AS DateTime2), 2)
GO
INSERT [dbo].[EvaluationExplaint] ([Id], [EvaluationId], [UserId], [SupervisorId], [CategoryCriteriaId], [Note], [FileAttachments], [IsDeleted], [UpdatedAt]) VALUES (N'7c5dfa02-6695-4386-8cee-5894ddb1798a', N'3e805b41-1adc-426c-93a4-cfb6b7be3f9a', N'd3f15e0a-7ac8-4f28-b93e-f8c11eee7fcf', NULL, N'c733b044-2ace-43ea-be34-251b9af672cf', N'test - pht', NULL, 0, CAST(N'2024-12-20T11:21:34.9325556' AS DateTime2))
GO
INSERT [dbo].[EvaluationSample] ([Id], [EvaluationSampleName], [IsDeleted], [UpdatedAt]) VALUES (N'9a245d3a-088b-4831-b3bf-77dc93c5ea1d', N'Mẫu 2 - Phiếu đánh giá dành cho nhóm đối tượng chung', 0, CAST(N'2024-11-23T13:09:47.0232562' AS DateTime2))
INSERT [dbo].[EvaluationSample] ([Id], [EvaluationSampleName], [IsDeleted], [UpdatedAt]) VALUES (N'b621540f-6142-42f3-8ec1-8f3cd8167a24', N'Mẫu 1 - Phiếu đánh giá dành cho HT PHT', 0, CAST(N'2024-11-23T13:09:09.4585816' AS DateTime2))
GO
INSERT [dbo].[EvaluationUser] ([Id], [EvaluationId], [UserId], [Type], [Sort], [IsDeleted], [UpdatedAt], [IsManager]) VALUES (N'9cf72f45-1f24-4b0f-aff9-074db238d82b', N'533e2aa7-6661-43fb-9be2-d23340a9cc52', N'0630cc13-3e54-4ba7-bdfe-f1ff42051257', 2, 1, 0, CAST(N'2024-12-03T22:12:03.5039181' AS DateTime2), 0)
INSERT [dbo].[EvaluationUser] ([Id], [EvaluationId], [UserId], [Type], [Sort], [IsDeleted], [UpdatedAt], [IsManager]) VALUES (N'147faf45-3401-4fc6-9118-0ece38b67c60', N'3e805b41-1adc-426c-93a4-cfb6b7be3f9a', N'70be578e-af27-4056-a6ad-55990f86b3e7', 1, 0, 0, CAST(N'2024-12-12T22:55:54.2018098' AS DateTime2), NULL)
INSERT [dbo].[EvaluationUser] ([Id], [EvaluationId], [UserId], [Type], [Sort], [IsDeleted], [UpdatedAt], [IsManager]) VALUES (N'eb7db4d9-fc0c-4f07-9053-42807ddb9510', N'44fd7eff-2866-48b2-a9cd-67f89406c5e3', N'dd3c7e8b-3dc7-45d2-a2bd-282de7d5e2de', 1, 0, 0, CAST(N'2024-12-03T22:10:50.4739321' AS DateTime2), NULL)
INSERT [dbo].[EvaluationUser] ([Id], [EvaluationId], [UserId], [Type], [Sort], [IsDeleted], [UpdatedAt], [IsManager]) VALUES (N'bd9c96ba-71a4-4220-a493-6a2ea8893aa7', N'3e805b41-1adc-426c-93a4-cfb6b7be3f9a', N'cdb5713c-fcb9-4105-8140-033fc2ac032e', 2, 1, 0, CAST(N'2024-12-12T22:56:06.1162595' AS DateTime2), 1)
INSERT [dbo].[EvaluationUser] ([Id], [EvaluationId], [UserId], [Type], [Sort], [IsDeleted], [UpdatedAt], [IsManager]) VALUES (N'0d8f9e5c-cc82-4cce-a9f6-6f15f0c57460', N'd6309271-88d3-4c70-8f3f-a89634cc81d9', N'c778e7e0-b970-4533-96a0-5091f4c57114', 1, 0, 0, CAST(N'2024-12-12T22:56:21.1146257' AS DateTime2), NULL)
INSERT [dbo].[EvaluationUser] ([Id], [EvaluationId], [UserId], [Type], [Sort], [IsDeleted], [UpdatedAt], [IsManager]) VALUES (N'f394e847-2b41-4f10-8055-804f463d2a7d', N'44fd7eff-2866-48b2-a9cd-67f89406c5e3', N'70be578e-af27-4056-a6ad-55990f86b3e7', 2, 2, 0, CAST(N'2024-12-03T22:11:17.2152576' AS DateTime2), 1)
INSERT [dbo].[EvaluationUser] ([Id], [EvaluationId], [UserId], [Type], [Sort], [IsDeleted], [UpdatedAt], [IsManager]) VALUES (N'e37c15ce-fad8-4aae-afc2-9c44464aa340', N'44fd7eff-2866-48b2-a9cd-67f89406c5e3', N'32f207a2-02ba-4b83-8c71-03af11657c63', 1, 0, 0, CAST(N'2024-12-03T22:10:50.4586261' AS DateTime2), NULL)
INSERT [dbo].[EvaluationUser] ([Id], [EvaluationId], [UserId], [Type], [Sort], [IsDeleted], [UpdatedAt], [IsManager]) VALUES (N'82367960-db97-4918-bd80-9cafee537d9e', N'533e2aa7-6661-43fb-9be2-d23340a9cc52', N'0630cc13-3e54-4ba7-bdfe-f1ff42051257', 1, 0, 0, CAST(N'2024-12-03T22:11:45.3489511' AS DateTime2), NULL)
INSERT [dbo].[EvaluationUser] ([Id], [EvaluationId], [UserId], [Type], [Sort], [IsDeleted], [UpdatedAt], [IsManager]) VALUES (N'e7ff1e69-bb25-4781-93eb-bd7c4b296aef', N'd6309271-88d3-4c70-8f3f-a89634cc81d9', N'cdb5713c-fcb9-4105-8140-033fc2ac032e', 2, 1, 0, CAST(N'2024-12-12T22:56:45.1955898' AS DateTime2), 1)
INSERT [dbo].[EvaluationUser] ([Id], [EvaluationId], [UserId], [Type], [Sort], [IsDeleted], [UpdatedAt], [IsManager]) VALUES (N'ff0db685-d3c5-49e7-87f8-c31c315b2b6d', N'd6309271-88d3-4c70-8f3f-a89634cc81d9', N'110aa824-4b97-4fac-972c-b66f2c478dca', 1, 0, 0, CAST(N'2024-12-12T22:56:21.1192195' AS DateTime2), NULL)
INSERT [dbo].[EvaluationUser] ([Id], [EvaluationId], [UserId], [Type], [Sort], [IsDeleted], [UpdatedAt], [IsManager]) VALUES (N'209acc12-ca4d-4e1a-a199-d8881c84d3c5', N'44fd7eff-2866-48b2-a9cd-67f89406c5e3', N'2d1c4b21-92b0-4105-9151-0980a4c924ad', 1, 0, 0, CAST(N'2024-12-03T22:10:50.4770130' AS DateTime2), NULL)
INSERT [dbo].[EvaluationUser] ([Id], [EvaluationId], [UserId], [Type], [Sort], [IsDeleted], [UpdatedAt], [IsManager]) VALUES (N'5aad4f1c-e31b-45be-b07c-e1c4372c434f', N'3e805b41-1adc-426c-93a4-cfb6b7be3f9a', N'd3f15e0a-7ac8-4f28-b93e-f8c11eee7fcf', 1, 0, 0, CAST(N'2024-12-12T22:55:54.1888088' AS DateTime2), NULL)
INSERT [dbo].[EvaluationUser] ([Id], [EvaluationId], [UserId], [Type], [Sort], [IsDeleted], [UpdatedAt], [IsManager]) VALUES (N'560becaf-86db-40c7-a03b-eb27a61927a6', N'533e2aa7-6661-43fb-9be2-d23340a9cc52', N'ce648ca9-fee9-40e7-8aff-03869bb6b010', 1, 0, 0, CAST(N'2024-12-03T22:11:45.3459708' AS DateTime2), NULL)
INSERT [dbo].[EvaluationUser] ([Id], [EvaluationId], [UserId], [Type], [Sort], [IsDeleted], [UpdatedAt], [IsManager]) VALUES (N'1cf8b0f1-670a-493c-a394-f99e15e85fc3', N'533e2aa7-6661-43fb-9be2-d23340a9cc52', N'4b986f5b-4e1d-4016-b771-14dab0c7af11', 1, 0, 0, CAST(N'2024-12-03T22:11:45.3516507' AS DateTime2), NULL)
INSERT [dbo].[EvaluationUser] ([Id], [EvaluationId], [UserId], [Type], [Sort], [IsDeleted], [UpdatedAt], [IsManager]) VALUES (N'ea4342ed-0725-42a9-88bc-fa93410c035d', N'44fd7eff-2866-48b2-a9cd-67f89406c5e3', N'55fc6d0e-50b3-4876-bf93-ee3937daeb62', 1, 0, 0, CAST(N'2024-12-03T22:17:42.6506196' AS DateTime2), NULL)
INSERT [dbo].[EvaluationUser] ([Id], [EvaluationId], [UserId], [Type], [Sort], [IsDeleted], [UpdatedAt], [IsManager]) VALUES (N'd0ba27b4-1e88-4f06-a21b-fb4c6c2a159f', N'44fd7eff-2866-48b2-a9cd-67f89406c5e3', N'55fc6d0e-50b3-4876-bf93-ee3937daeb62', 2, 1, 0, CAST(N'2024-12-03T22:11:02.6659728' AS DateTime2), 0)
INSERT [dbo].[EvaluationUser] ([Id], [EvaluationId], [UserId], [Type], [Sort], [IsDeleted], [UpdatedAt], [IsManager]) VALUES (N'07b13051-fac2-489e-aa5a-ff30f397f367', N'533e2aa7-6661-43fb-9be2-d23340a9cc52', N'c778e7e0-b970-4533-96a0-5091f4c57114', 2, 2, 0, CAST(N'2024-12-03T22:12:08.0471261' AS DateTime2), 1)
GO
INSERT [dbo].[MenuItems] ([Id], [Key], [Name], [ParentId], [Route], [Icon], [Sort]) VALUES (N'be782bc6-5b5f-4edc-a2c4-0dc8ad2af70e', N'evaluation-statistics', N'Thống kê đánh giá', N'fa70e2f4-8d7f-479d-a12a-f91508b8c33e', N'/statistics/evaluation-statistics', N'IconBarChartFill', 1)
INSERT [dbo].[MenuItems] ([Id], [Key], [Name], [ParentId], [Route], [Icon], [Sort]) VALUES (N'b67dc630-6c6f-4dd1-88a1-1380ddf043f6', N'units', N'Quản lý đơn vị/phòng ban', N'd7d627dc-8642-4131-ac61-f629a0f69929', N'/organization-management/units', N'IconDeploymentUnit', 4)
INSERT [dbo].[MenuItems] ([Id], [Key], [Name], [ParentId], [Route], [Icon], [Sort]) VALUES (N'8d34733f-09dd-4c18-8170-16e03456d202', N'evaluation-ratings', N'Danh mục thang điểm đánh giá', N'97e2f2a0-00c8-492e-8503-adbbcb791b1f', N'/categories/evaluation-ratings', N'IconScoreboardOutline', 1)
INSERT [dbo].[MenuItems] ([Id], [Key], [Name], [ParentId], [Route], [Icon], [Sort]) VALUES (N'b519f203-6a8c-48c5-800e-2b673aadec05', N'evaluations-sample', N'Quản lý mẫu phiếu đánh giá', NULL, N'/evaluations-sample', N'IconFileDocumentMultiple', 2)
INSERT [dbo].[MenuItems] ([Id], [Key], [Name], [ParentId], [Route], [Icon], [Sort]) VALUES (N'7df44a05-ecf1-4adf-91ee-328dcbd5dd99', N'consolidation-and-transfer', N'Tổng hợp và chuyển', N'fa70e2f4-8d7f-479d-a12a-f91508b8c33e', N'/statistics/consolidation-and-transfer', N'IconBxTransfer', 2)
INSERT [dbo].[MenuItems] ([Id], [Key], [Name], [ParentId], [Route], [Icon], [Sort]) VALUES (N'f0a0148d-7e05-4873-b5bd-37e61c626887', N'evaluation-forms', N'Phiếu đánh giá', NULL, N'/evaluation-forms', NULL, 8)
INSERT [dbo].[MenuItems] ([Id], [Key], [Name], [ParentId], [Route], [Icon], [Sort]) VALUES (N'93a76a6e-3f4c-4d02-9b67-3c938a873be1', N'users', N'Quản lý người dùng', N'd7d627dc-8642-4131-ac61-f629a0f69929', N'/organization-management/users', N'IconUser', 2)
INSERT [dbo].[MenuItems] ([Id], [Key], [Name], [ParentId], [Route], [Icon], [Sort]) VALUES (N'4c47569d-bbf0-400a-86eb-3dafaf7cd394', N'statistics-user', N'Tổng hợp xếp loại của người dùng', N'fa70e2f4-8d7f-479d-a12a-f91508b8c33e', N'/statistics/statistics-user', N'IconThumbsUpDown', 4)
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
INSERT [dbo].[MenuItems] ([Id], [Key], [Name], [ParentId], [Route], [Icon], [Sort]) VALUES (N'7600a347-28e5-4e1a-823e-ea11aca29e38', N'statistics-unit', N'Tổng hợp xếp loại của đơn vị', N'fa70e2f4-8d7f-479d-a12a-f91508b8c33e', N'/statistics/statistics-unit', N'IconThumbsUpDown', 3)
INSERT [dbo].[MenuItems] ([Id], [Key], [Name], [ParentId], [Route], [Icon], [Sort]) VALUES (N'f9518f77-2b01-4131-b229-f1f675f5ceca', N'evaluations', N'Quản lý phiếu đánh giá', NULL, N'/evaluations', N'IconDocument_justified', 3)
INSERT [dbo].[MenuItems] ([Id], [Key], [Name], [ParentId], [Route], [Icon], [Sort]) VALUES (N'd7d627dc-8642-4131-ac61-f629a0f69929', N'organization-management', N'Quản lý đơn vị và nhân sự', NULL, NULL, NULL, 5)
INSERT [dbo].[MenuItems] ([Id], [Key], [Name], [ParentId], [Route], [Icon], [Sort]) VALUES (N'fa70e2f4-8d7f-479d-a12a-f91508b8c33e', N'statistics', N'Thống kê', NULL, NULL, NULL, 7)
INSERT [dbo].[MenuItems] ([Id], [Key], [Name], [ParentId], [Route], [Icon], [Sort]) VALUES (N'6f9046d3-eb0e-4da1-97c1-f9509c240fd9', N'evaluation-pros-cons', N'Danh mục ưu và nhược điểm đánh giá', N'97e2f2a0-00c8-492e-8503-adbbcb791b1f', N'/categories/evaluation-pros-cons', N'IconThumbsUpDown', 4)
GO
INSERT [dbo].[RefreshToken] ([Id], [UserId], [Token], [JwtId], [IsUsed], [IsRevoked], [IssuedAt], [ExpiredAt]) VALUES (N'69343dc2-81c7-4d43-8319-483ed272e633', N'7ba6c795-d331-4f3a-8c5a-0647d53d8298', N'BvEp/otDv7zasys2vMBej7sNO7LrcDPU4KLtNYRhDEg=', N'8b8cdcc3-7057-4655-9fdb-41d6121f0cef', 0, 0, CAST(N'2024-12-20T11:11:11.7979999' AS DateTime2), CAST(N'2024-12-27T11:11:11.7979999' AS DateTime2))
INSERT [dbo].[RefreshToken] ([Id], [UserId], [Token], [JwtId], [IsUsed], [IsRevoked], [IssuedAt], [ExpiredAt]) VALUES (N'6f0bd780-f34f-46d9-b8d4-4ea47f234b8c', N'a6ba15f2-d668-4059-a1c4-5b0deda85c47', N'Rz1eA7EkLTB7WObNStocOLi3h8/W8HRki+ziqu4hNUg=', N'64d3de60-1439-4159-ad37-a21d675ceba7', 0, 0, CAST(N'2024-12-20T11:07:40.1396366' AS DateTime2), CAST(N'2024-12-27T11:07:40.1396367' AS DateTime2))
INSERT [dbo].[RefreshToken] ([Id], [UserId], [Token], [JwtId], [IsUsed], [IsRevoked], [IssuedAt], [ExpiredAt]) VALUES (N'3ca94395-90ca-494a-8996-5004bf10e520', N'2d1c4b21-92b0-4105-9151-0980a4c924ad', N'7ZUjkLxnMBAkGVFEXq6T/iMA/v6noE8xKVKhuoa0Ro0=', N'c3c3d610-d3fb-46fc-bc25-bed309ba8db0', 0, 0, CAST(N'2024-12-20T11:18:06.8958224' AS DateTime2), CAST(N'2024-12-27T11:18:06.8958224' AS DateTime2))
INSERT [dbo].[RefreshToken] ([Id], [UserId], [Token], [JwtId], [IsUsed], [IsRevoked], [IssuedAt], [ExpiredAt]) VALUES (N'a929f83a-cadd-4641-86f3-56788f3903c9', N'70be578e-af27-4056-a6ad-55990f86b3e7', N'6ZNQxEB1bsYNqMrSKgf6lXs3UthG5V14SSK0+W0sNbQ=', N'1d5df4fb-4d0b-4a47-812d-c905cf754265', 0, 0, CAST(N'2024-12-20T11:23:19.5386886' AS DateTime2), CAST(N'2024-12-27T11:23:19.5386887' AS DateTime2))
INSERT [dbo].[RefreshToken] ([Id], [UserId], [Token], [JwtId], [IsUsed], [IsRevoked], [IssuedAt], [ExpiredAt]) VALUES (N'01d17f79-d85b-482b-9bc3-6bc5e7549fad', N'c778e7e0-b970-4533-96a0-5091f4c57114', N'242iGRy+S5Qph8TJNvvPoELwxW8B5sIdddUyJSFO/5s=', N'1371d130-1366-410f-bdf0-a9a1ed38f50d', 0, 0, CAST(N'2024-12-18T15:20:03.6058739' AS DateTime2), CAST(N'2024-12-25T15:20:03.6058741' AS DateTime2))
INSERT [dbo].[RefreshToken] ([Id], [UserId], [Token], [JwtId], [IsUsed], [IsRevoked], [IssuedAt], [ExpiredAt]) VALUES (N'72101781-6e35-4d05-81b7-6dbb4c49c438', N'110aa824-4b97-4fac-972c-b66f2c478dca', N'Y/V4sapTdFzPcazT2rwK7Gpme86Fezh9KpdwdFvfXno=', N'56170219-5860-4427-9f58-ead8ac0fa3e5', 0, 0, CAST(N'2024-12-18T14:24:13.0108198' AS DateTime2), CAST(N'2024-12-25T14:24:13.0108203' AS DateTime2))
INSERT [dbo].[RefreshToken] ([Id], [UserId], [Token], [JwtId], [IsUsed], [IsRevoked], [IssuedAt], [ExpiredAt]) VALUES (N'79ab1ec0-c131-4adb-9cd4-72f48d8decae', N'0630cc13-3e54-4ba7-bdfe-f1ff42051257', N'eyWKoiRQeRe8fU0VcoTsQL4Rns5AyzhHIJLQvJd7xjk=', N'24ca0ffc-73e5-45f3-b34e-fc94f300cb48', 0, 0, CAST(N'2024-12-12T23:00:01.0346251' AS DateTime2), CAST(N'2024-12-19T23:00:01.0346253' AS DateTime2))
INSERT [dbo].[RefreshToken] ([Id], [UserId], [Token], [JwtId], [IsUsed], [IsRevoked], [IssuedAt], [ExpiredAt]) VALUES (N'ac25e5a9-38e2-460f-9c50-82cdabf1d3fd', N'55fc6d0e-50b3-4876-bf93-ee3937daeb62', N'wALHpSD8QW5YC9qgslK3LQ9uqgShezF8TnGWVfOxBvA=', N'eced0eb1-1e78-4296-82c1-22e77d617bc1', 0, 0, CAST(N'2024-12-20T11:18:35.5800226' AS DateTime2), CAST(N'2024-12-27T11:18:35.5800227' AS DateTime2))
INSERT [dbo].[RefreshToken] ([Id], [UserId], [Token], [JwtId], [IsUsed], [IsRevoked], [IssuedAt], [ExpiredAt]) VALUES (N'8601141c-cd63-4b73-93e3-8e330759b113', N'32f207a2-02ba-4b83-8c71-03af11657c63', N'b3DMNRuOPKKUYrC9oqXinLJWkYfEFM+Uo7lLahGlUVw=', N'e3e7ece2-b798-420a-b4f3-3a10303cee51', 0, 0, CAST(N'2024-12-20T11:15:10.5094320' AS DateTime2), CAST(N'2024-12-27T11:15:10.5094322' AS DateTime2))
INSERT [dbo].[RefreshToken] ([Id], [UserId], [Token], [JwtId], [IsUsed], [IsRevoked], [IssuedAt], [ExpiredAt]) VALUES (N'6b1eb552-592c-4168-968a-98ca59e2720a', N'd3f15e0a-7ac8-4f28-b93e-f8c11eee7fcf', N'/IjfywbRqbSX7G5J5kIMsi511vskY4KbPj036kmBPVE=', N'71035c8d-6fd2-4963-b817-d2a4410ba516', 0, 0, CAST(N'2024-12-20T11:21:16.6841621' AS DateTime2), CAST(N'2024-12-27T11:21:16.6841621' AS DateTime2))
INSERT [dbo].[RefreshToken] ([Id], [UserId], [Token], [JwtId], [IsUsed], [IsRevoked], [IssuedAt], [ExpiredAt]) VALUES (N'dfd52f48-0998-41f2-8dcf-9b787dab1ac7', N'ce648ca9-fee9-40e7-8aff-03869bb6b010', N'WdfRLJRd0EuJIKvw5xoUYkzfd3ebaART4+Gv6hbmafo=', N'8602d0a9-889f-472e-9605-0afa39081d1f', 0, 0, CAST(N'2024-12-04T13:21:45.6397610' AS DateTime2), CAST(N'2024-12-11T13:21:45.6397612' AS DateTime2))
INSERT [dbo].[RefreshToken] ([Id], [UserId], [Token], [JwtId], [IsUsed], [IsRevoked], [IssuedAt], [ExpiredAt]) VALUES (N'0fa9ea77-9f48-48e6-b1d9-9f57b188b9bd', N'cdb5713c-fcb9-4105-8140-033fc2ac032e', N'UQGrV8jDWJNa+iGF5YGSizPY87Jk43ow9GoZKGg61rA=', N'4359e2cf-8f10-4f23-86c9-7576376d658a', 0, 0, CAST(N'2024-12-20T11:25:47.8540449' AS DateTime2), CAST(N'2024-12-27T11:25:47.8540450' AS DateTime2))
INSERT [dbo].[RefreshToken] ([Id], [UserId], [Token], [JwtId], [IsUsed], [IsRevoked], [IssuedAt], [ExpiredAt]) VALUES (N'1ea4f5f1-ffa8-4239-a486-a924e7eb8c9a', N'4b986f5b-4e1d-4016-b771-14dab0c7af11', N's4eeHr1p7oODQ304APF4f8VTfI/+0Er0qFKfqLbpsSU=', N'b524b1a6-2cb0-40ba-a451-125657e139a9', 0, 0, CAST(N'2024-12-12T22:58:45.7183406' AS DateTime2), CAST(N'2024-12-19T22:58:45.7183407' AS DateTime2))
INSERT [dbo].[RefreshToken] ([Id], [UserId], [Token], [JwtId], [IsUsed], [IsRevoked], [IssuedAt], [ExpiredAt]) VALUES (N'7251a6eb-275d-4d98-9c1b-e7534598402f', N'dd3c7e8b-3dc7-45d2-a2bd-282de7d5e2de', N'ZiPVRoxyJFlYsaQj4L/06RO7tOSPj0CVrk6jE6aJI+E=', N'1ff108fb-db1c-42a8-b34c-e52dd451581c', 0, 0, CAST(N'2024-12-20T11:17:39.5421266' AS DateTime2), CAST(N'2024-12-27T11:17:39.5421266' AS DateTime2))
GO
INSERT [dbo].[RoleMenuItems] ([Id], [RoleId], [MenuItemId]) VALUES (N'7d0bae88-689a-4c68-b79b-01b84d9704b4', N'fa00a51d-a46e-4d10-926e-5ba8ba68d432', N'b67dc630-6c6f-4dd1-88a1-1380ddf043f6')
INSERT [dbo].[RoleMenuItems] ([Id], [RoleId], [MenuItemId]) VALUES (N'0ef23806-0172-497b-b06e-0728df9b4cff', N'fa00a51d-a46e-4d10-926e-5ba8ba68d432', N'f0a0148d-7e05-4873-b5bd-37e61c626887')
INSERT [dbo].[RoleMenuItems] ([Id], [RoleId], [MenuItemId]) VALUES (N'f8625947-26ea-4395-9bd5-087d4ca58ac1', N'fa00a51d-a46e-4d10-926e-5ba8ba68d432', N'f9518f77-2b01-4131-b229-f1f675f5ceca')
INSERT [dbo].[RoleMenuItems] ([Id], [RoleId], [MenuItemId]) VALUES (N'f0c4b155-e1f1-44fc-9cce-0b0373417c03', N'de170fda-aa4a-4e0b-8722-0522b950f745', N'32cc32e8-8e12-4b5f-9089-e2c52227155d')
INSERT [dbo].[RoleMenuItems] ([Id], [RoleId], [MenuItemId]) VALUES (N'6d2c3058-dcea-4a8b-a98f-0f5890597c09', N'fa00a51d-a46e-4d10-926e-5ba8ba68d432', N'd7d627dc-8642-4131-ac61-f629a0f69929')
INSERT [dbo].[RoleMenuItems] ([Id], [RoleId], [MenuItemId]) VALUES (N'1df5b40d-3641-49e2-b5d9-102ce661f27b', N'bc4ce45e-b29f-4f21-8c68-9e1cff35614e', N'd0a617ce-7a4a-4556-a2d0-82503dfef228')
INSERT [dbo].[RoleMenuItems] ([Id], [RoleId], [MenuItemId]) VALUES (N'a2d3c142-1792-48c1-82d1-16c3426c6a45', N'de170fda-aa4a-4e0b-8722-0522b950f745', N'be782bc6-5b5f-4edc-a2c4-0dc8ad2af70e')
INSERT [dbo].[RoleMenuItems] ([Id], [RoleId], [MenuItemId]) VALUES (N'5dbec410-99da-40ba-bf83-18f3544d543f', N'fa00a51d-a46e-4d10-926e-5ba8ba68d432', N'93a76a6e-3f4c-4d02-9b67-3c938a873be1')
INSERT [dbo].[RoleMenuItems] ([Id], [RoleId], [MenuItemId]) VALUES (N'afd49d0f-9701-4aed-81a6-21b797d22ab3', N'a6204804-82cf-4f94-a3e1-07cd10a8e579', N'3172d91d-37cf-46ec-9eb8-62fd2a01e691')
INSERT [dbo].[RoleMenuItems] ([Id], [RoleId], [MenuItemId]) VALUES (N'b932619d-1811-4e73-837d-225d90b54060', N'fa00a51d-a46e-4d10-926e-5ba8ba68d432', N'fa70e2f4-8d7f-479d-a12a-f91508b8c33e')
INSERT [dbo].[RoleMenuItems] ([Id], [RoleId], [MenuItemId]) VALUES (N'563b93a3-994d-4012-9e2c-228a048baa3c', N'a6204804-82cf-4f94-a3e1-07cd10a8e579', N'6f9046d3-eb0e-4da1-97c1-f9509c240fd9')
INSERT [dbo].[RoleMenuItems] ([Id], [RoleId], [MenuItemId]) VALUES (N'bd457be1-1f85-4a9f-bddf-245807b809d1', N'fa00a51d-a46e-4d10-926e-5ba8ba68d432', N'dd8e29a6-c51e-4e9a-9b89-6c255c7f1e07')
INSERT [dbo].[RoleMenuItems] ([Id], [RoleId], [MenuItemId]) VALUES (N'8807a3e3-05d7-49f7-ae89-2907af359be3', N'fa00a51d-a46e-4d10-926e-5ba8ba68d432', N'78ca07f2-0549-449a-9ca4-8a950a40b567')
INSERT [dbo].[RoleMenuItems] ([Id], [RoleId], [MenuItemId]) VALUES (N'a4b909e8-aba7-452f-94a4-2d4330daac6a', N'a6204804-82cf-4f94-a3e1-07cd10a8e579', N'e73b567f-c830-41d4-ac5c-e299543cf95a')
INSERT [dbo].[RoleMenuItems] ([Id], [RoleId], [MenuItemId]) VALUES (N'28d31643-cbf6-424a-a201-32c761f3c1c4', N'a6204804-82cf-4f94-a3e1-07cd10a8e579', N'32cc32e8-8e12-4b5f-9089-e2c52227155d')
INSERT [dbo].[RoleMenuItems] ([Id], [RoleId], [MenuItemId]) VALUES (N'3a664518-7de2-4aab-8b57-366d2bb27bcb', N'fa00a51d-a46e-4d10-926e-5ba8ba68d432', N'8d34733f-09dd-4c18-8170-16e03456d202')
INSERT [dbo].[RoleMenuItems] ([Id], [RoleId], [MenuItemId]) VALUES (N'fe59a9b0-5170-40f0-acbd-38638c83e28a', N'a6204804-82cf-4f94-a3e1-07cd10a8e579', N'd7d627dc-8642-4131-ac61-f629a0f69929')
INSERT [dbo].[RoleMenuItems] ([Id], [RoleId], [MenuItemId]) VALUES (N'0e69181c-5136-412b-8db1-3cd19a07da52', N'a6204804-82cf-4f94-a3e1-07cd10a8e579', N'dd8e29a6-c51e-4e9a-9b89-6c255c7f1e07')
INSERT [dbo].[RoleMenuItems] ([Id], [RoleId], [MenuItemId]) VALUES (N'66cf0917-2306-43df-81d7-47853d46bc0b', N'a6204804-82cf-4f94-a3e1-07cd10a8e579', N'4c47569d-bbf0-400a-86eb-3dafaf7cd394')
INSERT [dbo].[RoleMenuItems] ([Id], [RoleId], [MenuItemId]) VALUES (N'ad85c44e-ff7a-4b33-94b9-4ae749cdb37a', N'de170fda-aa4a-4e0b-8722-0522b950f745', N'dd8e29a6-c51e-4e9a-9b89-6c255c7f1e07')
INSERT [dbo].[RoleMenuItems] ([Id], [RoleId], [MenuItemId]) VALUES (N'1a5498a6-46bd-47d4-bffd-4c4759340837', N'fa00a51d-a46e-4d10-926e-5ba8ba68d432', N'e73b567f-c830-41d4-ac5c-e299543cf95a')
INSERT [dbo].[RoleMenuItems] ([Id], [RoleId], [MenuItemId]) VALUES (N'4c52601c-5555-48ad-a34d-4f00b99ce6ab', N'de170fda-aa4a-4e0b-8722-0522b950f745', N'b519f203-6a8c-48c5-800e-2b673aadec05')
INSERT [dbo].[RoleMenuItems] ([Id], [RoleId], [MenuItemId]) VALUES (N'd4541730-e353-4b22-97f5-50523876cdd6', N'de170fda-aa4a-4e0b-8722-0522b950f745', N'b67dc630-6c6f-4dd1-88a1-1380ddf043f6')
INSERT [dbo].[RoleMenuItems] ([Id], [RoleId], [MenuItemId]) VALUES (N'38dc8662-6976-462c-831f-57746b95d257', N'de170fda-aa4a-4e0b-8722-0522b950f745', N'f0a0148d-7e05-4873-b5bd-37e61c626887')
INSERT [dbo].[RoleMenuItems] ([Id], [RoleId], [MenuItemId]) VALUES (N'fc66b2a1-c11e-47a8-8ca4-588b54e8eb44', N'de170fda-aa4a-4e0b-8722-0522b950f745', N'd7d627dc-8642-4131-ac61-f629a0f69929')
INSERT [dbo].[RoleMenuItems] ([Id], [RoleId], [MenuItemId]) VALUES (N'b3d206f2-27d8-4f83-b27f-5f014c61f824', N'de170fda-aa4a-4e0b-8722-0522b950f745', N'93a76a6e-3f4c-4d02-9b67-3c938a873be1')
INSERT [dbo].[RoleMenuItems] ([Id], [RoleId], [MenuItemId]) VALUES (N'7d361fbc-eaef-438f-bb5b-61ec5a5881a1', N'a6204804-82cf-4f94-a3e1-07cd10a8e579', N'63a5cead-6c28-4993-8c46-d86458b4d8bb')
INSERT [dbo].[RoleMenuItems] ([Id], [RoleId], [MenuItemId]) VALUES (N'8c4a1dbf-93a2-4b18-aa63-64e03affd0d8', N'a6204804-82cf-4f94-a3e1-07cd10a8e579', N'f9518f77-2b01-4131-b229-f1f675f5ceca')
INSERT [dbo].[RoleMenuItems] ([Id], [RoleId], [MenuItemId]) VALUES (N'6969cc77-63b9-4d98-a43a-6b0079f3bca2', N'de170fda-aa4a-4e0b-8722-0522b950f745', N'7600a347-28e5-4e1a-823e-ea11aca29e38')
INSERT [dbo].[RoleMenuItems] ([Id], [RoleId], [MenuItemId]) VALUES (N'c6bec425-65b7-44d3-b7ce-6c31bd31d6f3', N'fa00a51d-a46e-4d10-926e-5ba8ba68d432', N'7df44a05-ecf1-4adf-91ee-328dcbd5dd99')
INSERT [dbo].[RoleMenuItems] ([Id], [RoleId], [MenuItemId]) VALUES (N'938a39c1-3d20-47b4-80a0-6e082d6c803c', N'a6204804-82cf-4f94-a3e1-07cd10a8e579', N'b519f203-6a8c-48c5-800e-2b673aadec05')
INSERT [dbo].[RoleMenuItems] ([Id], [RoleId], [MenuItemId]) VALUES (N'fa0ec9ce-7152-428c-9fb8-70f563ba1703', N'fa00a51d-a46e-4d10-926e-5ba8ba68d432', N'97e2f2a0-00c8-492e-8503-adbbcb791b1f')
INSERT [dbo].[RoleMenuItems] ([Id], [RoleId], [MenuItemId]) VALUES (N'ec4defcf-afc7-4bd2-9e54-756738b0d538', N'bc4ce45e-b29f-4f21-8c68-9e1cff35614e', N'e73b567f-c830-41d4-ac5c-e299543cf95a')
INSERT [dbo].[RoleMenuItems] ([Id], [RoleId], [MenuItemId]) VALUES (N'98d7026a-8d44-4516-9e74-786d3171d95f', N'de170fda-aa4a-4e0b-8722-0522b950f745', N'63a5cead-6c28-4993-8c46-d86458b4d8bb')
INSERT [dbo].[RoleMenuItems] ([Id], [RoleId], [MenuItemId]) VALUES (N'e033991a-d608-4787-80bd-7bb43c992e8d', N'a6204804-82cf-4f94-a3e1-07cd10a8e579', N'7df44a05-ecf1-4adf-91ee-328dcbd5dd99')
INSERT [dbo].[RoleMenuItems] ([Id], [RoleId], [MenuItemId]) VALUES (N'10d9cb7e-afe6-4a71-89b6-7c04dbe87106', N'fa00a51d-a46e-4d10-926e-5ba8ba68d432', N'7600a347-28e5-4e1a-823e-ea11aca29e38')
INSERT [dbo].[RoleMenuItems] ([Id], [RoleId], [MenuItemId]) VALUES (N'630e3988-be22-4942-a22c-81c284906939', N'bc4ce45e-b29f-4f21-8c68-9e1cff35614e', N'dd8e29a6-c51e-4e9a-9b89-6c255c7f1e07')
INSERT [dbo].[RoleMenuItems] ([Id], [RoleId], [MenuItemId]) VALUES (N'13f30d3b-a1c0-4367-9fa1-85c1f5fc8924', N'a6204804-82cf-4f94-a3e1-07cd10a8e579', N'8d34733f-09dd-4c18-8170-16e03456d202')
INSERT [dbo].[RoleMenuItems] ([Id], [RoleId], [MenuItemId]) VALUES (N'8829c6a7-7633-483e-9187-966643a9dc75', N'de170fda-aa4a-4e0b-8722-0522b950f745', N'f9518f77-2b01-4131-b229-f1f675f5ceca')
INSERT [dbo].[RoleMenuItems] ([Id], [RoleId], [MenuItemId]) VALUES (N'9f54312a-3b2c-4cc0-99a7-99f6edb53644', N'20a6ddc3-0e72-400e-80e0-dd5256182a9a', N'f0a0148d-7e05-4873-b5bd-37e61c626887')
INSERT [dbo].[RoleMenuItems] ([Id], [RoleId], [MenuItemId]) VALUES (N'c82740dc-7171-4f01-a6f0-9efb5a0f2b37', N'fa00a51d-a46e-4d10-926e-5ba8ba68d432', N'4c47569d-bbf0-400a-86eb-3dafaf7cd394')
INSERT [dbo].[RoleMenuItems] ([Id], [RoleId], [MenuItemId]) VALUES (N'939c8abe-2b62-4c8e-a195-a058fe4a239c', N'20a6ddc3-0e72-400e-80e0-dd5256182a9a', N'd0a617ce-7a4a-4556-a2d0-82503dfef228')
INSERT [dbo].[RoleMenuItems] ([Id], [RoleId], [MenuItemId]) VALUES (N'b6d91f67-a085-431c-ad69-a79159cfdb68', N'bc4ce45e-b29f-4f21-8c68-9e1cff35614e', N'f0a0148d-7e05-4873-b5bd-37e61c626887')
INSERT [dbo].[RoleMenuItems] ([Id], [RoleId], [MenuItemId]) VALUES (N'69c96643-ebbb-46b7-b6c8-ab2bb7ff80bf', N'a6204804-82cf-4f94-a3e1-07cd10a8e579', N'93a76a6e-3f4c-4d02-9b67-3c938a873be1')
INSERT [dbo].[RoleMenuItems] ([Id], [RoleId], [MenuItemId]) VALUES (N'b74988f4-fac0-43dc-90cc-abc4deaf57ad', N'a6204804-82cf-4f94-a3e1-07cd10a8e579', N'fa70e2f4-8d7f-479d-a12a-f91508b8c33e')
INSERT [dbo].[RoleMenuItems] ([Id], [RoleId], [MenuItemId]) VALUES (N'1f08a6ce-8d6d-42bd-8909-ac204c919b03', N'a6204804-82cf-4f94-a3e1-07cd10a8e579', N'7600a347-28e5-4e1a-823e-ea11aca29e38')
INSERT [dbo].[RoleMenuItems] ([Id], [RoleId], [MenuItemId]) VALUES (N'781db8a1-2250-4cf4-8655-ae95d63f9db2', N'de170fda-aa4a-4e0b-8722-0522b950f745', N'fa70e2f4-8d7f-479d-a12a-f91508b8c33e')
INSERT [dbo].[RoleMenuItems] ([Id], [RoleId], [MenuItemId]) VALUES (N'08433fb9-2201-4924-bb21-b1458b1b81cd', N'de170fda-aa4a-4e0b-8722-0522b950f745', N'78ca07f2-0549-449a-9ca4-8a950a40b567')
INSERT [dbo].[RoleMenuItems] ([Id], [RoleId], [MenuItemId]) VALUES (N'a8cfe41a-c3c6-45f6-91e7-bcec817819fa', N'20a6ddc3-0e72-400e-80e0-dd5256182a9a', N'e73b567f-c830-41d4-ac5c-e299543cf95a')
INSERT [dbo].[RoleMenuItems] ([Id], [RoleId], [MenuItemId]) VALUES (N'b8979236-1e00-4c69-8773-bdc55e8959ea', N'fa00a51d-a46e-4d10-926e-5ba8ba68d432', N'd0a617ce-7a4a-4556-a2d0-82503dfef228')
INSERT [dbo].[RoleMenuItems] ([Id], [RoleId], [MenuItemId]) VALUES (N'79b1c371-b3b1-4743-afcb-c08c8cdb7acb', N'de170fda-aa4a-4e0b-8722-0522b950f745', N'97e2f2a0-00c8-492e-8503-adbbcb791b1f')
INSERT [dbo].[RoleMenuItems] ([Id], [RoleId], [MenuItemId]) VALUES (N'48ddf0e4-36a4-465d-a8dc-c0eab9a77778', N'a6204804-82cf-4f94-a3e1-07cd10a8e579', N'be782bc6-5b5f-4edc-a2c4-0dc8ad2af70e')
INSERT [dbo].[RoleMenuItems] ([Id], [RoleId], [MenuItemId]) VALUES (N'75a07ffe-3c95-48d2-8baa-cde58cdb03c0', N'a6204804-82cf-4f94-a3e1-07cd10a8e579', N'b67dc630-6c6f-4dd1-88a1-1380ddf043f6')
INSERT [dbo].[RoleMenuItems] ([Id], [RoleId], [MenuItemId]) VALUES (N'f51d3294-406c-4410-ac5d-d44d9f1e4f7c', N'a6204804-82cf-4f94-a3e1-07cd10a8e579', N'd0a617ce-7a4a-4556-a2d0-82503dfef228')
INSERT [dbo].[RoleMenuItems] ([Id], [RoleId], [MenuItemId]) VALUES (N'cb907930-bf28-403c-a17b-de5f70df76f7', N'de170fda-aa4a-4e0b-8722-0522b950f745', N'8d34733f-09dd-4c18-8170-16e03456d202')
INSERT [dbo].[RoleMenuItems] ([Id], [RoleId], [MenuItemId]) VALUES (N'52695dac-f059-49bb-b121-e13f3e60a868', N'de170fda-aa4a-4e0b-8722-0522b950f745', N'3172d91d-37cf-46ec-9eb8-62fd2a01e691')
INSERT [dbo].[RoleMenuItems] ([Id], [RoleId], [MenuItemId]) VALUES (N'9407d122-ab59-4354-b0f9-ec1345b698e9', N'de170fda-aa4a-4e0b-8722-0522b950f745', N'd0a617ce-7a4a-4556-a2d0-82503dfef228')
INSERT [dbo].[RoleMenuItems] ([Id], [RoleId], [MenuItemId]) VALUES (N'6250e34e-cb86-4230-8766-ec6d323ab412', N'a6204804-82cf-4f94-a3e1-07cd10a8e579', N'78ca07f2-0549-449a-9ca4-8a950a40b567')
INSERT [dbo].[RoleMenuItems] ([Id], [RoleId], [MenuItemId]) VALUES (N'0158b45c-a816-4461-b477-ee988cb7f275', N'a6204804-82cf-4f94-a3e1-07cd10a8e579', N'97e2f2a0-00c8-492e-8503-adbbcb791b1f')
INSERT [dbo].[RoleMenuItems] ([Id], [RoleId], [MenuItemId]) VALUES (N'18df783c-78bd-43a7-ab02-ef796680f6c2', N'a6204804-82cf-4f94-a3e1-07cd10a8e579', N'9f7dd98f-381f-4cec-8448-b1f7e3ce6531')
INSERT [dbo].[RoleMenuItems] ([Id], [RoleId], [MenuItemId]) VALUES (N'9ca2a0fe-2e3c-4c06-af4b-f4ff289e2e6f', N'a6204804-82cf-4f94-a3e1-07cd10a8e579', N'f0a0148d-7e05-4873-b5bd-37e61c626887')
INSERT [dbo].[RoleMenuItems] ([Id], [RoleId], [MenuItemId]) VALUES (N'3956827f-11d4-4492-b76b-f680d053e0eb', N'de170fda-aa4a-4e0b-8722-0522b950f745', N'4c47569d-bbf0-400a-86eb-3dafaf7cd394')
INSERT [dbo].[RoleMenuItems] ([Id], [RoleId], [MenuItemId]) VALUES (N'0be3a489-9c17-4e11-a63e-fbbe03e7727c', N'a6204804-82cf-4f94-a3e1-07cd10a8e579', N'51b36720-d531-4648-9efb-e80c5bdd04a5')
INSERT [dbo].[RoleMenuItems] ([Id], [RoleId], [MenuItemId]) VALUES (N'94175aea-a454-4890-9b30-fce9274adaf5', N'de170fda-aa4a-4e0b-8722-0522b950f745', N'6f9046d3-eb0e-4da1-97c1-f9509c240fd9')
INSERT [dbo].[RoleMenuItems] ([Id], [RoleId], [MenuItemId]) VALUES (N'4f1d689b-9480-4f62-9900-fd0f7f248360', N'fa00a51d-a46e-4d10-926e-5ba8ba68d432', N'63a5cead-6c28-4993-8c46-d86458b4d8bb')
GO
INSERT [dbo].[Roles] ([Id], [RoleName], [UpdatedAt], [IsDeleted]) VALUES (N'de170fda-aa4a-4e0b-8722-0522b950f745', N'CHUYÊN VIÊN PGD', CAST(N'2024-12-08T17:34:10.8319020' AS DateTime2), 0)
INSERT [dbo].[Roles] ([Id], [RoleName], [UpdatedAt], [IsDeleted]) VALUES (N'a6204804-82cf-4f94-a3e1-07cd10a8e579', N'QUẢN TRỊ HỆ THỐNG', CAST(N'2024-12-06T15:11:27.7462761' AS DateTime2), 0)
INSERT [dbo].[Roles] ([Id], [RoleName], [UpdatedAt], [IsDeleted]) VALUES (N'fa00a51d-a46e-4d10-926e-5ba8ba68d432', N'QUẢN LÝ ĐƠN VỊ', CAST(N'2024-12-08T17:34:01.5103087' AS DateTime2), 0)
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
INSERT [dbo].[User] ([Id], [UserTypeId], [UnitId], [FullName], [Email], [Password], [Phone], [Address], [Birthday], [PositionsName], [IsActive], [IsDeleted], [UpdatedAt], [ActivationCode]) VALUES (N'7ba6c795-d331-4f3a-8c5a-0647d53d8298', N'1bd77fd4-32a8-4c80-ad95-e0c9373d485f', N'93684774-0d94-42c9-ac77-078b6e3d2366', N'TRẨN VĂN ĐỨC', N'pqi74uai7v@1secmail.com', N'admin', N'032639354111', N'asdsad', CAST(N'2024-12-01T00:00:00.0000000' AS DateTime2), N'VCGV', 1, 0, CAST(N'2024-12-20T11:11:02.6256859' AS DateTime2), NULL)
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
INSERT [dbo].[UserRoles] ([Id], [RoleId], [UserId]) VALUES (N'4e827a8a-c06f-4b91-bbdc-db98b817e2fd', N'20a6ddc3-0e72-400e-80e0-dd5256182a9a', N'7ba6c795-d331-4f3a-8c5a-0647d53d8298')
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
