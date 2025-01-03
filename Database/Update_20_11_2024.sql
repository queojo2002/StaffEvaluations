USE [SA_DEMO_1]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 11/20/2024 8:23:28 PM ******/
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
/****** Object:  Table [dbo].[CategoryComment]    Script Date: 11/20/2024 8:23:28 PM ******/
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
/****** Object:  Table [dbo].[CategoryCriteria]    Script Date: 11/20/2024 8:23:28 PM ******/
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
/****** Object:  Table [dbo].[CategoryProsCons]    Script Date: 11/20/2024 8:23:28 PM ******/
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
/****** Object:  Table [dbo].[CategoryRating]    Script Date: 11/20/2024 8:23:28 PM ******/
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
/****** Object:  Table [dbo].[CategoryTimeType]    Script Date: 11/20/2024 8:23:28 PM ******/
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
/****** Object:  Table [dbo].[ElectronicSignature]    Script Date: 11/20/2024 8:23:28 PM ******/
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
/****** Object:  Table [dbo].[Evaluation]    Script Date: 11/20/2024 8:23:28 PM ******/
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
/****** Object:  Table [dbo].[EvaluationAAE]    Script Date: 11/20/2024 8:23:28 PM ******/
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
/****** Object:  Table [dbo].[EvaluationCriteria]    Script Date: 11/20/2024 8:23:28 PM ******/
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
/****** Object:  Table [dbo].[EvaluationDetailsPersonal]    Script Date: 11/20/2024 8:23:28 PM ******/
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
/****** Object:  Table [dbo].[EvaluationDetailsSupervisor]    Script Date: 11/20/2024 8:23:28 PM ******/
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
/****** Object:  Table [dbo].[EvaluationExplaint]    Script Date: 11/20/2024 8:23:28 PM ******/
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
/****** Object:  Table [dbo].[EvaluationUser]    Script Date: 11/20/2024 8:23:28 PM ******/
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
/****** Object:  Table [dbo].[MenuItems]    Script Date: 11/20/2024 8:23:28 PM ******/
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
/****** Object:  Table [dbo].[RefreshToken]    Script Date: 11/20/2024 8:23:28 PM ******/
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
/****** Object:  Table [dbo].[RoleMenuItems]    Script Date: 11/20/2024 8:23:28 PM ******/
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
/****** Object:  Table [dbo].[Roles]    Script Date: 11/20/2024 8:23:28 PM ******/
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
/****** Object:  Table [dbo].[Unit]    Script Date: 11/20/2024 8:23:28 PM ******/
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
/****** Object:  Table [dbo].[User]    Script Date: 11/20/2024 8:23:28 PM ******/
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
/****** Object:  Table [dbo].[UserRoles]    Script Date: 11/20/2024 8:23:28 PM ******/
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
/****** Object:  Table [dbo].[UserType]    Script Date: 11/20/2024 8:23:28 PM ******/
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
INSERT [dbo].[ElectronicSignature] ([Id], [UserId], [Status], [PublicKey], [PrivateKey], [UpdatedAt]) VALUES (N'1262d4a3-711f-44d7-9d4e-ec26fa536225', N'd486e012-c894-4cf0-b036-445850887364', 0, N'MIIBCgKCAQEA8+GejpcuuElvpqGmb02/3E4EuLnTW3yo1YbCwRFVyrimvOUbfJM8plGBJ337xhYbgO8Pr6KA6xM92GQ/HBHh1RO3YWmVMj9aghRDIloSq1Ju3aM0+0g715Ol0AIXP3bT/AemZdx5j8yEaQCy/vP2cl21bJmYAAMUIOePpdz3SEGIGq/W8zab1T8NOQmd1DiPt5vlhzlrtX2Y0iRodQEUmlRC6d+LeKVR+OngcBzDwQskWyoCedSXy8jZ70rgJQz7WrNkSzRf7fEy5CvDXVKOlpk6t/Ah3O+ChMRU09zhbZ9XeXWU79GyQ48OpTNudwRxs4dqb1dqS6v6+ns4tDFHiQIDAQAB', N'MIIEogIBAAKCAQEA8+GejpcuuElvpqGmb02/3E4EuLnTW3yo1YbCwRFVyrimvOUbfJM8plGBJ337xhYbgO8Pr6KA6xM92GQ/HBHh1RO3YWmVMj9aghRDIloSq1Ju3aM0+0g715Ol0AIXP3bT/AemZdx5j8yEaQCy/vP2cl21bJmYAAMUIOePpdz3SEGIGq/W8zab1T8NOQmd1DiPt5vlhzlrtX2Y0iRodQEUmlRC6d+LeKVR+OngcBzDwQskWyoCedSXy8jZ70rgJQz7WrNkSzRf7fEy5CvDXVKOlpk6t/Ah3O+ChMRU09zhbZ9XeXWU79GyQ48OpTNudwRxs4dqb1dqS6v6+ns4tDFHiQIDAQABAoIBAEumW9GtUb+2f9y3XfI+stn6lXpbohVJ6PE7OSQ8ZVlZx9bmVo1g+ro4pBCFAtliOCvZfAsmJElHEbMS/YSOg3feAs9DuhT5E/Evqdd5Czt7eYpkuuWLdYycbx3D2ERGbuFJ2jLUnhyd+yC7J8rwEC1PphxG1KCEU/UU/zka/tW5ayL9h64L/Lsf5oKLgWqdgYgOQAgaTWz37oyhTT+VCC1z+TclgD4pf5sboXF8dLjyN874C+y1/svwld+r5P3BhbMWnWVoNkuMq+MhgYNSff0by//s1WlmKaBkdYA+WxSaEim0ScBSplksirSShEXSF73WjlKt8hZea7EW/wKvR6UCgYEA+G1Bly30ZaVOXoRx07K6VzG1hSFgcQP8iozGVTZvqNERSuqQzwfP1QK90wONQFljelPZR5Vbqqiv56G8kEpWtYbZPdnWPxTpG1TXroETNRrtRztOyeU2vPfioeMBoTUXrdpfFp7hjPtWNk33u9mcVgFPHujC/luChd/IyOJSWzMCgYEA+1Dj2GN6t/SE56UKYo2ahxUvH9RyQ+4SO283I74UZvtxM4WtRAUEaXkL68/x0rJumLLOe8rymsfbgiKeAcIGB7ZBR4yV9Mab02jtituEWrwcqxgUFd1od34sD6P6mlxnsTr4E3IQlsVldosTPSUAeX0TB9+71xYy02SiMNWbclMCgYA8HZw4rDsu+bCcOKqe0uo6vWGypKAE2TUchfJcnn6ouGbZ3SdLohVN84rh7EMbJkZnTLEQnHkBNC7U+5N4yzRuWwJo8DTjMPkzzvUeWke+mxR+H0DypE/5rHagPCGh1Ao13NkTzUDBb/St0XI4d/FX8psl3KeLC7PrF3sr+XB6dwKBgC/+zsSwmusuw4MJveX8bRqHLSzDAd9/Q/Qd1UX6MyNHueLBEMoAu0r5VxF98QzwDrcSzuRNae+tY3qC6fIj/8rRP75OVwUcOP4y98qhCbHaYw851fwnAKBxdDC4fE+mfhcWz/HGwuxIXow5Gz9+JY0OGehTDiiRkLtWaLMy2DEJAoGABbNDosX0c9TtRJSFoT/VEyiPnCo4KtSZ01n3ZD1e3LcoojjxQ4iB8jgkixFhjZe0DGOfxR7aqyVTsMtFi3OttAh/jqjKo7jDcwyZ77XUHkegyMDOy86A4Tb9kx46dX1RP/hsy1y3/gJYq0zMJcTghQhybV2L6Fa+pJngqO1Pdjk=', CAST(N'2024-11-15T22:16:54.5218025' AS DateTime2))
INSERT [dbo].[ElectronicSignature] ([Id], [UserId], [Status], [PublicKey], [PrivateKey], [UpdatedAt]) VALUES (N'c84dad6a-c55e-41f9-a400-ee5a49a88c0c', N'89675a85-e1bc-459b-8036-9e1597ed929a', 0, N'MIIBCgKCAQEAuypi6UpLLFNj7g6PK7Dj2KfhmVKdQ8MJLh38gNvht8ChI0PPdp/zMBfNANB6bf78YVxC+qlFE7nnHTqsO0snhSxCOMmHaKQGrJTnAIqG4N9h1AAUEVbmu+tHkP+v1Jympaf/+xNyTsSbI90sf9V45xn+B/XGCf8xAvGd90BAY9ZCXfUjQRUQZlz9s2vc+/sCLqJRtmM/cHgbNRw5keZzsWe9k/oD613FY7qS/5VDYYId553P6euZW597A/W8cGZVWcHRv07JMc5WCQxQi3tXbScaZAyk89RcTmb5GSPxvT89E10jhwGv3beBBJfJjee0bWQLyPmiYbeV9EElNwRxAQIDAQAB', N'MIIEpAIBAAKCAQEAuypi6UpLLFNj7g6PK7Dj2KfhmVKdQ8MJLh38gNvht8ChI0PPdp/zMBfNANB6bf78YVxC+qlFE7nnHTqsO0snhSxCOMmHaKQGrJTnAIqG4N9h1AAUEVbmu+tHkP+v1Jympaf/+xNyTsSbI90sf9V45xn+B/XGCf8xAvGd90BAY9ZCXfUjQRUQZlz9s2vc+/sCLqJRtmM/cHgbNRw5keZzsWe9k/oD613FY7qS/5VDYYId553P6euZW597A/W8cGZVWcHRv07JMc5WCQxQi3tXbScaZAyk89RcTmb5GSPxvT89E10jhwGv3beBBJfJjee0bWQLyPmiYbeV9EElNwRxAQIDAQABAoIBAFJHHdhEaqt/tSxPhizExETX+Fq4cJ37PSvizr+u6Zknuy6PfsI9KmD39YzoGQoFz9jVADTE+LLlRG4a/t/J+AOZIztnjHk5sh1oD+yy+Pwd9xmFN00wEJqHoZxial9ixfeI1QUA1X0+/JxVfFxt8YpWaNADAR4f6uHKaZDp0+SO6WkXB5rblQ7je6SbAk7RkmqIOKodlxjUKc0g2Z6/JzSrnnpfELKrA3nWwRzDzUxnBXx57sarEzQrO+3ZbrRU55CYJE4fzNhAacYv5YlsC7uxxmJWcJkfQgkLXuSJINsCaSenbL7fajhveoRgKH4dfDqmg9gIJVNQIWcXXWmc3EkCgYEA04ttJu0EGU85DCzbkcXd0G+qygT0kDiwF8z8EcXIR4nysj+38nsoczUylEROl8c9p/cRabDYMqQSxns66/3kY/ct3V9HCfnHJvTKawmUnYN7LGWUC9LyuU4ejoceZPUZmZrAuzx4DkOv9LGWUt0HxzqxafnSVAdjl5eVJqkinlMCgYEA4n9tYBlkQu94KIu2LLwPSTQcl0snjTwfyBvzYdNBUzxHOAZZ9iAvb/WbUnU2VnByr4YsOdwUCsqLKICB1WPQXrPiumbahwG+DbLfNpZp1bpHcsPDnx8R6XHwBVgalEMvtq6B0Uh+EetoiX/2PfYmDN2nbnrc5u1JTncuJi0dANsCgYEAuLH7u8emE37ivOmRTsWls207fSQ0bpK/1BfpYI8BHMypM82ECdZTa7rfjSnSQJv5DeQdtNxs9lHf/qDqwc4rEMhnp+aevGvy3+VLsYZs1dVMvmd1iZlEyFsXPLNl6xk/n6fIa/EQlMuuHYLLT0+hkeWBrpgqdaj54Am9dEKpcfcCgYByYJUULV5jKtjL6NmjN4ikl+tEP5CGkvEdtXevU+YuKUdxtEtjrhcme6nm9wfsmLZhiuj0gv2gAW5KkrJ91vzXhhGdvejmumuGMWjlAQoLAxmni9JSnXcHIyFpIXeynUcQAonN7MS1OeK9ZOAtpArM/nXZpbO97d/R/v9QCgIWdwKBgQC5wIR5wHDNYligEYmU2qw+Xqs0q+XWg7cM67BnWmGfXgJXr4H2frPJ80JEZaq+JNCQoxjaXeIQLR8P+IZvF/RY8JzCU9ScOODDgexPxi7LQExeSB3NkStxSSblpjVFew9kGKq0XwehkEfwmjZ7KhdI1agjd3lgl7FKDGntolTCzg==', CAST(N'2024-11-15T22:15:50.9808660' AS DateTime2))
GO
INSERT [dbo].[Evaluation] ([Id], [UnitId], [CategoryTimeTypeId], [EvaluationName], [Status], [IsDeleted], [UpdatedAt]) VALUES (N'30a176a2-0fad-4b72-826c-15b4e4f4a5a6', N'685ae7bc-6d3f-46ff-8ef8-b5bc25d2ddc5', NULL, N'test ht tao', 0, 0, CAST(N'2024-11-17T15:38:08.9126483' AS DateTime2))
INSERT [dbo].[Evaluation] ([Id], [UnitId], [CategoryTimeTypeId], [EvaluationName], [Status], [IsDeleted], [UpdatedAt]) VALUES (N'0eee7f37-91f5-4ed8-8faa-17d0320853f5', N'9fc274de-cfb9-46e1-9682-c8200ef4d7ee', N'13d5e5a0-7eda-4725-9e56-455790a9c0a2', N'test ht tao', 0, 0, CAST(N'2024-11-17T15:56:55.1909566' AS DateTime2))
INSERT [dbo].[Evaluation] ([Id], [UnitId], [CategoryTimeTypeId], [EvaluationName], [Status], [IsDeleted], [UpdatedAt]) VALUES (N'7ee8535a-dfbe-43bc-b51b-2a6094fbecf8', N'4402c619-783f-4580-83cd-86e50a47171d', N'13d5e5a0-7eda-4725-9e56-455790a9c0a2', N'Phiếu đánh giá tháng 11 - 2024', 0, 0, CAST(N'2024-11-15T22:19:53.5737052' AS DateTime2))
INSERT [dbo].[Evaluation] ([Id], [UnitId], [CategoryTimeTypeId], [EvaluationName], [Status], [IsDeleted], [UpdatedAt]) VALUES (N'2be3d999-0bc8-42a0-93be-332a07da7395', N'c8e8fe3c-4e4d-4d25-a5a6-3f175fae3d5f', NULL, N'sasd', 0, 0, CAST(N'2024-11-17T15:25:01.4383749' AS DateTime2))
INSERT [dbo].[Evaluation] ([Id], [UnitId], [CategoryTimeTypeId], [EvaluationName], [Status], [IsDeleted], [UpdatedAt]) VALUES (N'fe7a18ea-4c55-40ae-92af-4b3b85fa3944', N'3878d070-67e7-48bf-9382-039bae5397dd', NULL, N'test ht tao', 0, 0, CAST(N'2024-11-17T15:38:08.8986278' AS DateTime2))
INSERT [dbo].[Evaluation] ([Id], [UnitId], [CategoryTimeTypeId], [EvaluationName], [Status], [IsDeleted], [UpdatedAt]) VALUES (N'810ef289-d203-4b9d-9a15-598ea91a5abc', N'4402c619-783f-4580-83cd-86e50a47171d', NULL, N'test ht tao', 0, 0, CAST(N'2024-11-17T15:38:08.7319384' AS DateTime2))
INSERT [dbo].[Evaluation] ([Id], [UnitId], [CategoryTimeTypeId], [EvaluationName], [Status], [IsDeleted], [UpdatedAt]) VALUES (N'26e3575b-94c4-4e95-b1af-5c64e5f8b506', N'1feb11df-bb8c-4871-b916-3225c3897d40', NULL, N'sasd', 0, 0, CAST(N'2024-11-17T15:25:01.4318658' AS DateTime2))
INSERT [dbo].[Evaluation] ([Id], [UnitId], [CategoryTimeTypeId], [EvaluationName], [Status], [IsDeleted], [UpdatedAt]) VALUES (N'31767778-893e-4d54-8053-764ef58bed91', N'93684774-0d94-42c9-ac77-078b6e3d2366', NULL, N'sasd', 0, 0, CAST(N'2024-11-17T15:25:01.2590012' AS DateTime2))
INSERT [dbo].[Evaluation] ([Id], [UnitId], [CategoryTimeTypeId], [EvaluationName], [Status], [IsDeleted], [UpdatedAt]) VALUES (N'08623732-8154-4a15-b6c6-9aa532ef2ad7', N'22b62062-301d-4709-a5dc-13b99f931f02', NULL, N'test ht tao', 0, 0, CAST(N'2024-11-17T15:38:08.9050989' AS DateTime2))
INSERT [dbo].[Evaluation] ([Id], [UnitId], [CategoryTimeTypeId], [EvaluationName], [Status], [IsDeleted], [UpdatedAt]) VALUES (N'892b6556-f6be-4eab-b978-a407155dbbbf', N'4801aee9-d3dd-4330-ba8a-4fd180adc15e', NULL, N'sasd', 0, 0, CAST(N'2024-11-17T15:25:01.4410710' AS DateTime2))
INSERT [dbo].[Evaluation] ([Id], [UnitId], [CategoryTimeTypeId], [EvaluationName], [Status], [IsDeleted], [UpdatedAt]) VALUES (N'087d8c8b-ea71-4741-bc9f-e0b64147d2d8', N'260bcd0f-d423-4ba0-8d5f-b1935c177f32', NULL, N'test ht tao', 0, 0, CAST(N'2024-11-17T15:38:08.9100815' AS DateTime2))
INSERT [dbo].[Evaluation] ([Id], [UnitId], [CategoryTimeTypeId], [EvaluationName], [Status], [IsDeleted], [UpdatedAt]) VALUES (N'9b6937f7-b945-4bb0-8305-e122a27f1599', N'48c504d3-7b0a-4fc9-82b5-46e58b9b79fa', NULL, N'test ht tao', 0, 0, CAST(N'2024-11-17T15:38:08.9076463' AS DateTime2))
INSERT [dbo].[Evaluation] ([Id], [UnitId], [CategoryTimeTypeId], [EvaluationName], [Status], [IsDeleted], [UpdatedAt]) VALUES (N'a21b69e1-d858-4045-9623-f2eb070c279a', N'0877da50-70ee-41f6-a5fe-c4d6b50591a6', NULL, N'test ht tao', 0, 0, CAST(N'2024-11-17T15:38:08.9155463' AS DateTime2))
GO
INSERT [dbo].[EvaluationAAE] ([Id], [EvaluationId], [UserId], [SupervisorId], [Advantages], [DisAdvantages], [AddReviews], [KetQuaHoatDongCoQuan], [NangLucLanhDaoQuanLy], [NangLucTapHopDoanKet], [NhanXetUuKhuyetDiem], [NhanDinhChieuHuongPhatTrien], [IsDeleted], [UpdatedAt]) VALUES (N'c7291dc4-e954-4546-9e89-14f3187996bc', N'7ee8535a-dfbe-43bc-b51b-2a6094fbecf8', N'6b2dc1cb-7a55-4f16-b9cf-6cf6a048edea', N'd486e012-c894-4cf0-b036-445850887364', N' - Có ý thức học hỏi, tiếp thu kinh nghiệm, lắng nghe ý kiến hướng dẫn, góp ý của lãnh đạo và các đồng nghiệp trong cơ quan. Tự nâng cao trình độ, không ngại những những nhiệm vụ mới có áp lực công việc cao do cơ quan, đơn vị, tổ chức giao phó.
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
+ Lãnh đạo thực hiện mọi nhiệm vụ trên nguyên tắc tập trung dân chủ, phát huy quyền làm chủ, xây dựng khối đại đoàn kết giữa các bộ phận, tổ chức trong đơn vị.', NULL, NULL, NULL, N'- asdad', N'- adsadsad', 0, CAST(N'2024-11-15T23:47:20.8013605' AS DateTime2))
INSERT [dbo].[EvaluationAAE] ([Id], [EvaluationId], [UserId], [SupervisorId], [Advantages], [DisAdvantages], [AddReviews], [KetQuaHoatDongCoQuan], [NangLucLanhDaoQuanLy], [NangLucTapHopDoanKet], [NhanXetUuKhuyetDiem], [NhanDinhChieuHuongPhatTrien], [IsDeleted], [UpdatedAt]) VALUES (N'ff953bff-91ac-4aa1-af7a-81247901e0f9', N'7ee8535a-dfbe-43bc-b51b-2a6094fbecf8', N'3df19402-0808-47f6-9d47-e15b5a0df798', N'd486e012-c894-4cf0-b036-445850887364', N' - Tích cực, tận tụy, có ý thức trách nhiệm với công việc.
 - Có ý thức học hỏi, tiếp thu kinh nghiệm, lắng nghe ý kiến hướng dẫn, góp ý của lãnh đạo và các đồng nghiệp trong cơ quan. Tự nâng cao trình độ, không ngại những những nhiệm vụ mới có áp lực công việc cao do cơ quan, đơn vị, tổ chức giao phó.
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
+ Lãnh đạo thực hiện mọi nhiệm vụ trên nguyên tắc tập trung dân chủ, phát huy quyền làm chủ, xây dựng khối đại đoàn kết giữa các bộ phận, tổ chức trong đơn vị.', NULL, NULL, NULL, N'- asdsadsad
- sadsadsad', N'- asdsad
- asdasdsad', 0, CAST(N'2024-11-16T19:10:27.5060579' AS DateTime2))
INSERT [dbo].[EvaluationAAE] ([Id], [EvaluationId], [UserId], [SupervisorId], [Advantages], [DisAdvantages], [AddReviews], [KetQuaHoatDongCoQuan], [NangLucLanhDaoQuanLy], [NangLucTapHopDoanKet], [NhanXetUuKhuyetDiem], [NhanDinhChieuHuongPhatTrien], [IsDeleted], [UpdatedAt]) VALUES (N'a3b8db4c-1c69-4a46-93eb-fd25cf183baf', N'7ee8535a-dfbe-43bc-b51b-2a6094fbecf8', N'6b2dc1cb-7a55-4f16-b9cf-6cf6a048edea', NULL, N' - Tích cực, tận tụy, có ý thức trách nhiệm với công việc.
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
+ Lãnh đạo thực hiện mọi nhiệm vụ trên nguyên tắc tập trung dân chủ, phát huy quyền làm chủ, xây dựng khối đại đoàn kết giữa các bộ phận, tổ chức trong đơn vị.', NULL, NULL, NULL, NULL, NULL, 0, CAST(N'2024-11-15T23:40:31.9242302' AS DateTime2))
GO
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'd4090749-acca-4603-a5f3-019cdc82cd16', N'7ee8535a-dfbe-43bc-b51b-2a6094fbecf8', N'ca2c80e4-c9e6-4bc1-a080-1c0505bccaba', 0, CAST(N'2024-11-15T22:19:48.4834019' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'5a65bfac-674e-47de-9cb7-01ddabe4bd05', N'0eee7f37-91f5-4ed8-8faa-17d0320853f5', N'8b678550-a782-4ed9-a61f-15887cf5a73e', 0, CAST(N'2024-11-17T15:56:51.2779785' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'b889d850-fe2f-4af8-ab5a-02b48f0d2007', N'0eee7f37-91f5-4ed8-8faa-17d0320853f5', N'e296f2f3-e89c-49b9-b304-b76df59719ae', 0, CAST(N'2024-11-17T15:56:51.2747510' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'15a02d02-2389-45e7-a411-07a78f0ca935', N'0eee7f37-91f5-4ed8-8faa-17d0320853f5', N'ad4a5bce-f3c4-44a7-85c5-fdb1c2d19d12', 1, CAST(N'2024-11-17T15:56:50.9842415' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'7c589ad1-7e06-4be6-8a94-07c3f13aef31', N'0eee7f37-91f5-4ed8-8faa-17d0320853f5', N'a7efdc67-aa93-46cb-8410-0ddcfe0d5853', 0, CAST(N'2024-11-17T15:56:51.2421353' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'07bc1fc5-5675-472f-baff-0aaefa608198', N'0eee7f37-91f5-4ed8-8faa-17d0320853f5', N'6f0a8890-c105-4fb4-874b-9d559847eca6', 0, CAST(N'2024-11-17T15:56:51.2209235' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'd2f05d23-6b48-4340-9846-0db3d2a9585a', N'7ee8535a-dfbe-43bc-b51b-2a6094fbecf8', N'51ef79d2-b47e-41f1-a99d-f5c0e4f4416e', 0, CAST(N'2024-11-15T22:19:48.4785125' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'8aa5ea22-c74e-4b9b-9963-1415daabed0f', N'0eee7f37-91f5-4ed8-8faa-17d0320853f5', N'1fb789cf-87b0-43b0-a45e-e85e3891a9ee', 0, CAST(N'2024-11-17T15:56:51.2688414' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'5ebc19a5-dafe-4db0-ae9d-16fd12257475', N'0eee7f37-91f5-4ed8-8faa-17d0320853f5', N'31314875-8f03-4874-be17-0f31c14f28ee', 0, CAST(N'2024-11-17T15:56:51.2627138' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'72977a23-5a43-4b1b-81e0-1ad2e50921ba', N'7ee8535a-dfbe-43bc-b51b-2a6094fbecf8', N'87fedc0d-caae-4890-80d9-a6e086d71a1c', 0, CAST(N'2024-11-15T22:19:48.5129284' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'07f0374d-072f-461b-987e-1db664d5dc38', N'0eee7f37-91f5-4ed8-8faa-17d0320853f5', N'f4c06feb-eb3d-4f75-95f9-10c0289de995', 0, CAST(N'2024-11-17T15:56:51.2385069' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'b24ca437-f685-46a5-a707-1ea3d7b44036', N'0eee7f37-91f5-4ed8-8faa-17d0320853f5', N'b9ec64fd-8aac-44db-8541-67b1c6162676', 0, CAST(N'2024-11-17T15:56:51.2301231' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'b8f69882-d8ca-41c3-ba8b-22014e0bf03c', N'7ee8535a-dfbe-43bc-b51b-2a6094fbecf8', N'a7efdc67-aa93-46cb-8410-0ddcfe0d5853', 0, CAST(N'2024-11-15T22:19:48.4703375' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'eff3145f-bce3-4a6f-b761-252472d3d5f4', N'7ee8535a-dfbe-43bc-b51b-2a6094fbecf8', N'0f8a3810-dc07-47e8-a089-7d6c08107382', 0, CAST(N'2024-11-15T22:19:48.4983016' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'eea7df8f-459e-4e00-9313-2626d165d3d6', N'0eee7f37-91f5-4ed8-8faa-17d0320853f5', N'e6d88410-17f4-479b-8e2d-8b6d5c0324a7', 0, CAST(N'2024-11-17T15:56:51.2329767' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'5ae27d82-b27f-4635-9cb1-26d127aa656f', N'7ee8535a-dfbe-43bc-b51b-2a6094fbecf8', N'e296f2f3-e89c-49b9-b304-b76df59719ae', 0, CAST(N'2024-11-15T22:19:48.5008545' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'dca1deba-7689-4c54-a3b1-2f72613708b5', N'7ee8535a-dfbe-43bc-b51b-2a6094fbecf8', N'6f0a8890-c105-4fb4-874b-9d559847eca6', 0, CAST(N'2024-11-15T22:19:48.4514742' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'5d1561c4-3736-4e26-93fd-34b467c32658', N'0eee7f37-91f5-4ed8-8faa-17d0320853f5', N'4723cac1-52f7-43bb-8d3f-bfb3b6c28a96', 0, CAST(N'2024-11-17T15:56:51.2238549' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'75961be6-330e-4f3d-9af9-359b7806a9e7', N'0eee7f37-91f5-4ed8-8faa-17d0320853f5', N'76f4c106-34b2-4175-a413-f0b67106218f', 0, CAST(N'2024-11-17T15:56:50.9886652' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'7b783fec-5e8c-4d52-aec4-373d735617d7', N'7ee8535a-dfbe-43bc-b51b-2a6094fbecf8', N'c702e9e8-111b-4402-8ed0-5f939a7892a6', 0, CAST(N'2024-11-15T22:19:48.4356486' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'b1abd39f-b790-4744-9498-3dee96b5e16b', N'0eee7f37-91f5-4ed8-8faa-17d0320853f5', N'b4ab63da-81d4-4ea1-8a5a-3c12154fa561', 0, CAST(N'2024-11-17T15:56:51.2888461' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'ab21e4b4-e0ff-4b3a-b60a-3fd3a2aa2b21', N'7ee8535a-dfbe-43bc-b51b-2a6094fbecf8', N'999d3424-6bad-4d7b-8bd0-2b462b55dd45', 0, CAST(N'2024-11-15T22:19:48.5070901' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'ded43665-de8a-4678-9ef6-40e14ec3d14c', N'7ee8535a-dfbe-43bc-b51b-2a6094fbecf8', N'f4c06feb-eb3d-4f75-95f9-10c0289de995', 0, CAST(N'2024-11-15T22:19:48.4676528' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'94b74205-f5d0-494e-9d0c-48689fd31b1a', N'0eee7f37-91f5-4ed8-8faa-17d0320853f5', N'87fedc0d-caae-4890-80d9-a6e086d71a1c', 0, CAST(N'2024-11-17T15:56:51.2860404' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'be99dc82-8d49-4e0d-b5f1-4879c2dba8a7', N'0eee7f37-91f5-4ed8-8faa-17d0320853f5', N'35ca5805-aa8f-4dc0-a895-c2bae87a00eb', 0, CAST(N'2024-11-17T15:56:51.2182861' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'23ea4c0c-2b23-4efb-a6ac-4fb7527e18a7', N'7ee8535a-dfbe-43bc-b51b-2a6094fbecf8', N'786e1a85-def5-4a2e-a70c-cfc2c0d8b239', 0, CAST(N'2024-11-15T22:19:48.4758667' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'483a3dfd-cf9b-4b0b-8762-5129d3a0c64e', N'0eee7f37-91f5-4ed8-8faa-17d0320853f5', N'acf13799-4766-4be0-a514-693c0d238f34', 0, CAST(N'2024-11-17T15:56:51.2272785' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'9f2d66fb-d37a-48a8-ac32-5da8e2ba3d3f', N'0eee7f37-91f5-4ed8-8faa-17d0320853f5', N'3622e825-11bb-44fd-bc59-ce0c40aa9509', 0, CAST(N'2024-11-17T15:56:51.2096978' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'af909f22-afab-4fb8-b8ef-62b7af89d1af', N'7ee8535a-dfbe-43bc-b51b-2a6094fbecf8', N'b4ab63da-81d4-4ea1-8a5a-3c12154fa561', 0, CAST(N'2024-11-15T22:19:48.5153241' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'd405616a-39e8-4410-a1c0-64094d23ccfa', N'0eee7f37-91f5-4ed8-8faa-17d0320853f5', N'786e1a85-def5-4a2e-a70c-cfc2c0d8b239', 0, CAST(N'2024-11-17T15:56:51.2482776' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'77de7b50-af6d-420e-b121-6481d7eda57c', N'0eee7f37-91f5-4ed8-8faa-17d0320853f5', N'79459d60-5db6-48b6-94bf-2121d9839e15', 0, CAST(N'2024-11-17T15:56:51.2833116' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'e0023fc1-9634-48b8-b81d-66b0cdf21bb1', N'7ee8535a-dfbe-43bc-b51b-2a6094fbecf8', N'da5e3dff-a649-4508-943d-0ecc32d4f7fc', 0, CAST(N'2024-11-15T22:19:48.4929689' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'2f8bff09-bb3e-496a-9be6-6783a9cb64ac', N'7ee8535a-dfbe-43bc-b51b-2a6094fbecf8', N'bf0b9144-be3b-4213-8f3c-f744035ed4b5', 0, CAST(N'2024-11-15T22:19:48.4808709' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'2dbe1bad-d7c6-45a2-a5bf-6901b2d6911f', N'0eee7f37-91f5-4ed8-8faa-17d0320853f5', N'c702e9e8-111b-4402-8ed0-5f939a7892a6', 0, CAST(N'2024-11-17T15:56:51.2011242' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'a11bdac1-2afc-45f4-9f43-6c5553c8a790', N'0eee7f37-91f5-4ed8-8faa-17d0320853f5', N'1b68a81a-b654-4896-9195-84abfb081103', 0, CAST(N'2024-11-17T15:56:51.2455590' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'9b149972-1b86-4552-af28-6c995b633776', N'0eee7f37-91f5-4ed8-8faa-17d0320853f5', N'3622e825-11bb-44fd-bc59-ce0c40aa9509', 1, CAST(N'2024-11-17T15:56:50.9842427' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'8330a57f-8b3d-4f06-b602-704e87d2613c', N'7ee8535a-dfbe-43bc-b51b-2a6094fbecf8', N'35ca5805-aa8f-4dc0-a895-c2bae87a00eb', 0, CAST(N'2024-11-15T22:19:48.4487983' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'2d341e37-19e8-4416-994d-78c41e5bc3c1', N'7ee8535a-dfbe-43bc-b51b-2a6094fbecf8', N'76f4c106-34b2-4175-a413-f0b67106218f', 0, CAST(N'2024-11-15T22:19:48.4163194' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'28f9a2ce-a6a8-4ee4-b5bf-793d1d5eee66', N'0eee7f37-91f5-4ed8-8faa-17d0320853f5', N'efbe3ff8-a8cb-408b-b2de-f0cdc5f03d55', 0, CAST(N'2024-11-17T15:56:51.2060101' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'4940b117-f69a-4805-a2e0-7dc05c8666d1', N'0eee7f37-91f5-4ed8-8faa-17d0320853f5', N'999d3424-6bad-4d7b-8bd0-2b462b55dd45', 0, CAST(N'2024-11-17T15:56:51.2807652' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'4e7ae047-4937-438e-8940-89105891dc79', N'7ee8535a-dfbe-43bc-b51b-2a6094fbecf8', N'efbe3ff8-a8cb-408b-b2de-f0cdc5f03d55', 0, CAST(N'2024-11-15T22:19:48.4382406' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'443c04db-565f-4950-a33d-90c6e6f2bb1b', N'7ee8535a-dfbe-43bc-b51b-2a6094fbecf8', N'3a9ab36e-b834-4a20-ba32-a0d34fdc47da', 0, CAST(N'2024-11-15T22:19:48.4864939' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'248aedf9-9b8c-412b-9853-936c8cb825e5', N'7ee8535a-dfbe-43bc-b51b-2a6094fbecf8', N'acf13799-4766-4be0-a514-693c0d238f34', 0, CAST(N'2024-11-15T22:19:48.4571098' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'b5f8f529-c011-4f6b-b300-93903f776b65', N'7ee8535a-dfbe-43bc-b51b-2a6094fbecf8', N'3622e825-11bb-44fd-bc59-ce0c40aa9509', 0, CAST(N'2024-11-15T22:19:48.4409944' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'3fc10dea-9904-4a19-b140-964d7083f0ca', N'0eee7f37-91f5-4ed8-8faa-17d0320853f5', N'fb40ad8f-098f-4fd1-8870-c05d1d25fae2', 0, CAST(N'2024-11-17T15:56:51.2356599' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'b263b1aa-d63b-44a2-9073-9762e6992a47', N'7ee8535a-dfbe-43bc-b51b-2a6094fbecf8', N'3c69d1e2-9204-431f-863f-a4ba07f3ac1d', 0, CAST(N'2024-11-15T22:19:48.4464568' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'8433fddc-63bd-4600-a0b4-9845f39372bc', N'7ee8535a-dfbe-43bc-b51b-2a6094fbecf8', N'79459d60-5db6-48b6-94bf-2121d9839e15', 0, CAST(N'2024-11-15T22:19:48.5097973' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'73cd178c-bda3-4145-94e5-987b64997e4b', N'7ee8535a-dfbe-43bc-b51b-2a6094fbecf8', N'1b68a81a-b654-4896-9195-84abfb081103', 0, CAST(N'2024-11-15T22:19:48.4732105' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'66b59f2d-8eb8-4a9a-9c12-98eaa317a0d1', N'7ee8535a-dfbe-43bc-b51b-2a6094fbecf8', N'ad4a5bce-f3c4-44a7-85c5-fdb1c2d19d12', 0, CAST(N'2024-11-15T22:19:48.4436469' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'8fc5a863-9c0e-4935-8cc9-9e1f5e981ac5', N'0eee7f37-91f5-4ed8-8faa-17d0320853f5', N'76f4c106-34b2-4175-a413-f0b67106218f', 1, CAST(N'2024-11-17T15:56:50.9842427' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'd5aee9e0-5f86-41d4-920c-ab37fa2bd938', N'7ee8535a-dfbe-43bc-b51b-2a6094fbecf8', N'8b678550-a782-4ed9-a61f-15887cf5a73e', 0, CAST(N'2024-11-15T22:19:48.5039640' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'9ce28bde-a53f-4b39-95b6-b4b89322cbc3', N'0eee7f37-91f5-4ed8-8faa-17d0320853f5', N'c702e9e8-111b-4402-8ed0-5f939a7892a6', 1, CAST(N'2024-11-17T15:56:50.9842428' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'd01e561a-ec5c-4fbc-8485-b9a7b54db341', N'7ee8535a-dfbe-43bc-b51b-2a6094fbecf8', N'31314875-8f03-4874-be17-0f31c14f28ee', 0, CAST(N'2024-11-15T22:19:48.4904048' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'37fccff6-4299-403e-ad7b-bc9b8e018082', N'0eee7f37-91f5-4ed8-8faa-17d0320853f5', N'3c69d1e2-9204-431f-863f-a4ba07f3ac1d', 0, CAST(N'2024-11-17T15:56:51.2156129' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'f1adb215-e9f9-40b7-9298-bdce17062884', N'7ee8535a-dfbe-43bc-b51b-2a6094fbecf8', N'b9ec64fd-8aac-44db-8541-67b1c6162676', 0, CAST(N'2024-11-15T22:19:48.4599820' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'eb790539-e385-41a0-a523-beefe24c63d9', N'0eee7f37-91f5-4ed8-8faa-17d0320853f5', N'ca2c80e4-c9e6-4bc1-a080-1c0505bccaba', 0, CAST(N'2024-11-17T15:56:51.2565507' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'5c3cd54d-6790-420b-8399-c85c21b42b37', N'0eee7f37-91f5-4ed8-8faa-17d0320853f5', N'da5e3dff-a649-4508-943d-0ecc32d4f7fc', 0, CAST(N'2024-11-17T15:56:51.2656790' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'cce8fb8c-b97d-445d-9d94-d2690ddccb89', N'0eee7f37-91f5-4ed8-8faa-17d0320853f5', N'bf0b9144-be3b-4213-8f3c-f744035ed4b5', 0, CAST(N'2024-11-17T15:56:51.2533906' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'16293c78-fb00-492b-b7de-d5916c5db124', N'7ee8535a-dfbe-43bc-b51b-2a6094fbecf8', N'fb40ad8f-098f-4fd1-8870-c05d1d25fae2', 0, CAST(N'2024-11-15T22:19:48.4648606' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'a51b3465-5ce3-403b-9f6e-d806d1f6b9b5', N'0eee7f37-91f5-4ed8-8faa-17d0320853f5', N'51ef79d2-b47e-41f1-a99d-f5c0e4f4416e', 0, CAST(N'2024-11-17T15:56:51.2508640' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'fa3ad395-9dfc-4dce-a27f-d9f1e9183aaf', N'0eee7f37-91f5-4ed8-8faa-17d0320853f5', N'ad4a5bce-f3c4-44a7-85c5-fdb1c2d19d12', 0, CAST(N'2024-11-17T15:56:51.2127047' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'ef4e24f7-d6bd-43d0-82a2-dbc6e4bb2db3', N'7ee8535a-dfbe-43bc-b51b-2a6094fbecf8', N'1fb789cf-87b0-43b0-a45e-e85e3891a9ee', 0, CAST(N'2024-11-15T22:19:48.4957591' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'8dd991d2-b684-42ae-9688-e2cb88108009', N'0eee7f37-91f5-4ed8-8faa-17d0320853f5', N'3a9ab36e-b834-4a20-ba32-a0d34fdc47da', 0, CAST(N'2024-11-17T15:56:51.2595913' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'ed4c8ca4-0804-40bd-b15c-e7054b4c300a', N'0eee7f37-91f5-4ed8-8faa-17d0320853f5', N'efbe3ff8-a8cb-408b-b2de-f0cdc5f03d55', 1, CAST(N'2024-11-17T15:56:50.9842428' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'ed03adc0-ee61-434a-b550-e7828d084d95', N'7ee8535a-dfbe-43bc-b51b-2a6094fbecf8', N'e6d88410-17f4-479b-8e2d-8b6d5c0324a7', 0, CAST(N'2024-11-15T22:19:48.4625522' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'37a85e43-3c83-46c9-ae30-ed503e93a705', N'0eee7f37-91f5-4ed8-8faa-17d0320853f5', N'0f8a3810-dc07-47e8-a089-7d6c08107382', 0, CAST(N'2024-11-17T15:56:51.2713247' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'afd2c6cb-e886-43e1-a16f-f4a1aad8fe40', N'7ee8535a-dfbe-43bc-b51b-2a6094fbecf8', N'4723cac1-52f7-43bb-8d3f-bfb3b6c28a96', 0, CAST(N'2024-11-15T22:19:48.4543286' AS DateTime2), 1)
GO
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'7749daa5-44a3-4797-9cd0-07636e7e1b6c', N'7ee8535a-dfbe-43bc-b51b-2a6094fbecf8', N'3df19402-0808-47f6-9d47-e15b5a0df798', N'd2f05d23-6b48-4340-9846-0db3d2a9585a', 3, 0, CAST(N'2024-11-16T19:10:27.3756887' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'7f512cc0-ca05-4542-b5fc-0f498fcdf5cc', N'7ee8535a-dfbe-43bc-b51b-2a6094fbecf8', N'3df19402-0808-47f6-9d47-e15b5a0df798', N'af909f22-afab-4fb8-b8ef-62b7af89d1af', 4, 0, CAST(N'2024-11-16T19:10:27.4228377' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'45fff709-669b-43f6-b473-0f5a216d2b46', N'7ee8535a-dfbe-43bc-b51b-2a6094fbecf8', N'6b2dc1cb-7a55-4f16-b9cf-6cf6a048edea', N'd2f05d23-6b48-4340-9846-0db3d2a9585a', 1, 0, CAST(N'2024-11-15T23:47:20.6444179' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'b9e80707-f169-4c29-81bb-0fc71b2bb018', N'7ee8535a-dfbe-43bc-b51b-2a6094fbecf8', N'6b2dc1cb-7a55-4f16-b9cf-6cf6a048edea', N'eff3145f-bce3-4a6f-b761-252472d3d5f4', 0, 0, CAST(N'2024-11-15T23:47:20.6621546' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'992f46a4-1321-4725-ba94-121f20bed9b4', N'7ee8535a-dfbe-43bc-b51b-2a6094fbecf8', N'6b2dc1cb-7a55-4f16-b9cf-6cf6a048edea', N'ab21e4b4-e0ff-4b3a-b60a-3fd3a2aa2b21', 0, 0, CAST(N'2024-11-15T23:47:20.6858983' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'02be28c3-fa18-475b-80e6-12344078dfa0', N'7ee8535a-dfbe-43bc-b51b-2a6094fbecf8', N'6b2dc1cb-7a55-4f16-b9cf-6cf6a048edea', N'f1adb215-e9f9-40b7-9298-bdce17062884', 0, 0, CAST(N'2024-11-15T23:47:20.7631607' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'2b85fccd-faf6-4442-8b4e-138034be3e8e', N'7ee8535a-dfbe-43bc-b51b-2a6094fbecf8', N'3df19402-0808-47f6-9d47-e15b5a0df798', N'66b59f2d-8eb8-4a9a-9c12-98eaa317a0d1', 2, 0, CAST(N'2024-11-16T19:10:27.4722448' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'fa1f0bde-150b-46b4-832e-15918a33bcbd', N'7ee8535a-dfbe-43bc-b51b-2a6094fbecf8', N'3df19402-0808-47f6-9d47-e15b5a0df798', N'443c04db-565f-4950-a33d-90c6e6f2bb1b', 3, 0, CAST(N'2024-11-16T19:10:27.4436993' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'3f244648-ff51-48c3-b9d8-1e4eb43d2b33', N'7ee8535a-dfbe-43bc-b51b-2a6094fbecf8', N'6b2dc1cb-7a55-4f16-b9cf-6cf6a048edea', N'af909f22-afab-4fb8-b8ef-62b7af89d1af', 0, 0, CAST(N'2024-11-15T23:47:20.6964809' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'2020349f-cc50-44b5-bfd8-31a5138aaf69', N'7ee8535a-dfbe-43bc-b51b-2a6094fbecf8', N'3df19402-0808-47f6-9d47-e15b5a0df798', N'4e7ae047-4937-438e-8940-89105891dc79', 2, 0, CAST(N'2024-11-16T19:10:27.4389160' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'6c1f0af8-ebd6-45bd-8000-46a9a389b07b', N'7ee8535a-dfbe-43bc-b51b-2a6094fbecf8', N'6b2dc1cb-7a55-4f16-b9cf-6cf6a048edea', N'b8f69882-d8ca-41c3-ba8b-22014e0bf03c', 0, 0, CAST(N'2024-11-15T23:47:20.6566657' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'8e92c151-4e36-416e-bfe2-51dbee8e503d', N'7ee8535a-dfbe-43bc-b51b-2a6094fbecf8', N'6b2dc1cb-7a55-4f16-b9cf-6cf6a048edea', N'2f8bff09-bb3e-496a-9be6-6783a9cb64ac', 1, 0, CAST(N'2024-11-15T23:47:20.7097874' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'80112285-da30-4bd8-b281-59acb9aef9a2', N'7ee8535a-dfbe-43bc-b51b-2a6094fbecf8', N'3df19402-0808-47f6-9d47-e15b5a0df798', N'ef4e24f7-d6bd-43d0-82a2-dbc6e4bb2db3', 0, 0, CAST(N'2024-11-16T19:10:27.4873479' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'af6ff070-5b21-4a50-a2a6-5cba46daa572', N'7ee8535a-dfbe-43bc-b51b-2a6094fbecf8', N'3df19402-0808-47f6-9d47-e15b5a0df798', N'73cd178c-bda3-4145-94e5-987b64997e4b', 2, 0, CAST(N'2024-11-16T19:10:27.4679734' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'a9a6fb0c-d9aa-4f37-830b-60fb970ff83c', N'7ee8535a-dfbe-43bc-b51b-2a6094fbecf8', N'3df19402-0808-47f6-9d47-e15b5a0df798', N'ab21e4b4-e0ff-4b3a-b60a-3fd3a2aa2b21', 4, 0, CAST(N'2024-11-16T19:10:27.4126727' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'ef712ff5-cbb4-4e58-8609-61ba8c323952', N'7ee8535a-dfbe-43bc-b51b-2a6094fbecf8', N'3df19402-0808-47f6-9d47-e15b5a0df798', N'8433fddc-63bd-4600-a0b4-9845f39372bc', 4, 0, CAST(N'2024-11-16T19:10:27.4630385' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'd9fc6687-410c-4513-bddc-64cf2a697c5b', N'7ee8535a-dfbe-43bc-b51b-2a6094fbecf8', N'6b2dc1cb-7a55-4f16-b9cf-6cf6a048edea', N'd4090749-acca-4603-a5f3-019cdc82cd16', 1, 0, CAST(N'2024-11-15T23:47:20.5997396' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'9e4624ee-1c2f-49d3-97f3-702bd5977d66', N'7ee8535a-dfbe-43bc-b51b-2a6094fbecf8', N'6b2dc1cb-7a55-4f16-b9cf-6cf6a048edea', N'b5f8f529-c011-4f6b-b300-93903f776b65', 0, 0, CAST(N'2024-11-15T23:47:20.7359401' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'ec51a620-4065-4b77-9720-764f3ca0641e', N'7ee8535a-dfbe-43bc-b51b-2a6094fbecf8', N'6b2dc1cb-7a55-4f16-b9cf-6cf6a048edea', N'7b783fec-5e8c-4d52-aec4-373d735617d7', 0, 0, CAST(N'2024-11-15T23:47:20.6804457' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'7c2dfc61-fb91-4a42-a560-80f14a3dd722', N'7ee8535a-dfbe-43bc-b51b-2a6094fbecf8', N'3df19402-0808-47f6-9d47-e15b5a0df798', N'5ae27d82-b27f-4635-9cb1-26d127aa656f', 0, 0, CAST(N'2024-11-16T19:10:27.3984777' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'6b67027c-70aa-41da-a108-886520e23ff2', N'7ee8535a-dfbe-43bc-b51b-2a6094fbecf8', N'3df19402-0808-47f6-9d47-e15b5a0df798', N'2f8bff09-bb3e-496a-9be6-6783a9cb64ac', 3, 0, CAST(N'2024-11-16T19:10:27.4333742' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'59f47109-44fe-412f-acb6-8ac8a7b63835', N'7ee8535a-dfbe-43bc-b51b-2a6094fbecf8', N'3df19402-0808-47f6-9d47-e15b5a0df798', N'7b783fec-5e8c-4d52-aec4-373d735617d7', 3, 0, CAST(N'2024-11-16T19:10:27.4079126' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'cd56deac-b306-4730-a3b5-8f14c60f8297', N'7ee8535a-dfbe-43bc-b51b-2a6094fbecf8', N'3df19402-0808-47f6-9d47-e15b5a0df798', N'f1adb215-e9f9-40b7-9298-bdce17062884', 9, 0, CAST(N'2024-11-16T19:10:27.4769147' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'd7071caf-a812-4269-95ef-8fe785ca06c9', N'7ee8535a-dfbe-43bc-b51b-2a6094fbecf8', N'3df19402-0808-47f6-9d47-e15b5a0df798', N'248aedf9-9b8c-412b-9853-936c8cb825e5', 9, 0, CAST(N'2024-11-16T19:10:27.4537682' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'863c20a7-24cc-43dc-b4ba-912f81021141', N'7ee8535a-dfbe-43bc-b51b-2a6094fbecf8', N'6b2dc1cb-7a55-4f16-b9cf-6cf6a048edea', N'ef4e24f7-d6bd-43d0-82a2-dbc6e4bb2db3', 0, 0, CAST(N'2024-11-15T23:47:20.7771994' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'8275ac6d-d12a-459c-a696-950491c5b139', N'7ee8535a-dfbe-43bc-b51b-2a6094fbecf8', N'3df19402-0808-47f6-9d47-e15b5a0df798', N'dca1deba-7689-4c54-a3b1-2f72613708b5', 9, 0, CAST(N'2024-11-16T19:10:27.4038218' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'c847271c-3d43-49ba-b734-9b49e54c4e94', N'7ee8535a-dfbe-43bc-b51b-2a6094fbecf8', N'6b2dc1cb-7a55-4f16-b9cf-6cf6a048edea', N'dca1deba-7689-4c54-a3b1-2f72613708b5', 0, 0, CAST(N'2024-11-15T23:47:20.6751644' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'ed62cdcb-c64c-4c44-8758-a5063af90c77', N'7ee8535a-dfbe-43bc-b51b-2a6094fbecf8', N'3df19402-0808-47f6-9d47-e15b5a0df798', N'b5f8f529-c011-4f6b-b300-93903f776b65', 2, 0, CAST(N'2024-11-16T19:10:27.4578633' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'cf8b133f-27c8-46b7-835b-b44fd49f0eea', N'7ee8535a-dfbe-43bc-b51b-2a6094fbecf8', N'6b2dc1cb-7a55-4f16-b9cf-6cf6a048edea', N'66b59f2d-8eb8-4a9a-9c12-98eaa317a0d1', 0, 0, CAST(N'2024-11-15T23:47:20.7569529' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'ae264fda-fb6b-447a-965b-b7634b1c38e2', N'7ee8535a-dfbe-43bc-b51b-2a6094fbecf8', N'6b2dc1cb-7a55-4f16-b9cf-6cf6a048edea', N'73cd178c-bda3-4145-94e5-987b64997e4b', 0, 0, CAST(N'2024-11-15T23:47:20.7499795' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'bda25d7f-a457-446b-9249-c27e7b2ddbe1', N'7ee8535a-dfbe-43bc-b51b-2a6094fbecf8', N'6b2dc1cb-7a55-4f16-b9cf-6cf6a048edea', N'72977a23-5a43-4b1b-81e0-1ad2e50921ba', 0, 0, CAST(N'2024-11-15T23:47:20.6500098' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'20dc9239-d3cc-4712-9a45-c33e1f875f30', N'7ee8535a-dfbe-43bc-b51b-2a6094fbecf8', N'6b2dc1cb-7a55-4f16-b9cf-6cf6a048edea', N'ded43665-de8a-4678-9ef6-40e14ec3d14c', 0, 0, CAST(N'2024-11-15T23:47:20.6914204' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'e8fb6bd5-c4f2-4c58-a9f8-c7c402215942', N'7ee8535a-dfbe-43bc-b51b-2a6094fbecf8', N'3df19402-0808-47f6-9d47-e15b5a0df798', N'ded43665-de8a-4678-9ef6-40e14ec3d14c', 6, 0, CAST(N'2024-11-16T19:10:27.4180717' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'c3249083-2b36-41d2-bfc7-c98fdb3959ef', N'7ee8535a-dfbe-43bc-b51b-2a6094fbecf8', N'3df19402-0808-47f6-9d47-e15b5a0df798', N'b8f69882-d8ca-41c3-ba8b-22014e0bf03c', 6, 0, CAST(N'2024-11-16T19:10:27.3852448' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'a18d3a7c-677c-4e00-b55e-d12e19c63b63', N'7ee8535a-dfbe-43bc-b51b-2a6094fbecf8', N'6b2dc1cb-7a55-4f16-b9cf-6cf6a048edea', N'4e7ae047-4937-438e-8940-89105891dc79', 0, 0, CAST(N'2024-11-15T23:47:20.7155838' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'6b9ed0cd-8c00-4c0b-bcc0-d4c9c6600168', N'7ee8535a-dfbe-43bc-b51b-2a6094fbecf8', N'6b2dc1cb-7a55-4f16-b9cf-6cf6a048edea', N'248aedf9-9b8c-412b-9853-936c8cb825e5', 0, 0, CAST(N'2024-11-15T23:47:20.7296239' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'7efba5e5-1588-489a-8384-d51198054c6e', N'7ee8535a-dfbe-43bc-b51b-2a6094fbecf8', N'6b2dc1cb-7a55-4f16-b9cf-6cf6a048edea', N'443c04db-565f-4950-a33d-90c6e6f2bb1b', 1, 0, CAST(N'2024-11-15T23:47:20.7226969' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'a0f4e884-1ec6-445b-93ca-d56e47d400a7', N'7ee8535a-dfbe-43bc-b51b-2a6094fbecf8', N'6b2dc1cb-7a55-4f16-b9cf-6cf6a048edea', N'5ae27d82-b27f-4635-9cb1-26d127aa656f', 0, 0, CAST(N'2024-11-15T23:47:20.6678896' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'a12bd53c-21a1-442a-9d49-d7b2b350476e', N'7ee8535a-dfbe-43bc-b51b-2a6094fbecf8', N'3df19402-0808-47f6-9d47-e15b5a0df798', N'd4090749-acca-4603-a5f3-019cdc82cd16', 3, 0, CAST(N'2024-11-16T19:10:27.3202247' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'382f5ebc-ef09-487a-937e-d8a1db63fc1a', N'7ee8535a-dfbe-43bc-b51b-2a6094fbecf8', N'6b2dc1cb-7a55-4f16-b9cf-6cf6a048edea', N'e0023fc1-9634-48b8-b81d-66b0cdf21bb1', 0, 0, CAST(N'2024-11-15T23:47:20.7018580' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'593c225a-6e83-4397-86a8-db062160eba4', N'7ee8535a-dfbe-43bc-b51b-2a6094fbecf8', N'6b2dc1cb-7a55-4f16-b9cf-6cf6a048edea', N'16293c78-fb00-492b-b7de-d5916c5db124', 0, 0, CAST(N'2024-11-15T23:47:20.7701516' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'4e1e2a20-a7da-4975-8040-e43f8b165daa', N'7ee8535a-dfbe-43bc-b51b-2a6094fbecf8', N'3df19402-0808-47f6-9d47-e15b5a0df798', N'eff3145f-bce3-4a6f-b761-252472d3d5f4', 0, 0, CAST(N'2024-11-16T19:10:27.3896060' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'277e909e-6684-4d83-a0d5-ee61809d91d4', N'7ee8535a-dfbe-43bc-b51b-2a6094fbecf8', N'3df19402-0808-47f6-9d47-e15b5a0df798', N'16293c78-fb00-492b-b7de-d5916c5db124', 6, 0, CAST(N'2024-11-16T19:10:27.4828046' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'f72b875d-3028-40c3-be8b-f287e4a8ea8c', N'7ee8535a-dfbe-43bc-b51b-2a6094fbecf8', N'6b2dc1cb-7a55-4f16-b9cf-6cf6a048edea', N'8433fddc-63bd-4600-a0b4-9845f39372bc', 0, 0, CAST(N'2024-11-15T23:47:20.7439695' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'74422e3f-17b7-4af8-a763-fb8ff6920362', N'7ee8535a-dfbe-43bc-b51b-2a6094fbecf8', N'3df19402-0808-47f6-9d47-e15b5a0df798', N'e0023fc1-9634-48b8-b81d-66b0cdf21bb1', 0, 0, CAST(N'2024-11-16T19:10:27.4269263' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsPersonal] ([Id], [EvaluationId], [UserId], [EvaluationCriteriaId], [AssessmentValue], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'1539ef82-7aa2-43a1-8f55-fd2f62229c63', N'7ee8535a-dfbe-43bc-b51b-2a6094fbecf8', N'3df19402-0808-47f6-9d47-e15b5a0df798', N'72977a23-5a43-4b1b-81e0-1ad2e50921ba', 4, 0, CAST(N'2024-11-16T19:10:27.3809283' AS DateTime2), 2)
GO
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'639f5ee3-1cb6-4d50-9596-043ea8f3a127', N'7ee8535a-dfbe-43bc-b51b-2a6094fbecf8', N'9b7c2d93-7d20-4406-8a0a-7883cc4f3c3d', N'a0f4e884-1ec6-445b-93ca-d56e47d400a7', 2, 0, CAST(N'2024-11-15T23:56:22.0613363' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'b05e5c08-ef97-4ab7-80c5-0611db06f5f6', N'7ee8535a-dfbe-43bc-b51b-2a6094fbecf8', N'9b7c2d93-7d20-4406-8a0a-7883cc4f3c3d', N'7efba5e5-1588-489a-8384-d51198054c6e', 1, 0, CAST(N'2024-11-15T23:56:22.1413364' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'c1ad2728-3af1-4321-b0fb-062e828053d4', N'7ee8535a-dfbe-43bc-b51b-2a6094fbecf8', N'9b7c2d93-7d20-4406-8a0a-7883cc4f3c3d', N'863c20a7-24cc-43dc-b4ba-912f81021141', 2, 0, CAST(N'2024-11-15T23:56:22.1853877' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'48132c63-9687-449d-8dfb-08eebdd8e01c', N'7ee8535a-dfbe-43bc-b51b-2a6094fbecf8', N'd486e012-c894-4cf0-b036-445850887364', N'ae264fda-fb6b-447a-965b-b7634b1c38e2', 0, 0, CAST(N'2024-11-15T23:58:09.8996932' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'ca6d9e2c-f078-4c24-9471-0cc7a8e15032', N'7ee8535a-dfbe-43bc-b51b-2a6094fbecf8', N'9b7c2d93-7d20-4406-8a0a-7883cc4f3c3d', N'6b67027c-70aa-41da-a108-886520e23ff2', 3, 0, CAST(N'2024-11-16T20:17:54.1880264' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'e731ff7e-0ba0-4d2b-a753-0f67a5b07f49', N'7ee8535a-dfbe-43bc-b51b-2a6094fbecf8', N'9b7c2d93-7d20-4406-8a0a-7883cc4f3c3d', N'e8fb6bd5-c4f2-4c58-a9f8-c7c402215942', 6, 0, CAST(N'2024-11-16T20:17:54.1732652' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'9f1343ff-bd0f-4a09-982b-0f73fc8b6ee0', N'7ee8535a-dfbe-43bc-b51b-2a6094fbecf8', N'9b7c2d93-7d20-4406-8a0a-7883cc4f3c3d', N'd9fc6687-410c-4513-bddc-64cf2a697c5b', 1, 0, CAST(N'2024-11-15T23:56:21.8543930' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'377a902c-eb7a-40ee-a65d-0fa957c3d0e3', N'7ee8535a-dfbe-43bc-b51b-2a6094fbecf8', N'd486e012-c894-4cf0-b036-445850887364', N'80112285-da30-4bd8-b281-59acb9aef9a2', 3, 0, CAST(N'2024-11-16T20:19:05.1307682' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'7edb9d39-c5f1-414f-ae71-13c9a71ac9ba', N'7ee8535a-dfbe-43bc-b51b-2a6094fbecf8', N'9b7c2d93-7d20-4406-8a0a-7883cc4f3c3d', N'4e1e2a20-a7da-4975-8040-e43f8b165daa', 3, 0, CAST(N'2024-11-16T20:17:54.1490634' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'1e4a3043-59f1-4fa1-8b0d-140daf4e1a08', N'7ee8535a-dfbe-43bc-b51b-2a6094fbecf8', N'9b7c2d93-7d20-4406-8a0a-7883cc4f3c3d', N'6b9ed0cd-8c00-4c0b-bcc0-d4c9c6600168', 0, 0, CAST(N'2024-11-15T23:56:22.1468954' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'6c28ae61-4434-4259-a9a2-17131ac6900f', N'7ee8535a-dfbe-43bc-b51b-2a6094fbecf8', N'd486e012-c894-4cf0-b036-445850887364', N'7f512cc0-ca05-4542-b5fc-0f498fcdf5cc', 4, 0, CAST(N'2024-11-16T20:19:05.0552696' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'408b60fd-ce15-47ae-9b60-1ab86df21c2d', N'7ee8535a-dfbe-43bc-b51b-2a6094fbecf8', N'9b7c2d93-7d20-4406-8a0a-7883cc4f3c3d', N'8e92c151-4e36-416e-bfe2-51dbee8e503d', 1, 0, CAST(N'2024-11-15T23:56:22.1313986' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'12456234-1b32-40bc-b613-1ac144cd11fd', N'7ee8535a-dfbe-43bc-b51b-2a6094fbecf8', N'9b7c2d93-7d20-4406-8a0a-7883cc4f3c3d', N'c847271c-3d43-49ba-b734-9b49e54c4e94', 0, 0, CAST(N'2024-11-15T23:56:22.0668844' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'9a85bd69-611e-4cab-96d6-1b7cb32b3acf', N'7ee8535a-dfbe-43bc-b51b-2a6094fbecf8', N'9b7c2d93-7d20-4406-8a0a-7883cc4f3c3d', N'80112285-da30-4bd8-b281-59acb9aef9a2', 3, 0, CAST(N'2024-11-16T20:17:54.2409354' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'd502212b-ada4-4fbf-a320-1c876e04f312', N'7ee8535a-dfbe-43bc-b51b-2a6094fbecf8', N'd486e012-c894-4cf0-b036-445850887364', N'a0f4e884-1ec6-445b-93ca-d56e47d400a7', 3, 0, CAST(N'2024-11-15T23:58:09.8157941' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'58ccf3aa-04cd-4a0c-9952-1cdf719eb6ee', N'7ee8535a-dfbe-43bc-b51b-2a6094fbecf8', N'9b7c2d93-7d20-4406-8a0a-7883cc4f3c3d', N'1539ef82-7aa2-43a1-8f55-fd2f62229c63', 4, 0, CAST(N'2024-11-16T20:17:54.1392839' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'cf94491e-4382-4c8c-b093-1d072370a9c3', N'7ee8535a-dfbe-43bc-b51b-2a6094fbecf8', N'd486e012-c894-4cf0-b036-445850887364', N'bda25d7f-a457-446b-9249-c27e7b2ddbe1', 0, 0, CAST(N'2024-11-15T23:58:09.7978322' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'10d25086-cda7-4da1-90f0-1ef16edeace8', N'7ee8535a-dfbe-43bc-b51b-2a6094fbecf8', N'9b7c2d93-7d20-4406-8a0a-7883cc4f3c3d', N'45fff709-669b-43f6-b473-0f5a216d2b46', 1, 0, CAST(N'2024-11-15T23:56:22.0401451' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'563417ca-c9a2-44bb-9ff3-2003ee12d249', N'7ee8535a-dfbe-43bc-b51b-2a6094fbecf8', N'9b7c2d93-7d20-4406-8a0a-7883cc4f3c3d', N'a18d3a7c-677c-4e00-b55e-d12e19c63b63', 0, 0, CAST(N'2024-11-15T23:56:22.1365443' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'a70c005f-7786-4531-a3cb-288074ae655b', N'7ee8535a-dfbe-43bc-b51b-2a6094fbecf8', N'9b7c2d93-7d20-4406-8a0a-7883cc4f3c3d', N'2b85fccd-faf6-4442-8b4e-138034be3e8e', 2, 0, CAST(N'2024-11-16T20:17:54.2264890' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'23787e36-f0b3-4293-a0f2-29b370d50ec4', N'7ee8535a-dfbe-43bc-b51b-2a6094fbecf8', N'd486e012-c894-4cf0-b036-445850887364', N'45fff709-669b-43f6-b473-0f5a216d2b46', 1, 0, CAST(N'2024-11-15T23:58:09.7909092' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'1cdbefc4-d196-4adb-a21e-2acbf5c92047', N'7ee8535a-dfbe-43bc-b51b-2a6094fbecf8', N'd486e012-c894-4cf0-b036-445850887364', N'277e909e-6684-4d83-a0d5-ee61809d91d4', 6, 0, CAST(N'2024-11-16T20:19:05.1249212' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'29b638b2-618e-4167-882b-2ae7ab2f94c6', N'7ee8535a-dfbe-43bc-b51b-2a6094fbecf8', N'd486e012-c894-4cf0-b036-445850887364', N'6b9ed0cd-8c00-4c0b-bcc0-d4c9c6600168', 0, 0, CAST(N'2024-11-15T23:58:09.8789714' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'b8802770-bdbe-4833-9548-2bb36a635494', N'7ee8535a-dfbe-43bc-b51b-2a6094fbecf8', N'd486e012-c894-4cf0-b036-445850887364', N'a18d3a7c-677c-4e00-b55e-d12e19c63b63', 0, 0, CAST(N'2024-11-15T23:58:09.8653952' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'0f71dab0-079f-4f1d-a7ec-2d00d7bee2fc', N'7ee8535a-dfbe-43bc-b51b-2a6094fbecf8', N'd486e012-c894-4cf0-b036-445850887364', N'3f244648-ff51-48c3-b9d8-1e4eb43d2b33', 0, 0, CAST(N'2024-11-15T23:58:09.8468461' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'4158f01e-d5c0-4d34-b053-2d27dc214c10', N'7ee8535a-dfbe-43bc-b51b-2a6094fbecf8', N'9b7c2d93-7d20-4406-8a0a-7883cc4f3c3d', N'cf8b133f-27c8-46b7-835b-b44fd49f0eea', 0, 0, CAST(N'2024-11-15T23:56:22.1688250' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'712b3075-40e0-493d-bc37-2dd2b2784ae3', N'7ee8535a-dfbe-43bc-b51b-2a6094fbecf8', N'd486e012-c894-4cf0-b036-445850887364', N'2020349f-cc50-44b5-bfd8-31a5138aaf69', 2, 0, CAST(N'2024-11-16T20:19:05.0734083' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'6368dac7-8454-4d9d-bbf3-3511f8b359eb', N'7ee8535a-dfbe-43bc-b51b-2a6094fbecf8', N'9b7c2d93-7d20-4406-8a0a-7883cc4f3c3d', N'382f5ebc-ef09-487a-937e-d8a1db63fc1a', 2, 0, CAST(N'2024-11-15T23:56:22.1254881' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'cb716dff-b264-42ec-b52f-3c96a2c0a9e4', N'7ee8535a-dfbe-43bc-b51b-2a6094fbecf8', N'd486e012-c894-4cf0-b036-445850887364', N'a9a6fb0c-d9aa-4f37-830b-60fb970ff83c', 4, 0, CAST(N'2024-11-16T20:19:05.0436319' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'9f4b6599-8588-400c-8abf-3e763a9bf10f', N'7ee8535a-dfbe-43bc-b51b-2a6094fbecf8', N'9b7c2d93-7d20-4406-8a0a-7883cc4f3c3d', N'992f46a4-1321-4725-ba94-121f20bed9b4', 0, 0, CAST(N'2024-11-15T23:56:22.0762249' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'd72aac19-0415-45c9-ac8c-44e19c88d3c1', N'7ee8535a-dfbe-43bc-b51b-2a6094fbecf8', N'9b7c2d93-7d20-4406-8a0a-7883cc4f3c3d', N'6c1f0af8-ebd6-45bd-8000-46a9a389b07b', 0, 0, CAST(N'2024-11-15T23:56:22.0519330' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'd4e416a9-c72c-4dcc-8687-47f0e2a25f1d', N'7ee8535a-dfbe-43bc-b51b-2a6094fbecf8', N'd486e012-c894-4cf0-b036-445850887364', N'cf8b133f-27c8-46b7-835b-b44fd49f0eea', 0, 0, CAST(N'2024-11-15T23:58:09.9062851' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'da42a541-1567-4cc1-86fd-4a17fb7cc4ae', N'7ee8535a-dfbe-43bc-b51b-2a6094fbecf8', N'd486e012-c894-4cf0-b036-445850887364', N'6c1f0af8-ebd6-45bd-8000-46a9a389b07b', 0, 0, CAST(N'2024-11-15T23:58:09.8034271' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'6b816a2a-4482-425e-9c92-4a3f63e8953d', N'7ee8535a-dfbe-43bc-b51b-2a6094fbecf8', N'd486e012-c894-4cf0-b036-445850887364', N'8e92c151-4e36-416e-bfe2-51dbee8e503d', 1, 0, CAST(N'2024-11-15T23:58:09.8578991' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'98d8f2df-1da4-4ef1-ba45-508fafcc0daf', N'7ee8535a-dfbe-43bc-b51b-2a6094fbecf8', N'd486e012-c894-4cf0-b036-445850887364', N'7c2dfc61-fb91-4a42-a560-80f14a3dd722', 3, 0, CAST(N'2024-11-16T20:19:05.0261083' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'16fea619-ea29-47f3-9510-56d93ffb7126', N'7ee8535a-dfbe-43bc-b51b-2a6094fbecf8', N'd486e012-c894-4cf0-b036-445850887364', N'382f5ebc-ef09-487a-937e-d8a1db63fc1a', 3, 0, CAST(N'2024-11-15T23:58:09.8524184' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'5bb760a3-5a0b-47d7-a71f-58530bad6eec', N'7ee8535a-dfbe-43bc-b51b-2a6094fbecf8', N'd486e012-c894-4cf0-b036-445850887364', N'20dc9239-d3cc-4712-9a45-c33e1f875f30', 0, 0, CAST(N'2024-11-15T23:58:09.8405594' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'a760d64a-41fd-4bf0-9ca6-58db90072a3d', N'7ee8535a-dfbe-43bc-b51b-2a6094fbecf8', N'd486e012-c894-4cf0-b036-445850887364', N'74422e3f-17b7-4af8-a763-fb8ff6920362', 3, 0, CAST(N'2024-11-16T20:19:05.0614388' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'b6b04176-59a7-4463-8f64-5acc3c28d1f1', N'7ee8535a-dfbe-43bc-b51b-2a6094fbecf8', N'9b7c2d93-7d20-4406-8a0a-7883cc4f3c3d', N'2020349f-cc50-44b5-bfd8-31a5138aaf69', 2, 0, CAST(N'2024-11-16T20:17:54.1937638' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'6a58f23c-9d53-4fe7-9146-621732cf31cc', N'7ee8535a-dfbe-43bc-b51b-2a6094fbecf8', N'9b7c2d93-7d20-4406-8a0a-7883cc4f3c3d', N'c3249083-2b36-41d2-bfc7-c98fdb3959ef', 6, 0, CAST(N'2024-11-16T20:17:54.1443577' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'1b636e7a-90d7-403e-942c-65808dbd5ee1', N'7ee8535a-dfbe-43bc-b51b-2a6094fbecf8', N'9b7c2d93-7d20-4406-8a0a-7883cc4f3c3d', N'a9a6fb0c-d9aa-4f37-830b-60fb970ff83c', 4, 0, CAST(N'2024-11-16T20:17:54.1685146' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'e50ea52b-f1e7-4cb5-8602-66f82ca986d2', N'7ee8535a-dfbe-43bc-b51b-2a6094fbecf8', N'd486e012-c894-4cf0-b036-445850887364', N'863c20a7-24cc-43dc-b4ba-912f81021141', 3, 0, CAST(N'2024-11-15T23:58:09.9274712' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'632b6d00-64cb-49bd-ab9f-67ab77df7acd', N'7ee8535a-dfbe-43bc-b51b-2a6094fbecf8', N'd486e012-c894-4cf0-b036-445850887364', N'9e4624ee-1c2f-49d3-97f3-702bd5977d66', 0, 0, CAST(N'2024-11-15T23:58:09.8856884' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'bee5f8b7-5bbd-44ef-9993-680c21e5fdc1', N'7ee8535a-dfbe-43bc-b51b-2a6094fbecf8', N'd486e012-c894-4cf0-b036-445850887364', N'593c225a-6e83-4397-86a8-db062160eba4', 0, 0, CAST(N'2024-11-15T23:58:09.9201218' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'07f28ef1-9dae-449e-a1dc-6e0f43fe52dd', N'7ee8535a-dfbe-43bc-b51b-2a6094fbecf8', N'd486e012-c894-4cf0-b036-445850887364', N'2b85fccd-faf6-4442-8b4e-138034be3e8e', 2, 0, CAST(N'2024-11-16T20:19:05.1089485' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'445d377a-04ca-4987-88a0-6f8fb460e0f5', N'7ee8535a-dfbe-43bc-b51b-2a6094fbecf8', N'd486e012-c894-4cf0-b036-445850887364', N'fa1f0bde-150b-46b4-832e-15918a33bcbd', 3, 0, CAST(N'2024-11-16T20:19:05.0792478' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'cde16646-42ea-4489-9711-71936ecdf6c8', N'7ee8535a-dfbe-43bc-b51b-2a6094fbecf8', N'd486e012-c894-4cf0-b036-445850887364', N'8275ac6d-d12a-459c-a696-950491c5b139', 9, 0, CAST(N'2024-11-16T20:19:05.0321921' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'd9c8d79d-5ba8-4554-adda-73dcd278b52a', N'7ee8535a-dfbe-43bc-b51b-2a6094fbecf8', N'9b7c2d93-7d20-4406-8a0a-7883cc4f3c3d', N'74422e3f-17b7-4af8-a763-fb8ff6920362', 3, 0, CAST(N'2024-11-16T20:17:54.1832442' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'a2276422-2342-4cc1-9b47-7f346cda8376', N'7ee8535a-dfbe-43bc-b51b-2a6094fbecf8', N'9b7c2d93-7d20-4406-8a0a-7883cc4f3c3d', N'3f244648-ff51-48c3-b9d8-1e4eb43d2b33', 0, 0, CAST(N'2024-11-15T23:56:22.1207390' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'dfef9466-e07a-4f48-8e97-7f6541f031bd', N'7ee8535a-dfbe-43bc-b51b-2a6094fbecf8', N'9b7c2d93-7d20-4406-8a0a-7883cc4f3c3d', N'7749daa5-44a3-4797-9cd0-07636e7e1b6c', 3, 0, CAST(N'2024-11-16T20:17:54.1340551' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'05290e96-7a74-4fc1-9e0e-7fcdcabc8af6', N'7ee8535a-dfbe-43bc-b51b-2a6094fbecf8', N'd486e012-c894-4cf0-b036-445850887364', N'c3249083-2b36-41d2-bfc7-c98fdb3959ef', 6, 0, CAST(N'2024-11-16T20:19:05.0142002' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'c6131226-1f02-4bb1-9c0d-820b928aecbd', N'7ee8535a-dfbe-43bc-b51b-2a6094fbecf8', N'9b7c2d93-7d20-4406-8a0a-7883cc4f3c3d', N'8275ac6d-d12a-459c-a696-950491c5b139', 9, 0, CAST(N'2024-11-16T20:17:54.1593235' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'c07fc578-241e-4d72-9842-8402f22392a3', N'7ee8535a-dfbe-43bc-b51b-2a6094fbecf8', N'd486e012-c894-4cf0-b036-445850887364', N'1539ef82-7aa2-43a1-8f55-fd2f62229c63', 4, 0, CAST(N'2024-11-16T20:19:05.0081247' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'cdb71fe3-71e2-47d9-a621-84478894373f', N'7ee8535a-dfbe-43bc-b51b-2a6094fbecf8', N'9b7c2d93-7d20-4406-8a0a-7883cc4f3c3d', N'f72b875d-3028-40c3-be8b-f287e4a8ea8c', 0, 0, CAST(N'2024-11-15T23:56:22.1576355' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'e3fa9c5d-6acc-452d-a85e-85715c4b5f7b', N'7ee8535a-dfbe-43bc-b51b-2a6094fbecf8', N'9b7c2d93-7d20-4406-8a0a-7883cc4f3c3d', N'b9e80707-f169-4c29-81bb-0fc71b2bb018', 2, 0, CAST(N'2024-11-15T23:56:22.0564747' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'8f239608-d1c7-4a33-b2ce-8d37eaa1cf92', N'7ee8535a-dfbe-43bc-b51b-2a6094fbecf8', N'9b7c2d93-7d20-4406-8a0a-7883cc4f3c3d', N'7f512cc0-ca05-4542-b5fc-0f498fcdf5cc', 4, 0, CAST(N'2024-11-16T20:17:54.1785156' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'bd1b51e9-8d0d-452a-bb23-916cb346737c', N'7ee8535a-dfbe-43bc-b51b-2a6094fbecf8', N'd486e012-c894-4cf0-b036-445850887364', N'7efba5e5-1588-489a-8384-d51198054c6e', 1, 0, CAST(N'2024-11-15T23:58:09.8720423' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'6533edc9-6c48-4dcf-b98e-93961b277dc5', N'7ee8535a-dfbe-43bc-b51b-2a6094fbecf8', N'd486e012-c894-4cf0-b036-445850887364', N'af6ff070-5b21-4a50-a2a6-5cba46daa572', 6, 0, CAST(N'2024-11-16T20:19:05.1031330' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'8757f812-bb30-4807-8904-9fbc18a44314', N'7ee8535a-dfbe-43bc-b51b-2a6094fbecf8', N'd486e012-c894-4cf0-b036-445850887364', N'992f46a4-1321-4725-ba94-121f20bed9b4', 0, 0, CAST(N'2024-11-15T23:58:09.8347129' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'2912fab8-0ca7-4817-afaf-a37f595cfbbe', N'7ee8535a-dfbe-43bc-b51b-2a6094fbecf8', N'9b7c2d93-7d20-4406-8a0a-7883cc4f3c3d', N'a12bd53c-21a1-442a-9d49-d7b2b350476e', 3, 0, CAST(N'2024-11-16T20:17:54.0884036' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'ee652d27-51c1-46d4-8adc-a499ec8551cf', N'7ee8535a-dfbe-43bc-b51b-2a6094fbecf8', N'd486e012-c894-4cf0-b036-445850887364', N'6b67027c-70aa-41da-a108-886520e23ff2', 3, 0, CAST(N'2024-11-16T20:19:05.0676478' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'afbf570e-a6d9-4455-bb5c-a871794ef1b1', N'7ee8535a-dfbe-43bc-b51b-2a6094fbecf8', N'9b7c2d93-7d20-4406-8a0a-7883cc4f3c3d', N'ed62cdcb-c64c-4c44-8758-a5063af90c77', 2, 0, CAST(N'2024-11-16T20:17:54.2114357' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'b5fe824a-d03d-4587-97a6-b844e113f5e8', N'7ee8535a-dfbe-43bc-b51b-2a6094fbecf8', N'd486e012-c894-4cf0-b036-445850887364', N'7749daa5-44a3-4797-9cd0-07636e7e1b6c', 3, 0, CAST(N'2024-11-16T20:19:05.0021053' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'bd7edb0e-2c90-43b5-a686-b8c6c9be0500', N'7ee8535a-dfbe-43bc-b51b-2a6094fbecf8', N'9b7c2d93-7d20-4406-8a0a-7883cc4f3c3d', N'ec51a620-4065-4b77-9720-764f3ca0641e', 0, 0, CAST(N'2024-11-15T23:56:22.0714647' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'bf6fd200-7cb2-4b42-881f-bcff27a88f4c', N'7ee8535a-dfbe-43bc-b51b-2a6094fbecf8', N'9b7c2d93-7d20-4406-8a0a-7883cc4f3c3d', N'593c225a-6e83-4397-86a8-db062160eba4', 0, 0, CAST(N'2024-11-15T23:56:22.1796353' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'38b63958-8446-4999-884e-bf0a912db241', N'7ee8535a-dfbe-43bc-b51b-2a6094fbecf8', N'd486e012-c894-4cf0-b036-445850887364', N'ec51a620-4065-4b77-9720-764f3ca0641e', 0, 0, CAST(N'2024-11-15T23:58:09.8284645' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'66538998-f27a-49e0-a4de-c2cc507eebe7', N'7ee8535a-dfbe-43bc-b51b-2a6094fbecf8', N'9b7c2d93-7d20-4406-8a0a-7883cc4f3c3d', N'59f47109-44fe-412f-acb6-8ac8a7b63835', 3, 0, CAST(N'2024-11-16T20:17:54.1641659' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'06fbb373-7fd6-4681-83ec-c4b4c416b745', N'7ee8535a-dfbe-43bc-b51b-2a6094fbecf8', N'9b7c2d93-7d20-4406-8a0a-7883cc4f3c3d', N'20dc9239-d3cc-4712-9a45-c33e1f875f30', 0, 0, CAST(N'2024-11-15T23:56:22.0818398' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'd08c502b-553e-41d1-9ceb-c8e013023eba', N'7ee8535a-dfbe-43bc-b51b-2a6094fbecf8', N'd486e012-c894-4cf0-b036-445850887364', N'cd56deac-b306-4730-a3b5-8f14c60f8297', 9, 0, CAST(N'2024-11-16T20:19:05.1150502' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'fc5eeab2-2749-4847-b6ff-ca7ad98a72b9', N'7ee8535a-dfbe-43bc-b51b-2a6094fbecf8', N'd486e012-c894-4cf0-b036-445850887364', N'02be28c3-fa18-475b-80e6-12344078dfa0', 0, 0, CAST(N'2024-11-15T23:58:09.9133088' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'e58a8356-5c64-451c-ae9d-cad1a0ba5727', N'7ee8535a-dfbe-43bc-b51b-2a6094fbecf8', N'd486e012-c894-4cf0-b036-445850887364', N'59f47109-44fe-412f-acb6-8ac8a7b63835', 3, 0, CAST(N'2024-11-16T20:19:05.0375607' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'58e8ea1d-6bb8-4a7e-9068-cbdfb1c9857b', N'7ee8535a-dfbe-43bc-b51b-2a6094fbecf8', N'9b7c2d93-7d20-4406-8a0a-7883cc4f3c3d', N'277e909e-6684-4d83-a0d5-ee61809d91d4', 6, 0, CAST(N'2024-11-16T20:17:54.2358513' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'f71bf604-daef-41f1-9071-ccc0e4f7adf9', N'7ee8535a-dfbe-43bc-b51b-2a6094fbecf8', N'9b7c2d93-7d20-4406-8a0a-7883cc4f3c3d', N'ae264fda-fb6b-447a-965b-b7634b1c38e2', 0, 0, CAST(N'2024-11-15T23:56:22.1629791' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'bf22b86e-18fc-4c70-a18b-d193056b5ca8', N'7ee8535a-dfbe-43bc-b51b-2a6094fbecf8', N'9b7c2d93-7d20-4406-8a0a-7883cc4f3c3d', N'bda25d7f-a457-446b-9249-c27e7b2ddbe1', 0, 0, CAST(N'2024-11-15T23:56:22.0465439' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'b9ef8b1e-6617-4ca1-9600-d4b12b8042c1', N'7ee8535a-dfbe-43bc-b51b-2a6094fbecf8', N'd486e012-c894-4cf0-b036-445850887364', N'e8fb6bd5-c4f2-4c58-a9f8-c7c402215942', 6, 0, CAST(N'2024-11-16T20:19:05.0494430' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'770eaf1b-5a0d-42cf-9a85-d69d5a79818c', N'7ee8535a-dfbe-43bc-b51b-2a6094fbecf8', N'd486e012-c894-4cf0-b036-445850887364', N'ef712ff5-cbb4-4e58-8609-61ba8c323952', 4, 0, CAST(N'2024-11-16T20:19:05.0970322' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'186d860c-9aec-4975-a743-dded163a049b', N'7ee8535a-dfbe-43bc-b51b-2a6094fbecf8', N'd486e012-c894-4cf0-b036-445850887364', N'c847271c-3d43-49ba-b734-9b49e54c4e94', 0, 0, CAST(N'2024-11-15T23:58:09.8223556' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'f5e97093-c5c5-472a-a158-ded693c836c5', N'7ee8535a-dfbe-43bc-b51b-2a6094fbecf8', N'9b7c2d93-7d20-4406-8a0a-7883cc4f3c3d', N'ef712ff5-cbb4-4e58-8609-61ba8c323952', 4, 0, CAST(N'2024-11-16T20:17:54.2162726' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'c011d698-7239-48b2-aa6d-e35d4f6689b9', N'7ee8535a-dfbe-43bc-b51b-2a6094fbecf8', N'd486e012-c894-4cf0-b036-445850887364', N'd7071caf-a812-4269-95ef-8fe785ca06c9', 9, 0, CAST(N'2024-11-16T20:19:05.0849739' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'57b8ac34-398b-4086-b5d7-e77145061ba9', N'7ee8535a-dfbe-43bc-b51b-2a6094fbecf8', N'd486e012-c894-4cf0-b036-445850887364', N'a12bd53c-21a1-442a-9d49-d7b2b350476e', 3, 0, CAST(N'2024-11-16T20:19:04.9942861' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'099f3462-adfa-44bc-b293-ea8103caf82b', N'7ee8535a-dfbe-43bc-b51b-2a6094fbecf8', N'd486e012-c894-4cf0-b036-445850887364', N'4e1e2a20-a7da-4975-8040-e43f8b165daa', 3, 0, CAST(N'2024-11-16T20:19:05.0198637' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'aaae1fdc-0a8d-4f33-8023-f03db188dce0', N'7ee8535a-dfbe-43bc-b51b-2a6094fbecf8', N'9b7c2d93-7d20-4406-8a0a-7883cc4f3c3d', N'cd56deac-b306-4730-a3b5-8f14c60f8297', 9, 0, CAST(N'2024-11-16T20:17:54.2313363' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'6b0e4a74-b6cb-454b-9cf8-f08f43fd1fb9', N'7ee8535a-dfbe-43bc-b51b-2a6094fbecf8', N'9b7c2d93-7d20-4406-8a0a-7883cc4f3c3d', N'7c2dfc61-fb91-4a42-a560-80f14a3dd722', 3, 0, CAST(N'2024-11-16T20:17:54.1537556' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'afc48a15-888e-45ea-a87f-f16ae558f4e3', N'7ee8535a-dfbe-43bc-b51b-2a6094fbecf8', N'9b7c2d93-7d20-4406-8a0a-7883cc4f3c3d', N'fa1f0bde-150b-46b4-832e-15918a33bcbd', 3, 0, CAST(N'2024-11-16T20:17:54.2000308' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'9b9f4886-0572-4871-841d-f29e37c0c103', N'7ee8535a-dfbe-43bc-b51b-2a6094fbecf8', N'9b7c2d93-7d20-4406-8a0a-7883cc4f3c3d', N'9e4624ee-1c2f-49d3-97f3-702bd5977d66', 0, 0, CAST(N'2024-11-15T23:56:22.1522700' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'892d632f-1f17-4473-a9b0-f56ea962972c', N'7ee8535a-dfbe-43bc-b51b-2a6094fbecf8', N'9b7c2d93-7d20-4406-8a0a-7883cc4f3c3d', N'd7071caf-a812-4269-95ef-8fe785ca06c9', 9, 0, CAST(N'2024-11-16T20:17:54.2058603' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'105b8c52-2dae-4b5d-9c4e-f61e9f4550f4', N'7ee8535a-dfbe-43bc-b51b-2a6094fbecf8', N'9b7c2d93-7d20-4406-8a0a-7883cc4f3c3d', N'af6ff070-5b21-4a50-a2a6-5cba46daa572', 6, 0, CAST(N'2024-11-16T20:17:54.2209402' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'67028002-50da-41fe-870f-f90ba6bfef7c', N'7ee8535a-dfbe-43bc-b51b-2a6094fbecf8', N'9b7c2d93-7d20-4406-8a0a-7883cc4f3c3d', N'02be28c3-fa18-475b-80e6-12344078dfa0', 0, 0, CAST(N'2024-11-15T23:56:22.1738834' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'f7a3dce6-5779-4863-98b7-f926847759f4', N'7ee8535a-dfbe-43bc-b51b-2a6094fbecf8', N'd486e012-c894-4cf0-b036-445850887364', N'b9e80707-f169-4c29-81bb-0fc71b2bb018', 3, 0, CAST(N'2024-11-15T23:58:09.8090657' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'3a3e55ce-b24e-4db5-97ef-fad2c30725e7', N'7ee8535a-dfbe-43bc-b51b-2a6094fbecf8', N'd486e012-c894-4cf0-b036-445850887364', N'f72b875d-3028-40c3-be8b-f287e4a8ea8c', 0, 0, CAST(N'2024-11-15T23:58:09.8920168' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'4216524b-fdcc-4570-9b1b-fe4f52afc70d', N'7ee8535a-dfbe-43bc-b51b-2a6094fbecf8', N'd486e012-c894-4cf0-b036-445850887364', N'd9fc6687-410c-4513-bddc-64cf2a697c5b', 1, 0, CAST(N'2024-11-15T23:58:09.6565045' AS DateTime2), 2)
INSERT [dbo].[EvaluationDetailsSupervisor] ([Id], [EvaluationId], [UserSupervisorId], [EvaluationDetailsPersonalId], [AssessmentValueSupervisor], [IsDeleted], [UpdatedAt], [Status]) VALUES (N'3352b12a-9a2e-45a3-8822-fe74d53f0a24', N'7ee8535a-dfbe-43bc-b51b-2a6094fbecf8', N'd486e012-c894-4cf0-b036-445850887364', N'ed62cdcb-c64c-4c44-8758-a5063af90c77', 2, 0, CAST(N'2024-11-16T20:19:05.0912639' AS DateTime2), 2)
GO
INSERT [dbo].[EvaluationExplaint] ([Id], [EvaluationId], [UserId], [CategoryCriteriaId], [Note], [FileAttachments], [IsDeleted], [UpdatedAt]) VALUES (N'11d02511-e29b-4ce4-93e6-8355cd9c1d6a', N'7ee8535a-dfbe-43bc-b51b-2a6094fbecf8', N'6b2dc1cb-7a55-4f16-b9cf-6cf6a048edea', N'ca2c80e4-c9e6-4bc1-a080-1c0505bccaba', N'test1', NULL, 0, CAST(N'2024-11-15T23:47:08.6268044' AS DateTime2))
INSERT [dbo].[EvaluationExplaint] ([Id], [EvaluationId], [UserId], [CategoryCriteriaId], [Note], [FileAttachments], [IsDeleted], [UpdatedAt]) VALUES (N'c860d776-60aa-4f73-b271-94a239760796', N'7ee8535a-dfbe-43bc-b51b-2a6094fbecf8', N'd486e012-c894-4cf0-b036-445850887364', N'ca2c80e4-c9e6-4bc1-a080-1c0505bccaba', N'test34', NULL, 0, CAST(N'2024-11-15T23:56:39.2009467' AS DateTime2))
INSERT [dbo].[EvaluationExplaint] ([Id], [EvaluationId], [UserId], [CategoryCriteriaId], [Note], [FileAttachments], [IsDeleted], [UpdatedAt]) VALUES (N'61d5abba-1f26-454a-9cd7-c909e0802216', N'7ee8535a-dfbe-43bc-b51b-2a6094fbecf8', N'9b7c2d93-7d20-4406-8a0a-7883cc4f3c3d', N'ca2c80e4-c9e6-4bc1-a080-1c0505bccaba', N'test2', NULL, 0, CAST(N'2024-11-15T23:54:10.3563079' AS DateTime2))
INSERT [dbo].[EvaluationExplaint] ([Id], [EvaluationId], [UserId], [CategoryCriteriaId], [Note], [FileAttachments], [IsDeleted], [UpdatedAt]) VALUES (N'01c718f5-d317-48a7-b183-f67307308470', N'7ee8535a-dfbe-43bc-b51b-2a6094fbecf8', N'9b7c2d93-7d20-4406-8a0a-7883cc4f3c3d', N'ca2c80e4-c9e6-4bc1-a080-1c0505bccaba', N'test3', NULL, 0, CAST(N'2024-11-15T23:55:22.5818660' AS DateTime2))
GO
INSERT [dbo].[EvaluationUser] ([Id], [EvaluationId], [UserId], [Type], [Sort], [IsDeleted], [UpdatedAt], [IsManager]) VALUES (N'd9931378-ead4-43b4-b94a-4940ca6b464b', N'7ee8535a-dfbe-43bc-b51b-2a6094fbecf8', N'6b2dc1cb-7a55-4f16-b9cf-6cf6a048edea', 1, 0, 0, CAST(N'2024-11-15T23:40:04.6827260' AS DateTime2), NULL)
INSERT [dbo].[EvaluationUser] ([Id], [EvaluationId], [UserId], [Type], [Sort], [IsDeleted], [UpdatedAt], [IsManager]) VALUES (N'21054bbd-117f-45b9-86fc-5f7f0ed993fc', N'7ee8535a-dfbe-43bc-b51b-2a6094fbecf8', N'9b7c2d93-7d20-4406-8a0a-7883cc4f3c3d', 2, 1, 0, CAST(N'2024-11-15T23:21:51.3571308' AS DateTime2), 0)
INSERT [dbo].[EvaluationUser] ([Id], [EvaluationId], [UserId], [Type], [Sort], [IsDeleted], [UpdatedAt], [IsManager]) VALUES (N'7fde5e55-df93-4669-b6c6-962cc18867b9', N'7ee8535a-dfbe-43bc-b51b-2a6094fbecf8', N'9b7c2d93-7d20-4406-8a0a-7883cc4f3c3d', 1, 0, 0, CAST(N'2024-11-15T23:40:04.6366043' AS DateTime2), NULL)
INSERT [dbo].[EvaluationUser] ([Id], [EvaluationId], [UserId], [Type], [Sort], [IsDeleted], [UpdatedAt], [IsManager]) VALUES (N'b3bb0669-7246-4fdf-b1a5-d66e3a6e81c7', N'7ee8535a-dfbe-43bc-b51b-2a6094fbecf8', N'89675a85-e1bc-459b-8036-9e1597ed929a', 1, 0, 0, CAST(N'2024-11-15T23:40:04.6766043' AS DateTime2), NULL)
INSERT [dbo].[EvaluationUser] ([Id], [EvaluationId], [UserId], [Type], [Sort], [IsDeleted], [UpdatedAt], [IsManager]) VALUES (N'e5868ece-ad9a-458e-a985-dc643e3d430e', N'7ee8535a-dfbe-43bc-b51b-2a6094fbecf8', N'd486e012-c894-4cf0-b036-445850887364', 2, 2, 0, CAST(N'2024-11-15T23:22:20.9525754' AS DateTime2), 1)
INSERT [dbo].[EvaluationUser] ([Id], [EvaluationId], [UserId], [Type], [Sort], [IsDeleted], [UpdatedAt], [IsManager]) VALUES (N'0bfcbcab-f45b-46fa-9a0f-df5171131d0c', N'7ee8535a-dfbe-43bc-b51b-2a6094fbecf8', N'3df19402-0808-47f6-9d47-e15b5a0df798', 1, 0, 0, CAST(N'2024-11-15T23:40:04.6797922' AS DateTime2), NULL)
GO
INSERT [dbo].[MenuItems] ([Id], [Key], [Name], [ParentId], [Route], [Icon], [Sort]) VALUES (N'be782bc6-5b5f-4edc-a2c4-0dc8ad2af70e', N'evaluation-statistics', N'Thống kê đánh giá', N'fa70e2f4-8d7f-479d-a12a-f91508b8c33e', N'/statistics/evaluation-statistics', N'IconBarChartFill', 1)
INSERT [dbo].[MenuItems] ([Id], [Key], [Name], [ParentId], [Route], [Icon], [Sort]) VALUES (N'b67dc630-6c6f-4dd1-88a1-1380ddf043f6', N'units', N'Quản lý đơn vị/phòng ban', N'd7d627dc-8642-4131-ac61-f629a0f69929', N'/organization-management/units', N'IconDeploymentUnit', 4)
INSERT [dbo].[MenuItems] ([Id], [Key], [Name], [ParentId], [Route], [Icon], [Sort]) VALUES (N'8d34733f-09dd-4c18-8170-16e03456d202', N'evaluation-ratings', N'Danh mục thang điểm đánh giá', N'97e2f2a0-00c8-492e-8503-adbbcb791b1f', N'/categories/evaluation-ratings', N'IconScoreboardOutline', 1)
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
INSERT [dbo].[RefreshToken] ([Id], [UserId], [Token], [JwtId], [IsUsed], [IsRevoked], [IssuedAt], [ExpiredAt]) VALUES (N'12b17c46-89e3-476d-ad8f-3a9786f2ab1a', N'6b2dc1cb-7a55-4f16-b9cf-6cf6a048edea', N'3GzQZtFJcdQDcY0jb1bCACz8lsTNRkLNBKhqr4ARZIs=', N'769fc927-de43-4246-a740-b22f51b2302a', 0, 0, CAST(N'2024-11-18T21:27:56.2524175' AS DateTime2), CAST(N'2024-11-25T21:27:56.2524464' AS DateTime2))
INSERT [dbo].[RefreshToken] ([Id], [UserId], [Token], [JwtId], [IsUsed], [IsRevoked], [IssuedAt], [ExpiredAt]) VALUES (N'4401b503-d989-4d74-9ff9-4b7a5120a68b', N'89675a85-e1bc-459b-8036-9e1597ed929a', N'pLpoXF/6nfbKDRVPTdUPNOwYbi3QacZ4yn1gWXJaFvQ=', N'd3f8aaee-2e31-4cc3-a0fd-f7a285906bea', 0, 0, CAST(N'2024-11-18T21:29:05.6866802' AS DateTime2), CAST(N'2024-11-25T21:29:05.6866803' AS DateTime2))
INSERT [dbo].[RefreshToken] ([Id], [UserId], [Token], [JwtId], [IsUsed], [IsRevoked], [IssuedAt], [ExpiredAt]) VALUES (N'36a2c8bb-c970-420c-a45c-9d4e03a6cd7f', N'd486e012-c894-4cf0-b036-445850887364', N'zBIJwuoR+VxZnKdxXL89lG/7to7eaJuTNdbwwLACxkw=', N'2c007383-c9c7-4333-b76e-5992b49e24b5', 0, 0, CAST(N'2024-11-17T15:01:15.5406392' AS DateTime2), CAST(N'2024-11-24T15:01:15.5406393' AS DateTime2))
INSERT [dbo].[RefreshToken] ([Id], [UserId], [Token], [JwtId], [IsUsed], [IsRevoked], [IssuedAt], [ExpiredAt]) VALUES (N'9ca25d30-922a-40cc-9406-ae282fae5f27', N'3df19402-0808-47f6-9d47-e15b5a0df798', N'A1YJ9eKgMl5z2JHxIS8ab8ccFk8e4Gg3nhit+dJuruk=', N'8472e88c-f4bd-4731-8db0-83b050d7cf6e', 0, 0, CAST(N'2024-11-18T21:28:55.7180645' AS DateTime2), CAST(N'2024-11-25T21:28:55.7180646' AS DateTime2))
INSERT [dbo].[RefreshToken] ([Id], [UserId], [Token], [JwtId], [IsUsed], [IsRevoked], [IssuedAt], [ExpiredAt]) VALUES (N'5626b619-75c1-4dc9-a96a-b47f0ffedb2f', N'a6ba15f2-d668-4059-a1c4-5b0deda85c47', N'S8j/Tqci+heLQWXULjg3NXFP4dZVQiU98NT+Hc6jFBw=', N'885b1768-8ace-4f69-9246-0fcd70317429', 0, 0, CAST(N'2024-11-18T21:30:19.5456975' AS DateTime2), CAST(N'2024-11-25T21:30:19.5456975' AS DateTime2))
INSERT [dbo].[RefreshToken] ([Id], [UserId], [Token], [JwtId], [IsUsed], [IsRevoked], [IssuedAt], [ExpiredAt]) VALUES (N'e64df8d7-c9aa-49e8-8526-da0767b74c49', N'9b7c2d93-7d20-4406-8a0a-7883cc4f3c3d', N'OWZshHIVrT7bzGpyvOuZT9y/j/5Hdl6cyKX/fQQF8vU=', N'15595a17-c356-4686-b881-dbadacebbd7b', 0, 0, CAST(N'2024-11-18T21:43:07.8555653' AS DateTime2), CAST(N'2024-11-25T21:43:07.8555654' AS DateTime2))
GO
INSERT [dbo].[RoleMenuItems] ([Id], [RoleId], [MenuItemId]) VALUES (N'a787a8b1-9a70-4126-9b2b-05c830230949', N'a6204804-82cf-4f94-a3e1-07cd10a8e579', N'fa70e2f4-8d7f-479d-a12a-f91508b8c33e')
INSERT [dbo].[RoleMenuItems] ([Id], [RoleId], [MenuItemId]) VALUES (N'12703fe6-7a89-4a49-b387-16ef6ee19cce', N'a6204804-82cf-4f94-a3e1-07cd10a8e579', N'dd8e29a6-c51e-4e9a-9b89-6c255c7f1e07')
INSERT [dbo].[RoleMenuItems] ([Id], [RoleId], [MenuItemId]) VALUES (N'e5b1930a-447c-4841-a06f-1fc720e2c95d', N'a6204804-82cf-4f94-a3e1-07cd10a8e579', N'97e2f2a0-00c8-492e-8503-adbbcb791b1f')
INSERT [dbo].[RoleMenuItems] ([Id], [RoleId], [MenuItemId]) VALUES (N'4208e7ab-86c0-492e-91cc-28320886fd43', N'a6204804-82cf-4f94-a3e1-07cd10a8e579', N'b67dc630-6c6f-4dd1-88a1-1380ddf043f6')
INSERT [dbo].[RoleMenuItems] ([Id], [RoleId], [MenuItemId]) VALUES (N'7ed9ef64-5712-46e6-8c9c-2a4b413fdc1b', N'a6204804-82cf-4f94-a3e1-07cd10a8e579', N'78ca07f2-0549-449a-9ca4-8a950a40b567')
INSERT [dbo].[RoleMenuItems] ([Id], [RoleId], [MenuItemId]) VALUES (N'4ea23c92-07ea-4734-98be-30fd27bc0513', N'fa00a51d-a46e-4d10-926e-5ba8ba68d432', N'e73b567f-c830-41d4-ac5c-e299543cf95a')
INSERT [dbo].[RoleMenuItems] ([Id], [RoleId], [MenuItemId]) VALUES (N'8ef86dcb-9606-44ac-af64-346ca3fe38d6', N'a6204804-82cf-4f94-a3e1-07cd10a8e579', N'f0a0148d-7e05-4873-b5bd-37e61c626887')
INSERT [dbo].[RoleMenuItems] ([Id], [RoleId], [MenuItemId]) VALUES (N'73c469a5-7df8-42a6-b601-3b409e6dfc82', N'a6204804-82cf-4f94-a3e1-07cd10a8e579', N'51b36720-d531-4648-9efb-e80c5bdd04a5')
INSERT [dbo].[RoleMenuItems] ([Id], [RoleId], [MenuItemId]) VALUES (N'843684ff-ee0c-4ac5-8529-522754bf67bf', N'a6204804-82cf-4f94-a3e1-07cd10a8e579', N'd7d627dc-8642-4131-ac61-f629a0f69929')
INSERT [dbo].[RoleMenuItems] ([Id], [RoleId], [MenuItemId]) VALUES (N'e54db450-4e2b-469e-a4c3-5b702656eb7f', N'a6204804-82cf-4f94-a3e1-07cd10a8e579', N'9f7dd98f-381f-4cec-8448-b1f7e3ce6531')
INSERT [dbo].[RoleMenuItems] ([Id], [RoleId], [MenuItemId]) VALUES (N'4a9ad7a3-ff0a-419d-a243-5fa9e2aae79d', N'20a6ddc3-0e72-400e-80e0-dd5256182a9a', N'd0a617ce-7a4a-4556-a2d0-82503dfef228')
INSERT [dbo].[RoleMenuItems] ([Id], [RoleId], [MenuItemId]) VALUES (N'8233a391-b4a5-4d07-af56-71972951eb3b', N'a6204804-82cf-4f94-a3e1-07cd10a8e579', N'd0a617ce-7a4a-4556-a2d0-82503dfef228')
INSERT [dbo].[RoleMenuItems] ([Id], [RoleId], [MenuItemId]) VALUES (N'cb6ef9f9-49ab-4cce-b337-77c1771a0a6d', N'a6204804-82cf-4f94-a3e1-07cd10a8e579', N'93a76a6e-3f4c-4d02-9b67-3c938a873be1')
INSERT [dbo].[RoleMenuItems] ([Id], [RoleId], [MenuItemId]) VALUES (N'd7d828f6-a641-4bc5-99db-780998206f67', N'bc4ce45e-b29f-4f21-8c68-9e1cff35614e', N'dd8e29a6-c51e-4e9a-9b89-6c255c7f1e07')
INSERT [dbo].[RoleMenuItems] ([Id], [RoleId], [MenuItemId]) VALUES (N'bdc62e40-bfae-4c79-ab09-7b2e7885e49a', N'a6204804-82cf-4f94-a3e1-07cd10a8e579', N'6f9046d3-eb0e-4da1-97c1-f9509c240fd9')
INSERT [dbo].[RoleMenuItems] ([Id], [RoleId], [MenuItemId]) VALUES (N'38c044dc-7f43-4dad-b52f-85e1e8435ecb', N'a6204804-82cf-4f94-a3e1-07cd10a8e579', N'be782bc6-5b5f-4edc-a2c4-0dc8ad2af70e')
INSERT [dbo].[RoleMenuItems] ([Id], [RoleId], [MenuItemId]) VALUES (N'4c112efd-b8a4-49a6-bf0f-88b4884cc091', N'a6204804-82cf-4f94-a3e1-07cd10a8e579', N'32cc32e8-8e12-4b5f-9089-e2c52227155d')
INSERT [dbo].[RoleMenuItems] ([Id], [RoleId], [MenuItemId]) VALUES (N'00031b02-c463-4b9a-89e8-a1fcb179a1f4', N'a6204804-82cf-4f94-a3e1-07cd10a8e579', N'f9518f77-2b01-4131-b229-f1f675f5ceca')
INSERT [dbo].[RoleMenuItems] ([Id], [RoleId], [MenuItemId]) VALUES (N'51fd8bc3-54cf-4609-a66b-adaa0520bd7c', N'fa00a51d-a46e-4d10-926e-5ba8ba68d432', N'dd8e29a6-c51e-4e9a-9b89-6c255c7f1e07')
INSERT [dbo].[RoleMenuItems] ([Id], [RoleId], [MenuItemId]) VALUES (N'dd0a5147-05e3-45bb-8c1f-adb64c91264d', N'a6204804-82cf-4f94-a3e1-07cd10a8e579', N'3172d91d-37cf-46ec-9eb8-62fd2a01e691')
INSERT [dbo].[RoleMenuItems] ([Id], [RoleId], [MenuItemId]) VALUES (N'7a7b7109-2e4c-4de9-94f1-b069c98bd024', N'20a6ddc3-0e72-400e-80e0-dd5256182a9a', N'e73b567f-c830-41d4-ac5c-e299543cf95a')
INSERT [dbo].[RoleMenuItems] ([Id], [RoleId], [MenuItemId]) VALUES (N'7a855627-65e3-45da-b7a6-c6a8730ec2ad', N'fa00a51d-a46e-4d10-926e-5ba8ba68d432', N'f9518f77-2b01-4131-b229-f1f675f5ceca')
INSERT [dbo].[RoleMenuItems] ([Id], [RoleId], [MenuItemId]) VALUES (N'e5cd423c-b431-44cd-b0d5-cc05a99dc64e', N'bc4ce45e-b29f-4f21-8c68-9e1cff35614e', N'd0a617ce-7a4a-4556-a2d0-82503dfef228')
INSERT [dbo].[RoleMenuItems] ([Id], [RoleId], [MenuItemId]) VALUES (N'34abb084-a6f8-4957-a88f-cc2867857562', N'bc4ce45e-b29f-4f21-8c68-9e1cff35614e', N'f0a0148d-7e05-4873-b5bd-37e61c626887')
INSERT [dbo].[RoleMenuItems] ([Id], [RoleId], [MenuItemId]) VALUES (N'29e0aa2c-f3df-49d3-9f2a-da8442b260fb', N'bc4ce45e-b29f-4f21-8c68-9e1cff35614e', N'e73b567f-c830-41d4-ac5c-e299543cf95a')
INSERT [dbo].[RoleMenuItems] ([Id], [RoleId], [MenuItemId]) VALUES (N'd35ec026-caed-46fd-95f8-de2c1b596c00', N'fa00a51d-a46e-4d10-926e-5ba8ba68d432', N'd0a617ce-7a4a-4556-a2d0-82503dfef228')
INSERT [dbo].[RoleMenuItems] ([Id], [RoleId], [MenuItemId]) VALUES (N'da4bbbbc-6d52-4cb6-9a8b-e0cacec188b1', N'a6204804-82cf-4f94-a3e1-07cd10a8e579', N'e73b567f-c830-41d4-ac5c-e299543cf95a')
INSERT [dbo].[RoleMenuItems] ([Id], [RoleId], [MenuItemId]) VALUES (N'fe2740b6-adc5-4a15-86e2-e7f9946600bf', N'a6204804-82cf-4f94-a3e1-07cd10a8e579', N'63a5cead-6c28-4993-8c46-d86458b4d8bb')
INSERT [dbo].[RoleMenuItems] ([Id], [RoleId], [MenuItemId]) VALUES (N'28571700-b465-4c4b-ad24-fbeb957dfb4d', N'20a6ddc3-0e72-400e-80e0-dd5256182a9a', N'f0a0148d-7e05-4873-b5bd-37e61c626887')
INSERT [dbo].[RoleMenuItems] ([Id], [RoleId], [MenuItemId]) VALUES (N'01a145a1-3d60-4b59-aebf-fc24610c3f95', N'fa00a51d-a46e-4d10-926e-5ba8ba68d432', N'f0a0148d-7e05-4873-b5bd-37e61c626887')
INSERT [dbo].[RoleMenuItems] ([Id], [RoleId], [MenuItemId]) VALUES (N'd339f9ba-041d-4ea6-b939-ff61ce1345a8', N'a6204804-82cf-4f94-a3e1-07cd10a8e579', N'8d34733f-09dd-4c18-8170-16e03456d202')
GO
INSERT [dbo].[Roles] ([Id], [RoleName], [UpdatedAt], [IsDeleted]) VALUES (N'a6204804-82cf-4f94-a3e1-07cd10a8e579', N'QUẢN TRỊ HỆ THỐNG', CAST(N'2024-11-12T07:44:20.7088902' AS DateTime2), 0)
INSERT [dbo].[Roles] ([Id], [RoleName], [UpdatedAt], [IsDeleted]) VALUES (N'fa00a51d-a46e-4d10-926e-5ba8ba68d432', N'QUẢN LÝ ĐƠN VỊ', CAST(N'2024-11-12T07:57:52.1480944' AS DateTime2), 0)
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
INSERT [dbo].[User] ([Id], [UserTypeId], [UnitId], [FullName], [Email], [Password], [Phone], [Address], [Birthday], [PositionsName], [IsActive], [IsDeleted], [UpdatedAt]) VALUES (N'd486e012-c894-4cf0-b036-445850887364', N'0acb8f47-7f4b-4ed9-aeb8-b331f0dbf704', N'4402c619-783f-4580-83cd-86e50a47171d', N'Hiệu trưởng', N'ht@gmail.com', N'123456789', N'0326393545', N'asdsad', CAST(N'2024-11-09T00:00:00.0000000' AS DateTime2), N'VCGV', 1, 0, CAST(N'2024-11-15T22:16:54.4538347' AS DateTime2))
INSERT [dbo].[User] ([Id], [UserTypeId], [UnitId], [FullName], [Email], [Password], [Phone], [Address], [Birthday], [PositionsName], [IsActive], [IsDeleted], [UpdatedAt]) VALUES (N'a6ba15f2-d668-4059-a1c4-5b0deda85c47', N'25baa22a-3368-4958-96a2-fe3a3591a35d', N'7787a766-2655-457b-afa5-cc21e94ff712', N'ADMIN', N'admin@gmail.com', N'admin', N'03263935401', N'Lộc Ninh, Bình Phước', CAST(N'2002-01-20T00:00:00.0000000' AS DateTime2), N'LDHD', 1, 0, CAST(N'2024-10-31T15:01:27.4135003' AS DateTime2))
INSERT [dbo].[User] ([Id], [UserTypeId], [UnitId], [FullName], [Email], [Password], [Phone], [Address], [Birthday], [PositionsName], [IsActive], [IsDeleted], [UpdatedAt]) VALUES (N'6b2dc1cb-7a55-4f16-b9cf-6cf6a048edea', N'1bd77fd4-32a8-4c80-ad95-e0c9373d485f', N'4402c619-783f-4580-83cd-86e50a47171d', N'Giáo viên 1', N'giaovien1@gmail.com', N'admin', N'0326393540', N'asdsdasdsad', CAST(N'2024-11-01T00:00:00.0000000' AS DateTime2), N'VCGV', 1, 0, CAST(N'2024-11-15T22:10:18.8948435' AS DateTime2))
INSERT [dbo].[User] ([Id], [UserTypeId], [UnitId], [FullName], [Email], [Password], [Phone], [Address], [Birthday], [PositionsName], [IsActive], [IsDeleted], [UpdatedAt]) VALUES (N'9b7c2d93-7d20-4406-8a0a-7883cc4f3c3d', N'4bb20ca7-76b9-4137-b32a-1174b43a9765', N'4402c619-783f-4580-83cd-86e50a47171d', N'Trưởng bộ môn', N'tbm@gmail.com', N'123456789', N'0326393544', N'asdsad', CAST(N'2024-11-16T00:00:00.0000000' AS DateTime2), N'VCGV', 1, 0, CAST(N'2024-11-15T22:17:11.2805409' AS DateTime2))
INSERT [dbo].[User] ([Id], [UserTypeId], [UnitId], [FullName], [Email], [Password], [Phone], [Address], [Birthday], [PositionsName], [IsActive], [IsDeleted], [UpdatedAt]) VALUES (N'89675a85-e1bc-459b-8036-9e1597ed929a', N'1bd77fd4-32a8-4c80-ad95-e0c9373d485f', N'4402c619-783f-4580-83cd-86e50a47171d', N'Giáo viên 3', N'giaovien3@gmail.com', N'123456789', N'0326393543', N'asds', CAST(N'2024-11-16T00:00:00.0000000' AS DateTime2), N'VCGV', 1, 0, CAST(N'2024-11-15T22:15:50.9139904' AS DateTime2))
INSERT [dbo].[User] ([Id], [UserTypeId], [UnitId], [FullName], [Email], [Password], [Phone], [Address], [Birthday], [PositionsName], [IsActive], [IsDeleted], [UpdatedAt]) VALUES (N'3df19402-0808-47f6-9d47-e15b5a0df798', N'1bd77fd4-32a8-4c80-ad95-e0c9373d485f', N'4402c619-783f-4580-83cd-86e50a47171d', N'Giáo viên 2', N'giaovien2@gmail.com', N'123456789', N'0326393541', N'asdd', CAST(N'2024-11-02T00:00:00.0000000' AS DateTime2), N'VCGV', 1, 0, CAST(N'2024-11-15T22:15:20.1175362' AS DateTime2))
GO
INSERT [dbo].[UserRoles] ([Id], [RoleId], [UserId]) VALUES (N'5ec426a8-81c9-445b-8c40-04ec735b7394', N'bc4ce45e-b29f-4f21-8c68-9e1cff35614e', N'9b7c2d93-7d20-4406-8a0a-7883cc4f3c3d')
INSERT [dbo].[UserRoles] ([Id], [RoleId], [UserId]) VALUES (N'196e39dc-f75b-4af1-922e-4c7904180ed4', N'a6204804-82cf-4f94-a3e1-07cd10a8e579', N'a6ba15f2-d668-4059-a1c4-5b0deda85c47')
INSERT [dbo].[UserRoles] ([Id], [RoleId], [UserId]) VALUES (N'483600af-e225-4904-895f-88fe592883a2', N'fa00a51d-a46e-4d10-926e-5ba8ba68d432', N'd486e012-c894-4cf0-b036-445850887364')
INSERT [dbo].[UserRoles] ([Id], [RoleId], [UserId]) VALUES (N'9bf36fcd-ff24-4c60-b35b-ae534fc10c92', N'20a6ddc3-0e72-400e-80e0-dd5256182a9a', N'89675a85-e1bc-459b-8036-9e1597ed929a')
INSERT [dbo].[UserRoles] ([Id], [RoleId], [UserId]) VALUES (N'1f48033f-2f81-44b7-9173-cd7f0c8210ce', N'20a6ddc3-0e72-400e-80e0-dd5256182a9a', N'6b2dc1cb-7a55-4f16-b9cf-6cf6a048edea')
INSERT [dbo].[UserRoles] ([Id], [RoleId], [UserId]) VALUES (N'd3ee80f2-4634-4648-a221-d0db591f02bf', N'20a6ddc3-0e72-400e-80e0-dd5256182a9a', N'3df19402-0808-47f6-9d47-e15b5a0df798')
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
