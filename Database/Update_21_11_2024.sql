USE [SA_Demo_1]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 11/21/2024 11:13:30 PM ******/
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
/****** Object:  Table [dbo].[CategoryComment]    Script Date: 11/21/2024 11:13:30 PM ******/
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
/****** Object:  Table [dbo].[CategoryCriteria]    Script Date: 11/21/2024 11:13:30 PM ******/
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
/****** Object:  Table [dbo].[CategoryProsCons]    Script Date: 11/21/2024 11:13:30 PM ******/
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
/****** Object:  Table [dbo].[CategoryRating]    Script Date: 11/21/2024 11:13:30 PM ******/
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
/****** Object:  Table [dbo].[CategoryTimeType]    Script Date: 11/21/2024 11:13:30 PM ******/
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
/****** Object:  Table [dbo].[ElectronicSignature]    Script Date: 11/21/2024 11:13:30 PM ******/
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
/****** Object:  Table [dbo].[Evaluation]    Script Date: 11/21/2024 11:13:30 PM ******/
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
/****** Object:  Table [dbo].[EvaluationAAE]    Script Date: 11/21/2024 11:13:30 PM ******/
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
/****** Object:  Table [dbo].[EvaluationConsolidationAndTransfer]    Script Date: 11/21/2024 11:13:30 PM ******/
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
/****** Object:  Table [dbo].[EvaluationConsolidationAndTransferDetails]    Script Date: 11/21/2024 11:13:30 PM ******/
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
/****** Object:  Table [dbo].[EvaluationCriteria]    Script Date: 11/21/2024 11:13:30 PM ******/
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
/****** Object:  Table [dbo].[EvaluationDetailsPersonal]    Script Date: 11/21/2024 11:13:30 PM ******/
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
/****** Object:  Table [dbo].[EvaluationDetailsSupervisor]    Script Date: 11/21/2024 11:13:30 PM ******/
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
/****** Object:  Table [dbo].[EvaluationExplaint]    Script Date: 11/21/2024 11:13:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EvaluationExplaint](
	[Id] [uniqueidentifier] NOT NULL,
	[EvaluationId] [uniqueidentifier] NULL,
	[UserId] [uniqueidentifier] NULL,
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
/****** Object:  Table [dbo].[EvaluationUser]    Script Date: 11/21/2024 11:13:30 PM ******/
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
/****** Object:  Table [dbo].[MenuItems]    Script Date: 11/21/2024 11:13:30 PM ******/
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
/****** Object:  Table [dbo].[RefreshToken]    Script Date: 11/21/2024 11:13:30 PM ******/
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
/****** Object:  Table [dbo].[RoleMenuItems]    Script Date: 11/21/2024 11:13:30 PM ******/
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
/****** Object:  Table [dbo].[Roles]    Script Date: 11/21/2024 11:13:30 PM ******/
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
/****** Object:  Table [dbo].[Unit]    Script Date: 11/21/2024 11:13:30 PM ******/
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
/****** Object:  Table [dbo].[User]    Script Date: 11/21/2024 11:13:30 PM ******/
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
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserRoles]    Script Date: 11/21/2024 11:13:30 PM ******/
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
/****** Object:  Table [dbo].[UserType]    Script Date: 11/21/2024 11:13:30 PM ******/
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
INSERT [dbo].[CategoryCriteria] ([Id], [ParentId], [CategoryRatingId], [UnitId], [CriteriaName], [IsDistinct], [IsDeleted], [UpdatedAt]) VALUES (N'a7efdc67-aa93-46cb-8410-0ddcfe0d5853', N'e6d88410-17f4-479b-8e2d-8b6d5c0324a7', N'0273a6e8-6078-4383-81f2-bbbf6fe016f4', N'fe6717f3-92c1-48dd-acf6-a65dbefdb04e', N'Duy trì kỷ luật, kỷ cương trong cơ quan, tổ chức, đơn vị; không để xảy ra các vụ, việc vi phạm kỷ luật, vi phạm pháp luật phải xử lý, tình trạng khiếu nại, tố cáo kéo dài; phòng, chống tham nhũng, lãng phí trong phạm vi cơ quan, tổ chức, đơn vị.', 0, 0, CAST(N'2024-11-03T15:07:05.0453887' AS DateTime2))
INSERT [dbo].[CategoryCriteria] ([Id], [ParentId], [CategoryRatingId], [UnitId], [CriteriaName], [IsDistinct], [IsDeleted], [UpdatedAt]) VALUES (N'da5e3dff-a649-4508-943d-0ecc32d4f7fc', N'31314875-8f03-4874-be17-0f31c14f28ee', N'0164939d-6db7-40f9-8d73-064a33cccd6b', N'fe6717f3-92c1-48dd-acf6-a65dbefdb04e', N'Có thái độ đúng mực và phong cách ứng xử, lề lối làm việc chuẩn mực, đáp ứng yêu cầu của văn hóa công vụ.', 0, 0, CAST(N'2024-11-03T15:03:04.4188496' AS DateTime2))
INSERT [dbo].[CategoryCriteria] ([Id], [ParentId], [CategoryRatingId], [UnitId], [CriteriaName], [IsDistinct], [IsDeleted], [UpdatedAt]) VALUES (N'31314875-8f03-4874-be17-0f31c14f28ee', NULL, NULL, N'fe6717f3-92c1-48dd-acf6-a65dbefdb04e', N'Tác phong, lề lối làm việc', 0, 0, CAST(N'2024-11-03T15:02:34.6488939' AS DateTime2))
INSERT [dbo].[CategoryCriteria] ([Id], [ParentId], [CategoryRatingId], [UnitId], [CriteriaName], [IsDistinct], [IsDeleted], [UpdatedAt]) VALUES (N'f4c06feb-eb3d-4f75-95f9-10c0289de995', N'e6d88410-17f4-479b-8e2d-8b6d5c0324a7', N'0273a6e8-6078-4383-81f2-bbbf6fe016f4', N'fe6717f3-92c1-48dd-acf6-a65dbefdb04e', N'Lãnh đạo, chỉ đạo, tổ chức kiểm tra, thanh tra, giám sát, giải quyết khiếu nại, tố cáo theo thẩm quyền; chỉ đạo, thực hiện công tác cải cách hành chính, cải cách chế độ công vụ, công chức tại cơ quan, tổ chức, đơn vị.', 0, 0, CAST(N'2024-11-03T15:07:12.9522130' AS DateTime2))
INSERT [dbo].[CategoryCriteria] ([Id], [ParentId], [CategoryRatingId], [UnitId], [CriteriaName], [IsDistinct], [IsDeleted], [UpdatedAt]) VALUES (N'8b678550-a782-4ed9-a61f-15887cf5a73e', NULL, NULL, N'fe6717f3-92c1-48dd-acf6-a65dbefdb04e', N'Chính trị tư tưởng', 0, 0, CAST(N'2024-11-03T14:59:43.7774059' AS DateTime2))
INSERT [dbo].[CategoryCriteria] ([Id], [ParentId], [CategoryRatingId], [UnitId], [CriteriaName], [IsDistinct], [IsDeleted], [UpdatedAt]) VALUES (N'ca2c80e4-c9e6-4bc1-a080-1c0505bccaba', N'786e1a85-def5-4a2e-a70c-cfc2c0d8b239', N'0164939d-6db7-40f9-8d73-064a33cccd6b', N'fe6717f3-92c1-48dd-acf6-a65dbefdb04e', N'Thực hiện các quy định, quy chế, nội quy của cơ quan, tổ chức, đơn vị nơi công tác.', 0, 0, CAST(N'2024-11-03T15:03:56.0350066' AS DateTime2))
INSERT [dbo].[CategoryCriteria] ([Id], [ParentId], [CategoryRatingId], [UnitId], [CriteriaName], [IsDistinct], [IsDeleted], [UpdatedAt]) VALUES (N'79459d60-5db6-48b6-94bf-2121d9839e15', N'8b678550-a782-4ed9-a61f-15887cf5a73e', N'81788585-ac18-4dec-b0c6-8b0bc946eccf', N'fe6717f3-92c1-48dd-acf6-a65dbefdb04e', N'Đặt lợi ích của Đảng, quốc gia - dân tộc, nhân dân, tập thể lên trên lợi ích cá nhân.', 0, 0, CAST(N'2024-11-03T15:01:33.8572339' AS DateTime2))
INSERT [dbo].[CategoryCriteria] ([Id], [ParentId], [CategoryRatingId], [UnitId], [CriteriaName], [IsDistinct], [IsDeleted], [UpdatedAt]) VALUES (N'999d3424-6bad-4d7b-8bd0-2b462b55dd45', N'8b678550-a782-4ed9-a61f-15887cf5a73e', N'81788585-ac18-4dec-b0c6-8b0bc946eccf', N'fe6717f3-92c1-48dd-acf6-a65dbefdb04e', N'Có ý thức nghiên cứu, học tập, vận dụng chủ nghĩa Mác - Lênin, tư tưởng Hồ Chí Minh, nghị quyết, chỉ thị, quyết định và các văn bản của Đảng.', 0, 0, CAST(N'2024-11-03T15:01:41.9389039' AS DateTime2))
INSERT [dbo].[CategoryCriteria] ([Id], [ParentId], [CategoryRatingId], [UnitId], [CriteriaName], [IsDistinct], [IsDeleted], [UpdatedAt]) VALUES (N'b4ab63da-81d4-4ea1-8a5a-3c12154fa561', N'8b678550-a782-4ed9-a61f-15887cf5a73e', N'81788585-ac18-4dec-b0c6-8b0bc946eccf', N'fe6717f3-92c1-48dd-acf6-a65dbefdb04e', N'Chấp hành chủ trương, đường lối, quy định của Đảng, chính sách, pháp luật của Nhà nước và các nguyên tắc tổ chức, kỷ luật của Đảng, nhất là nguyên tắc tập trung dân chủ, tự phê bình và phê bình.', 0, 0, CAST(N'2024-11-03T15:01:14.7707688' AS DateTime2))
INSERT [dbo].[CategoryCriteria] ([Id], [ParentId], [CategoryRatingId], [UnitId], [CriteriaName], [IsDistinct], [IsDeleted], [UpdatedAt]) VALUES (N'c702e9e8-111b-4402-8ed0-5f939a7892a6', N'76f4c106-34b2-4175-a413-f0b67106218f', N'0164939d-6db7-40f9-8d73-064a33cccd6b', N'fe6717f3-92c1-48dd-acf6-a65dbefdb04e', N'Không để người thân, người quen lợi dụng chức vụ, quyền hạn của mình để trục lợi.', 0, 0, CAST(N'2024-11-03T15:02:26.9577663' AS DateTime2))
INSERT [dbo].[CategoryCriteria] ([Id], [ParentId], [CategoryRatingId], [UnitId], [CriteriaName], [IsDistinct], [IsDeleted], [UpdatedAt]) VALUES (N'b9ec64fd-8aac-44db-8541-67b1c6162676', N'4723cac1-52f7-43bb-8d3f-bfb3b6c28a96', N'aa5db29e-7359-406a-9bc3-c37f756ae46e', N'fe6717f3-92c1-48dd-acf6-a65dbefdb04e', N'Tạo mối đoàn kết, hỗ trợ trong công tác của công chức trong đơn vị.', 0, 0, CAST(N'2024-11-03T15:07:51.0421238' AS DateTime2))
INSERT [dbo].[CategoryCriteria] ([Id], [ParentId], [CategoryRatingId], [UnitId], [CriteriaName], [IsDistinct], [IsDeleted], [UpdatedAt]) VALUES (N'acf13799-4766-4be0-a514-693c0d238f34', N'4723cac1-52f7-43bb-8d3f-bfb3b6c28a96', N'aa5db29e-7359-406a-9bc3-c37f756ae46e', N'fe6717f3-92c1-48dd-acf6-a65dbefdb04e', N'Phân công nhiệm vụ cho cấp dưới căn cứ vào năng lực, trình độ và tính phù hợp, sở trường của từng người, phù hợp với công việc được giao.', 0, 0, CAST(N'2024-11-03T15:07:56.1457463' AS DateTime2))
INSERT [dbo].[CategoryCriteria] ([Id], [ParentId], [CategoryRatingId], [UnitId], [CriteriaName], [IsDistinct], [IsDeleted], [UpdatedAt]) VALUES (N'0f8a3810-dc07-47e8-a089-7d6c08107382', N'31314875-8f03-4874-be17-0f31c14f28ee', N'0164939d-6db7-40f9-8d73-064a33cccd6b', N'fe6717f3-92c1-48dd-acf6-a65dbefdb04e', N'Phương pháp làm việc khoa học, dân chủ, đúng nguyên tắc.', 0, 0, CAST(N'2024-11-03T15:02:50.4423472' AS DateTime2))
INSERT [dbo].[CategoryCriteria] ([Id], [ParentId], [CategoryRatingId], [UnitId], [CriteriaName], [IsDistinct], [IsDeleted], [UpdatedAt]) VALUES (N'1b68a81a-b654-4896-9195-84abfb081103', N'e6d88410-17f4-479b-8e2d-8b6d5c0324a7', N'0273a6e8-6078-4383-81f2-bbbf6fe016f4', N'fe6717f3-92c1-48dd-acf6-a65dbefdb04e', N'Quán triệt, thể chế hóa và thực hiện chủ trương, đường lối của Đảng, chính sách, pháp luật của Nhà nước tại cơ quan, tổ chức, đơn vị.', 0, 0, CAST(N'2024-11-03T15:06:16.9008104' AS DateTime2))
INSERT [dbo].[CategoryCriteria] ([Id], [ParentId], [CategoryRatingId], [UnitId], [CriteriaName], [IsDistinct], [IsDeleted], [UpdatedAt]) VALUES (N'e6d88410-17f4-479b-8e2d-8b6d5c0324a7', N'3c69d1e2-9204-431f-863f-a4ba07f3ac1d', NULL, N'fe6717f3-92c1-48dd-acf6-a65dbefdb04e', N'Kết quả hoạt động của cơ quan, tổ chức, đơn vị được giao lãnh đạo, quản lý, phụ trách (xác định rõ nội dung công việc thực hiện; tỷ lệ hoàn thành, chất lượng, tiến độ công việc)', 0, 0, CAST(N'2024-11-03T15:04:42.1757843' AS DateTime2))
INSERT [dbo].[CategoryCriteria] ([Id], [ParentId], [CategoryRatingId], [UnitId], [CriteriaName], [IsDistinct], [IsDeleted], [UpdatedAt]) VALUES (N'6f0a8890-c105-4fb4-874b-9d559847eca6', N'35ca5805-aa8f-4dc0-a895-c2bae87a00eb', N'aa5db29e-7359-406a-9bc3-c37f756ae46e', N'fe6717f3-92c1-48dd-acf6-a65dbefdb04e', N'Lãnh đạo thực hiện mọi nhiệm vụ trên nguyên tắc tập trung dân chủ, phát huy quyền làm chủ, xây dựng khối đại đoàn kết giữa các bộ phận, tổ chức trong đơn vị.', 0, 0, CAST(N'2024-11-03T15:08:18.4846660' AS DateTime2))
INSERT [dbo].[CategoryCriteria] ([Id], [ParentId], [CategoryRatingId], [UnitId], [CriteriaName], [IsDistinct], [IsDeleted], [UpdatedAt]) VALUES (N'3a9ab36e-b834-4a20-ba32-a0d34fdc47da', N'786e1a85-def5-4a2e-a70c-cfc2c0d8b239', N'0164939d-6db7-40f9-8d73-064a33cccd6b', N'fe6717f3-92c1-48dd-acf6-a65dbefdb04e', N'Chấp hành sự phân công của tổ chức', 0, 0, CAST(N'2024-11-03T15:03:27.4825669' AS DateTime2))
INSERT [dbo].[CategoryCriteria] ([Id], [ParentId], [CategoryRatingId], [UnitId], [CriteriaName], [IsDistinct], [IsDeleted], [UpdatedAt]) VALUES (N'3c69d1e2-9204-431f-863f-a4ba07f3ac1d', NULL, NULL, N'fe6717f3-92c1-48dd-acf6-a65dbefdb04e', N'Kết quả thực hiện chức trách, nhiệm vụ được giao', 0, 0, CAST(N'2024-11-03T15:04:30.2662224' AS DateTime2))
INSERT [dbo].[CategoryCriteria] ([Id], [ParentId], [CategoryRatingId], [UnitId], [CriteriaName], [IsDistinct], [IsDeleted], [UpdatedAt]) VALUES (N'87fedc0d-caae-4890-80d9-a6e086d71a1c', N'8b678550-a782-4ed9-a61f-15887cf5a73e', N'81788585-ac18-4dec-b0c6-8b0bc946eccf', N'fe6717f3-92c1-48dd-acf6-a65dbefdb04e', N'Có quan điểm, bản lĩnh chính trị vững vàng; kiên định lập trường; không dao động trước mọi khó khăn, thách thức.', 0, 0, CAST(N'2024-11-03T15:01:25.2812856' AS DateTime2))
INSERT [dbo].[CategoryCriteria] ([Id], [ParentId], [CategoryRatingId], [UnitId], [CriteriaName], [IsDistinct], [IsDeleted], [UpdatedAt]) VALUES (N'e296f2f3-e89c-49b9-b304-b76df59719ae', N'31314875-8f03-4874-be17-0f31c14f28ee', N'0164939d-6db7-40f9-8d73-064a33cccd6b', N'fe6717f3-92c1-48dd-acf6-a65dbefdb04e', N'Có trách nhiệm với công việc; năng động, sáng tạo, dám nghĩ, dám làm, linh hoạt trong thực hiện nhiệm vụ.', 0, 0, CAST(N'2024-11-03T15:02:43.9248464' AS DateTime2))
INSERT [dbo].[CategoryCriteria] ([Id], [ParentId], [CategoryRatingId], [UnitId], [CriteriaName], [IsDistinct], [IsDeleted], [UpdatedAt]) VALUES (N'4723cac1-52f7-43bb-8d3f-bfb3b6c28a96', N'3c69d1e2-9204-431f-863f-a4ba07f3ac1d', NULL, N'fe6717f3-92c1-48dd-acf6-a65dbefdb04e', N'Năng lực lãnh đạo, quản lý', 0, 0, CAST(N'2024-11-03T15:07:38.5728019' AS DateTime2))
INSERT [dbo].[CategoryCriteria] ([Id], [ParentId], [CategoryRatingId], [UnitId], [CriteriaName], [IsDistinct], [IsDeleted], [UpdatedAt]) VALUES (N'fb40ad8f-098f-4fd1-8870-c05d1d25fae2', N'e6d88410-17f4-479b-8e2d-8b6d5c0324a7', N'0273a6e8-6078-4383-81f2-bbbf6fe016f4', N'fe6717f3-92c1-48dd-acf6-a65dbefdb04e', N'Xây dựng chương trình, kế hoạch hoạt động hàng năm của cơ quan, tổ chức, đơn vị được giao quản lý, phụ trách, trong đó xác định rõ kết quả thực hiện các chỉ tiêu, nhiệm vụ, lượng hóa bằng sản phẩm cụ thể.', 0, 0, CAST(N'2024-11-03T15:07:19.9708645' AS DateTime2))
INSERT [dbo].[CategoryCriteria] ([Id], [ParentId], [CategoryRatingId], [UnitId], [CriteriaName], [IsDistinct], [IsDeleted], [UpdatedAt]) VALUES (N'35ca5805-aa8f-4dc0-a895-c2bae87a00eb', N'3c69d1e2-9204-431f-863f-a4ba07f3ac1d', NULL, N'fe6717f3-92c1-48dd-acf6-a65dbefdb04e', N'Năng lực tập hợp, đoàn kết', 0, 0, CAST(N'2024-11-03T15:08:06.9496262' AS DateTime2))
INSERT [dbo].[CategoryCriteria] ([Id], [ParentId], [CategoryRatingId], [UnitId], [CriteriaName], [IsDistinct], [IsDeleted], [UpdatedAt]) VALUES (N'3622e825-11bb-44fd-bc59-ce0c40aa9509', N'76f4c106-34b2-4175-a413-f0b67106218f', N'3aea35b0-3c2f-4c9a-85ab-5d6bfbd06444', N'fe6717f3-92c1-48dd-acf6-a65dbefdb04e', N'Có lối sống trung thực, khiêm tốn, chân thành, trong sáng, giản dị.', 0, 0, CAST(N'2024-11-03T15:02:10.5558641' AS DateTime2))
INSERT [dbo].[CategoryCriteria] ([Id], [ParentId], [CategoryRatingId], [UnitId], [CriteriaName], [IsDistinct], [IsDeleted], [UpdatedAt]) VALUES (N'786e1a85-def5-4a2e-a70c-cfc2c0d8b239', NULL, NULL, N'fe6717f3-92c1-48dd-acf6-a65dbefdb04e', N'Ý thức tổ chức kỷ luật', 0, 0, CAST(N'2024-11-03T15:03:15.4696293' AS DateTime2))
INSERT [dbo].[CategoryCriteria] ([Id], [ParentId], [CategoryRatingId], [UnitId], [CriteriaName], [IsDistinct], [IsDeleted], [UpdatedAt]) VALUES (N'1fb789cf-87b0-43b0-a45e-e85e3891a9ee', N'31314875-8f03-4874-be17-0f31c14f28ee', N'0164939d-6db7-40f9-8d73-064a33cccd6b', N'fe6717f3-92c1-48dd-acf6-a65dbefdb04e', N'Có tinh thần trách nhiệm và phối hợp trong thực hiện nhiệm vụ.', 0, 0, CAST(N'2024-11-03T15:02:57.1283828' AS DateTime2))
INSERT [dbo].[CategoryCriteria] ([Id], [ParentId], [CategoryRatingId], [UnitId], [CriteriaName], [IsDistinct], [IsDeleted], [UpdatedAt]) VALUES (N'76f4c106-34b2-4175-a413-f0b67106218f', NULL, NULL, N'fe6717f3-92c1-48dd-acf6-a65dbefdb04e', N'Đạo đức, lối sống', 0, 0, CAST(N'2024-11-03T19:00:31.0594389' AS DateTime2))
INSERT [dbo].[CategoryCriteria] ([Id], [ParentId], [CategoryRatingId], [UnitId], [CriteriaName], [IsDistinct], [IsDeleted], [UpdatedAt]) VALUES (N'efbe3ff8-a8cb-408b-b2de-f0cdc5f03d55', N'76f4c106-34b2-4175-a413-f0b67106218f', N'3aea35b0-3c2f-4c9a-85ab-5d6bfbd06444', N'fe6717f3-92c1-48dd-acf6-a65dbefdb04e', N'Có tinh thần đoàn kết, xây dựng cơ quan, tổ chức, đơn vị trong sạch, vững mạnh.', 0, 0, CAST(N'2024-11-03T15:02:19.4751641' AS DateTime2))
INSERT [dbo].[CategoryCriteria] ([Id], [ParentId], [CategoryRatingId], [UnitId], [CriteriaName], [IsDistinct], [IsDeleted], [UpdatedAt]) VALUES (N'51ef79d2-b47e-41f1-a99d-f5c0e4f4416e', N'786e1a85-def5-4a2e-a70c-cfc2c0d8b239', N'0164939d-6db7-40f9-8d73-064a33cccd6b', N'fe6717f3-92c1-48dd-acf6-a65dbefdb04e', N'Báo cáo đầy đủ, trung thực, cung cấp thông tin chính xác, khách quan về những nội dung liên quan đến việc thực hiện chức trách, nhiệm vụ được giao và hoạt động của cơ quan, tổ chức, đơn vị với cấp trên khi được yêu cầu.', 0, 0, CAST(N'2024-11-03T15:04:15.0766354' AS DateTime2))
INSERT [dbo].[CategoryCriteria] ([Id], [ParentId], [CategoryRatingId], [UnitId], [CriteriaName], [IsDistinct], [IsDeleted], [UpdatedAt]) VALUES (N'bf0b9144-be3b-4213-8f3c-f744035ed4b5', N'786e1a85-def5-4a2e-a70c-cfc2c0d8b239', N'0164939d-6db7-40f9-8d73-064a33cccd6b', N'fe6717f3-92c1-48dd-acf6-a65dbefdb04e', N'Thực hiện việc kê khai và công khai tài sản, thu nhập theo quy định', 0, 0, CAST(N'2024-11-03T15:04:07.0678839' AS DateTime2))
INSERT [dbo].[CategoryCriteria] ([Id], [ParentId], [CategoryRatingId], [UnitId], [CriteriaName], [IsDistinct], [IsDeleted], [UpdatedAt]) VALUES (N'ad4a5bce-f3c4-44a7-85c5-fdb1c2d19d12', N'76f4c106-34b2-4175-a413-f0b67106218f', N'3aea35b0-3c2f-4c9a-85ab-5d6bfbd06444', N'fe6717f3-92c1-48dd-acf6-a65dbefdb04e', N'Không tham ô, tham nhũng, tiêu cực, lãng phí, quan liêu, cơ hội, vụ lợi, hách dịch, cửa quyền; không có biểu hiện suy thoái về đạo đức, lối sống, tự diễn biến, tự chuyển hóa', 0, 0, CAST(N'2024-11-03T15:02:01.9729049' AS DateTime2))
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
INSERT [dbo].[CategoryRating] ([Id], [UnitId], [RatingName], [StartValue], [EndValue], [IsDeleted], [UpdatedAt]) VALUES (N'0164939d-6db7-40f9-8d73-064a33cccd6b', N'fe6717f3-92c1-48dd-acf6-a65dbefdb04e', N'Thang điểm 0 - 3', 0, 3, 0, CAST(N'2024-11-03T15:00:28.2110712' AS DateTime2))
INSERT [dbo].[CategoryRating] ([Id], [UnitId], [RatingName], [StartValue], [EndValue], [IsDeleted], [UpdatedAt]) VALUES (N'062d5f60-f533-483c-ae78-54f9d0838d67', N'fe6717f3-92c1-48dd-acf6-a65dbefdb04e', N'test', 12, 20, 1, CAST(N'2024-11-02T18:33:08.1090292' AS DateTime2))
INSERT [dbo].[CategoryRating] ([Id], [UnitId], [RatingName], [StartValue], [EndValue], [IsDeleted], [UpdatedAt]) VALUES (N'3aea35b0-3c2f-4c9a-85ab-5d6bfbd06444', N'fe6717f3-92c1-48dd-acf6-a65dbefdb04e', N'Thang điểm 0 - 2', 0, 2, 0, CAST(N'2024-11-03T15:00:16.6323979' AS DateTime2))
INSERT [dbo].[CategoryRating] ([Id], [UnitId], [RatingName], [StartValue], [EndValue], [IsDeleted], [UpdatedAt]) VALUES (N'daf888a5-ca30-4679-8fc3-63ed35d0f970', N'fe6717f3-92c1-48dd-acf6-a65dbefdb04e', N'Thang điểm 0 - 24', 0, 24, 0, CAST(N'2024-11-03T15:00:41.8382124' AS DateTime2))
INSERT [dbo].[CategoryRating] ([Id], [UnitId], [RatingName], [StartValue], [EndValue], [IsDeleted], [UpdatedAt]) VALUES (N'7bc5f0d7-7f31-4ec4-804c-84e3cee675ce', N'fe6717f3-92c1-48dd-acf6-a65dbefdb04e', N'Thang điểm 0 - 9', 0, 9, 0, CAST(N'2024-11-03T15:05:22.6516042' AS DateTime2))
INSERT [dbo].[CategoryRating] ([Id], [UnitId], [RatingName], [StartValue], [EndValue], [IsDeleted], [UpdatedAt]) VALUES (N'81788585-ac18-4dec-b0c6-8b0bc946eccf', N'fe6717f3-92c1-48dd-acf6-a65dbefdb04e', N'Thang điểm 0 - 4', 0, 4, 0, CAST(N'2024-11-03T15:00:05.2911919' AS DateTime2))
INSERT [dbo].[CategoryRating] ([Id], [UnitId], [RatingName], [StartValue], [EndValue], [IsDeleted], [UpdatedAt]) VALUES (N'764f9497-9963-438b-94b3-9d9b61be578a', N'7787a766-2655-457b-afa5-cc21e94ff712', N'test', 12, 30, 1, CAST(N'2024-11-02T18:33:08.1090306' AS DateTime2))
INSERT [dbo].[CategoryRating] ([Id], [UnitId], [RatingName], [StartValue], [EndValue], [IsDeleted], [UpdatedAt]) VALUES (N'2dff7931-edf8-4330-b5df-aadb06d13fa4', N'fe6717f3-92c1-48dd-acf6-a65dbefdb04e', N'Thang điểm 0 - 18', 0, 18, 0, CAST(N'2024-11-03T15:00:48.8073585' AS DateTime2))
INSERT [dbo].[CategoryRating] ([Id], [UnitId], [RatingName], [StartValue], [EndValue], [IsDeleted], [UpdatedAt]) VALUES (N'0273a6e8-6078-4383-81f2-bbbf6fe016f4', N'fe6717f3-92c1-48dd-acf6-a65dbefdb04e', N'Thang điểm 0 - 6', 0, 6, 0, CAST(N'2024-11-03T15:05:14.9995621' AS DateTime2))
INSERT [dbo].[CategoryRating] ([Id], [UnitId], [RatingName], [StartValue], [EndValue], [IsDeleted], [UpdatedAt]) VALUES (N'0246fe8b-187a-4948-8db8-c062b5aa4ed5', N'1feb11df-bb8c-4871-b916-3225c3897d40', NULL, 0, 0, 1, CAST(N'2024-11-03T12:39:16.1044262' AS DateTime2))
INSERT [dbo].[CategoryRating] ([Id], [UnitId], [RatingName], [StartValue], [EndValue], [IsDeleted], [UpdatedAt]) VALUES (N'aa5db29e-7359-406a-9bc3-c37f756ae46e', N'fe6717f3-92c1-48dd-acf6-a65dbefdb04e', N'Thang điểm 0 - 9', 0, 9, 0, CAST(N'2024-11-03T15:00:54.9197438' AS DateTime2))
INSERT [dbo].[CategoryRating] ([Id], [UnitId], [RatingName], [StartValue], [EndValue], [IsDeleted], [UpdatedAt]) VALUES (N'd896d84f-4f11-4573-86d5-e7b95c6ddc9d', N'fe6717f3-92c1-48dd-acf6-a65dbefdb04e', N'Thang điểm 10-15', 10, 15, 0, CAST(N'2024-11-03T12:56:04.0220775' AS DateTime2))
GO
INSERT [dbo].[CategoryTimeType] ([Id], [UnitId], [TimeTypeName], [FromDate], [ToDate], [IsDeleted], [UpdatedAt]) VALUES (N'cbd1e5ab-0498-460c-823d-0acfde1bc2d3', N'fe6717f3-92c1-48dd-acf6-a65dbefdb04e', N'Kỳ đánh giá tháng 12 - 2024', CAST(N'2024-12-01T00:00:00.0000000' AS DateTime2), CAST(N'2024-12-31T00:00:00.0000000' AS DateTime2), 0, CAST(N'2024-11-03T13:02:00.8186735' AS DateTime2))
INSERT [dbo].[CategoryTimeType] ([Id], [UnitId], [TimeTypeName], [FromDate], [ToDate], [IsDeleted], [UpdatedAt]) VALUES (N'f62939c8-91ba-4607-b531-1c13e0f974a1', N'fe6717f3-92c1-48dd-acf6-a65dbefdb04e', NULL, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 1, CAST(N'2024-11-03T14:26:35.8099810' AS DateTime2))
INSERT [dbo].[CategoryTimeType] ([Id], [UnitId], [TimeTypeName], [FromDate], [ToDate], [IsDeleted], [UpdatedAt]) VALUES (N'13d5e5a0-7eda-4725-9e56-455790a9c0a2', N'fe6717f3-92c1-48dd-acf6-a65dbefdb04e', N'Kỳ đánh giá tháng 11 - 2024', CAST(N'2024-11-01T00:00:00.0000000' AS DateTime2), CAST(N'2024-11-30T00:00:00.0000000' AS DateTime2), 0, CAST(N'2024-11-03T13:02:02.8835845' AS DateTime2))
INSERT [dbo].[CategoryTimeType] ([Id], [UnitId], [TimeTypeName], [FromDate], [ToDate], [IsDeleted], [UpdatedAt]) VALUES (N'0ec736da-795b-4bc3-9b92-f4e0242d18e0', N'fe6717f3-92c1-48dd-acf6-a65dbefdb04e', N'Kỳ đánh giá tháng 1 - 2025', CAST(N'2025-01-01T00:00:00.0000000' AS DateTime2), CAST(N'2025-01-31T00:00:00.0000000' AS DateTime2), 0, CAST(N'2024-11-03T13:01:48.2535009' AS DateTime2))
GO
INSERT [dbo].[ElectronicSignature] ([Id], [UserId], [Status], [PublicKey], [PrivateKey], [UpdatedAt]) VALUES (N'b593bdc9-b58c-4ada-965e-1653a075994b', N'6b2dc1cb-7a55-4f16-b9cf-6cf6a048edea', 0, N'MIIBCgKCAQEAqu6j5erdpg12+pN+BrMwO9LoVYsp/hQVvqan34w81QrGY8p/HCdgWyQ7u0tZFuDNqGVySkQiNcMdWAbg7tlefwT0fk+PR+EM8LWEWJRFjSI5CynYC6LwSQOeZrfbyXaDh1XBjAy8G6ddVrXEW5/uIP5QbyZiULlepQa2yesH9ZnF/3ZfkmEfKZMoWVLk8kVNXOXfqwxPwN39ugLS/mllj8L2mn77RtF64yOnUaZpzIjOpcwrMILniTHkQDGLTLLNfeGXF74wMRNOtAQfT9NpHvswKNnK+H8zb1Tr5928cqoQMHQ2I2m8TvqAgzTjzL5+n+jJfCw/UUulRig8NGSKyQIDAQAB', N'MIIEpAIBAAKCAQEAqu6j5erdpg12+pN+BrMwO9LoVYsp/hQVvqan34w81QrGY8p/HCdgWyQ7u0tZFuDNqGVySkQiNcMdWAbg7tlefwT0fk+PR+EM8LWEWJRFjSI5CynYC6LwSQOeZrfbyXaDh1XBjAy8G6ddVrXEW5/uIP5QbyZiULlepQa2yesH9ZnF/3ZfkmEfKZMoWVLk8kVNXOXfqwxPwN39ugLS/mllj8L2mn77RtF64yOnUaZpzIjOpcwrMILniTHkQDGLTLLNfeGXF74wMRNOtAQfT9NpHvswKNnK+H8zb1Tr5928cqoQMHQ2I2m8TvqAgzTjzL5+n+jJfCw/UUulRig8NGSKyQIDAQABAoIBAQCgy1CerivHUw9DdI+vGc0b2bD5F6pu+tHhwMBWiIOJHVO29/xOrbP0yMbvz1eFMAAGkzfKKQHNdTgbYI0j4pMEBdNBJvJv+YLExNw0v3YV58WlfL1hZOuIo8DUe8xjXfsoykEBz9D8apphQSfv0SifHNzpUkBWE6q2rvQwScn4/B8tCf7MGcXrK8SI2/TrQfzQwqjWwZ4ANSETRbzISG1hPMkPWv37AOwpKmocsgO9gfpZArgQUjYB0UCWJcE7Sb9g5Gjb55oVzGhl2doWXktkOoDwv+iZIcsQgCww5Xo42Jd//JLrOHOJa3qKvHYxYhmgbSkzu7Wo8P/2/Qi/aNbJAoGBANQ4JbUQ0fIEdOlbWyq5QAZL07rx9a/HTGScCcELcNg/DtevAC3GxtA5HwVtBy6AkyBcPrK4sEDav2ouYNErshZ+18/w1N1uEPNJXaj+1ARevNyAB4f/2RCM7yNhF4tfkLWm2+GGa7kE+QwjMnP21WGxTHTsTOFd2v3PrDUO4LEbAoGBAM4yAx+Y3nBNnUeeSMr+YkjOv+83dn57VC+eH4nUuCHGn/aj7E5kmS7ahmASXXijmDvw0XEuKCYv6oPONA6LXDUpj3a1f0TnPdx5ctjg67hazIkt/NXhqMSje4O1DPyaRFjQ4mgp+KlMFgSOa/SmIYp6/oVw8w1fppltcc49PFXrAoGBAI4st4ZgqGadeb3EyIUM6snNDyJVa6XBvXpB138PLSCSzlzNDy+b1iI1woSeEIuk8+xgIFkXxm0Mn+SBAbfgsETF4cubquBWFuEGq8rGPkBXP+vxkhoY29FsueFX8LAc7BPmn7Stm4muvTLWebybB0WVxIUosjDh8g7MjLBXMU01AoGAX8pgJRexjt6fyJvCGXvgUQ6roAhWJiBJVe3RnQiTmi1aNwykRS768wdWEd+2SMtHd+FCi5/zyvnLqvvqty8K4S+zlGRxAaOj238YWaT0HSshhkE1Cm/RJbkFMoSzyc4pHlG8PMPy30OXnvpDMN7VCi5le7yjTX04OmLb0gIku40CgYBToVGoM/GIQy7uZstpPR+I2bu1YNnQdgLMovn90SoEreTcXrPnWGnV+15IcUHirs3Z3LyAAVO51kxTEauaPArCPZ0yI5ppU1oNFuRF+NggZK/UgAHO3sieobPYGuwvBwo+QINfK4xSh7eUrnpE0zPLsZ3PtzLlzjx1vLCUjv+5Sg==', CAST(N'2024-11-15T22:10:18.9656650' AS DateTime2))
INSERT [dbo].[ElectronicSignature] ([Id], [UserId], [Status], [PublicKey], [PrivateKey], [UpdatedAt]) VALUES (N'8ef12ae5-bd50-4174-afdc-1c0a2aa27ed5', N'3df19402-0808-47f6-9d47-e15b5a0df798', 0, N'MIIBCgKCAQEA0C9LTxi3YlTdvOnfbuWunWxwQcxq++RlGdxw2/NrI0FAGXZnm7uhoVF4fH6Dw8z90liLcw5ICZr4g99ewL4rUypKn5R57tzXqEHl68U2o1E4QXXtGZWTSjsMyU1CbkvdX7z83Ylshv/DXVVtkmg/DYbzXHLDxUIZ82+6jnQ6N0R8onNqk/1YaW7QxFRs2VF/wLaUeupil9z7W5kFWwgDEcDttEYskbsuCzzrJ7YPZ65qo9pqXWOy2H6ldvU7fsDJd1W/X1a7tOEL3QePDBhZ+FmrdMecguRmKr3c0N6vPJ92ec4t5G/Zt46i3ZD7BmBsz5ZMGdPfbQxjLbLQ3Yp/hQIDAQAB', N'MIIEowIBAAKCAQEA0C9LTxi3YlTdvOnfbuWunWxwQcxq++RlGdxw2/NrI0FAGXZnm7uhoVF4fH6Dw8z90liLcw5ICZr4g99ewL4rUypKn5R57tzXqEHl68U2o1E4QXXtGZWTSjsMyU1CbkvdX7z83Ylshv/DXVVtkmg/DYbzXHLDxUIZ82+6jnQ6N0R8onNqk/1YaW7QxFRs2VF/wLaUeupil9z7W5kFWwgDEcDttEYskbsuCzzrJ7YPZ65qo9pqXWOy2H6ldvU7fsDJd1W/X1a7tOEL3QePDBhZ+FmrdMecguRmKr3c0N6vPJ92ec4t5G/Zt46i3ZD7BmBsz5ZMGdPfbQxjLbLQ3Yp/hQIDAQABAoIBAQCHwH88GaLjVPGukVaoKs99Scu9rD2K+bjPb0aMtqMDPzY8JFCVZXmVBtopXBox4IcW1bRBF2v0D4DEBTD1QExiE67Ldnc4QfvCdQ4netcREhI75VjxmO6Ntgm1blLGN2QoXMUK9OS29yp+vwkPMjkDah9hBlkQVPU1H4MoBzQ6+plhMUv9608FPvuEJjlPkxRZ8xX2G84dESHXm6/h3aAjmUOh0QBPQXO2M9Yk1gLTnTDkhUUWrXPhDN62yFkTdg2ZXtlUOA1OvRVZBeWxkSgckaZoGGFXJA146tIz7y61n9vTv0jotiyk3IuuNcbedk2ASScYV92Uw9z5X180JDhVAoGBANxySSsiJcYNpRCJWQlud2yS6KWtPGQ84jhe7tMb/07xNQ33uF1xjr2w8Cbc04PNcPcD9jdao2biZR0YBE5+nER6tztH19INdsCfjXAAO+CQbCH35QoRHUPmqG4bI7fBBkDODQx8nxaDHyOuvAJtYGts5dhR7y7W29/UQ40Zp05zAoGBAPHCwJBhOQ9YVOQ4T9OMCU9JVvbB7YnZR6AHTPVqlMoLcJSOdDeh/LOXU6vv/2ERHpqhPP9U8sGuiKsKF7bqETZIRPSJi3iwKjO4ns7nZgWZ4JeJb6xnW7K/rQ+W9hgbkymh73r2TYK2PxpiQ0cnh1pVYXLRxAfSOQJQiWveLUQnAoGAGtNRcg1CuXoZlwyPqCUoJS8vXlHZYn1CLgfnWgszI0EY6q01YzGZZB3u61u95XEPiQ+TW6MM9U0hbsvoYkDn9TFVsMIKUkZPKBuCU5nDr40Di5Kl7XatsACWiGeHDipP/3zTe6yCk3O7S1VNDaKPtCLZSVyXFYUR1of2/GmdwV8CgYAzqsFomb6ODvylgXtd5JGgxjW1qqBPU4ZBJw5FbK+7tlIrDX683Puajf6twi672eLGfSsCDm+LAPfoRdHnn4JqLWu/Lx4FfvCl+RDHeyCMleQvvomFONmaC+i6ajLR2CLNRPRfPQA3rSczRkjGjiYZIiIfXcEdQso4OmoECYl3BQKBgGi+Ljmb/pCVS0vtQSOklGrsYlzroLe/3ApN6YbvXEph03rLzsgicg7iTFKvYWa8MchA30hvTZBz6MPThyw18iaQ2ZJMIDVJdXLDJazpodMoZfGOI7vTJ7errYhnlQoChOeKVown6HDBCFVoaPrM5jiYjDbXkoll2zJmL7BZ5KYQ', CAST(N'2024-11-15T22:15:20.1639381' AS DateTime2))
INSERT [dbo].[ElectronicSignature] ([Id], [UserId], [Status], [PublicKey], [PrivateKey], [UpdatedAt]) VALUES (N'eced9084-3795-4b0a-8016-59c7bfd3dff5', N'9b7c2d93-7d20-4406-8a0a-7883cc4f3c3d', 0, N'MIIBCgKCAQEAxn9MU95d3gBgxjhsGbsYQ9HVbmZ+3qZIM9U75Sz84EyZi2fSH5NrVigLILCi8vG9gxr80GhtKNandD9xNAdl5AMTwByrXGApY8gj/soHHUErl2nQNRPH0OTBe8ID6Sxx3cFeq0LRhkYtCH6KGexLIGPNQWeAMINVJkMci026cZAMjszSU6NLXdnZivku7adjoqaoiaWYTeId5cjqtbWflBJFBahmIG53hcvYyCyM9k92yAIbHcny3cVfcv92TrFoLU0kdHpMGkvTn3B43Fw/VFOhGYX4FcxMur+L1TRna9jon+YJvLZ9LNfm8LnOM0GPduhdVEzn0h/DeUnlAsBQPQIDAQAB', N'MIIEpAIBAAKCAQEAxn9MU95d3gBgxjhsGbsYQ9HVbmZ+3qZIM9U75Sz84EyZi2fSH5NrVigLILCi8vG9gxr80GhtKNandD9xNAdl5AMTwByrXGApY8gj/soHHUErl2nQNRPH0OTBe8ID6Sxx3cFeq0LRhkYtCH6KGexLIGPNQWeAMINVJkMci026cZAMjszSU6NLXdnZivku7adjoqaoiaWYTeId5cjqtbWflBJFBahmIG53hcvYyCyM9k92yAIbHcny3cVfcv92TrFoLU0kdHpMGkvTn3B43Fw/VFOhGYX4FcxMur+L1TRna9jon+YJvLZ9LNfm8LnOM0GPduhdVEzn0h/DeUnlAsBQPQIDAQABAoIBAGkmdCuVh0ocDyfSKcmzp9X9aT+zgg+2LFdw5OqxW0ACs+/6ToA1ms2oJsTpbVifIJI8EKLiPrk8hLZ7CR/Tr3ELBEJnrYsg0awvEIpfQUeJB2uNPSNw2A/brnc9vs6dobAkSF8W5WFo+WAfkE7NMrr0w32bM3f/inLbaFqPEW4oPuo9UL38n0JgZE3gzSHT1Uq2o0LoMal+xfvIK/Fj0qjVQdYHn5XWMlX6jmpK4okPxR0l0haJXW/u3CmRG396tnW1s9ToJ5fnLqjRg1hL9YBEuC8ciqPHZswZ3600y7oCqHMYWmpGn6EfHWhVXpLbhiPmkmbqGKH6186k6+DJ9e0CgYEA3FTKVEC5KYmhtUWETifrmN3bqB2l+u5Hr4GdCoAdZif8gqJRhppUHc04ieJYC/ap67xF4Xav269Gp+70WgMmy5tYOUCj5HbM3WE9rBwBUfmplBh8xYw3EiNO4hj0CBdPmQEru2sDpAnPOzLlJJmTOZ65WaRKQVwBLzpN0iBL2vcCgYEA5qGkFZ7HuyW2AH254CfdpRG7nMvdAx0Sl8jJiDKWefBnLVZMhAC7jr7YEwmZRUNSd6cvY6E4uNKoe2LDUVLr0oHWDhG38mhnMQ6oVrYUwi+ElKQW/u61Wk2T/FZZEW8FRxzDmcWOpJtkh/ems5zG/mMDrPtFrM9Nqb6olR/szWsCgYBHD63F6K4PgI1AGrCmSGfLANsEaLOMr+c86q/MoC9bMFBXjaR/piy1A+hVSEQfb6m0Fx/urMnhL7G5He9/TH7psiuNI5T4bXx7dg5fARVH7B7OXet4B1YHqo2ZjHTAW0xXy7HgG46sDGHi9PJEkKeUMOYUzFEKrXLQWZyZxcLRVwKBgQDPC9/1tOTUIyfASx6amM+HiGLogbA5QllVwGEEj329nM/TyLzKaKn4nWX3uU9K+gRH/OQzSiJU8nFky6ZTFOE2y26ylL+RtJ6nUORZa/840VXx51nppb1Tg3/OMmqllwii7bTAELZdGk/nLLIQXzfaWmOLYM0NNdIgCFTqA44gXwKBgQCnOfBeg7yhRZqnz2UjHtmDe2NIZ+N0Oy2jCzfW5g2ytZocBi9oFpGbxWokTikw06r6WRWTa2UgVocMLTjYFRidX8DqlNhawTmSn+TvtD0j1rLYsX+VRX+Rzb3nb+zXImLIrnj/fmGPHGy5uaH5sfNkCThRQCxyQ92vvADo3alSiQ==', CAST(N'2024-11-15T22:16:23.5947666' AS DateTime2))
INSERT [dbo].[ElectronicSignature] ([Id], [UserId], [Status], [PublicKey], [PrivateKey], [UpdatedAt]) VALUES (N'91ae2c4a-e5db-410e-8509-bf59a990173a', N'1c004580-03da-44c4-b52f-436e4ae47bad', 0, N'MIIBCgKCAQEAupKPKEloXfMbGvVptI3I3i2nDNoVa6Mlp+BaWZdhQLkuAIWbF4cQHj/2h8SBgRP910FJ4nAl4CMVaKK8HALwIY/+LWmtxkhEOEwOyNInu09YVldMuMgJRgRs6f/pXFQpG0SMu0HATJVFmVrly2ojE77qJqDcaUW4b8PDa6Lo416TA5HQiEV5YT0ufE2PjIYfFkExq7Q+XoHK/JwJVi5533DivEJ1N8Uy4K0q7EYfZlP6hFnAwnqr5xbuw7PzdbsQT8jNnDsMfjNlpfQ2wmVq6ePxxwUDZ6D0G8QmGgYetRQWyU5/YQFgz9vmimEGKYOfONRYkjq0eX34Jrqp8wq+ZQIDAQAB', N'MIIEowIBAAKCAQEAupKPKEloXfMbGvVptI3I3i2nDNoVa6Mlp+BaWZdhQLkuAIWbF4cQHj/2h8SBgRP910FJ4nAl4CMVaKK8HALwIY/+LWmtxkhEOEwOyNInu09YVldMuMgJRgRs6f/pXFQpG0SMu0HATJVFmVrly2ojE77qJqDcaUW4b8PDa6Lo416TA5HQiEV5YT0ufE2PjIYfFkExq7Q+XoHK/JwJVi5533DivEJ1N8Uy4K0q7EYfZlP6hFnAwnqr5xbuw7PzdbsQT8jNnDsMfjNlpfQ2wmVq6ePxxwUDZ6D0G8QmGgYetRQWyU5/YQFgz9vmimEGKYOfONRYkjq0eX34Jrqp8wq+ZQIDAQABAoIBAQCXvdd9FqcxsiWbeXothRuXyF2TUFQXpStdLFWPhFVuxK2rcv6+1fTABZnGtoX1q4LK7ajf6AKGF0K0RZbk2WbghTJfURIqsF/7wbBMmNADwfbA0mPt7ZPNRJAoiSENHM4KBWjIbCOwpb9jiNBY7sv0pVPfcvmRDUmCbR+ljWwIb17kxp/rQHwnzH4vlDz8in/0gsydPkhv1UhtAlPCieEVQQkDBanw0N9itYsTQNP3rw2/e8DUvf+obTMgH0c5TonEU1J/ZW77C8d9U8TgUfk12qRoK78RVysc3lPU5GDAL4Dtq3C1LmY9kCz79iwX7mP9zhlsKyhudG/Fr1dmDddJAoGBAMHLZp8j7/+ip8DzF5112XNcEIOvj5uMmiSk1oyyJH8hKSiMrmqyyZTAOyT3TRJq9tAW+NWchz6EoqUszGfozVX4wH7i6MrDV418gDOG3Gm7ReG5bAbvFd3qFVbsQppwAH47xV+Tpg5ItHIrt99ks3+0cf3qTSBpJ9MgZyKduQKHAoGBAPZ1tGzouf3qsJBbKMOVeya97seOEVb+EDkHe92Tp0r7vwJGo2BuFrbYFOXIpyM09s0WLlL5J+G8Vvkix6hTgdnyr8mddKcbBt2QiO7IHom1O0vVsShdCo0o5+5Bu5zqStoRPKH3G22sdd9Wad6DwGsS/ThS+RLNcr/H2IhkjrazAoGAS66doySrw4/IJ6hH3qx5gX3AzUywrrSYNhtR1pxzeFqA8l8OdojgBIGWF3ek176CKP3vq6x3fMjbo9n88c+O8TY2JteCxjzHYm/uuTC/v2LthZuePo78YS/bqZiW4i0/ZAz/pbXJseZe4f+EzW9MUmEr61enSzMF5IPRA0nJSN0CgYBVmWgC84m1wQ9189NiqsZNHGaUdKldF3y28fx5ZtER4AHlXndcBKBq/P21GU3Dkp+td2i7dMH/SxTCDuxdcDOHaRzY35EmgOKPjaWhmWvR1Fo16pBPPpFtmamEPNxWkaFRv+7ZKiQioWWHHlJC8GuiRMQiDd9oQmb6aQSxyosutQKBgCdB4lc+cNOPqjOkcABpi4eE67a8VMvPOKeNX0YtEt0/z7QRLyn1C7YTRfU73ZAi5UXoV8CbfaGDwLM4t1LcabCr6nfaLiK1+3Jn7TeCmaqMgUrG6ZjVdFE3uLatjdw0OIFVLWtYczGpzfYcuODb7zfIS61bJOyYs21COILPei07', CAST(N'2024-11-20T21:11:27.8406783' AS DateTime2))
INSERT [dbo].[ElectronicSignature] ([Id], [UserId], [Status], [PublicKey], [PrivateKey], [UpdatedAt]) VALUES (N'1262d4a3-711f-44d7-9d4e-ec26fa536225', N'd486e012-c894-4cf0-b036-445850887364', 0, N'MIIBCgKCAQEA8+GejpcuuElvpqGmb02/3E4EuLnTW3yo1YbCwRFVyrimvOUbfJM8plGBJ337xhYbgO8Pr6KA6xM92GQ/HBHh1RO3YWmVMj9aghRDIloSq1Ju3aM0+0g715Ol0AIXP3bT/AemZdx5j8yEaQCy/vP2cl21bJmYAAMUIOePpdz3SEGIGq/W8zab1T8NOQmd1DiPt5vlhzlrtX2Y0iRodQEUmlRC6d+LeKVR+OngcBzDwQskWyoCedSXy8jZ70rgJQz7WrNkSzRf7fEy5CvDXVKOlpk6t/Ah3O+ChMRU09zhbZ9XeXWU79GyQ48OpTNudwRxs4dqb1dqS6v6+ns4tDFHiQIDAQAB', N'MIIEogIBAAKCAQEA8+GejpcuuElvpqGmb02/3E4EuLnTW3yo1YbCwRFVyrimvOUbfJM8plGBJ337xhYbgO8Pr6KA6xM92GQ/HBHh1RO3YWmVMj9aghRDIloSq1Ju3aM0+0g715Ol0AIXP3bT/AemZdx5j8yEaQCy/vP2cl21bJmYAAMUIOePpdz3SEGIGq/W8zab1T8NOQmd1DiPt5vlhzlrtX2Y0iRodQEUmlRC6d+LeKVR+OngcBzDwQskWyoCedSXy8jZ70rgJQz7WrNkSzRf7fEy5CvDXVKOlpk6t/Ah3O+ChMRU09zhbZ9XeXWU79GyQ48OpTNudwRxs4dqb1dqS6v6+ns4tDFHiQIDAQABAoIBAEumW9GtUb+2f9y3XfI+stn6lXpbohVJ6PE7OSQ8ZVlZx9bmVo1g+ro4pBCFAtliOCvZfAsmJElHEbMS/YSOg3feAs9DuhT5E/Evqdd5Czt7eYpkuuWLdYycbx3D2ERGbuFJ2jLUnhyd+yC7J8rwEC1PphxG1KCEU/UU/zka/tW5ayL9h64L/Lsf5oKLgWqdgYgOQAgaTWz37oyhTT+VCC1z+TclgD4pf5sboXF8dLjyN874C+y1/svwld+r5P3BhbMWnWVoNkuMq+MhgYNSff0by//s1WlmKaBkdYA+WxSaEim0ScBSplksirSShEXSF73WjlKt8hZea7EW/wKvR6UCgYEA+G1Bly30ZaVOXoRx07K6VzG1hSFgcQP8iozGVTZvqNERSuqQzwfP1QK90wONQFljelPZR5Vbqqiv56G8kEpWtYbZPdnWPxTpG1TXroETNRrtRztOyeU2vPfioeMBoTUXrdpfFp7hjPtWNk33u9mcVgFPHujC/luChd/IyOJSWzMCgYEA+1Dj2GN6t/SE56UKYo2ahxUvH9RyQ+4SO283I74UZvtxM4WtRAUEaXkL68/x0rJumLLOe8rymsfbgiKeAcIGB7ZBR4yV9Mab02jtituEWrwcqxgUFd1od34sD6P6mlxnsTr4E3IQlsVldosTPSUAeX0TB9+71xYy02SiMNWbclMCgYA8HZw4rDsu+bCcOKqe0uo6vWGypKAE2TUchfJcnn6ouGbZ3SdLohVN84rh7EMbJkZnTLEQnHkBNC7U+5N4yzRuWwJo8DTjMPkzzvUeWke+mxR+H0DypE/5rHagPCGh1Ao13NkTzUDBb/St0XI4d/FX8psl3KeLC7PrF3sr+XB6dwKBgC/+zsSwmusuw4MJveX8bRqHLSzDAd9/Q/Qd1UX6MyNHueLBEMoAu0r5VxF98QzwDrcSzuRNae+tY3qC6fIj/8rRP75OVwUcOP4y98qhCbHaYw851fwnAKBxdDC4fE+mfhcWz/HGwuxIXow5Gz9+JY0OGehTDiiRkLtWaLMy2DEJAoGABbNDosX0c9TtRJSFoT/VEyiPnCo4KtSZ01n3ZD1e3LcoojjxQ4iB8jgkixFhjZe0DGOfxR7aqyVTsMtFi3OttAh/jqjKo7jDcwyZ77XUHkegyMDOy86A4Tb9kx46dX1RP/hsy1y3/gJYq0zMJcTghQhybV2L6Fa+pJngqO1Pdjk=', CAST(N'2024-11-15T22:16:54.5218025' AS DateTime2))
INSERT [dbo].[ElectronicSignature] ([Id], [UserId], [Status], [PublicKey], [PrivateKey], [UpdatedAt]) VALUES (N'c84dad6a-c55e-41f9-a400-ee5a49a88c0c', N'89675a85-e1bc-459b-8036-9e1597ed929a', 0, N'MIIBCgKCAQEAuypi6UpLLFNj7g6PK7Dj2KfhmVKdQ8MJLh38gNvht8ChI0PPdp/zMBfNANB6bf78YVxC+qlFE7nnHTqsO0snhSxCOMmHaKQGrJTnAIqG4N9h1AAUEVbmu+tHkP+v1Jympaf/+xNyTsSbI90sf9V45xn+B/XGCf8xAvGd90BAY9ZCXfUjQRUQZlz9s2vc+/sCLqJRtmM/cHgbNRw5keZzsWe9k/oD613FY7qS/5VDYYId553P6euZW597A/W8cGZVWcHRv07JMc5WCQxQi3tXbScaZAyk89RcTmb5GSPxvT89E10jhwGv3beBBJfJjee0bWQLyPmiYbeV9EElNwRxAQIDAQAB', N'MIIEpAIBAAKCAQEAuypi6UpLLFNj7g6PK7Dj2KfhmVKdQ8MJLh38gNvht8ChI0PPdp/zMBfNANB6bf78YVxC+qlFE7nnHTqsO0snhSxCOMmHaKQGrJTnAIqG4N9h1AAUEVbmu+tHkP+v1Jympaf/+xNyTsSbI90sf9V45xn+B/XGCf8xAvGd90BAY9ZCXfUjQRUQZlz9s2vc+/sCLqJRtmM/cHgbNRw5keZzsWe9k/oD613FY7qS/5VDYYId553P6euZW597A/W8cGZVWcHRv07JMc5WCQxQi3tXbScaZAyk89RcTmb5GSPxvT89E10jhwGv3beBBJfJjee0bWQLyPmiYbeV9EElNwRxAQIDAQABAoIBAFJHHdhEaqt/tSxPhizExETX+Fq4cJ37PSvizr+u6Zknuy6PfsI9KmD39YzoGQoFz9jVADTE+LLlRG4a/t/J+AOZIztnjHk5sh1oD+yy+Pwd9xmFN00wEJqHoZxial9ixfeI1QUA1X0+/JxVfFxt8YpWaNADAR4f6uHKaZDp0+SO6WkXB5rblQ7je6SbAk7RkmqIOKodlxjUKc0g2Z6/JzSrnnpfELKrA3nWwRzDzUxnBXx57sarEzQrO+3ZbrRU55CYJE4fzNhAacYv5YlsC7uxxmJWcJkfQgkLXuSJINsCaSenbL7fajhveoRgKH4dfDqmg9gIJVNQIWcXXWmc3EkCgYEA04ttJu0EGU85DCzbkcXd0G+qygT0kDiwF8z8EcXIR4nysj+38nsoczUylEROl8c9p/cRabDYMqQSxns66/3kY/ct3V9HCfnHJvTKawmUnYN7LGWUC9LyuU4ejoceZPUZmZrAuzx4DkOv9LGWUt0HxzqxafnSVAdjl5eVJqkinlMCgYEA4n9tYBlkQu94KIu2LLwPSTQcl0snjTwfyBvzYdNBUzxHOAZZ9iAvb/WbUnU2VnByr4YsOdwUCsqLKICB1WPQXrPiumbahwG+DbLfNpZp1bpHcsPDnx8R6XHwBVgalEMvtq6B0Uh+EetoiX/2PfYmDN2nbnrc5u1JTncuJi0dANsCgYEAuLH7u8emE37ivOmRTsWls207fSQ0bpK/1BfpYI8BHMypM82ECdZTa7rfjSnSQJv5DeQdtNxs9lHf/qDqwc4rEMhnp+aevGvy3+VLsYZs1dVMvmd1iZlEyFsXPLNl6xk/n6fIa/EQlMuuHYLLT0+hkeWBrpgqdaj54Am9dEKpcfcCgYByYJUULV5jKtjL6NmjN4ikl+tEP5CGkvEdtXevU+YuKUdxtEtjrhcme6nm9wfsmLZhiuj0gv2gAW5KkrJ91vzXhhGdvejmumuGMWjlAQoLAxmni9JSnXcHIyFpIXeynUcQAonN7MS1OeK9ZOAtpArM/nXZpbO97d/R/v9QCgIWdwKBgQC5wIR5wHDNYligEYmU2qw+Xqs0q+XWg7cM67BnWmGfXgJXr4H2frPJ80JEZaq+JNCQoxjaXeIQLR8P+IZvF/RY8JzCU9ScOODDgexPxi7LQExeSB3NkStxSSblpjVFew9kGKq0XwehkEfwmjZ7KhdI1agjd3lgl7FKDGntolTCzg==', CAST(N'2024-11-15T22:15:50.9808660' AS DateTime2))
GO
INSERT [dbo].[Evaluation] ([Id], [UnitId], [CategoryTimeTypeId], [EvaluationName], [Status], [IsDeleted], [UpdatedAt]) VALUES (N'30a176a2-0fad-4b72-826c-15b4e4f4a5a6', N'685ae7bc-6d3f-46ff-8ef8-b5bc25d2ddc5', NULL, N'test ht tao', 0, 1, CAST(N'2024-11-20T20:52:07.4556730' AS DateTime2))
INSERT [dbo].[Evaluation] ([Id], [UnitId], [CategoryTimeTypeId], [EvaluationName], [Status], [IsDeleted], [UpdatedAt]) VALUES (N'0eee7f37-91f5-4ed8-8faa-17d0320853f5', N'9fc274de-cfb9-46e1-9682-c8200ef4d7ee', N'13d5e5a0-7eda-4725-9e56-455790a9c0a2', N'test ht tao', 0, 1, CAST(N'2024-11-20T20:52:07.4557357' AS DateTime2))
INSERT [dbo].[Evaluation] ([Id], [UnitId], [CategoryTimeTypeId], [EvaluationName], [Status], [IsDeleted], [UpdatedAt]) VALUES (N'7ee8535a-dfbe-43bc-b51b-2a6094fbecf8', N'4402c619-783f-4580-83cd-86e50a47171d', N'13d5e5a0-7eda-4725-9e56-455790a9c0a2', N'Phiếu đánh giá tháng 11 - 2024', 1, 0, CAST(N'2024-11-15T22:19:53.5737052' AS DateTime2))
INSERT [dbo].[Evaluation] ([Id], [UnitId], [CategoryTimeTypeId], [EvaluationName], [Status], [IsDeleted], [UpdatedAt]) VALUES (N'2be3d999-0bc8-42a0-93be-332a07da7395', N'c8e8fe3c-4e4d-4d25-a5a6-3f175fae3d5f', NULL, N'sasd', 0, 1, CAST(N'2024-11-20T20:52:07.4557359' AS DateTime2))
INSERT [dbo].[Evaluation] ([Id], [UnitId], [CategoryTimeTypeId], [EvaluationName], [Status], [IsDeleted], [UpdatedAt]) VALUES (N'fe7a18ea-4c55-40ae-92af-4b3b85fa3944', N'3878d070-67e7-48bf-9382-039bae5397dd', NULL, N'test ht tao', 0, 1, CAST(N'2024-11-20T20:52:07.4557360' AS DateTime2))
INSERT [dbo].[Evaluation] ([Id], [UnitId], [CategoryTimeTypeId], [EvaluationName], [Status], [IsDeleted], [UpdatedAt]) VALUES (N'810ef289-d203-4b9d-9a15-598ea91a5abc', N'4402c619-783f-4580-83cd-86e50a47171d', NULL, N'test ht tao', 0, 1, CAST(N'2024-11-20T20:52:07.4557360' AS DateTime2))
INSERT [dbo].[Evaluation] ([Id], [UnitId], [CategoryTimeTypeId], [EvaluationName], [Status], [IsDeleted], [UpdatedAt]) VALUES (N'26e3575b-94c4-4e95-b1af-5c64e5f8b506', N'1feb11df-bb8c-4871-b916-3225c3897d40', NULL, N'sasd', 0, 1, CAST(N'2024-11-20T20:54:49.7962263' AS DateTime2))
INSERT [dbo].[Evaluation] ([Id], [UnitId], [CategoryTimeTypeId], [EvaluationName], [Status], [IsDeleted], [UpdatedAt]) VALUES (N'31767778-893e-4d54-8053-764ef58bed91', N'93684774-0d94-42c9-ac77-078b6e3d2366', NULL, N'sasd', 0, 1, CAST(N'2024-11-20T20:54:49.7962791' AS DateTime2))
INSERT [dbo].[Evaluation] ([Id], [UnitId], [CategoryTimeTypeId], [EvaluationName], [Status], [IsDeleted], [UpdatedAt]) VALUES (N'08623732-8154-4a15-b6c6-9aa532ef2ad7', N'22b62062-301d-4709-a5dc-13b99f931f02', NULL, N'test ht tao', 0, 1, CAST(N'2024-11-20T20:52:07.4557361' AS DateTime2))
INSERT [dbo].[Evaluation] ([Id], [UnitId], [CategoryTimeTypeId], [EvaluationName], [Status], [IsDeleted], [UpdatedAt]) VALUES (N'892b6556-f6be-4eab-b978-a407155dbbbf', N'4801aee9-d3dd-4330-ba8a-4fd180adc15e', NULL, N'sasd', 0, 1, CAST(N'2024-11-20T20:52:07.4557362' AS DateTime2))
INSERT [dbo].[Evaluation] ([Id], [UnitId], [CategoryTimeTypeId], [EvaluationName], [Status], [IsDeleted], [UpdatedAt]) VALUES (N'72d6ae46-ff5b-4cdf-88db-be5b90b10474', N'4402c619-783f-4580-83cd-86e50a47171d', N'13d5e5a0-7eda-4725-9e56-455790a9c0a2', N'Phiếu đánh giá tháng 11 - 2024 - VCQL', 1, 0, CAST(N'2024-11-20T20:57:04.7705083' AS DateTime2))
INSERT [dbo].[Evaluation] ([Id], [UnitId], [CategoryTimeTypeId], [EvaluationName], [Status], [IsDeleted], [UpdatedAt]) VALUES (N'087d8c8b-ea71-4741-bc9f-e0b64147d2d8', N'260bcd0f-d423-4ba0-8d5f-b1935c177f32', NULL, N'test ht tao', 0, 1, CAST(N'2024-11-20T20:52:07.4557363' AS DateTime2))
INSERT [dbo].[Evaluation] ([Id], [UnitId], [CategoryTimeTypeId], [EvaluationName], [Status], [IsDeleted], [UpdatedAt]) VALUES (N'9b6937f7-b945-4bb0-8305-e122a27f1599', N'48c504d3-7b0a-4fc9-82b5-46e58b9b79fa', NULL, N'test ht tao', 0, 1, CAST(N'2024-11-20T20:52:07.4557364' AS DateTime2))
INSERT [dbo].[Evaluation] ([Id], [UnitId], [CategoryTimeTypeId], [EvaluationName], [Status], [IsDeleted], [UpdatedAt]) VALUES (N'a21b69e1-d858-4045-9623-f2eb070c279a', N'0877da50-70ee-41f6-a5fe-c4d6b50591a6', NULL, N'test ht tao', 0, 1, CAST(N'2024-11-20T20:52:07.4557365' AS DateTime2))
GO
INSERT [dbo].[EvaluationAAE] ([Id], [EvaluationId], [UserId], [SupervisorId], [Advantages], [DisAdvantages], [AddReviews], [KetQuaHoatDongCoQuan], [NangLucLanhDaoQuanLy], [NangLucTapHopDoanKet], [NhanXetUuKhuyetDiem], [NhanDinhChieuHuongPhatTrien], [IsDeleted], [UpdatedAt]) VALUES (N'e41b61f3-43c0-4b40-bcaa-37beb3221feb', N'72d6ae46-ff5b-4cdf-88db-be5b90b10474', N'd486e012-c894-4cf0-b036-445850887364', N'1c004580-03da-44c4-b52f-436e4ae47bad', N' - Tích cực, tận tụy, có ý thức trách nhiệm với công việc.
 - Luôn chấp hành mọi chủ trương chính sách của Đảng, chính sách pháp luật của nhà nước, không vi phạm pháp luật, không mắc tệ nạn xã hội,có tinh thần đoàn kết,sẵn sàng giúp đỡ mọi người.
 - Thực hiện đóng góp đầy đủ các loại quỹ và các nghĩa vụ khác của viên chức.
', N' - Đôi khi chưa đảm bảo ngày, giờ công lao động.
 - Chưa hòa đồng với đồng nghiệp.
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
+ Lãnh đạo thực hiện mọi nhiệm vụ trên nguyên tắc tập trung dân chủ, phát huy quyền làm chủ, xây dựng khối đại đoàn kết giữa các bộ phận, tổ chức trong đơn vị.', N'- test 1', N'- test 2', N'- test 3', N'- test 4', N'- test 5', 0, CAST(N'2024-11-20T21:13:14.1577896' AS DateTime2))
GO
INSERT [dbo].[EvaluationConsolidationAndTransfer] ([Id], [UserId], [UnitId], [EvaluationConsolidationAndTransferName], [Status], [UpdatedAt]) VALUES (N'088eff96-d5a2-4b55-bd25-73912fba74cf', N'd486e012-c894-4cf0-b036-445850887364', N'4402c619-783f-4580-83cd-86e50a47171d', N'test', 1, CAST(N'2024-11-21T21:01:19.0046122' AS DateTime2))
GO
INSERT [dbo].[EvaluationConsolidationAndTransferDetails] ([Id], [EvaluationConsolidationAndTransferId], [EvaluationId], [UpdatedAt]) VALUES (N'd8e16edc-5a48-46a1-b0b7-ad8964d28b76', N'088eff96-d5a2-4b55-bd25-73912fba74cf', N'7ee8535a-dfbe-43bc-b51b-2a6094fbecf8', CAST(N'2024-11-21T22:26:35.7634398' AS DateTime2))
INSERT [dbo].[EvaluationConsolidationAndTransferDetails] ([Id], [EvaluationConsolidationAndTransferId], [EvaluationId], [UpdatedAt]) VALUES (N'e2fbb3d2-a438-47de-86ea-d5745079dc69', N'088eff96-d5a2-4b55-bd25-73912fba74cf', N'72d6ae46-ff5b-4cdf-88db-be5b90b10474', CAST(N'2024-11-21T22:26:35.8057709' AS DateTime2))
GO
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'd4090749-acca-4603-a5f3-019cdc82cd16', N'7ee8535a-dfbe-43bc-b51b-2a6094fbecf8', N'ca2c80e4-c9e6-4bc1-a080-1c0505bccaba', 0, CAST(N'2024-11-20T20:55:10.6334545' AS DateTime2), 2)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'5a65bfac-674e-47de-9cb7-01ddabe4bd05', N'0eee7f37-91f5-4ed8-8faa-17d0320853f5', N'8b678550-a782-4ed9-a61f-15887cf5a73e', 1, CAST(N'2024-11-20T20:51:57.1240780' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'b889d850-fe2f-4af8-ab5a-02b48f0d2007', N'0eee7f37-91f5-4ed8-8faa-17d0320853f5', N'e296f2f3-e89c-49b9-b304-b76df59719ae', 1, CAST(N'2024-11-20T20:51:57.1241282' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'15a02d02-2389-45e7-a411-07a78f0ca935', N'0eee7f37-91f5-4ed8-8faa-17d0320853f5', N'ad4a5bce-f3c4-44a7-85c5-fdb1c2d19d12', 1, CAST(N'2024-11-17T15:56:50.9842415' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'7c589ad1-7e06-4be6-8a94-07c3f13aef31', N'0eee7f37-91f5-4ed8-8faa-17d0320853f5', N'a7efdc67-aa93-46cb-8410-0ddcfe0d5853', 1, CAST(N'2024-11-20T20:51:57.1241284' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'07bc1fc5-5675-472f-baff-0aaefa608198', N'0eee7f37-91f5-4ed8-8faa-17d0320853f5', N'6f0a8890-c105-4fb4-874b-9d559847eca6', 1, CAST(N'2024-11-20T20:51:57.1241285' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'd2f05d23-6b48-4340-9846-0db3d2a9585a', N'7ee8535a-dfbe-43bc-b51b-2a6094fbecf8', N'51ef79d2-b47e-41f1-a99d-f5c0e4f4416e', 0, CAST(N'2024-11-20T20:55:10.6393861' AS DateTime2), 3)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'8aa5ea22-c74e-4b9b-9963-1415daabed0f', N'0eee7f37-91f5-4ed8-8faa-17d0320853f5', N'1fb789cf-87b0-43b0-a45e-e85e3891a9ee', 1, CAST(N'2024-11-20T20:51:57.1241286' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'5ebc19a5-dafe-4db0-ae9d-16fd12257475', N'0eee7f37-91f5-4ed8-8faa-17d0320853f5', N'31314875-8f03-4874-be17-0f31c14f28ee', 1, CAST(N'2024-11-20T20:51:57.1241286' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'72977a23-5a43-4b1b-81e0-1ad2e50921ba', N'7ee8535a-dfbe-43bc-b51b-2a6094fbecf8', N'87fedc0d-caae-4890-80d9-a6e086d71a1c', 0, CAST(N'2024-11-20T20:55:10.7608091' AS DateTime2), 23)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'07f0374d-072f-461b-987e-1db664d5dc38', N'0eee7f37-91f5-4ed8-8faa-17d0320853f5', N'f4c06feb-eb3d-4f75-95f9-10c0289de995', 1, CAST(N'2024-11-20T20:51:57.1241287' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'b24ca437-f685-46a5-a707-1ea3d7b44036', N'0eee7f37-91f5-4ed8-8faa-17d0320853f5', N'b9ec64fd-8aac-44db-8541-67b1c6162676', 1, CAST(N'2024-11-20T20:51:57.1241287' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'b8f69882-d8ca-41c3-ba8b-22014e0bf03c', N'7ee8535a-dfbe-43bc-b51b-2a6094fbecf8', N'a7efdc67-aa93-46cb-8410-0ddcfe0d5853', 0, CAST(N'2024-11-20T20:55:10.7270728' AS DateTime2), 15)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'807444b5-6210-4332-91f4-2393a57db1b9', N'72d6ae46-ff5b-4cdf-88db-be5b90b10474', N'87fedc0d-caae-4890-80d9-a6e086d71a1c', 0, CAST(N'2024-11-20T20:57:01.6863818' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'eff3145f-bce3-4a6f-b761-252472d3d5f4', N'7ee8535a-dfbe-43bc-b51b-2a6094fbecf8', N'0f8a3810-dc07-47e8-a089-7d6c08107382', 0, CAST(N'2024-11-20T20:55:10.7809126' AS DateTime2), 28)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'eea7df8f-459e-4e00-9313-2626d165d3d6', N'0eee7f37-91f5-4ed8-8faa-17d0320853f5', N'e6d88410-17f4-479b-8e2d-8b6d5c0324a7', 1, CAST(N'2024-11-20T20:51:57.1241288' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'5ae27d82-b27f-4635-9cb1-26d127aa656f', N'7ee8535a-dfbe-43bc-b51b-2a6094fbecf8', N'e296f2f3-e89c-49b9-b304-b76df59719ae', 0, CAST(N'2024-11-20T20:55:10.7849584' AS DateTime2), 29)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'c9edb2f8-6010-42c9-9bca-28f2cc06e9fa', N'72d6ae46-ff5b-4cdf-88db-be5b90b10474', N'1fb789cf-87b0-43b0-a45e-e85e3891a9ee', 0, CAST(N'2024-11-20T20:57:01.6652901' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'd64f59c1-19e4-4ba5-9d32-2d863ae5cc1c', N'72d6ae46-ff5b-4cdf-88db-be5b90b10474', N'79459d60-5db6-48b6-94bf-2121d9839e15', 0, CAST(N'2024-11-20T20:57:01.6816018' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'dca1deba-7689-4c54-a3b1-2f72613708b5', N'7ee8535a-dfbe-43bc-b51b-2a6094fbecf8', N'6f0a8890-c105-4fb4-874b-9d559847eca6', 0, CAST(N'2024-11-20T20:55:10.7178290' AS DateTime2), 13)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'6c1b24b4-1a97-4e65-aae2-331830ed90d5', N'72d6ae46-ff5b-4cdf-88db-be5b90b10474', N'999d3424-6bad-4d7b-8bd0-2b462b55dd45', 0, CAST(N'2024-11-20T20:57:01.6783023' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'5d1561c4-3736-4e26-93fd-34b467c32658', N'0eee7f37-91f5-4ed8-8faa-17d0320853f5', N'4723cac1-52f7-43bb-8d3f-bfb3b6c28a96', 1, CAST(N'2024-11-20T20:51:57.1241288' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'75961be6-330e-4f3d-9af9-359b7806a9e7', N'0eee7f37-91f5-4ed8-8faa-17d0320853f5', N'76f4c106-34b2-4175-a413-f0b67106218f', 1, CAST(N'2024-11-20T20:51:57.1241289' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'7b783fec-5e8c-4d52-aec4-373d735617d7', N'7ee8535a-dfbe-43bc-b51b-2a6094fbecf8', N'c702e9e8-111b-4402-8ed0-5f939a7892a6', 0, CAST(N'2024-11-20T20:55:10.6904347' AS DateTime2), 7)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'3ef636b2-abe8-47cd-b2ba-3c0f2cd86d24', N'72d6ae46-ff5b-4cdf-88db-be5b90b10474', N'51ef79d2-b47e-41f1-a99d-f5c0e4f4416e', 0, CAST(N'2024-11-20T20:57:01.6493958' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'b1abd39f-b790-4744-9498-3dee96b5e16b', N'0eee7f37-91f5-4ed8-8faa-17d0320853f5', N'b4ab63da-81d4-4ea1-8a5a-3c12154fa561', 1, CAST(N'2024-11-20T20:51:57.1241290' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'ab21e4b4-e0ff-4b3a-b60a-3fd3a2aa2b21', N'7ee8535a-dfbe-43bc-b51b-2a6094fbecf8', N'999d3424-6bad-4d7b-8bd0-2b462b55dd45', 0, CAST(N'2024-11-20T20:55:10.7645993' AS DateTime2), 24)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'ded43665-de8a-4678-9ef6-40e14ec3d14c', N'7ee8535a-dfbe-43bc-b51b-2a6094fbecf8', N'f4c06feb-eb3d-4f75-95f9-10c0289de995', 0, CAST(N'2024-11-20T20:55:10.7311855' AS DateTime2), 16)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'94b74205-f5d0-494e-9d0c-48689fd31b1a', N'0eee7f37-91f5-4ed8-8faa-17d0320853f5', N'87fedc0d-caae-4890-80d9-a6e086d71a1c', 1, CAST(N'2024-11-20T20:51:57.1241291' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'be99dc82-8d49-4e0d-b5f1-4879c2dba8a7', N'0eee7f37-91f5-4ed8-8faa-17d0320853f5', N'35ca5805-aa8f-4dc0-a895-c2bae87a00eb', 1, CAST(N'2024-11-20T20:51:57.1241291' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'757ef325-f1e5-459e-899a-4b7abb48db61', N'72d6ae46-ff5b-4cdf-88db-be5b90b10474', N'4723cac1-52f7-43bb-8d3f-bfb3b6c28a96', 0, CAST(N'2024-11-20T20:57:01.6253031' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'd02e655c-d7f3-4303-9c29-4c85f81c6978', N'72d6ae46-ff5b-4cdf-88db-be5b90b10474', N'786e1a85-def5-4a2e-a70c-cfc2c0d8b239', 0, CAST(N'2024-11-20T20:57:01.6463684' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'23ea4c0c-2b23-4efb-a6ac-4fb7527e18a7', N'7ee8535a-dfbe-43bc-b51b-2a6094fbecf8', N'786e1a85-def5-4a2e-a70c-cfc2c0d8b239', 0, CAST(N'2024-11-20T20:55:10.6245970' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'483a3dfd-cf9b-4b0b-8762-5129d3a0c64e', N'0eee7f37-91f5-4ed8-8faa-17d0320853f5', N'acf13799-4766-4be0-a514-693c0d238f34', 1, CAST(N'2024-11-20T20:51:57.1241292' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'5f6f549b-4ac5-4682-9101-562e10fc144c', N'72d6ae46-ff5b-4cdf-88db-be5b90b10474', N'35ca5805-aa8f-4dc0-a895-c2bae87a00eb', 0, CAST(N'2024-11-20T20:57:01.6196787' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'98bb9a31-ecf0-482f-83a6-56633e41cc40', N'72d6ae46-ff5b-4cdf-88db-be5b90b10474', N'3c69d1e2-9204-431f-863f-a4ba07f3ac1d', 0, CAST(N'2024-11-20T20:57:01.6175594' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'43decabf-a148-482e-a089-57d1c1809a90', N'72d6ae46-ff5b-4cdf-88db-be5b90b10474', N'c702e9e8-111b-4402-8ed0-5f939a7892a6', 0, CAST(N'2024-11-20T20:57:01.6074943' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'9f2d66fb-d37a-48a8-ac32-5da8e2ba3d3f', N'0eee7f37-91f5-4ed8-8faa-17d0320853f5', N'3622e825-11bb-44fd-bc59-ce0c40aa9509', 1, CAST(N'2024-11-20T20:51:57.1241292' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'36789f14-b8f8-4a09-b0d5-5e39d44cb57d', N'72d6ae46-ff5b-4cdf-88db-be5b90b10474', N'76f4c106-34b2-4175-a413-f0b67106218f', 0, CAST(N'2024-11-20T20:57:01.5908357' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'a2bf9fa5-e60f-4610-8162-6132de9e779b', N'72d6ae46-ff5b-4cdf-88db-be5b90b10474', N'ca2c80e4-c9e6-4bc1-a080-1c0505bccaba', 0, CAST(N'2024-11-20T20:57:01.6542328' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'af909f22-afab-4fb8-b8ef-62b7af89d1af', N'7ee8535a-dfbe-43bc-b51b-2a6094fbecf8', N'b4ab63da-81d4-4ea1-8a5a-3c12154fa561', 0, CAST(N'2024-11-20T20:55:10.7688196' AS DateTime2), 25)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'00841f6e-3bd0-4e51-bdb2-63bd683671d8', N'72d6ae46-ff5b-4cdf-88db-be5b90b10474', N'6f0a8890-c105-4fb4-874b-9d559847eca6', 0, CAST(N'2024-11-20T20:57:01.6228173' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'd405616a-39e8-4410-a1c0-64094d23ccfa', N'0eee7f37-91f5-4ed8-8faa-17d0320853f5', N'786e1a85-def5-4a2e-a70c-cfc2c0d8b239', 1, CAST(N'2024-11-20T20:51:57.1241293' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'77de7b50-af6d-420e-b121-6481d7eda57c', N'0eee7f37-91f5-4ed8-8faa-17d0320853f5', N'79459d60-5db6-48b6-94bf-2121d9839e15', 1, CAST(N'2024-11-20T20:51:57.1241293' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'cea3fa7a-e40c-4214-b087-64f63168cfb7', N'72d6ae46-ff5b-4cdf-88db-be5b90b10474', N'fb40ad8f-098f-4fd1-8870-c05d1d25fae2', 0, CAST(N'2024-11-20T20:57:01.6360197' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'21c6f802-9612-4fb6-bc36-662133448da9', N'72d6ae46-ff5b-4cdf-88db-be5b90b10474', N'0f8a3810-dc07-47e8-a089-7d6c08107382', 0, CAST(N'2024-11-20T20:57:01.6681242' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'e0023fc1-9634-48b8-b81d-66b0cdf21bb1', N'7ee8535a-dfbe-43bc-b51b-2a6094fbecf8', N'da5e3dff-a649-4508-943d-0ecc32d4f7fc', 0, CAST(N'2024-11-20T20:55:10.7890187' AS DateTime2), 30)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'2f8bff09-bb3e-496a-9be6-6783a9cb64ac', N'7ee8535a-dfbe-43bc-b51b-2a6094fbecf8', N'bf0b9144-be3b-4213-8f3c-f744035ed4b5', 0, CAST(N'2024-11-20T20:55:10.6440099' AS DateTime2), 4)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'2dbe1bad-d7c6-45a2-a5bf-6901b2d6911f', N'0eee7f37-91f5-4ed8-8faa-17d0320853f5', N'c702e9e8-111b-4402-8ed0-5f939a7892a6', 1, CAST(N'2024-11-20T20:51:57.1241294' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'a11bdac1-2afc-45f4-9f43-6c5553c8a790', N'0eee7f37-91f5-4ed8-8faa-17d0320853f5', N'1b68a81a-b654-4896-9195-84abfb081103', 1, CAST(N'2024-11-20T20:51:57.1241294' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'9b149972-1b86-4552-af28-6c995b633776', N'0eee7f37-91f5-4ed8-8faa-17d0320853f5', N'3622e825-11bb-44fd-bc59-ce0c40aa9509', 1, CAST(N'2024-11-17T15:56:50.9842427' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'8330a57f-8b3d-4f06-b602-704e87d2613c', N'7ee8535a-dfbe-43bc-b51b-2a6094fbecf8', N'35ca5805-aa8f-4dc0-a895-c2bae87a00eb', 0, CAST(N'2024-11-20T20:55:10.7131601' AS DateTime2), 12)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'82991fac-c60f-41ae-b1bb-7388e22fdd3c', N'72d6ae46-ff5b-4cdf-88db-be5b90b10474', N'acf13799-4766-4be0-a514-693c0d238f34', 0, CAST(N'2024-11-20T20:57:01.6277536' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'88d6e6e8-5e6b-4266-a089-75ce038d966c', N'72d6ae46-ff5b-4cdf-88db-be5b90b10474', N'8b678550-a782-4ed9-a61f-15887cf5a73e', 0, CAST(N'2024-11-20T20:57:01.6745963' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'd570f5ee-f897-4293-9a48-76cb82e6f6bd', N'72d6ae46-ff5b-4cdf-88db-be5b90b10474', N'1b68a81a-b654-4896-9195-84abfb081103', 0, CAST(N'2024-11-20T20:57:01.6438806' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'5dce425a-7307-4e0e-b1bf-780cc8fe2a44', N'72d6ae46-ff5b-4cdf-88db-be5b90b10474', N'a7efdc67-aa93-46cb-8410-0ddcfe0d5853', 0, CAST(N'2024-11-20T20:57:01.6407832' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'2d341e37-19e8-4416-994d-78c41e5bc3c1', N'7ee8535a-dfbe-43bc-b51b-2a6094fbecf8', N'76f4c106-34b2-4175-a413-f0b67106218f', 0, CAST(N'2024-11-20T20:55:10.6858469' AS DateTime2), 6)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'28f9a2ce-a6a8-4ee4-b5bf-793d1d5eee66', N'0eee7f37-91f5-4ed8-8faa-17d0320853f5', N'efbe3ff8-a8cb-408b-b2de-f0cdc5f03d55', 1, CAST(N'2024-11-20T20:51:57.1241295' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'4940b117-f69a-4805-a2e0-7dc05c8666d1', N'0eee7f37-91f5-4ed8-8faa-17d0320853f5', N'999d3424-6bad-4d7b-8bd0-2b462b55dd45', 1, CAST(N'2024-11-20T20:51:57.1241295' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'2f0df183-5ca3-4ea7-8931-801f81ab3e0d', N'72d6ae46-ff5b-4cdf-88db-be5b90b10474', N'ad4a5bce-f3c4-44a7-85c5-fdb1c2d19d12', 0, CAST(N'2024-11-20T20:57:01.6152294' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'4e7ae047-4937-438e-8940-89105891dc79', N'7ee8535a-dfbe-43bc-b51b-2a6094fbecf8', N'efbe3ff8-a8cb-408b-b2de-f0cdc5f03d55', 0, CAST(N'2024-11-20T20:55:10.6946998' AS DateTime2), 8)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'28d82d29-1bf4-42b3-9194-8ac5e348d348', N'72d6ae46-ff5b-4cdf-88db-be5b90b10474', N'f4c06feb-eb3d-4f75-95f9-10c0289de995', 0, CAST(N'2024-11-20T20:57:01.6386487' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'443c04db-565f-4950-a33d-90c6e6f2bb1b', N'7ee8535a-dfbe-43bc-b51b-2a6094fbecf8', N'3a9ab36e-b834-4a20-ba32-a0d34fdc47da', 0, CAST(N'2024-11-20T20:55:10.6480281' AS DateTime2), 5)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'08f9a6df-6b4e-4c98-b4d5-91672c8966c6', N'72d6ae46-ff5b-4cdf-88db-be5b90b10474', N'e296f2f3-e89c-49b9-b304-b76df59719ae', 0, CAST(N'2024-11-20T20:57:01.6717558' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'248aedf9-9b8c-412b-9853-936c8cb825e5', N'7ee8535a-dfbe-43bc-b51b-2a6094fbecf8', N'acf13799-4766-4be0-a514-693c0d238f34', 0, CAST(N'2024-11-20T20:55:10.7486664' AS DateTime2), 20)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'b5f8f529-c011-4f6b-b300-93903f776b65', N'7ee8535a-dfbe-43bc-b51b-2a6094fbecf8', N'3622e825-11bb-44fd-bc59-ce0c40aa9509', 0, CAST(N'2024-11-20T20:55:10.6997859' AS DateTime2), 9)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'3fc10dea-9904-4a19-b140-964d7083f0ca', N'0eee7f37-91f5-4ed8-8faa-17d0320853f5', N'fb40ad8f-098f-4fd1-8870-c05d1d25fae2', 1, CAST(N'2024-11-20T20:51:57.1241296' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'b263b1aa-d63b-44a2-9073-9762e6992a47', N'7ee8535a-dfbe-43bc-b51b-2a6094fbecf8', N'3c69d1e2-9204-431f-863f-a4ba07f3ac1d', 0, CAST(N'2024-11-20T20:55:10.7088514' AS DateTime2), 11)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'8433fddc-63bd-4600-a0b4-9845f39372bc', N'7ee8535a-dfbe-43bc-b51b-2a6094fbecf8', N'79459d60-5db6-48b6-94bf-2121d9839e15', 0, CAST(N'2024-11-20T20:55:10.7723054' AS DateTime2), 26)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'73cd178c-bda3-4145-94e5-987b64997e4b', N'7ee8535a-dfbe-43bc-b51b-2a6094fbecf8', N'1b68a81a-b654-4896-9195-84abfb081103', 0, CAST(N'2024-11-20T20:55:10.7362509' AS DateTime2), 17)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'66b59f2d-8eb8-4a9a-9c12-98eaa317a0d1', N'7ee8535a-dfbe-43bc-b51b-2a6094fbecf8', N'ad4a5bce-f3c4-44a7-85c5-fdb1c2d19d12', 0, CAST(N'2024-11-20T20:55:10.7043297' AS DateTime2), 10)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'8fc5a863-9c0e-4935-8cc9-9e1f5e981ac5', N'0eee7f37-91f5-4ed8-8faa-17d0320853f5', N'76f4c106-34b2-4175-a413-f0b67106218f', 1, CAST(N'2024-11-17T15:56:50.9842427' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'd5aee9e0-5f86-41d4-920c-ab37fa2bd938', N'7ee8535a-dfbe-43bc-b51b-2a6094fbecf8', N'8b678550-a782-4ed9-a61f-15887cf5a73e', 0, CAST(N'2024-11-20T20:55:10.7567209' AS DateTime2), 22)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'a4c3b947-b90f-4c86-8861-afa543f4ee1d', N'72d6ae46-ff5b-4cdf-88db-be5b90b10474', N'b9ec64fd-8aac-44db-8541-67b1c6162676', 0, CAST(N'2024-11-20T20:57:01.6307679' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'9ce28bde-a53f-4b39-95b6-b4b89322cbc3', N'0eee7f37-91f5-4ed8-8faa-17d0320853f5', N'c702e9e8-111b-4402-8ed0-5f939a7892a6', 1, CAST(N'2024-11-17T15:56:50.9842428' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'd01e561a-ec5c-4fbc-8485-b9a7b54db341', N'7ee8535a-dfbe-43bc-b51b-2a6094fbecf8', N'31314875-8f03-4874-be17-0f31c14f28ee', 0, CAST(N'2024-11-20T20:55:10.7765225' AS DateTime2), 27)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'37fccff6-4299-403e-ad7b-bc9b8e018082', N'0eee7f37-91f5-4ed8-8faa-17d0320853f5', N'3c69d1e2-9204-431f-863f-a4ba07f3ac1d', 1, CAST(N'2024-11-20T20:51:57.1241296' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'f1adb215-e9f9-40b7-9298-bdce17062884', N'7ee8535a-dfbe-43bc-b51b-2a6094fbecf8', N'b9ec64fd-8aac-44db-8541-67b1c6162676', 0, CAST(N'2024-11-20T20:55:10.7531423' AS DateTime2), 21)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'eb790539-e385-41a0-a523-beefe24c63d9', N'0eee7f37-91f5-4ed8-8faa-17d0320853f5', N'ca2c80e4-c9e6-4bc1-a080-1c0505bccaba', 1, CAST(N'2024-11-20T20:51:57.1241297' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'78981441-8313-4201-8d48-c5f159feb940', N'72d6ae46-ff5b-4cdf-88db-be5b90b10474', N'b4ab63da-81d4-4ea1-8a5a-3c12154fa561', 0, CAST(N'2024-11-20T20:57:01.6889320' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'5c3cd54d-6790-420b-8399-c85c21b42b37', N'0eee7f37-91f5-4ed8-8faa-17d0320853f5', N'da5e3dff-a649-4508-943d-0ecc32d4f7fc', 1, CAST(N'2024-11-20T20:51:57.1241297' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'5cb775ad-0d9b-402e-b83b-cd7d13a21bd7', N'72d6ae46-ff5b-4cdf-88db-be5b90b10474', N'efbe3ff8-a8cb-408b-b2de-f0cdc5f03d55', 0, CAST(N'2024-11-20T20:57:01.6102465' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'cce8fb8c-b97d-445d-9d94-d2690ddccb89', N'0eee7f37-91f5-4ed8-8faa-17d0320853f5', N'bf0b9144-be3b-4213-8f3c-f744035ed4b5', 1, CAST(N'2024-11-20T20:51:57.1241298' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'16293c78-fb00-492b-b7de-d5916c5db124', N'7ee8535a-dfbe-43bc-b51b-2a6094fbecf8', N'fb40ad8f-098f-4fd1-8870-c05d1d25fae2', 0, CAST(N'2024-11-20T20:55:10.7403604' AS DateTime2), 18)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'1d32b8a9-2681-4681-8bd7-d75717dd951e', N'72d6ae46-ff5b-4cdf-88db-be5b90b10474', N'3a9ab36e-b834-4a20-ba32-a0d34fdc47da', 0, CAST(N'2024-11-20T20:57:01.6571925' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'a51b3465-5ce3-403b-9f6e-d806d1f6b9b5', N'0eee7f37-91f5-4ed8-8faa-17d0320853f5', N'51ef79d2-b47e-41f1-a99d-f5c0e4f4416e', 1, CAST(N'2024-11-20T20:51:57.1241298' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'fa3ad395-9dfc-4dce-a27f-d9f1e9183aaf', N'0eee7f37-91f5-4ed8-8faa-17d0320853f5', N'ad4a5bce-f3c4-44a7-85c5-fdb1c2d19d12', 1, CAST(N'2024-11-20T20:51:57.1241299' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'ef4e24f7-d6bd-43d0-82a2-dbc6e4bb2db3', N'7ee8535a-dfbe-43bc-b51b-2a6094fbecf8', N'1fb789cf-87b0-43b0-a45e-e85e3891a9ee', 0, CAST(N'2024-11-20T20:55:10.7928480' AS DateTime2), 31)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'8dd991d2-b684-42ae-9688-e2cb88108009', N'0eee7f37-91f5-4ed8-8faa-17d0320853f5', N'3a9ab36e-b834-4a20-ba32-a0d34fdc47da', 1, CAST(N'2024-11-20T20:51:57.1241299' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'ed4c8ca4-0804-40bd-b15c-e7054b4c300a', N'0eee7f37-91f5-4ed8-8faa-17d0320853f5', N'efbe3ff8-a8cb-408b-b2de-f0cdc5f03d55', 1, CAST(N'2024-11-17T15:56:50.9842428' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'ed03adc0-ee61-434a-b550-e7828d084d95', N'7ee8535a-dfbe-43bc-b51b-2a6094fbecf8', N'e6d88410-17f4-479b-8e2d-8b6d5c0324a7', 0, CAST(N'2024-11-20T20:55:10.7223197' AS DateTime2), 14)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'7244fdf3-5095-44df-82a2-ecff0528b44f', N'72d6ae46-ff5b-4cdf-88db-be5b90b10474', N'bf0b9144-be3b-4213-8f3c-f744035ed4b5', 0, CAST(N'2024-11-20T20:57:01.6521177' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'37a85e43-3c83-46c9-ae30-ed503e93a705', N'0eee7f37-91f5-4ed8-8faa-17d0320853f5', N'0f8a3810-dc07-47e8-a089-7d6c08107382', 1, CAST(N'2024-11-20T20:51:57.1241300' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'b5a9277d-9c9d-4690-9fb4-ed6d489d933c', N'72d6ae46-ff5b-4cdf-88db-be5b90b10474', N'31314875-8f03-4874-be17-0f31c14f28ee', 0, CAST(N'2024-11-20T20:57:01.6596866' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'd4f02968-faab-4587-9bb7-ee29363d76b4', N'72d6ae46-ff5b-4cdf-88db-be5b90b10474', N'da5e3dff-a649-4508-943d-0ecc32d4f7fc', 0, CAST(N'2024-11-20T20:57:01.6618186' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'7bfd1699-7ffa-4844-a343-f4199b498893', N'72d6ae46-ff5b-4cdf-88db-be5b90b10474', N'3622e825-11bb-44fd-bc59-ce0c40aa9509', 0, CAST(N'2024-11-20T20:57:01.6123301' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'afd2c6cb-e886-43e1-a16f-f4a1aad8fe40', N'7ee8535a-dfbe-43bc-b51b-2a6094fbecf8', N'4723cac1-52f7-43bb-8d3f-bfb3b6c28a96', 0, CAST(N'2024-11-20T20:55:10.7441830' AS DateTime2), 19)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'b938912c-1585-45e9-976e-f72b9c28d3ce', N'72d6ae46-ff5b-4cdf-88db-be5b90b10474', N'e6d88410-17f4-479b-8e2d-8b6d5c0324a7', 0, CAST(N'2024-11-20T20:57:01.6329556' AS DateTime2), 1)
GO
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'1893a699-b8cd-4c2d-be52-0e0e34777f0b', N'72d6ae46-ff5b-4cdf-88db-be5b90b10474', N'd486e012-c894-4cf0-b036-445850887364', N'28d82d29-1bf4-42b3-9194-8ac5e348d348', 5, 0, CAST(N'2024-11-20T21:13:14.1088357' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'ec98034b-f065-477a-83e8-0ee8f694d7ac', N'72d6ae46-ff5b-4cdf-88db-be5b90b10474', N'd486e012-c894-4cf0-b036-445850887364', N'5cb775ad-0d9b-402e-b83b-cd7d13a21bd7', 2, 0, CAST(N'2024-11-20T21:13:14.1273205' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'013ad415-cb63-4484-a38e-14840c7081f7', N'72d6ae46-ff5b-4cdf-88db-be5b90b10474', N'd486e012-c894-4cf0-b036-445850887364', N'7bfd1699-7ffa-4844-a343-f4199b498893', 2, 0, CAST(N'2024-11-20T21:13:14.1451636' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'0598f8fd-ab0a-404f-8ead-234a5c491f9a', N'72d6ae46-ff5b-4cdf-88db-be5b90b10474', N'd486e012-c894-4cf0-b036-445850887364', N'78981441-8313-4201-8d48-c5f159feb940', 0, 0, CAST(N'2024-11-20T21:13:14.1226008' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'03c0355d-edd4-40f3-ac65-3ddbf297c9cf', N'72d6ae46-ff5b-4cdf-88db-be5b90b10474', N'd486e012-c894-4cf0-b036-445850887364', N'6c1b24b4-1a97-4e65-aae2-331830ed90d5', 4, 0, CAST(N'2024-11-20T21:13:14.0591900' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'd0c409fc-56eb-4024-8b3d-3e93696aa001', N'72d6ae46-ff5b-4cdf-88db-be5b90b10474', N'd486e012-c894-4cf0-b036-445850887364', N'00841f6e-3bd0-4e51-bdb2-63bd683671d8', 9, 0, CAST(N'2024-11-20T21:13:14.0767250' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'b8df8ece-5d47-4f85-acac-405fea5853f2', N'72d6ae46-ff5b-4cdf-88db-be5b90b10474', N'd486e012-c894-4cf0-b036-445850887364', N'21c6f802-9612-4fb6-bc36-662133448da9', 0, 0, CAST(N'2024-11-20T21:13:14.0858211' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'1eefbc61-7015-470f-9cf6-46d2c4769d7f', N'72d6ae46-ff5b-4cdf-88db-be5b90b10474', N'd486e012-c894-4cf0-b036-445850887364', N'cea3fa7a-e40c-4214-b087-64f63168cfb7', 6, 0, CAST(N'2024-11-20T21:13:14.0810060' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'9f8372b8-16e7-4300-a21c-5f47172bfe4a', N'72d6ae46-ff5b-4cdf-88db-be5b90b10474', N'd486e012-c894-4cf0-b036-445850887364', N'82991fac-c60f-41ae-b1bb-7388e22fdd3c', 9, 0, CAST(N'2024-11-20T21:13:14.0895695' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'a4ca95ac-79d3-47ae-a493-6866a6d5be87', N'72d6ae46-ff5b-4cdf-88db-be5b90b10474', N'd486e012-c894-4cf0-b036-445850887364', N'd4f02968-faab-4587-9bb7-ee29363d76b4', 0, 0, CAST(N'2024-11-20T21:13:14.1412613' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'a70e797c-23b8-4984-89f0-6a920dd20507', N'72d6ae46-ff5b-4cdf-88db-be5b90b10474', N'd486e012-c894-4cf0-b036-445850887364', N'43decabf-a148-482e-a089-57d1c1809a90', 3, 0, CAST(N'2024-11-20T21:13:14.0679894' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'c3ba4b7f-366d-4156-a383-6e90c80e369f', N'72d6ae46-ff5b-4cdf-88db-be5b90b10474', N'd486e012-c894-4cf0-b036-445850887364', N'd570f5ee-f897-4293-9a48-76cb82e6f6bd', 6, 0, CAST(N'2024-11-20T21:13:14.0943020' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'2950e789-9b25-41e8-afb2-87b2f3ff48d3', N'72d6ae46-ff5b-4cdf-88db-be5b90b10474', N'd486e012-c894-4cf0-b036-445850887364', N'7244fdf3-5095-44df-82a2-ecff0528b44f', 3, 0, CAST(N'2024-11-20T21:13:14.1364849' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'651c060b-3bc8-4d70-ba87-8a3a54f8b06b', N'72d6ae46-ff5b-4cdf-88db-be5b90b10474', N'd486e012-c894-4cf0-b036-445850887364', N'5dce425a-7307-4e0e-b1bf-780cc8fe2a44', 6, 0, CAST(N'2024-11-20T21:13:14.0986735' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'ecd903ee-dd23-4b27-b2ef-8ffef24f5acb', N'72d6ae46-ff5b-4cdf-88db-be5b90b10474', N'd486e012-c894-4cf0-b036-445850887364', N'c9edb2f8-6010-42c9-9bca-28f2cc06e9fa', 0, 0, CAST(N'2024-11-20T21:13:14.0499029' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'db18a372-f813-4571-b2e5-ab5425444a0b', N'72d6ae46-ff5b-4cdf-88db-be5b90b10474', N'd486e012-c894-4cf0-b036-445850887364', N'08f9a6df-6b4e-4c98-b4d5-91672c8966c6', 0, 0, CAST(N'2024-11-20T21:13:14.1136324' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'e336a0c1-a042-445a-99ba-ad91a1c4e31b', N'72d6ae46-ff5b-4cdf-88db-be5b90b10474', N'd486e012-c894-4cf0-b036-445850887364', N'a2bf9fa5-e60f-4610-8162-6132de9e779b', 3, 0, CAST(N'2024-11-20T21:13:14.0726128' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'acd632f1-2bfe-4774-a339-b687f0a657eb', N'72d6ae46-ff5b-4cdf-88db-be5b90b10474', N'd486e012-c894-4cf0-b036-445850887364', N'807444b5-6210-4332-91f4-2393a57db1b9', 4, 0, CAST(N'2024-11-20T21:13:14.0442863' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'54f82720-71d8-4fc0-b091-c2b1a9479394', N'72d6ae46-ff5b-4cdf-88db-be5b90b10474', N'd486e012-c894-4cf0-b036-445850887364', N'1d32b8a9-2681-4681-8bd7-d75717dd951e', 3, 0, CAST(N'2024-11-20T21:13:14.1313796' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'075ed516-398d-42eb-87e1-c604a9295fc3', N'72d6ae46-ff5b-4cdf-88db-be5b90b10474', N'd486e012-c894-4cf0-b036-445850887364', N'2f0df183-5ca3-4ea7-8931-801f81ab3e0d', 2, 0, CAST(N'2024-11-20T21:13:14.1035948' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'926d712d-9bb5-4514-9496-e209ed027fe5', N'72d6ae46-ff5b-4cdf-88db-be5b90b10474', N'd486e012-c894-4cf0-b036-445850887364', N'a4c3b947-b90f-4c86-8861-afa543f4ee1d', 9, 0, CAST(N'2024-11-20T21:13:14.1178640' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'307db7e8-fc30-4e6c-b90d-ea2f4a10d321', N'72d6ae46-ff5b-4cdf-88db-be5b90b10474', N'd486e012-c894-4cf0-b036-445850887364', N'd64f59c1-19e4-4ba5-9d32-2d863ae5cc1c', 4, 0, CAST(N'2024-11-20T21:13:14.0536585' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'733f2118-d515-4e6f-9d16-f9f67d75a340', N'72d6ae46-ff5b-4cdf-88db-be5b90b10474', N'd486e012-c894-4cf0-b036-445850887364', N'3ef636b2-abe8-47cd-b2ba-3c0f2cd86d24', 3, 0, CAST(N'2024-11-20T21:13:14.0639863' AS DateTime2), 2)
GO
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'4b39ef1d-9594-4052-8076-0d1bcbfa82a3', N'72d6ae46-ff5b-4cdf-88db-be5b90b10474', N'1c004580-03da-44c4-b52f-436e4ae47bad', N'926d712d-9bb5-4514-9496-e209ed027fe5', 9, 0, CAST(N'2024-11-20T21:14:22.2488647' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'9fcd64bc-4abb-440c-a52a-1699680784a5', N'72d6ae46-ff5b-4cdf-88db-be5b90b10474', N'1c004580-03da-44c4-b52f-436e4ae47bad', N'e336a0c1-a042-445a-99ba-ad91a1c4e31b', 3, 0, CAST(N'2024-11-20T21:14:22.1997537' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'2cd9935f-3dda-4d85-a046-2547d65b644d', N'72d6ae46-ff5b-4cdf-88db-be5b90b10474', N'1c004580-03da-44c4-b52f-436e4ae47bad', N'9f8372b8-16e7-4300-a21c-5f47172bfe4a', 9, 0, CAST(N'2024-11-20T21:14:22.2215283' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'5877bd0b-fd23-4e7b-9146-338cf695d3c2', N'72d6ae46-ff5b-4cdf-88db-be5b90b10474', N'1c004580-03da-44c4-b52f-436e4ae47bad', N'2950e789-9b25-41e8-afb2-87b2f3ff48d3', 3, 0, CAST(N'2024-11-20T21:14:22.2663503' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'29c304ec-fe4a-4a6a-854f-3c525970f3ca', N'72d6ae46-ff5b-4cdf-88db-be5b90b10474', N'1c004580-03da-44c4-b52f-436e4ae47bad', N'013ad415-cb63-4484-a38e-14840c7081f7', 2, 0, CAST(N'2024-11-20T21:14:22.2758943' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'f744430f-dd99-4478-b2e5-447e10f6ab72', N'72d6ae46-ff5b-4cdf-88db-be5b90b10474', N'1c004580-03da-44c4-b52f-436e4ae47bad', N'a70e797c-23b8-4984-89f0-6a920dd20507', 3, 0, CAST(N'2024-11-20T21:14:22.1953672' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'3b06a0da-b739-4ec2-aafd-595175641b72', N'72d6ae46-ff5b-4cdf-88db-be5b90b10474', N'1c004580-03da-44c4-b52f-436e4ae47bad', N'd0c409fc-56eb-4024-8b3d-3e93696aa001', 9, 0, CAST(N'2024-11-20T21:14:22.2042498' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'51222f58-b026-4cb9-bb40-5b58b0fb9da3', N'72d6ae46-ff5b-4cdf-88db-be5b90b10474', N'1c004580-03da-44c4-b52f-436e4ae47bad', N'307db7e8-fc30-4e6c-b90d-ea2f4a10d321', 4, 0, CAST(N'2024-11-20T21:14:22.1813440' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'c061b218-eb5c-41ed-842b-5f086271ee33', N'72d6ae46-ff5b-4cdf-88db-be5b90b10474', N'1c004580-03da-44c4-b52f-436e4ae47bad', N'acd632f1-2bfe-4774-a339-b687f0a657eb', 4, 0, CAST(N'2024-11-20T21:14:22.1565604' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'45b4cf1e-ab80-48ba-a9b8-694749601bbf', N'72d6ae46-ff5b-4cdf-88db-be5b90b10474', N'1c004580-03da-44c4-b52f-436e4ae47bad', N'1eefbc61-7015-470f-9cf6-46d2c4769d7f', 6, 0, CAST(N'2024-11-20T21:14:22.2098621' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'fd4f2d8c-c8ab-403a-a1ee-6d8cf81a122f', N'72d6ae46-ff5b-4cdf-88db-be5b90b10474', N'1c004580-03da-44c4-b52f-436e4ae47bad', N'03c0355d-edd4-40f3-ac65-3ddbf297c9cf', 4, 0, CAST(N'2024-11-20T21:14:22.1856442' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'1a3f7a91-3e48-4c78-a8b6-885ba23af2ad', N'72d6ae46-ff5b-4cdf-88db-be5b90b10474', N'1c004580-03da-44c4-b52f-436e4ae47bad', N'db18a372-f813-4571-b2e5-ab5425444a0b', 3, 0, CAST(N'2024-11-20T21:14:22.2445456' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'82955f70-7f7c-438e-833b-95c68b2b9633', N'72d6ae46-ff5b-4cdf-88db-be5b90b10474', N'1c004580-03da-44c4-b52f-436e4ae47bad', N'a4ca95ac-79d3-47ae-a493-6866a6d5be87', 3, 0, CAST(N'2024-11-20T21:14:22.2715307' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'cca54971-19ac-4185-931b-a097df6b60e9', N'72d6ae46-ff5b-4cdf-88db-be5b90b10474', N'1c004580-03da-44c4-b52f-436e4ae47bad', N'ec98034b-f065-477a-83e8-0ee8f694d7ac', 2, 0, CAST(N'2024-11-20T21:14:22.2577901' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'a76aace1-136e-426e-ad16-bcb294624170', N'72d6ae46-ff5b-4cdf-88db-be5b90b10474', N'1c004580-03da-44c4-b52f-436e4ae47bad', N'0598f8fd-ab0a-404f-8ead-234a5c491f9a', 4, 0, CAST(N'2024-11-20T21:14:22.2531257' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'bbbd9990-a0eb-4589-8a2b-bf8ac131d891', N'72d6ae46-ff5b-4cdf-88db-be5b90b10474', N'1c004580-03da-44c4-b52f-436e4ae47bad', N'075ed516-398d-42eb-87e1-c604a9295fc3', 2, 0, CAST(N'2024-11-20T21:14:22.2362483' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'4d2d453e-506c-4406-a9f6-c43ecd290a89', N'72d6ae46-ff5b-4cdf-88db-be5b90b10474', N'1c004580-03da-44c4-b52f-436e4ae47bad', N'b8df8ece-5d47-4f85-acac-405fea5853f2', 3, 0, CAST(N'2024-11-20T21:14:22.2161098' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'5a3d2228-350f-4263-9f3b-cce72aeaff24', N'72d6ae46-ff5b-4cdf-88db-be5b90b10474', N'1c004580-03da-44c4-b52f-436e4ae47bad', N'1893a699-b8cd-4c2d-be52-0e0e34777f0b', 6, 0, CAST(N'2024-11-20T21:14:22.2400203' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'0676d81f-5463-4a80-b023-d1e9010b6325', N'72d6ae46-ff5b-4cdf-88db-be5b90b10474', N'1c004580-03da-44c4-b52f-436e4ae47bad', N'54f82720-71d8-4fc0-b091-c2b1a9479394', 3, 0, CAST(N'2024-11-20T21:14:22.2619295' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'eeb89065-b6af-41fa-b7c4-d270f925447f', N'72d6ae46-ff5b-4cdf-88db-be5b90b10474', N'1c004580-03da-44c4-b52f-436e4ae47bad', N'651c060b-3bc8-4d70-ba87-8a3a54f8b06b', 6, 0, CAST(N'2024-11-20T21:14:22.2314876' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'a7a9cf78-d6d2-4e88-ab9a-d8519f9a929d', N'72d6ae46-ff5b-4cdf-88db-be5b90b10474', N'1c004580-03da-44c4-b52f-436e4ae47bad', N'733f2118-d515-4e6f-9d16-f9f67d75a340', 3, 0, CAST(N'2024-11-20T21:14:22.1903498' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'72f25aac-bcc4-40a0-a109-e2afd96ed28a', N'72d6ae46-ff5b-4cdf-88db-be5b90b10474', N'1c004580-03da-44c4-b52f-436e4ae47bad', N'c3ba4b7f-366d-4156-a383-6e90c80e369f', 6, 0, CAST(N'2024-11-20T21:14:22.2261509' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'994a3690-c9a6-453d-80e8-f45eba635002', N'72d6ae46-ff5b-4cdf-88db-be5b90b10474', N'1c004580-03da-44c4-b52f-436e4ae47bad', N'ecd903ee-dd23-4b27-b2ef-8ffef24f5acb', 3, 0, CAST(N'2024-11-20T21:14:22.1761381' AS DateTime2), 2)
GO
INSERT [dbo].[EvaluationUser] ([Id], [EvaluationId], [UserId], [Type], [Sort], [IsDeleted], [UpdatedAt], [IsManager]) VALUES (N'd9931378-ead4-43b4-b94a-4940ca6b464b', N'7ee8535a-dfbe-43bc-b51b-2a6094fbecf8', N'6b2dc1cb-7a55-4f16-b9cf-6cf6a048edea', 1, 0, 0, CAST(N'2024-11-15T23:40:04.6827260' AS DateTime2), NULL)
INSERT [dbo].[EvaluationUser] ([Id], [EvaluationId], [UserId], [Type], [Sort], [IsDeleted], [UpdatedAt], [IsManager]) VALUES (N'c75122f2-1282-4f3d-83fb-49f47fcac7b3', N'72d6ae46-ff5b-4cdf-88db-be5b90b10474', N'd486e012-c894-4cf0-b036-445850887364', 1, 0, 0, CAST(N'2024-11-20T20:58:02.4348089' AS DateTime2), NULL)
INSERT [dbo].[EvaluationUser] ([Id], [EvaluationId], [UserId], [Type], [Sort], [IsDeleted], [UpdatedAt], [IsManager]) VALUES (N'15f9c03a-d737-41cd-9215-4c92517c9205', N'72d6ae46-ff5b-4cdf-88db-be5b90b10474', N'1c004580-03da-44c4-b52f-436e4ae47bad', 2, 1, 0, CAST(N'2024-11-20T21:12:11.3657696' AS DateTime2), 1)
INSERT [dbo].[EvaluationUser] ([Id], [EvaluationId], [UserId], [Type], [Sort], [IsDeleted], [UpdatedAt], [IsManager]) VALUES (N'21054bbd-117f-45b9-86fc-5f7f0ed993fc', N'7ee8535a-dfbe-43bc-b51b-2a6094fbecf8', N'9b7c2d93-7d20-4406-8a0a-7883cc4f3c3d', 2, 1, 0, CAST(N'2024-11-15T23:21:51.3571308' AS DateTime2), 0)
INSERT [dbo].[EvaluationUser] ([Id], [EvaluationId], [UserId], [Type], [Sort], [IsDeleted], [UpdatedAt], [IsManager]) VALUES (N'7fde5e55-df93-4669-b6c6-962cc18867b9', N'7ee8535a-dfbe-43bc-b51b-2a6094fbecf8', N'9b7c2d93-7d20-4406-8a0a-7883cc4f3c3d', 1, 0, 0, CAST(N'2024-11-15T23:40:04.6366043' AS DateTime2), NULL)
INSERT [dbo].[EvaluationUser] ([Id], [EvaluationId], [UserId], [Type], [Sort], [IsDeleted], [UpdatedAt], [IsManager]) VALUES (N'b3bb0669-7246-4fdf-b1a5-d66e3a6e81c7', N'7ee8535a-dfbe-43bc-b51b-2a6094fbecf8', N'89675a85-e1bc-459b-8036-9e1597ed929a', 1, 0, 0, CAST(N'2024-11-15T23:40:04.6766043' AS DateTime2), NULL)
INSERT [dbo].[EvaluationUser] ([Id], [EvaluationId], [UserId], [Type], [Sort], [IsDeleted], [UpdatedAt], [IsManager]) VALUES (N'e5868ece-ad9a-458e-a985-dc643e3d430e', N'7ee8535a-dfbe-43bc-b51b-2a6094fbecf8', N'd486e012-c894-4cf0-b036-445850887364', 2, 2, 0, CAST(N'2024-11-15T23:22:20.9525754' AS DateTime2), 1)
INSERT [dbo].[EvaluationUser] ([Id], [EvaluationId], [UserId], [Type], [Sort], [IsDeleted], [UpdatedAt], [IsManager]) VALUES (N'0bfcbcab-f45b-46fa-9a0f-df5171131d0c', N'7ee8535a-dfbe-43bc-b51b-2a6094fbecf8', N'3df19402-0808-47f6-9d47-e15b5a0df798', 1, 0, 0, CAST(N'2024-11-15T23:40:04.6797922' AS DateTime2), NULL)
GO
INSERT [dbo].[MenuItems] ([Id], [Key], [Name], [ParentId], [Route], [Icon], [Sort]) VALUES (N'be782bc6-5b5f-4edc-a2c4-0dc8ad2af70e', N'evaluation-statistics', N'Thống kê đánh giá', N'fa70e2f4-8d7f-479d-a12a-f91508b8c33e', N'/statistics/evaluation-statistics', N'IconBarChartFill', 1)
INSERT [dbo].[MenuItems] ([Id], [Key], [Name], [ParentId], [Route], [Icon], [Sort]) VALUES (N'b67dc630-6c6f-4dd1-88a1-1380ddf043f6', N'units', N'Quản lý đơn vị/phòng ban', N'd7d627dc-8642-4131-ac61-f629a0f69929', N'/organization-management/units', N'IconDeploymentUnit', 4)
INSERT [dbo].[MenuItems] ([Id], [Key], [Name], [ParentId], [Route], [Icon], [Sort]) VALUES (N'8d34733f-09dd-4c18-8170-16e03456d202', N'evaluation-ratings', N'Danh mục thang điểm đánh giá', N'97e2f2a0-00c8-492e-8503-adbbcb791b1f', N'/categories/evaluation-ratings', N'IconScoreboardOutline', 1)
INSERT [dbo].[MenuItems] ([Id], [Key], [Name], [ParentId], [Route], [Icon], [Sort]) VALUES (N'7df44a05-ecf1-4adf-91ee-328dcbd5dd99', N'consolidation-and-transfer', N'Tổng hợp và chuyển', N'fa70e2f4-8d7f-479d-a12a-f91508b8c33e', N'/statistics/consolidation-and-transfer', N'IconBxTransfer', 2)
INSERT [dbo].[MenuItems] ([Id], [Key], [Name], [ParentId], [Route], [Icon], [Sort]) VALUES (N'f0a0148d-7e05-4873-b5bd-37e61c626887', N'evaluation-forms', N'Phiếu đánh giá', NULL, N'/evaluation-forms', NULL, 7)
INSERT [dbo].[MenuItems] ([Id], [Key], [Name], [ParentId], [Route], [Icon], [Sort]) VALUES (N'93a76a6e-3f4c-4d02-9b67-3c938a873be1', N'users', N'Quản lý người dùng', N'd7d627dc-8642-4131-ac61-f629a0f69929', N'/organization-management/users', N'IconUser', 2)
INSERT [dbo].[MenuItems] ([Id], [Key], [Name], [ParentId], [Route], [Icon], [Sort]) VALUES (N'3172d91d-37cf-46ec-9eb8-62fd2a01e691', N'user-type', N'Quản lý loại người dùng', N'd7d627dc-8642-4131-ac61-f629a0f69929', N'/organization-management/user-type', N'IconPersonRolodex', 1)
INSERT [dbo].[MenuItems] ([Id], [Key], [Name], [ParentId], [Route], [Icon], [Sort]) VALUES (N'dd8e29a6-c51e-4e9a-9b89-6c255c7f1e07', N'supervisor-evaluation', N'Giám sát viên đánh giá', N'f0a0148d-7e05-4873-b5bd-37e61c626887', N'/evaluation-forms/supervisor-evaluation', N'IconAccountSupervisorOutline', 2)
INSERT [dbo].[MenuItems] ([Id], [Key], [Name], [ParentId], [Route], [Icon], [Sort]) VALUES (N'd0a617ce-7a4a-4556-a2d0-82503dfef228', N'dashboard', N'Trang tổng quan', NULL, N'/dashboard', N'IconDashboard', 1)
INSERT [dbo].[MenuItems] ([Id], [Key], [Name], [ParentId], [Route], [Icon], [Sort]) VALUES (N'78ca07f2-0549-449a-9ca4-8a950a40b567', N'evaluation-criteria', N'Danh mục tiêu chí đánh giá', N'97e2f2a0-00c8-492e-8503-adbbcb791b1f', N'/categories/evaluation-criteria', N'IconCardChecklist', 2)
INSERT [dbo].[MenuItems] ([Id], [Key], [Name], [ParentId], [Route], [Icon], [Sort]) VALUES (N'97e2f2a0-00c8-492e-8503-adbbcb791b1f', N'categories', N'Quản lý danh mục', NULL, NULL, NULL, 5)
INSERT [dbo].[MenuItems] ([Id], [Key], [Name], [ParentId], [Route], [Icon], [Sort]) VALUES (N'9f7dd98f-381f-4cec-8448-b1f7e3ce6531', N'global-management', N'Quản lý chung', NULL, NULL, NULL, 3)
INSERT [dbo].[MenuItems] ([Id], [Key], [Name], [ParentId], [Route], [Icon], [Sort]) VALUES (N'63a5cead-6c28-4993-8c46-d86458b4d8bb', N'evaluation-periods', N'Danh mục kỳ đánh giá', N'97e2f2a0-00c8-492e-8503-adbbcb791b1f', N'/categories/evaluation-periods', N'IconClipboardTextClock', 6)
INSERT [dbo].[MenuItems] ([Id], [Key], [Name], [ParentId], [Route], [Icon], [Sort]) VALUES (N'e73b567f-c830-41d4-ac5c-e299543cf95a', N'self-evaluation', N'Tự đánh giá', N'f0a0148d-7e05-4873-b5bd-37e61c626887', N'/evaluation-forms/self-evaluation', N'IconBxUserCheck', 1)
INSERT [dbo].[MenuItems] ([Id], [Key], [Name], [ParentId], [Route], [Icon], [Sort]) VALUES (N'32cc32e8-8e12-4b5f-9089-e2c52227155d', N'evaluation-comments', N'Danh mục nhận xét đánh giá', N'97e2f2a0-00c8-492e-8503-adbbcb791b1f', N'/categories/evaluation-comments', N'IconComment', 5)
INSERT [dbo].[MenuItems] ([Id], [Key], [Name], [ParentId], [Route], [Icon], [Sort]) VALUES (N'51b36720-d531-4648-9efb-e80c5bdd04a5', N'roles', N'Quản lý vai trò', N'9f7dd98f-381f-4cec-8448-b1f7e3ce6531', N'/global-management/roles', N'IconUserShield', 1)
INSERT [dbo].[MenuItems] ([Id], [Key], [Name], [ParentId], [Route], [Icon], [Sort]) VALUES (N'f9518f77-2b01-4131-b229-f1f675f5ceca', N'evaluations', N'Quản lý phiếu đánh giá', NULL, N'/evaluations', N'IconDocument_justified', 2)
INSERT [dbo].[MenuItems] ([Id], [Key], [Name], [ParentId], [Route], [Icon], [Sort]) VALUES (N'd7d627dc-8642-4131-ac61-f629a0f69929', N'organization-management', N'Quản lý đơn vị và nhân sự', NULL, NULL, NULL, 4)
INSERT [dbo].[MenuItems] ([Id], [Key], [Name], [ParentId], [Route], [Icon], [Sort]) VALUES (N'fa70e2f4-8d7f-479d-a12a-f91508b8c33e', N'statistics', N'Thống kê', NULL, NULL, NULL, 6)
INSERT [dbo].[MenuItems] ([Id], [Key], [Name], [ParentId], [Route], [Icon], [Sort]) VALUES (N'6f9046d3-eb0e-4da1-97c1-f9509c240fd9', N'evaluation-pros-cons', N'Danh mục ưu và nhược điểm đánh giá', N'97e2f2a0-00c8-492e-8503-adbbcb791b1f', N'/categories/evaluation-pros-cons', N'IconThumbsUpDown', 4)
GO
INSERT [dbo].[RefreshToken] ([Id], [UserId], [Token], [JwtId], [IsUsed], [IsRevoked], [IssuedAt], [ExpiredAt]) VALUES (N'cb86f61f-824a-4dbe-8de9-0739abca4232', N'a6ba15f2-d668-4059-a1c4-5b0deda85c47', N'aSa3PFKqbpKX4VwDXzwPhmEjEZ8Bf7QyvtFQhJ34tt0=', N'22c1c6cb-933e-441b-8631-b265490b956a', 0, 0, CAST(N'2024-11-20T21:09:58.8381291' AS DateTime2), CAST(N'2024-11-27T21:09:58.8381725' AS DateTime2))
INSERT [dbo].[RefreshToken] ([Id], [UserId], [Token], [JwtId], [IsUsed], [IsRevoked], [IssuedAt], [ExpiredAt]) VALUES (N'0c86b8f5-4474-4e0d-9067-1358d1403ef2', N'1c004580-03da-44c4-b52f-436e4ae47bad', N'wZy79prL1rLebungLudseZpK0xtjaPLE0lKR4yxfUGI=', N'c11ae62d-f3f2-4a8c-921f-645555d2a5fd', 0, 0, CAST(N'2024-11-21T13:08:04.9298947' AS DateTime2), CAST(N'2024-11-28T13:08:04.9298949' AS DateTime2))
INSERT [dbo].[RefreshToken] ([Id], [UserId], [Token], [JwtId], [IsUsed], [IsRevoked], [IssuedAt], [ExpiredAt]) VALUES (N'ba7fdf20-5e7d-46f1-a860-3e1620a46732', N'd486e012-c894-4cf0-b036-445850887364', N'HlajpeIPI6TIS5uMwh1Mj9pMIROVOx+vPCfm2BrKZsg=', N'edca48f3-6303-48bf-8d3d-284d1d378e86', 0, 0, CAST(N'2024-11-21T21:01:14.1423772' AS DateTime2), CAST(N'2024-11-28T21:01:14.1424159' AS DateTime2))
INSERT [dbo].[RefreshToken] ([Id], [UserId], [Token], [JwtId], [IsUsed], [IsRevoked], [IssuedAt], [ExpiredAt]) VALUES (N'4401b503-d989-4d74-9ff9-4b7a5120a68b', N'89675a85-e1bc-459b-8036-9e1597ed929a', N'pLpoXF/6nfbKDRVPTdUPNOwYbi3QacZ4yn1gWXJaFvQ=', N'd3f8aaee-2e31-4cc3-a0fd-f7a285906bea', 0, 0, CAST(N'2024-11-18T21:29:05.6866802' AS DateTime2), CAST(N'2024-11-25T21:29:05.6866803' AS DateTime2))
INSERT [dbo].[RefreshToken] ([Id], [UserId], [Token], [JwtId], [IsUsed], [IsRevoked], [IssuedAt], [ExpiredAt]) VALUES (N'a6ba55fa-73d3-4f7b-9e30-adabcbee655b', N'6b2dc1cb-7a55-4f16-b9cf-6cf6a048edea', N'b6sVzCsqDzRZcDbzLUnpmGaNcaKeQP4Q5nT1ek+VGyY=', N'de907915-6ec0-4470-8335-6f71ea054dbb', 0, 0, CAST(N'2024-11-20T20:46:25.3939410' AS DateTime2), CAST(N'2024-11-27T20:46:25.3939411' AS DateTime2))
INSERT [dbo].[RefreshToken] ([Id], [UserId], [Token], [JwtId], [IsUsed], [IsRevoked], [IssuedAt], [ExpiredAt]) VALUES (N'9ca25d30-922a-40cc-9406-ae282fae5f27', N'3df19402-0808-47f6-9d47-e15b5a0df798', N'A1YJ9eKgMl5z2JHxIS8ab8ccFk8e4Gg3nhit+dJuruk=', N'8472e88c-f4bd-4731-8db0-83b050d7cf6e', 0, 0, CAST(N'2024-11-18T21:28:55.7180645' AS DateTime2), CAST(N'2024-11-25T21:28:55.7180646' AS DateTime2))
INSERT [dbo].[RefreshToken] ([Id], [UserId], [Token], [JwtId], [IsUsed], [IsRevoked], [IssuedAt], [ExpiredAt]) VALUES (N'e64df8d7-c9aa-49e8-8526-da0767b74c49', N'9b7c2d93-7d20-4406-8a0a-7883cc4f3c3d', N'OWZshHIVrT7bzGpyvOuZT9y/j/5Hdl6cyKX/fQQF8vU=', N'15595a17-c356-4686-b881-dbadacebbd7b', 0, 0, CAST(N'2024-11-18T21:43:07.8555653' AS DateTime2), CAST(N'2024-11-25T21:43:07.8555654' AS DateTime2))
GO
INSERT [dbo].[RoleMenuItems] ([Id], [RoleId], [MenuItemId]) VALUES (N'cd630be4-3e58-4333-bb10-19d240ed7da6', N'a6204804-82cf-4f94-a3e1-07cd10a8e579', N'78ca07f2-0549-449a-9ca4-8a950a40b567')
INSERT [dbo].[RoleMenuItems] ([Id], [RoleId], [MenuItemId]) VALUES (N'a2605a4d-f607-42c6-b0ba-2c76c8cc9a92', N'a6204804-82cf-4f94-a3e1-07cd10a8e579', N'b67dc630-6c6f-4dd1-88a1-1380ddf043f6')
INSERT [dbo].[RoleMenuItems] ([Id], [RoleId], [MenuItemId]) VALUES (N'ca58983b-0242-43b7-8797-3688d2122a54', N'fa00a51d-a46e-4d10-926e-5ba8ba68d432', N'd0a617ce-7a4a-4556-a2d0-82503dfef228')
INSERT [dbo].[RoleMenuItems] ([Id], [RoleId], [MenuItemId]) VALUES (N'ad7c21ad-a5ab-470e-9b58-3c7009737bae', N'a6204804-82cf-4f94-a3e1-07cd10a8e579', N'93a76a6e-3f4c-4d02-9b67-3c938a873be1')
INSERT [dbo].[RoleMenuItems] ([Id], [RoleId], [MenuItemId]) VALUES (N'021a7598-f7ea-49b1-9227-45924746d606', N'a6204804-82cf-4f94-a3e1-07cd10a8e579', N'fa70e2f4-8d7f-479d-a12a-f91508b8c33e')
INSERT [dbo].[RoleMenuItems] ([Id], [RoleId], [MenuItemId]) VALUES (N'b5e0e377-6a76-471a-b912-49614d31b23c', N'fa00a51d-a46e-4d10-926e-5ba8ba68d432', N'f0a0148d-7e05-4873-b5bd-37e61c626887')
INSERT [dbo].[RoleMenuItems] ([Id], [RoleId], [MenuItemId]) VALUES (N'4a9ad7a3-ff0a-419d-a243-5fa9e2aae79d', N'20a6ddc3-0e72-400e-80e0-dd5256182a9a', N'd0a617ce-7a4a-4556-a2d0-82503dfef228')
INSERT [dbo].[RoleMenuItems] ([Id], [RoleId], [MenuItemId]) VALUES (N'28378e3d-39c9-416b-ae57-6dc881c5866f', N'a6204804-82cf-4f94-a3e1-07cd10a8e579', N'6f9046d3-eb0e-4da1-97c1-f9509c240fd9')
INSERT [dbo].[RoleMenuItems] ([Id], [RoleId], [MenuItemId]) VALUES (N'd7d828f6-a641-4bc5-99db-780998206f67', N'bc4ce45e-b29f-4f21-8c68-9e1cff35614e', N'dd8e29a6-c51e-4e9a-9b89-6c255c7f1e07')
INSERT [dbo].[RoleMenuItems] ([Id], [RoleId], [MenuItemId]) VALUES (N'c19762b7-1b8f-4cef-ac3f-84c0b47f3bf3', N'a6204804-82cf-4f94-a3e1-07cd10a8e579', N'32cc32e8-8e12-4b5f-9089-e2c52227155d')
INSERT [dbo].[RoleMenuItems] ([Id], [RoleId], [MenuItemId]) VALUES (N'90b87d24-e30f-4522-beae-856872629c59', N'fa00a51d-a46e-4d10-926e-5ba8ba68d432', N'fa70e2f4-8d7f-479d-a12a-f91508b8c33e')
INSERT [dbo].[RoleMenuItems] ([Id], [RoleId], [MenuItemId]) VALUES (N'a0060678-723d-420d-aacb-8613758a0cff', N'a6204804-82cf-4f94-a3e1-07cd10a8e579', N'f0a0148d-7e05-4873-b5bd-37e61c626887')
INSERT [dbo].[RoleMenuItems] ([Id], [RoleId], [MenuItemId]) VALUES (N'48f37ff3-4793-4a60-aaed-8a07583517b9', N'a6204804-82cf-4f94-a3e1-07cd10a8e579', N'97e2f2a0-00c8-492e-8503-adbbcb791b1f')
INSERT [dbo].[RoleMenuItems] ([Id], [RoleId], [MenuItemId]) VALUES (N'9de602da-09ca-4621-97fb-8d4bd68cb245', N'fa00a51d-a46e-4d10-926e-5ba8ba68d432', N'e73b567f-c830-41d4-ac5c-e299543cf95a')
INSERT [dbo].[RoleMenuItems] ([Id], [RoleId], [MenuItemId]) VALUES (N'0148ffc9-3c92-4467-878a-947f42199a60', N'a6204804-82cf-4f94-a3e1-07cd10a8e579', N'51b36720-d531-4648-9efb-e80c5bdd04a5')
INSERT [dbo].[RoleMenuItems] ([Id], [RoleId], [MenuItemId]) VALUES (N'7a7b7109-2e4c-4de9-94f1-b069c98bd024', N'20a6ddc3-0e72-400e-80e0-dd5256182a9a', N'e73b567f-c830-41d4-ac5c-e299543cf95a')
INSERT [dbo].[RoleMenuItems] ([Id], [RoleId], [MenuItemId]) VALUES (N'31cab040-a18a-419e-afa1-b072436eec86', N'fa00a51d-a46e-4d10-926e-5ba8ba68d432', N'7df44a05-ecf1-4adf-91ee-328dcbd5dd99')
INSERT [dbo].[RoleMenuItems] ([Id], [RoleId], [MenuItemId]) VALUES (N'20859630-8736-4ef7-8e47-b2bffab8f8bb', N'a6204804-82cf-4f94-a3e1-07cd10a8e579', N'dd8e29a6-c51e-4e9a-9b89-6c255c7f1e07')
INSERT [dbo].[RoleMenuItems] ([Id], [RoleId], [MenuItemId]) VALUES (N'f1d8d4fa-1b8b-4386-b59b-b5ffff8901dd', N'a6204804-82cf-4f94-a3e1-07cd10a8e579', N'8d34733f-09dd-4c18-8170-16e03456d202')
INSERT [dbo].[RoleMenuItems] ([Id], [RoleId], [MenuItemId]) VALUES (N'd6fee506-0241-4be2-a431-bb1005d6e857', N'a6204804-82cf-4f94-a3e1-07cd10a8e579', N'3172d91d-37cf-46ec-9eb8-62fd2a01e691')
INSERT [dbo].[RoleMenuItems] ([Id], [RoleId], [MenuItemId]) VALUES (N'b410604a-514e-41b5-9efd-c05cff11ad70', N'a6204804-82cf-4f94-a3e1-07cd10a8e579', N'7df44a05-ecf1-4adf-91ee-328dcbd5dd99')
INSERT [dbo].[RoleMenuItems] ([Id], [RoleId], [MenuItemId]) VALUES (N'f89669e9-63d8-43db-9029-c28a49261111', N'a6204804-82cf-4f94-a3e1-07cd10a8e579', N'd7d627dc-8642-4131-ac61-f629a0f69929')
INSERT [dbo].[RoleMenuItems] ([Id], [RoleId], [MenuItemId]) VALUES (N'517a6492-6066-4201-a1ba-c507c22dc973', N'fa00a51d-a46e-4d10-926e-5ba8ba68d432', N'f9518f77-2b01-4131-b229-f1f675f5ceca')
INSERT [dbo].[RoleMenuItems] ([Id], [RoleId], [MenuItemId]) VALUES (N'df343f3a-6243-45ad-91a8-cb22451b0fed', N'a6204804-82cf-4f94-a3e1-07cd10a8e579', N'be782bc6-5b5f-4edc-a2c4-0dc8ad2af70e')
INSERT [dbo].[RoleMenuItems] ([Id], [RoleId], [MenuItemId]) VALUES (N'e5cd423c-b431-44cd-b0d5-cc05a99dc64e', N'bc4ce45e-b29f-4f21-8c68-9e1cff35614e', N'd0a617ce-7a4a-4556-a2d0-82503dfef228')
INSERT [dbo].[RoleMenuItems] ([Id], [RoleId], [MenuItemId]) VALUES (N'34abb084-a6f8-4957-a88f-cc2867857562', N'bc4ce45e-b29f-4f21-8c68-9e1cff35614e', N'f0a0148d-7e05-4873-b5bd-37e61c626887')
INSERT [dbo].[RoleMenuItems] ([Id], [RoleId], [MenuItemId]) VALUES (N'd6e03699-1fcc-4488-a079-d332c4aa440c', N'a6204804-82cf-4f94-a3e1-07cd10a8e579', N'f9518f77-2b01-4131-b229-f1f675f5ceca')
INSERT [dbo].[RoleMenuItems] ([Id], [RoleId], [MenuItemId]) VALUES (N'29e0aa2c-f3df-49d3-9f2a-da8442b260fb', N'bc4ce45e-b29f-4f21-8c68-9e1cff35614e', N'e73b567f-c830-41d4-ac5c-e299543cf95a')
INSERT [dbo].[RoleMenuItems] ([Id], [RoleId], [MenuItemId]) VALUES (N'7a1cf114-7c8f-4e18-808c-e50b028812b1', N'fa00a51d-a46e-4d10-926e-5ba8ba68d432', N'dd8e29a6-c51e-4e9a-9b89-6c255c7f1e07')
INSERT [dbo].[RoleMenuItems] ([Id], [RoleId], [MenuItemId]) VALUES (N'8145203e-46a4-43f5-a7bd-ebab9768d35e', N'a6204804-82cf-4f94-a3e1-07cd10a8e579', N'63a5cead-6c28-4993-8c46-d86458b4d8bb')
INSERT [dbo].[RoleMenuItems] ([Id], [RoleId], [MenuItemId]) VALUES (N'f55da6b0-120b-4a28-815f-ed194ee73f77', N'a6204804-82cf-4f94-a3e1-07cd10a8e579', N'e73b567f-c830-41d4-ac5c-e299543cf95a')
INSERT [dbo].[RoleMenuItems] ([Id], [RoleId], [MenuItemId]) VALUES (N'd9aea025-6aaa-4df2-9599-f2f1a829d6ac', N'a6204804-82cf-4f94-a3e1-07cd10a8e579', N'9f7dd98f-381f-4cec-8448-b1f7e3ce6531')
INSERT [dbo].[RoleMenuItems] ([Id], [RoleId], [MenuItemId]) VALUES (N'cef7aa14-46cd-4953-9858-f79704fed51e', N'a6204804-82cf-4f94-a3e1-07cd10a8e579', N'd0a617ce-7a4a-4556-a2d0-82503dfef228')
INSERT [dbo].[RoleMenuItems] ([Id], [RoleId], [MenuItemId]) VALUES (N'28571700-b465-4c4b-ad24-fbeb957dfb4d', N'20a6ddc3-0e72-400e-80e0-dd5256182a9a', N'f0a0148d-7e05-4873-b5bd-37e61c626887')
GO
INSERT [dbo].[Roles] ([Id], [RoleName], [UpdatedAt], [IsDeleted]) VALUES (N'a6204804-82cf-4f94-a3e1-07cd10a8e579', N'QUẢN TRỊ HỆ THỐNG', CAST(N'2024-11-20T22:24:39.3415656' AS DateTime2), 0)
INSERT [dbo].[Roles] ([Id], [RoleName], [UpdatedAt], [IsDeleted]) VALUES (N'fa00a51d-a46e-4d10-926e-5ba8ba68d432', N'QUẢN LÝ ĐƠN VỊ', CAST(N'2024-11-20T22:28:33.5565517' AS DateTime2), 0)
INSERT [dbo].[Roles] ([Id], [RoleName], [UpdatedAt], [IsDeleted]) VALUES (N'459779cb-eece-4ac0-afed-791253c18be4', N'test1234566', CAST(N'2024-10-25T14:48:26.6279582' AS DateTime2), 1)
INSERT [dbo].[Roles] ([Id], [RoleName], [UpdatedAt], [IsDeleted]) VALUES (N'10aa2a01-5d85-428e-8b4f-7d41fce70a42', N'asdsad3334412', CAST(N'2024-10-25T14:57:39.2114150' AS DateTime2), 1)
INSERT [dbo].[Roles] ([Id], [RoleName], [UpdatedAt], [IsDeleted]) VALUES (N'bc4ce45e-b29f-4f21-8c68-9e1cff35614e', N'GIÁM SÁT VIÊN', CAST(N'2024-11-14T10:02:30.1959877' AS DateTime2), 0)
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
INSERT [dbo].[User] ([Id], [UserTypeId], [UnitId], [FullName], [Email], [Password], [Phone], [Address], [Birthday], [PositionsName], [IsActive], [IsDeleted], [UpdatedAt]) VALUES (N'1c004580-03da-44c4-b52f-436e4ae47bad', N'25baa22a-3368-4958-96a2-fe3a3591a35d', N'fe6717f3-92c1-48dd-acf6-a65dbefdb04e', N'phòng giáo dục', N'pgd@gmail.com', N'admin', N'03263935423', N'asdad', CAST(N'2024-11-28T00:00:00.0000000' AS DateTime2), N'VCQL', 1, 0, CAST(N'2024-11-20T21:11:27.8014994' AS DateTime2))
INSERT [dbo].[User] ([Id], [UserTypeId], [UnitId], [FullName], [Email], [Password], [Phone], [Address], [Birthday], [PositionsName], [IsActive], [IsDeleted], [UpdatedAt]) VALUES (N'd486e012-c894-4cf0-b036-445850887364', N'0acb8f47-7f4b-4ed9-aeb8-b331f0dbf704', N'4402c619-783f-4580-83cd-86e50a47171d', N'Hiệu trưởng', N'ht@gmail.com', N'admin', N'0326393545', N'asdsad', CAST(N'2024-11-09T00:00:00.0000000' AS DateTime2), N'VCQL', 1, 0, CAST(N'2024-11-20T21:03:37.3443246' AS DateTime2))
INSERT [dbo].[User] ([Id], [UserTypeId], [UnitId], [FullName], [Email], [Password], [Phone], [Address], [Birthday], [PositionsName], [IsActive], [IsDeleted], [UpdatedAt]) VALUES (N'a6ba15f2-d668-4059-a1c4-5b0deda85c47', N'25baa22a-3368-4958-96a2-fe3a3591a35d', N'7787a766-2655-457b-afa5-cc21e94ff712', N'ADMIN', N'admin@gmail.com', N'admin', N'03263935401', N'Lộc Ninh, Bình Phước', CAST(N'2002-01-20T00:00:00.0000000' AS DateTime2), N'LDHD', 1, 0, CAST(N'2024-10-31T15:01:27.4135003' AS DateTime2))
INSERT [dbo].[User] ([Id], [UserTypeId], [UnitId], [FullName], [Email], [Password], [Phone], [Address], [Birthday], [PositionsName], [IsActive], [IsDeleted], [UpdatedAt]) VALUES (N'6b2dc1cb-7a55-4f16-b9cf-6cf6a048edea', N'1bd77fd4-32a8-4c80-ad95-e0c9373d485f', N'4402c619-783f-4580-83cd-86e50a47171d', N'Giáo viên 1', N'giaovien1@gmail.com', N'admin', N'0326393540', N'asdsdasdsad', CAST(N'2024-11-01T00:00:00.0000000' AS DateTime2), N'VCGV', 1, 0, CAST(N'2024-11-15T22:10:18.8948435' AS DateTime2))
INSERT [dbo].[User] ([Id], [UserTypeId], [UnitId], [FullName], [Email], [Password], [Phone], [Address], [Birthday], [PositionsName], [IsActive], [IsDeleted], [UpdatedAt]) VALUES (N'9b7c2d93-7d20-4406-8a0a-7883cc4f3c3d', N'4bb20ca7-76b9-4137-b32a-1174b43a9765', N'4402c619-783f-4580-83cd-86e50a47171d', N'Trưởng bộ môn', N'tbm@gmail.com', N'admin', N'0326393544', N'asdsad', CAST(N'2024-11-16T00:00:00.0000000' AS DateTime2), N'VCGV', 1, 0, CAST(N'2024-11-15T22:17:11.2805409' AS DateTime2))
INSERT [dbo].[User] ([Id], [UserTypeId], [UnitId], [FullName], [Email], [Password], [Phone], [Address], [Birthday], [PositionsName], [IsActive], [IsDeleted], [UpdatedAt]) VALUES (N'89675a85-e1bc-459b-8036-9e1597ed929a', N'1bd77fd4-32a8-4c80-ad95-e0c9373d485f', N'4402c619-783f-4580-83cd-86e50a47171d', N'Giáo viên 3', N'giaovien3@gmail.com', N'admin', N'0326393543', N'asds', CAST(N'2024-11-16T00:00:00.0000000' AS DateTime2), N'VCGV', 1, 0, CAST(N'2024-11-20T20:46:06.7061149' AS DateTime2))
INSERT [dbo].[User] ([Id], [UserTypeId], [UnitId], [FullName], [Email], [Password], [Phone], [Address], [Birthday], [PositionsName], [IsActive], [IsDeleted], [UpdatedAt]) VALUES (N'3df19402-0808-47f6-9d47-e15b5a0df798', N'1bd77fd4-32a8-4c80-ad95-e0c9373d485f', N'4402c619-783f-4580-83cd-86e50a47171d', N'Giáo viên 2', N'giaovien2@gmail.com', N'admin', N'0326393541', N'asdd', CAST(N'2024-11-02T00:00:00.0000000' AS DateTime2), N'VCGV', 1, 0, CAST(N'2024-11-20T20:46:01.5327984' AS DateTime2))
GO
INSERT [dbo].[UserRoles] ([Id], [RoleId], [UserId]) VALUES (N'5ec426a8-81c9-445b-8c40-04ec735b7394', N'bc4ce45e-b29f-4f21-8c68-9e1cff35614e', N'9b7c2d93-7d20-4406-8a0a-7883cc4f3c3d')
INSERT [dbo].[UserRoles] ([Id], [RoleId], [UserId]) VALUES (N'196e39dc-f75b-4af1-922e-4c7904180ed4', N'a6204804-82cf-4f94-a3e1-07cd10a8e579', N'a6ba15f2-d668-4059-a1c4-5b0deda85c47')
INSERT [dbo].[UserRoles] ([Id], [RoleId], [UserId]) VALUES (N'483600af-e225-4904-895f-88fe592883a2', N'fa00a51d-a46e-4d10-926e-5ba8ba68d432', N'd486e012-c894-4cf0-b036-445850887364')
INSERT [dbo].[UserRoles] ([Id], [RoleId], [UserId]) VALUES (N'9bf36fcd-ff24-4c60-b35b-ae534fc10c92', N'20a6ddc3-0e72-400e-80e0-dd5256182a9a', N'89675a85-e1bc-459b-8036-9e1597ed929a')
INSERT [dbo].[UserRoles] ([Id], [RoleId], [UserId]) VALUES (N'1f48033f-2f81-44b7-9173-cd7f0c8210ce', N'20a6ddc3-0e72-400e-80e0-dd5256182a9a', N'6b2dc1cb-7a55-4f16-b9cf-6cf6a048edea')
INSERT [dbo].[UserRoles] ([Id], [RoleId], [UserId]) VALUES (N'd3ee80f2-4634-4648-a221-d0db591f02bf', N'20a6ddc3-0e72-400e-80e0-dd5256182a9a', N'3df19402-0808-47f6-9d47-e15b5a0df798')
INSERT [dbo].[UserRoles] ([Id], [RoleId], [UserId]) VALUES (N'ae15e805-5248-442c-85c4-e33b465a2de1', N'a6204804-82cf-4f94-a3e1-07cd10a8e579', N'1c004580-03da-44c4-b52f-436e4ae47bad')
GO
INSERT [dbo].[UserType] ([Id], [UserTypeName], [UpdatedAt], [IsDeleted]) VALUES (N'3cff44e1-32d2-49d7-ae22-01e2ce616c56', N'TEST1S', CAST(N'2024-10-31T10:54:47.9610611' AS DateTime2), 1)
INSERT [dbo].[UserType] ([Id], [UserTypeName], [UpdatedAt], [IsDeleted]) VALUES (N'4bb20ca7-76b9-4137-b32a-1174b43a9765', N'TRƯỞNG BỘ MÔN', CAST(N'2024-10-31T13:07:06.9601907' AS DateTime2), 0)
INSERT [dbo].[UserType] ([Id], [UserTypeName], [UpdatedAt], [IsDeleted]) VALUES (N'db1bc179-7f4c-4eb3-9e9b-24c67f6421f4', N'TEST23S', CAST(N'2024-10-31T10:54:42.9018584' AS DateTime2), 1)
INSERT [dbo].[UserType] ([Id], [UserTypeName], [UpdatedAt], [IsDeleted]) VALUES (N'1c1dcbe5-babf-4e41-a04f-425efd75fef1', N'PHÓ HIỆU TRƯỞNG', CAST(N'2024-10-31T13:05:29.3369892' AS DateTime2), 0)
INSERT [dbo].[UserType] ([Id], [UserTypeName], [UpdatedAt], [IsDeleted]) VALUES (N'c76b48e9-d169-46bc-bc1e-62276cb19010', N'ASDASDASs', CAST(N'2024-10-31T10:54:09.6878590' AS DateTime2), 1)
INSERT [dbo].[UserType] ([Id], [UserTypeName], [UpdatedAt], [IsDeleted]) VALUES (N'0acb8f47-7f4b-4ed9-aeb8-b331f0dbf704', N'HIỆU TRƯỞNG', CAST(N'2024-10-31T13:05:17.7327675' AS DateTime2), 0)
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
