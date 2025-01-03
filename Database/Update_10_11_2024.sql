USE [SA_Demo_1]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 11/10/2024 9:54:59 AM ******/
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
/****** Object:  Table [dbo].[CategoryComment]    Script Date: 11/10/2024 9:54:59 AM ******/
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
/****** Object:  Table [dbo].[CategoryCriteria]    Script Date: 11/10/2024 9:54:59 AM ******/
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
/****** Object:  Table [dbo].[CategoryProsCons]    Script Date: 11/10/2024 9:54:59 AM ******/
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
/****** Object:  Table [dbo].[CategoryRating]    Script Date: 11/10/2024 9:54:59 AM ******/
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
/****** Object:  Table [dbo].[CategoryTimeType]    Script Date: 11/10/2024 9:54:59 AM ******/
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
/****** Object:  Table [dbo].[ElectronicSignature]    Script Date: 11/10/2024 9:54:59 AM ******/
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
/****** Object:  Table [dbo].[Evaluation]    Script Date: 11/10/2024 9:54:59 AM ******/
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
/****** Object:  Table [dbo].[EvaluationCriteria]    Script Date: 11/10/2024 9:54:59 AM ******/
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
/****** Object:  Table [dbo].[MenuItems]    Script Date: 11/10/2024 9:54:59 AM ******/
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
/****** Object:  Table [dbo].[RefreshToken]    Script Date: 11/10/2024 9:54:59 AM ******/
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
/****** Object:  Table [dbo].[RoleMenuItems]    Script Date: 11/10/2024 9:54:59 AM ******/
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
/****** Object:  Table [dbo].[Roles]    Script Date: 11/10/2024 9:54:59 AM ******/
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
/****** Object:  Table [dbo].[Unit]    Script Date: 11/10/2024 9:54:59 AM ******/
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
/****** Object:  Table [dbo].[User]    Script Date: 11/10/2024 9:54:59 AM ******/
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
/****** Object:  Table [dbo].[UserRoles]    Script Date: 11/10/2024 9:54:59 AM ******/
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
/****** Object:  Table [dbo].[UserType]    Script Date: 11/10/2024 9:54:59 AM ******/
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
INSERT [dbo].[ElectronicSignature] ([Id], [UserId], [Status], [PublicKey], [PrivateKey], [UpdatedAt]) VALUES (N'ca059476-35c1-42cc-bee8-cccd83cbf9bd', N'7e1cb3e6-e94a-4177-95af-6f2296c5efe4', 0, N'MIIEowIBAAKCAQEAtS0nOhL1RWTrNwu4JUt0aZ5T4pFeOy+n8tkbpNfmABDHFiA2kys9d98DsMXTLyegXtrs/Jm5Z3C7kLsPuWuRDzIAxQ4hWxZp0i8aGFkrWtI9oF6plK5VoRxcsmltK8wlKRoMTwmikC/6hcYo4L0HdZ12N8IeynQ38XJGakpagGP6vFLhQoC1kxM1U50mTgT+m0Rp6ockLc1VhFAHylNE9WdEqpTuhsijNOUvIIRjdd0zhviEpz5IweF2nm2LFWsiu19k7esxhIe1HyHRP8nx+aaBs8ZhCTO2Ey+wxrH3oZ15OhpX7Viz+saVEOBGlzomaFhVDpyZQ1q8bgZfBhobPQIDAQABAoIBAC3po2c0JrPPP0xTy/aniHi7hsaD0D1vdkA0hKzhiYe6uLkCsNHaw1j9SxIhD8ODZ0CieiwJSNLN3rpurS1v9PLE2S0Wx50tsONyzEofTr1VSgi59H+ZLloFtfgAf4n50fD4iOX+qxOfFP2RmgpZ3OoRXUQEDYmAqiylqPKGpSijv+hhZBCcKvpW498rNOVM+kgQ0jDHnsBICtTJiOp24FO7GiIegx8S9pZhjzbRcKh8X23a1i+nduSLPIcZyVSd5NTe3+Keg18HV25OJXIOc3nJ+svrXbFjGjlxl3iDMB50gIKyq2oZhlTmFQoV/inK1Em+fMitQGGxSz4sEU5j7IECgYEA7C2eJKwD/aI/JVsGcBm+33kfP6vWoLVAoYo3JTjblS4JZaBplnMQn8SvcsR5rgomNbWn6Mx3DNIL64gYHtw4lo3qKfff3OD2vOaxepPlkksg9nGDkyGd7IT3Z8x3lUlvjiUNFqpCmlo4FStou/e9wjexmlD+aHmFigLTI3h5PkMCgYEAxGHMtuJx71TuO4fk1IgZPeJYDxdTDHlucW+r6SphUuISrr5SOwMZ1mhwWNbaQRsc+Th+a1qRXkeZ18CoCVmkGPWpsFVEdL0M7Iq6BcY4oqM3SsxHGG+2KcszlcUJ6XipvdabGF8gNIiwYY76IJOCVwxaqtiXo3ycxC8oJHSjaH8CgYB7e2pYsBsyDBdJ16qpB7z1KGW/K3/+7GVLUHF+o5ijCbveB53NDIIfln1I2xLnfOT3Ze/RVr3T1SpoTfKWh/uKM86/fJrt6Cz5HQCkHxmDgIZOc5EgZw4jsG2ONqg7RHbv8c1DEWfbPdperyCGToRHPEk+bqRlSUwZmVp9DCsP8wKBgGtPlfIJ44CIxHW7WIvaoxBx8vSsJjGW2YcbIrGS+wOzjcn3LjAZDbFf+KRTI4iYLEjzWgGHyA/gyGxhVnFljoolE8jLj1DLTZikZepp2uDkl35ECkWMJdrIszOQLE5sJTUbZDz5HjwWxWtKGdxbPsoaciERoiswGOoLasAhDHo5AoGBAL5x1LcASp/U+8eymZLZUh8A4F0qaABWNFvtq6Sn/rrPGCZRY+HaT52q3AIMNnss7Z5LpSj/o3tWwkU3ZXy9Z2Gn+U1bTWCHjwi5BR3KLA8JElHm8f6o391T5rzF4BZnWTWvutKTb+g9YExkazGZNxtyP+x65EesXtPldyUtLpAU', N'MIIBCgKCAQEAtS0nOhL1RWTrNwu4JUt0aZ5T4pFeOy+n8tkbpNfmABDHFiA2kys9d98DsMXTLyegXtrs/Jm5Z3C7kLsPuWuRDzIAxQ4hWxZp0i8aGFkrWtI9oF6plK5VoRxcsmltK8wlKRoMTwmikC/6hcYo4L0HdZ12N8IeynQ38XJGakpagGP6vFLhQoC1kxM1U50mTgT+m0Rp6ockLc1VhFAHylNE9WdEqpTuhsijNOUvIIRjdd0zhviEpz5IweF2nm2LFWsiu19k7esxhIe1HyHRP8nx+aaBs8ZhCTO2Ey+wxrH3oZ15OhpX7Viz+saVEOBGlzomaFhVDpyZQ1q8bgZfBhobPQIDAQAB', CAST(N'2024-11-02T09:58:54.7483644' AS DateTime2))
GO
INSERT [dbo].[Evaluation] ([Id], [UnitId], [CategoryTimeTypeId], [EvaluationName], [Status], [IsDeleted], [UpdatedAt]) VALUES (N'8280b868-03f1-45c8-a2f1-11e2880af097', N'93684774-0d94-42c9-ac77-078b6e3d2366', N'cbd1e5ab-0498-460c-823d-0acfde1bc2d3', N'asdasd', 0, 1, CAST(N'2024-11-06T08:46:28.4937768' AS DateTime2))
INSERT [dbo].[Evaluation] ([Id], [UnitId], [CategoryTimeTypeId], [EvaluationName], [Status], [IsDeleted], [UpdatedAt]) VALUES (N'bb5d49b0-97b8-466f-9883-18a468601043', N'eddeeb9a-3d58-4996-9cf3-6033f9088f2f', N'13d5e5a0-7eda-4725-9e56-455790a9c0a2', N'asdasd', 0, 1, CAST(N'2024-11-06T08:46:28.4937779' AS DateTime2))
INSERT [dbo].[Evaluation] ([Id], [UnitId], [CategoryTimeTypeId], [EvaluationName], [Status], [IsDeleted], [UpdatedAt]) VALUES (N'13b08443-960c-466e-b2f5-1aa28acc5bdf', N'078a7927-d967-4d63-9543-56d3437aa343', N'13d5e5a0-7eda-4725-9e56-455790a9c0a2', N'asdasd', 0, 1, CAST(N'2024-11-06T08:46:28.4937779' AS DateTime2))
INSERT [dbo].[Evaluation] ([Id], [UnitId], [CategoryTimeTypeId], [EvaluationName], [Status], [IsDeleted], [UpdatedAt]) VALUES (N'ee790547-5a8b-4f60-8d0a-273ce1ad3326', N'1feb11df-bb8c-4871-b916-3225c3897d40', N'13d5e5a0-7eda-4725-9e56-455790a9c0a2', N'asdasd', 0, 1, CAST(N'2024-11-06T08:46:28.4937780' AS DateTime2))
INSERT [dbo].[Evaluation] ([Id], [UnitId], [CategoryTimeTypeId], [EvaluationName], [Status], [IsDeleted], [UpdatedAt]) VALUES (N'9dcda18f-c78a-4dfe-a8f3-3010459d5787', N'd027056f-5de8-4e88-8bfa-7a01f6ffc001', N'0ec736da-795b-4bc3-9b92-f4e0242d18e0', N'test1', 0, 0, CAST(N'2024-11-06T21:28:59.0493539' AS DateTime2))
INSERT [dbo].[Evaluation] ([Id], [UnitId], [CategoryTimeTypeId], [EvaluationName], [Status], [IsDeleted], [UpdatedAt]) VALUES (N'1c202492-f29c-44a8-85f8-516666d3dd0c', N'c8e8fe3c-4e4d-4d25-a5a6-3f175fae3d5f', N'13d5e5a0-7eda-4725-9e56-455790a9c0a2', N'asdasd', 0, 1, CAST(N'2024-11-06T08:46:28.4937781' AS DateTime2))
INSERT [dbo].[Evaluation] ([Id], [UnitId], [CategoryTimeTypeId], [EvaluationName], [Status], [IsDeleted], [UpdatedAt]) VALUES (N'87482a50-6425-4411-a6b5-574e8b11c387', N'4402c619-783f-4580-83cd-86e50a47171d', N'0ec736da-795b-4bc3-9b92-f4e0242d18e0', N'test1', 0, 0, CAST(N'2024-11-06T21:28:59.0493552' AS DateTime2))
INSERT [dbo].[Evaluation] ([Id], [UnitId], [CategoryTimeTypeId], [EvaluationName], [Status], [IsDeleted], [UpdatedAt]) VALUES (N'0e3b9ee0-7aa4-458c-8da7-639c72b88494', N'c8e8fe3c-4e4d-4d25-a5a6-3f175fae3d5f', N'0ec736da-795b-4bc3-9b92-f4e0242d18e0', N'asdsad', 0, 0, CAST(N'2024-11-06T21:28:59.0493553' AS DateTime2))
INSERT [dbo].[Evaluation] ([Id], [UnitId], [CategoryTimeTypeId], [EvaluationName], [Status], [IsDeleted], [UpdatedAt]) VALUES (N'911b67d7-c6ff-42ba-a710-8cd49cc2141f', N'664bd0e3-9aad-4100-9271-6ab89fb35d88', N'0ec736da-795b-4bc3-9b92-f4e0242d18e0', N'test1', 0, 0, CAST(N'2024-11-06T21:28:59.0493553' AS DateTime2))
INSERT [dbo].[Evaluation] ([Id], [UnitId], [CategoryTimeTypeId], [EvaluationName], [Status], [IsDeleted], [UpdatedAt]) VALUES (N'ae628d0d-d84d-4b95-9134-a8a3788af737', N'078a7927-d967-4d63-9543-56d3437aa343', N'0ec736da-795b-4bc3-9b92-f4e0242d18e0', N'asdsad', 0, 0, CAST(N'2024-11-06T21:28:59.0493554' AS DateTime2))
INSERT [dbo].[Evaluation] ([Id], [UnitId], [CategoryTimeTypeId], [EvaluationName], [Status], [IsDeleted], [UpdatedAt]) VALUES (N'1849fcbe-2a49-4e3c-8d9a-d12139acdcae', N'eddeeb9a-3d58-4996-9cf3-6033f9088f2f', N'0ec736da-795b-4bc3-9b92-f4e0242d18e0', N'asdsad', 0, 0, CAST(N'2024-11-06T21:28:59.0493554' AS DateTime2))
INSERT [dbo].[Evaluation] ([Id], [UnitId], [CategoryTimeTypeId], [EvaluationName], [Status], [IsDeleted], [UpdatedAt]) VALUES (N'db8c58cb-aec0-43f2-8277-d5d04069f7e4', N'1feb11df-bb8c-4871-b916-3225c3897d40', N'0ec736da-795b-4bc3-9b92-f4e0242d18e0', N'asdsad', 0, 0, CAST(N'2024-11-06T21:28:59.0493555' AS DateTime2))
INSERT [dbo].[Evaluation] ([Id], [UnitId], [CategoryTimeTypeId], [EvaluationName], [Status], [IsDeleted], [UpdatedAt]) VALUES (N'4996b1df-3d3a-4057-a5dd-d6c90e183452', N'4801aee9-d3dd-4330-ba8a-4fd180adc15e', N'0ec736da-795b-4bc3-9b92-f4e0242d18e0', N'asdsad', 0, 0, CAST(N'2024-11-06T21:28:59.0493556' AS DateTime2))
INSERT [dbo].[Evaluation] ([Id], [UnitId], [CategoryTimeTypeId], [EvaluationName], [Status], [IsDeleted], [UpdatedAt]) VALUES (N'eb5ccb88-8798-4a61-bf60-e886a36db3e6', N'4801aee9-d3dd-4330-ba8a-4fd180adc15e', N'13d5e5a0-7eda-4725-9e56-455790a9c0a2', N'asdasd', 0, 1, CAST(N'2024-11-06T08:46:28.4937781' AS DateTime2))
INSERT [dbo].[Evaluation] ([Id], [UnitId], [CategoryTimeTypeId], [EvaluationName], [Status], [IsDeleted], [UpdatedAt]) VALUES (N'fe8e27cb-9f15-4ced-bf8f-fb8c4668d767', N'93684774-0d94-42c9-ac77-078b6e3d2366', N'0ec736da-795b-4bc3-9b92-f4e0242d18e0', N'asdsad3', 0, 0, CAST(N'2024-11-06T21:28:59.0493556' AS DateTime2))
GO
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'275007e0-66f5-4b57-a854-00798bea78e5', N'db8c58cb-aec0-43f2-8277-d5d04069f7e4', N'3622e825-11bb-44fd-bc59-ce0c40aa9509', 0, CAST(N'2024-11-07T20:31:36.1656392' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'cebafbae-4406-44fb-b209-009925036032', N'1849fcbe-2a49-4e3c-8d9a-d12139acdcae', N'bf0b9144-be3b-4213-8f3c-f744035ed4b5', 0, CAST(N'2024-11-07T20:31:36.4514861' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'd26df3c0-24dd-45d7-8391-0166b547d52f', N'911b67d7-c6ff-42ba-a710-8cd49cc2141f', N'3c69d1e2-9204-431f-863f-a4ba07f3ac1d', 0, CAST(N'2024-11-07T20:31:36.6528224' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'9530b76b-5c1f-474f-83b9-0274fce75ad2', N'fe8e27cb-9f15-4ced-bf8f-fb8c4668d767', N'b4ab63da-81d4-4ea1-8a5a-3c12154fa561', 0, CAST(N'2024-11-07T20:31:36.1540552' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'8bcee614-bce8-4e22-bb96-03088f34800a', N'4996b1df-3d3a-4057-a5dd-d6c90e183452', N'4723cac1-52f7-43bb-8d3f-bfb3b6c28a96', 0, CAST(N'2024-11-07T20:33:14.4036341' AS DateTime2), 22)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'7c2bf219-cfb1-47b2-b1f9-03ee73e93ede', N'db8c58cb-aec0-43f2-8277-d5d04069f7e4', N'b4ab63da-81d4-4ea1-8a5a-3c12154fa561', 0, CAST(N'2024-11-07T20:31:36.2618359' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'080df945-a849-48a6-8965-0431c9b9d27d', N'0e3b9ee0-7aa4-458c-8da7-639c72b88494', N'51ef79d2-b47e-41f1-a99d-f5c0e4f4416e', 0, CAST(N'2024-11-07T20:31:36.5614573' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'76cf7f5f-f1b8-4dc5-ade0-0621606866e4', N'9dcda18f-c78a-4dfe-a8f3-3010459d5787', N'31314875-8f03-4874-be17-0f31c14f28ee', 0, CAST(N'2024-11-07T21:24:42.4051242' AS DateTime2), 16)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'cfe0ead6-4434-4923-a57e-070a4ebcd747', N'1849fcbe-2a49-4e3c-8d9a-d12139acdcae', N'1b68a81a-b654-4896-9195-84abfb081103', 0, CAST(N'2024-11-07T20:31:36.4401038' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'c89ab347-490b-45c7-b426-0800f856e31d', N'db8c58cb-aec0-43f2-8277-d5d04069f7e4', N'87fedc0d-caae-4890-80d9-a6e086d71a1c', 0, CAST(N'2024-11-07T20:31:36.2586878' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'90342c9a-3487-4b10-a0dd-085c3acb928a', N'0e3b9ee0-7aa4-458c-8da7-639c72b88494', N'0f8a3810-dc07-47e8-a089-7d6c08107382', 0, CAST(N'2024-11-07T20:31:36.5975404' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'92f17a79-c394-486f-82af-0923deec8eb8', N'911b67d7-c6ff-42ba-a710-8cd49cc2141f', N'999d3424-6bad-4d7b-8bd0-2b462b55dd45', 0, CAST(N'2024-11-07T20:31:36.7388169' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'663a8ec7-e0f1-4a0f-828e-092566b2d9eb', N'fe8e27cb-9f15-4ced-bf8f-fb8c4668d767', N'a7efdc67-aa93-46cb-8410-0ddcfe0d5853', 0, CAST(N'2024-11-07T20:31:36.0984348' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'cc87f131-2a56-4635-b407-0a3a82b41731', N'ae628d0d-d84d-4b95-9134-a8a3788af737', N'a7efdc67-aa93-46cb-8410-0ddcfe0d5853', 0, CAST(N'2024-11-07T20:31:36.3189409' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'd213e6ca-8e0b-4025-a233-0a68dcc6ac4c', N'ae628d0d-d84d-4b95-9134-a8a3788af737', N'efbe3ff8-a8cb-408b-b2de-f0cdc5f03d55', 0, CAST(N'2024-11-07T20:31:36.2744494' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'95a75d1d-e36e-4168-82b3-0bec29b229ea', N'87482a50-6425-4411-a6b5-574e8b11c387', N'fb40ad8f-098f-4fd1-8870-c05d1d25fae2', 0, CAST(N'2024-11-07T20:31:36.8030510' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'1d521d14-eecf-4f6e-8b43-0ecfb2ca3642', N'911b67d7-c6ff-42ba-a710-8cd49cc2141f', N'3a9ab36e-b834-4a20-ba32-a0d34fdc47da', 0, CAST(N'2024-11-07T20:31:36.7117295' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'ab9215a6-135c-4054-add1-0f8cdf1d05f0', N'4996b1df-3d3a-4057-a5dd-d6c90e183452', N'bf0b9144-be3b-4213-8f3c-f744035ed4b5', 0, CAST(N'2024-11-07T20:33:14.3418153' AS DateTime2), 12)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'a34b0b41-eef9-4f2b-9809-110578285dde', N'db8c58cb-aec0-43f2-8277-d5d04069f7e4', N'a7efdc67-aa93-46cb-8410-0ddcfe0d5853', 0, CAST(N'2024-11-07T20:31:36.2065847' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'a5f332d1-a036-4b35-b2f8-11802adbeb91', N'9dcda18f-c78a-4dfe-a8f3-3010459d5787', N'ca2c80e4-c9e6-4bc1-a080-1c0505bccaba', 0, CAST(N'2024-11-07T21:24:42.3516611' AS DateTime2), 9)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'cae610e1-badf-4613-b129-12632a16af19', N'87482a50-6425-4411-a6b5-574e8b11c387', N'3a9ab36e-b834-4a20-ba32-a0d34fdc47da', 0, CAST(N'2024-11-07T20:31:36.8410698' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'14dba253-2360-48e4-b55a-12d5a16ef5a9', N'4996b1df-3d3a-4057-a5dd-d6c90e183452', N'ca2c80e4-c9e6-4bc1-a080-1c0505bccaba', 0, CAST(N'2024-11-07T20:33:14.3463105' AS DateTime2), 13)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'cf7d073c-ec31-4dc6-b60d-151074b4da88', N'fe8e27cb-9f15-4ced-bf8f-fb8c4668d767', N'c702e9e8-111b-4402-8ed0-5f939a7892a6', 0, CAST(N'2024-11-07T20:31:36.0605844' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'03c3d3eb-7ab8-4f1b-bf81-15bea7604069', N'fe8e27cb-9f15-4ced-bf8f-fb8c4668d767', N'999d3424-6bad-4d7b-8bd0-2b462b55dd45', 0, CAST(N'2024-11-07T20:31:36.1442604' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'40caa9cb-6e7a-49d8-8c8f-15cbfda004c3', N'1849fcbe-2a49-4e3c-8d9a-d12139acdcae', N'51ef79d2-b47e-41f1-a99d-f5c0e4f4416e', 0, CAST(N'2024-11-07T20:31:36.4473830' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'00670391-ae82-4c33-a770-15fa85750657', N'0e3b9ee0-7aa4-458c-8da7-639c72b88494', N'8b678550-a782-4ed9-a61f-15887cf5a73e', 0, CAST(N'2024-11-07T20:31:36.6087602' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'e81ad1bc-6d1c-4086-accb-191427c19999', N'fe8e27cb-9f15-4ced-bf8f-fb8c4668d767', N'3622e825-11bb-44fd-bc59-ce0c40aa9509', 0, CAST(N'2024-11-07T20:31:36.0669638' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'faffea36-92c6-4cec-a495-192a759f4ba0', N'0e3b9ee0-7aa4-458c-8da7-639c72b88494', N'e296f2f3-e89c-49b9-b304-b76df59719ae', 0, CAST(N'2024-11-07T20:31:36.6044805' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'37811147-23d0-4f3a-a3ce-1a0ab47f68c2', N'1849fcbe-2a49-4e3c-8d9a-d12139acdcae', N'da5e3dff-a649-4508-943d-0ecc32d4f7fc', 0, CAST(N'2024-11-07T20:31:36.4659375' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'5a61b6db-324f-47fb-a0e4-1b968e5e9303', N'0e3b9ee0-7aa4-458c-8da7-639c72b88494', N'35ca5805-aa8f-4dc0-a895-c2bae87a00eb', 0, CAST(N'2024-11-07T20:31:36.5211892' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'5cbe517e-2e2b-48da-8a87-1bd09d925f6d', N'1849fcbe-2a49-4e3c-8d9a-d12139acdcae', N'e6d88410-17f4-479b-8e2d-8b6d5c0324a7', 0, CAST(N'2024-11-07T20:31:36.4262442' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'50ba5d0f-e7df-44fc-a482-1c02a93a9cc6', N'1849fcbe-2a49-4e3c-8d9a-d12139acdcae', N'e296f2f3-e89c-49b9-b304-b76df59719ae', 0, CAST(N'2024-11-07T20:31:36.4766712' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'139c2b66-f3d5-4985-9d91-1c10b78a16c4', N'87482a50-6425-4411-a6b5-574e8b11c387', N'ad4a5bce-f3c4-44a7-85c5-fdb1c2d19d12', 0, CAST(N'2024-11-07T20:31:36.7732531' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'9c7f33bc-6e41-4e79-95c0-1cc1c74cfbe4', N'911b67d7-c6ff-42ba-a710-8cd49cc2141f', N'79459d60-5db6-48b6-94bf-2121d9839e15', 0, CAST(N'2024-11-07T20:31:36.7443011' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'ca6a79fe-d7a2-4cc7-b194-1cccdb907334', N'87482a50-6425-4411-a6b5-574e8b11c387', N'786e1a85-def5-4a2e-a70c-cfc2c0d8b239', 0, CAST(N'2024-11-07T20:31:36.8221693' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'b2113490-9ec2-4ce3-b0e0-1dabee88972f', N'ae628d0d-d84d-4b95-9134-a8a3788af737', N'e6d88410-17f4-479b-8e2d-8b6d5c0324a7', 0, CAST(N'2024-11-07T20:31:36.3092243' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'25142735-bf6d-423a-b5b3-1db680c93daa', N'1849fcbe-2a49-4e3c-8d9a-d12139acdcae', N'786e1a85-def5-4a2e-a70c-cfc2c0d8b239', 0, CAST(N'2024-11-07T20:31:36.4431086' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'5173e9a7-87ce-4cf8-bd54-1dc2e39e3367', N'87482a50-6425-4411-a6b5-574e8b11c387', N'b4ab63da-81d4-4ea1-8a5a-3c12154fa561', 0, CAST(N'2024-11-07T20:31:36.8876799' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'7ac07707-5e83-4adf-92a9-209db6f9a44a', N'9dcda18f-c78a-4dfe-a8f3-3010459d5787', N'3622e825-11bb-44fd-bc59-ce0c40aa9509', 0, CAST(N'2024-11-07T21:24:42.3901870' AS DateTime2), 14)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'8f270d99-e9c5-4a2d-a346-21acf184a61a', N'4996b1df-3d3a-4057-a5dd-d6c90e183452', N'c702e9e8-111b-4402-8ed0-5f939a7892a6', 0, CAST(N'2024-11-07T20:33:14.3140412' AS DateTime2), 7)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'd2196e1f-0b5d-4fa3-b9f0-237f7b40f27a', N'1849fcbe-2a49-4e3c-8d9a-d12139acdcae', N'ca2c80e4-c9e6-4bc1-a080-1c0505bccaba', 0, CAST(N'2024-11-07T20:31:36.4550274' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'1eff1c20-beb0-4858-bc69-23bf877e969e', N'1849fcbe-2a49-4e3c-8d9a-d12139acdcae', N'35ca5805-aa8f-4dc0-a895-c2bae87a00eb', 0, CAST(N'2024-11-07T20:31:36.4074212' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'b63f306a-a8a2-4d11-aa42-23c011afa0bf', N'fe8e27cb-9f15-4ced-bf8f-fb8c4668d767', N'76f4c106-34b2-4175-a413-f0b67106218f', 0, CAST(N'2024-11-07T20:31:36.0583790' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'fcace1b3-346f-4f0c-a203-23fd587b6faf', N'1849fcbe-2a49-4e3c-8d9a-d12139acdcae', N'31314875-8f03-4874-be17-0f31c14f28ee', 0, CAST(N'2024-11-07T20:31:36.4619630' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'20755104-e28d-4d62-a0db-240fbe580a9d', N'fe8e27cb-9f15-4ced-bf8f-fb8c4668d767', N'ca2c80e4-c9e6-4bc1-a080-1c0505bccaba', 0, CAST(N'2024-11-07T20:31:36.1139380' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'55010393-2dfa-428c-8784-2522a29c2af7', N'1849fcbe-2a49-4e3c-8d9a-d12139acdcae', N'b4ab63da-81d4-4ea1-8a5a-3c12154fa561', 0, CAST(N'2024-11-07T20:31:36.4963482' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'9a0a65fe-8572-4124-b976-25b946329831', N'87482a50-6425-4411-a6b5-574e8b11c387', N'4723cac1-52f7-43bb-8d3f-bfb3b6c28a96', 0, CAST(N'2024-11-07T20:31:36.7880851' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'adee52b8-f734-4562-b88e-28ab09a43559', N'ae628d0d-d84d-4b95-9134-a8a3788af737', N'b9ec64fd-8aac-44db-8541-67b1c6162676', 0, CAST(N'2024-11-07T20:31:36.3036285' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'ee3f472c-567c-41dd-b13f-293a7bf8eb81', N'ae628d0d-d84d-4b95-9134-a8a3788af737', N'e296f2f3-e89c-49b9-b304-b76df59719ae', 0, CAST(N'2024-11-07T20:31:36.3656377' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'62843dd4-31f1-4de3-af79-29b8a11d9f62', N'911b67d7-c6ff-42ba-a710-8cd49cc2141f', N'76f4c106-34b2-4175-a413-f0b67106218f', 0, CAST(N'2024-11-07T20:31:36.6295249' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'c6553517-3f2a-4e71-acf0-2ae1a4d02ded', N'1849fcbe-2a49-4e3c-8d9a-d12139acdcae', N'a7efdc67-aa93-46cb-8410-0ddcfe0d5853', 0, CAST(N'2024-11-07T20:31:36.4364556' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'9fad107f-7416-4f6a-8060-2bb8c0552ff2', N'87482a50-6425-4411-a6b5-574e8b11c387', N'ca2c80e4-c9e6-4bc1-a080-1c0505bccaba', 0, CAST(N'2024-11-07T20:31:36.8369831' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'97d78f2f-2623-4a06-ae11-2cd2a0263ff4', N'9dcda18f-c78a-4dfe-a8f3-3010459d5787', N'79459d60-5db6-48b6-94bf-2121d9839e15', 0, CAST(N'2024-11-07T21:24:42.2999650' AS DateTime2), 2)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'3c10499d-cc65-4efd-b71f-2db94e5aac60', N'87482a50-6425-4411-a6b5-574e8b11c387', N'a7efdc67-aa93-46cb-8410-0ddcfe0d5853', 0, CAST(N'2024-11-07T20:31:36.8115895' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'0e170393-3e56-4068-8e3c-2ddb4349f33f', N'4996b1df-3d3a-4057-a5dd-d6c90e183452', N'76f4c106-34b2-4175-a413-f0b67106218f', 0, CAST(N'2024-11-07T20:33:14.3092864' AS DateTime2), 6)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'16129714-aa0f-49a7-aaf5-2e8142006714', N'ae628d0d-d84d-4b95-9134-a8a3788af737', N'6f0a8890-c105-4fb4-874b-9d559847eca6', 0, CAST(N'2024-11-07T20:31:36.2928542' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'202ed8db-e33c-4396-8dce-2e9a99040b13', N'1849fcbe-2a49-4e3c-8d9a-d12139acdcae', N'b9ec64fd-8aac-44db-8541-67b1c6162676', 0, CAST(N'2024-11-07T20:31:36.4224738' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'791de622-a22e-4700-8079-2f08f85eeea9', N'fe8e27cb-9f15-4ced-bf8f-fb8c4668d767', N'1fb789cf-87b0-43b0-a45e-e85e3891a9ee', 0, CAST(N'2024-11-07T20:31:36.1282205' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'f471171e-ac70-472a-9dee-2f77316c8cc3', N'1849fcbe-2a49-4e3c-8d9a-d12139acdcae', N'ad4a5bce-f3c4-44a7-85c5-fdb1c2d19d12', 0, CAST(N'2024-11-07T20:31:36.4004512' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'2b6eba52-0c37-4e5f-bb2a-312335185d0c', N'db8c58cb-aec0-43f2-8277-d5d04069f7e4', N'79459d60-5db6-48b6-94bf-2121d9839e15', 0, CAST(N'2024-11-07T20:31:36.2544403' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'b21fd6c8-3ade-4027-9fd4-31235bdd6d33', N'db8c58cb-aec0-43f2-8277-d5d04069f7e4', N'bf0b9144-be3b-4213-8f3c-f744035ed4b5', 0, CAST(N'2024-11-07T20:31:36.2216652' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'48dc525c-269c-48f0-b4fd-3203d8c65cda', N'0e3b9ee0-7aa4-458c-8da7-639c72b88494', N'acf13799-4766-4be0-a514-693c0d238f34', 0, CAST(N'2024-11-07T20:31:36.5317619' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'438c679a-c10a-493e-94e0-32f86cc53cab', N'4996b1df-3d3a-4057-a5dd-d6c90e183452', N'ad4a5bce-f3c4-44a7-85c5-fdb1c2d19d12', 0, CAST(N'2024-11-07T20:33:14.3193575' AS DateTime2), 8)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'f960cd68-63fe-462c-ada9-34d4f13243fc', N'ae628d0d-d84d-4b95-9134-a8a3788af737', N'31314875-8f03-4874-be17-0f31c14f28ee', 0, CAST(N'2024-11-07T20:31:36.3491933' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'b16a12d9-b8ef-48d5-a291-34e38b2da91c', N'9dcda18f-c78a-4dfe-a8f3-3010459d5787', N'76f4c106-34b2-4175-a413-f0b67106218f', 0, CAST(N'2024-11-07T21:24:42.3637771' AS DateTime2), 11)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'63018b1f-3e1e-4092-bd03-3506d9b3301b', N'911b67d7-c6ff-42ba-a710-8cd49cc2141f', N'87fedc0d-caae-4890-80d9-a6e086d71a1c', 0, CAST(N'2024-11-07T20:31:36.7479437' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'68e6310e-7f71-4b1c-a9a0-35219bf1e06f', N'0e3b9ee0-7aa4-458c-8da7-639c72b88494', N'bf0b9144-be3b-4213-8f3c-f744035ed4b5', 0, CAST(N'2024-11-07T20:31:36.5659701' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'806e8516-510b-46f4-8df4-36f5da5cea75', N'4996b1df-3d3a-4057-a5dd-d6c90e183452', N'1b68a81a-b654-4896-9195-84abfb081103', 0, CAST(N'2024-11-07T20:33:14.4408565' AS DateTime2), 28)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'a147f755-0665-429d-af5c-37c76bad9611', N'fe8e27cb-9f15-4ced-bf8f-fb8c4668d767', N'1b68a81a-b654-4896-9195-84abfb081103', 0, CAST(N'2024-11-07T20:31:36.1012566' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'6273a2a4-3b11-4062-9de5-385338fa1f5c', N'db8c58cb-aec0-43f2-8277-d5d04069f7e4', N'999d3424-6bad-4d7b-8bd0-2b462b55dd45', 0, CAST(N'2024-11-07T20:31:36.2514982' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'ddaaca96-57e4-4812-8fb8-3c1c17042105', N'fe8e27cb-9f15-4ced-bf8f-fb8c4668d767', N'31314875-8f03-4874-be17-0f31c14f28ee', 0, CAST(N'2024-11-07T20:31:36.1200843' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'6e6a2421-bed2-4bd5-859d-3d710543158d', N'ae628d0d-d84d-4b95-9134-a8a3788af737', N'ca2c80e4-c9e6-4bc1-a080-1c0505bccaba', 0, CAST(N'2024-11-07T20:31:36.3405218' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'c12326af-cc27-4b07-bba4-3dbceac1e0e8', N'ae628d0d-d84d-4b95-9134-a8a3788af737', N'0f8a3810-dc07-47e8-a089-7d6c08107382', 0, CAST(N'2024-11-07T20:31:36.3627271' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'46beba59-524e-4719-94be-3f1f33eb2557', N'1849fcbe-2a49-4e3c-8d9a-d12139acdcae', N'f4c06feb-eb3d-4f75-95f9-10c0289de995', 0, CAST(N'2024-11-07T20:31:36.4333548' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'a648d5ed-805a-4acb-b0e3-3ff6f0fa3442', N'db8c58cb-aec0-43f2-8277-d5d04069f7e4', N'da5e3dff-a649-4508-943d-0ecc32d4f7fc', 0, CAST(N'2024-11-07T20:31:36.2346695' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'06981f98-e641-4ff0-9256-41711c4b3777', N'db8c58cb-aec0-43f2-8277-d5d04069f7e4', N'4723cac1-52f7-43bb-8d3f-bfb3b6c28a96', 0, CAST(N'2024-11-07T20:31:36.1824566' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'f8a43314-bed4-4986-8895-417472f49390', N'0e3b9ee0-7aa4-458c-8da7-639c72b88494', N'f4c06feb-eb3d-4f75-95f9-10c0289de995', 0, CAST(N'2024-11-07T20:31:36.5457083' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'21ed6877-a8da-43cd-ba5d-41ad87f45d13', N'4996b1df-3d3a-4057-a5dd-d6c90e183452', N'acf13799-4766-4be0-a514-693c0d238f34', 0, CAST(N'2024-11-07T20:33:14.4115400' AS DateTime2), 23)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'0f1e19cb-ca03-49bb-9fcd-41c528d7e4e0', N'0e3b9ee0-7aa4-458c-8da7-639c72b88494', N'1fb789cf-87b0-43b0-a45e-e85e3891a9ee', 0, CAST(N'2024-11-07T20:31:36.5925360' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'1f655b45-8555-4aec-b4c0-42a612e61b56', N'0e3b9ee0-7aa4-458c-8da7-639c72b88494', N'b9ec64fd-8aac-44db-8541-67b1c6162676', 0, CAST(N'2024-11-07T20:31:36.5354199' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'05d3cd96-9281-4350-854b-433828b10162', N'ae628d0d-d84d-4b95-9134-a8a3788af737', N'1fb789cf-87b0-43b0-a45e-e85e3891a9ee', 0, CAST(N'2024-11-07T20:31:36.3589522' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'20efc376-17cf-4671-a927-440d5aa74467', N'0e3b9ee0-7aa4-458c-8da7-639c72b88494', N'efbe3ff8-a8cb-408b-b2de-f0cdc5f03d55', 0, CAST(N'2024-11-07T20:31:36.5066470' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'bff56cf6-4834-465a-9989-4475c047bac8', N'db8c58cb-aec0-43f2-8277-d5d04069f7e4', N'0f8a3810-dc07-47e8-a089-7d6c08107382', 0, CAST(N'2024-11-07T20:31:36.2406778' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'04465aef-eded-4d15-a1f3-4673d30b1991', N'87482a50-6425-4411-a6b5-574e8b11c387', N'acf13799-4766-4be0-a514-693c0d238f34', 0, CAST(N'2024-11-07T20:31:36.7913657' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'17aff5e5-b157-42e6-a0a5-46ee434ea42f', N'ae628d0d-d84d-4b95-9134-a8a3788af737', N'f4c06feb-eb3d-4f75-95f9-10c0289de995', 0, CAST(N'2024-11-07T20:31:36.3159436' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'18ccb3aa-8cc4-4334-be4b-47fe288346fc', N'87482a50-6425-4411-a6b5-574e8b11c387', N'bf0b9144-be3b-4213-8f3c-f744035ed4b5', 0, CAST(N'2024-11-07T20:31:36.8310765' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'd510b0d2-0da8-4344-bed4-47ffb985be57', N'1849fcbe-2a49-4e3c-8d9a-d12139acdcae', N'4723cac1-52f7-43bb-8d3f-bfb3b6c28a96', 0, CAST(N'2024-11-07T20:31:36.4145070' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'f5759d9a-0103-459c-93e9-4a3763e188e1', N'1849fcbe-2a49-4e3c-8d9a-d12139acdcae', N'6f0a8890-c105-4fb4-874b-9d559847eca6', 0, CAST(N'2024-11-07T20:31:36.4112733' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'5c589d70-e9f4-4eb2-b7b3-4b0c4c788931', N'db8c58cb-aec0-43f2-8277-d5d04069f7e4', N'786e1a85-def5-4a2e-a70c-cfc2c0d8b239', 0, CAST(N'2024-11-07T20:31:36.2141056' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'29e420b3-6891-4feb-a636-4b21d827f466', N'4996b1df-3d3a-4057-a5dd-d6c90e183452', N'35ca5805-aa8f-4dc0-a895-c2bae87a00eb', 0, CAST(N'2024-11-07T20:33:14.4230380' AS DateTime2), 25)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'53ec52ae-9494-4eea-a5b3-4bb710e02d77', N'4996b1df-3d3a-4057-a5dd-d6c90e183452', N'a7efdc67-aa93-46cb-8410-0ddcfe0d5853', 0, CAST(N'2024-11-07T20:33:14.4460752' AS DateTime2), 29)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'5d65c522-64f7-4613-ade4-4c993f4d2f7f', N'ae628d0d-d84d-4b95-9134-a8a3788af737', N'786e1a85-def5-4a2e-a70c-cfc2c0d8b239', 0, CAST(N'2024-11-07T20:31:36.3273640' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'3be2ba44-5022-48aa-8d76-4daf92c022cd', N'911b67d7-c6ff-42ba-a710-8cd49cc2141f', N'efbe3ff8-a8cb-408b-b2de-f0cdc5f03d55', 0, CAST(N'2024-11-07T20:31:36.6395397' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'd15d4a07-491e-4ff2-b007-4ea377d3a587', N'9dcda18f-c78a-4dfe-a8f3-3010459d5787', N'da5e3dff-a649-4508-943d-0ecc32d4f7fc', 0, CAST(N'2024-11-07T21:24:42.4114192' AS DateTime2), 17)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'7e8c8530-68df-4100-a01e-500fdc869c49', N'ae628d0d-d84d-4b95-9134-a8a3788af737', N'4723cac1-52f7-43bb-8d3f-bfb3b6c28a96', 0, CAST(N'2024-11-07T20:31:36.2964717' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'85a1fc90-6489-42d2-9b78-518153213a16', N'ae628d0d-d84d-4b95-9134-a8a3788af737', N'acf13799-4766-4be0-a514-693c0d238f34', 0, CAST(N'2024-11-07T20:31:36.3006886' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'f258d347-2085-4bd4-b715-524810bb16b0', N'911b67d7-c6ff-42ba-a710-8cd49cc2141f', N'bf0b9144-be3b-4213-8f3c-f744035ed4b5', 0, CAST(N'2024-11-07T20:31:36.7035076' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'5ff3b933-2463-4388-8bdf-52cb10b3ae29', N'911b67d7-c6ff-42ba-a710-8cd49cc2141f', N'4723cac1-52f7-43bb-8d3f-bfb3b6c28a96', 0, CAST(N'2024-11-07T20:31:36.6647173' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'3c41b11c-4249-4bbf-a6fd-52e72ac234ea', N'fe8e27cb-9f15-4ced-bf8f-fb8c4668d767', N'acf13799-4766-4be0-a514-693c0d238f34', 0, CAST(N'2024-11-07T20:31:36.0837576' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'033c7f37-c901-46dc-abf4-52ec31255986', N'911b67d7-c6ff-42ba-a710-8cd49cc2141f', N'51ef79d2-b47e-41f1-a99d-f5c0e4f4416e', 0, CAST(N'2024-11-07T20:31:36.6994418' AS DateTime2), 1)
GO
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'bd715e52-425c-4d91-8138-53388832f96f', N'4996b1df-3d3a-4057-a5dd-d6c90e183452', N'e6d88410-17f4-479b-8e2d-8b6d5c0324a7', 0, CAST(N'2024-11-07T20:33:14.4355805' AS DateTime2), 27)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'd8be9e2b-1824-4a68-8588-53e01e227200', N'1849fcbe-2a49-4e3c-8d9a-d12139acdcae', N'c702e9e8-111b-4402-8ed0-5f939a7892a6', 0, CAST(N'2024-11-07T20:31:36.3901255' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'ee7e81a2-cca3-4cad-bd20-54198647b17f', N'ae628d0d-d84d-4b95-9134-a8a3788af737', N'3c69d1e2-9204-431f-863f-a4ba07f3ac1d', 0, CAST(N'2024-11-07T20:31:36.2857329' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'814c37bc-0ad0-42f4-b20e-548f11929444', N'1849fcbe-2a49-4e3c-8d9a-d12139acdcae', N'8b678550-a782-4ed9-a61f-15887cf5a73e', 0, CAST(N'2024-11-07T20:31:36.4813498' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'f3a23992-1bbb-4083-a992-57129c457c77', N'4996b1df-3d3a-4057-a5dd-d6c90e183452', N'1fb789cf-87b0-43b0-a45e-e85e3891a9ee', 0, CAST(N'2024-11-07T20:33:14.3685465' AS DateTime2), 17)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'dafec308-92ee-42b7-a3e9-577169af1707', N'db8c58cb-aec0-43f2-8277-d5d04069f7e4', N'3c69d1e2-9204-431f-863f-a4ba07f3ac1d', 0, CAST(N'2024-11-07T20:31:36.1719116' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'09048cef-0b81-40fa-aee2-58698642c50f', N'0e3b9ee0-7aa4-458c-8da7-639c72b88494', N'3c69d1e2-9204-431f-863f-a4ba07f3ac1d', 0, CAST(N'2024-11-07T20:31:36.5177116' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'6ef7aa32-234f-4ce8-b9b0-58da214c4020', N'1849fcbe-2a49-4e3c-8d9a-d12139acdcae', N'3c69d1e2-9204-431f-863f-a4ba07f3ac1d', 0, CAST(N'2024-11-07T20:31:36.4044621' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'255a7187-812f-43cf-bd60-59dcffc2e9fc', N'0e3b9ee0-7aa4-458c-8da7-639c72b88494', N'4723cac1-52f7-43bb-8d3f-bfb3b6c28a96', 0, CAST(N'2024-11-07T20:31:36.5284966' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'4caf5a29-7431-47ee-bf64-5dc42873f619', N'0e3b9ee0-7aa4-458c-8da7-639c72b88494', N'1b68a81a-b654-4896-9195-84abfb081103', 0, CAST(N'2024-11-07T20:31:36.5526972' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'e03c89f3-9d39-45ae-bcd0-5fac683a6295', N'9dcda18f-c78a-4dfe-a8f3-3010459d5787', N'0f8a3810-dc07-47e8-a089-7d6c08107382', 0, CAST(N'2024-11-07T21:24:42.4167609' AS DateTime2), 18)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'c90e8a9f-4e7c-498b-8341-5fc85b3532bb', N'87482a50-6425-4411-a6b5-574e8b11c387', N'76f4c106-34b2-4175-a413-f0b67106218f', 0, CAST(N'2024-11-07T20:31:36.7568180' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'ddb3c62d-c91c-46d2-8a12-605d7f7c22d4', N'87482a50-6425-4411-a6b5-574e8b11c387', N'e296f2f3-e89c-49b9-b304-b76df59719ae', 0, CAST(N'2024-11-07T20:31:36.8660177' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'08252f54-3226-4c98-b663-608861646214', N'4996b1df-3d3a-4057-a5dd-d6c90e183452', N'8b678550-a782-4ed9-a61f-15887cf5a73e', 0, CAST(N'2024-11-07T20:33:14.0685613' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'b494df98-3c1c-4b95-b51a-617038121333', N'fe8e27cb-9f15-4ced-bf8f-fb8c4668d767', N'e296f2f3-e89c-49b9-b304-b76df59719ae', 0, CAST(N'2024-11-07T20:31:36.1361789' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'2c9ec565-9f86-41ed-a87b-62c344b20632', N'911b67d7-c6ff-42ba-a710-8cd49cc2141f', N'ca2c80e4-c9e6-4bc1-a080-1c0505bccaba', 0, CAST(N'2024-11-07T20:31:36.7074171' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'288ce151-0ee2-4a3a-b2ba-63fdd62b2f7c', N'9dcda18f-c78a-4dfe-a8f3-3010459d5787', N'c702e9e8-111b-4402-8ed0-5f939a7892a6', 0, CAST(N'2024-11-07T21:24:42.3734288' AS DateTime2), 12)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'5f80ae49-de64-4f21-9549-643d5d8f1b70', N'87482a50-6425-4411-a6b5-574e8b11c387', N'999d3424-6bad-4d7b-8bd0-2b462b55dd45', 0, CAST(N'2024-11-07T20:31:36.8754982' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'2a5b458c-aec5-40a0-bf99-64aed5652c5c', N'4996b1df-3d3a-4057-a5dd-d6c90e183452', N'6f0a8890-c105-4fb4-874b-9d559847eca6', 0, CAST(N'2024-11-07T20:33:14.4284241' AS DateTime2), 26)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'3c94bad9-c0fb-4d0b-bd1c-64e300fdc4c8', N'fe8e27cb-9f15-4ced-bf8f-fb8c4668d767', N'da5e3dff-a649-4508-943d-0ecc32d4f7fc', 0, CAST(N'2024-11-07T20:31:36.1226927' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'4f6327c3-822d-4282-828c-65f18b4633cc', N'87482a50-6425-4411-a6b5-574e8b11c387', N'1b68a81a-b654-4896-9195-84abfb081103', 0, CAST(N'2024-11-07T20:31:36.8166217' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'6df7ea52-f536-44a4-a805-6652a61d7835', N'ae628d0d-d84d-4b95-9134-a8a3788af737', N'c702e9e8-111b-4402-8ed0-5f939a7892a6', 0, CAST(N'2024-11-07T20:31:36.2703313' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'4b13c345-b608-4b03-9463-6661a845696d', N'1849fcbe-2a49-4e3c-8d9a-d12139acdcae', N'79459d60-5db6-48b6-94bf-2121d9839e15', 0, CAST(N'2024-11-07T20:31:36.4883683' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'0dab53aa-7752-4b6b-8aab-667951377f7e', N'fe8e27cb-9f15-4ced-bf8f-fb8c4668d767', N'ad4a5bce-f3c4-44a7-85c5-fdb1c2d19d12', 0, CAST(N'2024-11-07T20:31:36.0701445' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'a5f28031-d56f-469d-8019-66d1a80db550', N'0e3b9ee0-7aa4-458c-8da7-639c72b88494', N'da5e3dff-a649-4508-943d-0ecc32d4f7fc', 0, CAST(N'2024-11-07T20:31:36.5865363' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'dd6fbbb2-bb17-40ae-ad69-679fc1668368', N'1849fcbe-2a49-4e3c-8d9a-d12139acdcae', N'fb40ad8f-098f-4fd1-8870-c05d1d25fae2', 0, CAST(N'2024-11-07T20:31:36.4291264' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'94d572a0-133b-4f69-a7ad-688bb5032dcd', N'1849fcbe-2a49-4e3c-8d9a-d12139acdcae', N'76f4c106-34b2-4175-a413-f0b67106218f', 0, CAST(N'2024-11-07T20:31:36.3863791' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'07e876ab-954a-4346-a090-68e33969c1f1', N'9dcda18f-c78a-4dfe-a8f3-3010459d5787', N'efbe3ff8-a8cb-408b-b2de-f0cdc5f03d55', 0, CAST(N'2024-11-07T21:24:42.3830292' AS DateTime2), 13)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'540ea168-f1dd-46cc-8274-69311cb7f4d6', N'0e3b9ee0-7aa4-458c-8da7-639c72b88494', N'b4ab63da-81d4-4ea1-8a5a-3c12154fa561', 0, CAST(N'2024-11-07T20:31:36.6251382' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'1e349071-3910-4905-a401-694696603d14', N'9dcda18f-c78a-4dfe-a8f3-3010459d5787', N'786e1a85-def5-4a2e-a70c-cfc2c0d8b239', 0, CAST(N'2024-11-07T21:24:42.3288440' AS DateTime2), 6)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'172acd3e-5357-44ae-9918-695622b20bad', N'87482a50-6425-4411-a6b5-574e8b11c387', N'51ef79d2-b47e-41f1-a99d-f5c0e4f4416e', 0, CAST(N'2024-11-07T20:31:36.8266942' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'6606d368-6796-41cb-bcea-69916d5dbb4b', N'1849fcbe-2a49-4e3c-8d9a-d12139acdcae', N'1fb789cf-87b0-43b0-a45e-e85e3891a9ee', 0, CAST(N'2024-11-07T20:31:36.4694029' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'3982450f-7aad-4bf1-9f7b-6a3155b912c4', N'0e3b9ee0-7aa4-458c-8da7-639c72b88494', N'999d3424-6bad-4d7b-8bd0-2b462b55dd45', 0, CAST(N'2024-11-07T20:31:36.6128232' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'618a7905-6435-49f0-bc30-6a7392e52c66', N'db8c58cb-aec0-43f2-8277-d5d04069f7e4', N'51ef79d2-b47e-41f1-a99d-f5c0e4f4416e', 0, CAST(N'2024-11-07T20:31:36.2188087' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'e38814d1-12cb-409c-af03-6aa083505809', N'9dcda18f-c78a-4dfe-a8f3-3010459d5787', N'f4c06feb-eb3d-4f75-95f9-10c0289de995', 0, CAST(N'2024-11-07T21:24:42.4451155' AS DateTime2), 23)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'de5d4317-d44a-4e43-a4aa-6ac8c136c21d', N'911b67d7-c6ff-42ba-a710-8cd49cc2141f', N'e296f2f3-e89c-49b9-b304-b76df59719ae', 0, CAST(N'2024-11-07T20:31:36.7308903' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'47b81205-08a2-4ead-b57a-6b129c3deaa3', N'0e3b9ee0-7aa4-458c-8da7-639c72b88494', N'76f4c106-34b2-4175-a413-f0b67106218f', 0, CAST(N'2024-11-07T20:31:36.4995902' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'79e89f22-2e33-46be-80d3-6b437790f64b', N'911b67d7-c6ff-42ba-a710-8cd49cc2141f', N'786e1a85-def5-4a2e-a70c-cfc2c0d8b239', 0, CAST(N'2024-11-07T20:31:36.6965015' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'1b7a3e7e-d203-42d5-943e-6bc9f6481390', N'9dcda18f-c78a-4dfe-a8f3-3010459d5787', N'acf13799-4766-4be0-a514-693c0d238f34', 0, CAST(N'2024-11-07T21:24:42.4714980' AS DateTime2), 28)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'cf2c281c-41c0-4637-a617-6be89937b912', N'9dcda18f-c78a-4dfe-a8f3-3010459d5787', N'1fb789cf-87b0-43b0-a45e-e85e3891a9ee', 0, CAST(N'2024-11-07T21:24:42.4220327' AS DateTime2), 19)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'757d70d2-bfe3-4379-82c3-6c82be6fa13d', N'911b67d7-c6ff-42ba-a710-8cd49cc2141f', N'acf13799-4766-4be0-a514-693c0d238f34', 0, CAST(N'2024-11-07T20:31:36.6690423' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'001803b9-e6bc-44d3-97eb-6d07f198af4c', N'9dcda18f-c78a-4dfe-a8f3-3010459d5787', N'3a9ab36e-b834-4a20-ba32-a0d34fdc47da', 0, CAST(N'2024-11-07T21:24:42.3582352' AS DateTime2), 10)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'c67fb2e5-5b22-4018-a6c3-6e1956b01f9e', N'4996b1df-3d3a-4057-a5dd-d6c90e183452', N'fb40ad8f-098f-4fd1-8870-c05d1d25fae2', 0, CAST(N'2024-11-07T20:33:14.4512836' AS DateTime2), 30)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'ee880695-8bca-4f51-8084-6eaabbe00ce8', N'4996b1df-3d3a-4057-a5dd-d6c90e183452', N'51ef79d2-b47e-41f1-a99d-f5c0e4f4416e', 0, CAST(N'2024-11-07T20:33:14.3516230' AS DateTime2), 14)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'f6fb3b2f-620c-42b8-98ed-6edcbf354231', N'911b67d7-c6ff-42ba-a710-8cd49cc2141f', N'6f0a8890-c105-4fb4-874b-9d559847eca6', 0, CAST(N'2024-11-07T20:31:36.6608688' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'481153aa-c0d3-4f98-9f59-6ef3aefd4187', N'9dcda18f-c78a-4dfe-a8f3-3010459d5787', N'bf0b9144-be3b-4213-8f3c-f744035ed4b5', 0, CAST(N'2024-11-07T21:24:42.3344538' AS DateTime2), 7)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'395e3754-1d0b-41bb-92dd-71879cf7b9bd', N'911b67d7-c6ff-42ba-a710-8cd49cc2141f', N'35ca5805-aa8f-4dc0-a895-c2bae87a00eb', 0, CAST(N'2024-11-07T20:31:36.6566628' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'08bbf9a0-bd38-4769-be16-754b6ac56116', N'ae628d0d-d84d-4b95-9134-a8a3788af737', N'bf0b9144-be3b-4213-8f3c-f744035ed4b5', 0, CAST(N'2024-11-07T20:31:36.3365345' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'11a900b6-a58c-4569-966f-7708ff19b10b', N'fe8e27cb-9f15-4ced-bf8f-fb8c4668d767', N'8b678550-a782-4ed9-a61f-15887cf5a73e', 0, CAST(N'2024-11-07T20:31:36.1413079' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'85b93ef3-330f-432b-8128-7731da1f4f39', N'9dcda18f-c78a-4dfe-a8f3-3010459d5787', N'8b678550-a782-4ed9-a61f-15887cf5a73e', 0, CAST(N'2024-11-07T21:24:42.2891220' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'2efa17f1-b56e-4107-b3fe-78753982b9f8', N'db8c58cb-aec0-43f2-8277-d5d04069f7e4', N'ca2c80e4-c9e6-4bc1-a080-1c0505bccaba', 0, CAST(N'2024-11-07T20:31:36.2256008' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'48272393-ece1-40ac-a034-78fec45ca0d0', N'9dcda18f-c78a-4dfe-a8f3-3010459d5787', N'b9ec64fd-8aac-44db-8541-67b1c6162676', 0, CAST(N'2024-11-07T21:24:42.4775504' AS DateTime2), 29)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'e7d36bb1-49da-4007-960d-79af010d7387', N'fe8e27cb-9f15-4ced-bf8f-fb8c4668d767', N'e6d88410-17f4-479b-8e2d-8b6d5c0324a7', 0, CAST(N'2024-11-07T20:31:36.0892077' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'b2fb06f9-91c6-4ff5-9d61-7b86b4c672f3', N'4996b1df-3d3a-4057-a5dd-d6c90e183452', N'79459d60-5db6-48b6-94bf-2121d9839e15', 0, CAST(N'2024-11-07T20:33:14.2872917' AS DateTime2), 2)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'979cbeb9-156f-4df3-860b-7cb3e2f7ea87', N'db8c58cb-aec0-43f2-8277-d5d04069f7e4', N'c702e9e8-111b-4402-8ed0-5f939a7892a6', 0, CAST(N'2024-11-07T20:31:36.1600574' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'be166248-bfaf-47af-a0d2-7f7eb3919d23', N'0e3b9ee0-7aa4-458c-8da7-639c72b88494', N'ad4a5bce-f3c4-44a7-85c5-fdb1c2d19d12', 0, CAST(N'2024-11-07T20:31:36.5137379' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'd02bf0a9-7815-4a90-b7d0-7ff86e59a84e', N'4996b1df-3d3a-4057-a5dd-d6c90e183452', N'efbe3ff8-a8cb-408b-b2de-f0cdc5f03d55', 0, CAST(N'2024-11-07T20:33:14.3247362' AS DateTime2), 9)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'48398450-235e-4968-8f28-813ea42e4ab9', N'ae628d0d-d84d-4b95-9134-a8a3788af737', N'79459d60-5db6-48b6-94bf-2121d9839e15', 0, CAST(N'2024-11-07T20:31:36.3760688' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'7e52caa9-051a-4c19-90f5-814dfbc5104b', N'1849fcbe-2a49-4e3c-8d9a-d12139acdcae', N'efbe3ff8-a8cb-408b-b2de-f0cdc5f03d55', 0, CAST(N'2024-11-07T20:31:36.3930810' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'1d65828c-f425-45d7-bc9a-83d43d0f08e2', N'ae628d0d-d84d-4b95-9134-a8a3788af737', N'da5e3dff-a649-4508-943d-0ecc32d4f7fc', 0, CAST(N'2024-11-07T20:31:36.3529570' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'6c74f570-db87-4258-b422-84c494c9bce3', N'0e3b9ee0-7aa4-458c-8da7-639c72b88494', N'a7efdc67-aa93-46cb-8410-0ddcfe0d5853', 0, CAST(N'2024-11-07T20:31:36.5493586' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'6a0581ed-bf15-4916-b248-84f4307f4169', N'ae628d0d-d84d-4b95-9134-a8a3788af737', N'35ca5805-aa8f-4dc0-a895-c2bae87a00eb', 0, CAST(N'2024-11-07T20:31:36.2891262' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'b7921e65-8694-45f3-ad99-854680dc070e', N'0e3b9ee0-7aa4-458c-8da7-639c72b88494', N'87fedc0d-caae-4890-80d9-a6e086d71a1c', 0, CAST(N'2024-11-07T20:31:36.6212952' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'4a240bad-e51d-4eb4-b1db-864db5e6e9f7', N'fe8e27cb-9f15-4ced-bf8f-fb8c4668d767', N'3c69d1e2-9204-431f-863f-a4ba07f3ac1d', 0, CAST(N'2024-11-07T20:31:36.0726468' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'b36cd381-ee4e-4ae7-9f96-86d3c10d4c63', N'ae628d0d-d84d-4b95-9134-a8a3788af737', N'1b68a81a-b654-4896-9195-84abfb081103', 0, CAST(N'2024-11-07T20:31:36.3225550' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'c0f6049a-b972-42d1-bff9-870a87548fd2', N'911b67d7-c6ff-42ba-a710-8cd49cc2141f', N'da5e3dff-a649-4508-943d-0ecc32d4f7fc', 0, CAST(N'2024-11-07T20:31:36.7190560' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'62d51487-92f7-4a87-ab77-882ed5c6f818', N'9dcda18f-c78a-4dfe-a8f3-3010459d5787', N'b4ab63da-81d4-4ea1-8a5a-3c12154fa561', 0, CAST(N'2024-11-07T21:24:42.3129959' AS DateTime2), 3)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'd59328a2-998b-48d8-9273-89d21545f26d', N'911b67d7-c6ff-42ba-a710-8cd49cc2141f', N'a7efdc67-aa93-46cb-8410-0ddcfe0d5853', 0, CAST(N'2024-11-07T20:31:36.6887983' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'a853094b-b42c-487d-a726-8a9b5c4dc91b', N'fe8e27cb-9f15-4ced-bf8f-fb8c4668d767', N'786e1a85-def5-4a2e-a70c-cfc2c0d8b239', 0, CAST(N'2024-11-07T20:31:36.1041258' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'102a6e34-2520-4b9b-a7a7-8b081a9d7cb1', N'9dcda18f-c78a-4dfe-a8f3-3010459d5787', N'fb40ad8f-098f-4fd1-8870-c05d1d25fae2', 0, CAST(N'2024-11-07T21:24:42.4497897' AS DateTime2), 24)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'431f1597-8f23-417c-9a39-8e9e96871ed0', N'fe8e27cb-9f15-4ced-bf8f-fb8c4668d767', N'efbe3ff8-a8cb-408b-b2de-f0cdc5f03d55', 0, CAST(N'2024-11-07T20:31:36.0637156' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'0b539f09-f84c-4784-9d3e-8ff512a97db2', N'db8c58cb-aec0-43f2-8277-d5d04069f7e4', N'efbe3ff8-a8cb-408b-b2de-f0cdc5f03d55', 0, CAST(N'2024-11-07T20:31:36.1629870' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'10e81c71-f244-4ab8-bf4d-9199f7199a8d', N'1849fcbe-2a49-4e3c-8d9a-d12139acdcae', N'0f8a3810-dc07-47e8-a089-7d6c08107382', 0, CAST(N'2024-11-07T20:31:36.4730782' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'9070e0d6-8ba0-42ec-bb6d-923643e19c31', N'fe8e27cb-9f15-4ced-bf8f-fb8c4668d767', N'b9ec64fd-8aac-44db-8541-67b1c6162676', 0, CAST(N'2024-11-07T20:31:36.0864641' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'49b83b43-be0c-47fe-a232-92623fd6bb92', N'4996b1df-3d3a-4057-a5dd-d6c90e183452', N'b9ec64fd-8aac-44db-8541-67b1c6162676', 0, CAST(N'2024-11-07T20:33:14.4178062' AS DateTime2), 24)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'0242dbce-37e8-456f-8963-92b530dbb342', N'ae628d0d-d84d-4b95-9134-a8a3788af737', N'999d3424-6bad-4d7b-8bd0-2b462b55dd45', 0, CAST(N'2024-11-07T20:31:36.3723462' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'0721d906-0c9c-42e4-a02e-92f3115ad006', N'9dcda18f-c78a-4dfe-a8f3-3010459d5787', N'e296f2f3-e89c-49b9-b304-b76df59719ae', 0, CAST(N'2024-11-07T21:24:42.4272543' AS DateTime2), 20)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'5f5b7c5f-d36a-4595-8c70-939607892c76', N'9dcda18f-c78a-4dfe-a8f3-3010459d5787', N'ad4a5bce-f3c4-44a7-85c5-fdb1c2d19d12', 0, CAST(N'2024-11-07T21:24:42.3975788' AS DateTime2), 15)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'9d870af7-ae5c-4604-ae79-94f363aa5680', N'0e3b9ee0-7aa4-458c-8da7-639c72b88494', N'ca2c80e4-c9e6-4bc1-a080-1c0505bccaba', 0, CAST(N'2024-11-07T20:31:36.5715561' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'cb425a85-4250-4ef3-a636-96880882a021', N'db8c58cb-aec0-43f2-8277-d5d04069f7e4', N'e6d88410-17f4-479b-8e2d-8b6d5c0324a7', 0, CAST(N'2024-11-07T20:31:36.1957176' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'0e8f0428-2d13-47ea-93fc-96b1702affb2', N'911b67d7-c6ff-42ba-a710-8cd49cc2141f', N'31314875-8f03-4874-be17-0f31c14f28ee', 0, CAST(N'2024-11-07T20:31:36.7151448' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'176c9d17-0237-435f-b392-9716633bcea1', N'4996b1df-3d3a-4057-a5dd-d6c90e183452', N'87fedc0d-caae-4890-80d9-a6e086d71a1c', 0, CAST(N'2024-11-07T20:33:14.2937193' AS DateTime2), 3)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'c693b476-5a09-4733-9079-97ad451a5bdb', N'911b67d7-c6ff-42ba-a710-8cd49cc2141f', N'b9ec64fd-8aac-44db-8541-67b1c6162676', 0, CAST(N'2024-11-07T20:31:36.6728525' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'd242e3c9-276f-44b5-aa33-97f56fb1f53e', N'911b67d7-c6ff-42ba-a710-8cd49cc2141f', N'3622e825-11bb-44fd-bc59-ce0c40aa9509', 0, CAST(N'2024-11-07T20:31:36.6436458' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'57e8a9fe-09fb-4f23-b343-9a030557a7c0', N'87482a50-6425-4411-a6b5-574e8b11c387', N'87fedc0d-caae-4890-80d9-a6e086d71a1c', 0, CAST(N'2024-11-07T20:31:36.8841554' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'794c6033-c4a5-4ee5-866d-9b6b2becac27', N'4996b1df-3d3a-4057-a5dd-d6c90e183452', N'3622e825-11bb-44fd-bc59-ce0c40aa9509', 0, CAST(N'2024-11-07T20:33:14.3304820' AS DateTime2), 10)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'63726e39-0cdb-4f71-a60e-9e15f320f1d1', N'ae628d0d-d84d-4b95-9134-a8a3788af737', N'ad4a5bce-f3c4-44a7-85c5-fdb1c2d19d12', 0, CAST(N'2024-11-07T20:31:36.2818028' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'a680024d-0fa4-40d9-854e-9e38787f6ded', N'0e3b9ee0-7aa4-458c-8da7-639c72b88494', N'786e1a85-def5-4a2e-a70c-cfc2c0d8b239', 0, CAST(N'2024-11-07T20:31:36.5578006' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'f4defdf0-36bb-464b-a2b0-9f6c37beb20b', N'9dcda18f-c78a-4dfe-a8f3-3010459d5787', N'e6d88410-17f4-479b-8e2d-8b6d5c0324a7', 0, CAST(N'2024-11-07T21:24:42.4395313' AS DateTime2), 22)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'178c9cb6-866e-4a8a-b462-a2900d9e9a09', N'db8c58cb-aec0-43f2-8277-d5d04069f7e4', N'b9ec64fd-8aac-44db-8541-67b1c6162676', 0, CAST(N'2024-11-07T20:31:36.1912705' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'494cd730-09c2-4e55-8e2e-a48fe59f3796', N'87482a50-6425-4411-a6b5-574e8b11c387', N'f4c06feb-eb3d-4f75-95f9-10c0289de995', 0, CAST(N'2024-11-07T20:31:36.8077918' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'2ddff3dd-d627-48a1-bb39-a50b3b375797', N'87482a50-6425-4411-a6b5-574e8b11c387', N'31314875-8f03-4874-be17-0f31c14f28ee', 0, CAST(N'2024-11-07T20:31:36.8466538' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'2721e9a1-5d69-453b-a608-a5673c2204c6', N'4996b1df-3d3a-4057-a5dd-d6c90e183452', N'da5e3dff-a649-4508-943d-0ecc32d4f7fc', 0, CAST(N'2024-11-07T20:33:14.3729430' AS DateTime2), 18)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'ba5f99c6-298a-4693-bce8-a5f65b6da3e3', N'87482a50-6425-4411-a6b5-574e8b11c387', N'79459d60-5db6-48b6-94bf-2121d9839e15', 0, CAST(N'2024-11-07T20:31:36.8796070' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'aae7891c-f77d-4e9d-979d-a798e209b4f9', N'1849fcbe-2a49-4e3c-8d9a-d12139acdcae', N'3a9ab36e-b834-4a20-ba32-a0d34fdc47da', 0, CAST(N'2024-11-07T20:31:36.4585905' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'227cb386-7cdc-44da-837b-a7af59433c85', N'0e3b9ee0-7aa4-458c-8da7-639c72b88494', N'e6d88410-17f4-479b-8e2d-8b6d5c0324a7', 0, CAST(N'2024-11-07T20:31:36.5386203' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'dd34d257-3fe3-4d5c-8d87-a84f7b0ebf2f', N'0e3b9ee0-7aa4-458c-8da7-639c72b88494', N'3a9ab36e-b834-4a20-ba32-a0d34fdc47da', 0, CAST(N'2024-11-07T20:31:36.5768917' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'9ff97b10-2ce1-4920-879f-a8b951dbe6da', N'fe8e27cb-9f15-4ced-bf8f-fb8c4668d767', N'79459d60-5db6-48b6-94bf-2121d9839e15', 0, CAST(N'2024-11-07T20:31:36.1479037' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'e85472ed-6b9a-4ecb-b14c-aa37ed0dd29f', N'9dcda18f-c78a-4dfe-a8f3-3010459d5787', N'3c69d1e2-9204-431f-863f-a4ba07f3ac1d', 0, CAST(N'2024-11-07T21:24:42.4324184' AS DateTime2), 21)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'067b0951-6128-4e72-b745-aa396be3012c', N'9dcda18f-c78a-4dfe-a8f3-3010459d5787', N'6f0a8890-c105-4fb4-874b-9d559847eca6', 0, CAST(N'2024-11-07T21:24:42.4898837' AS DateTime2), 31)
GO
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'18e7a5db-9fc5-4a11-b126-b1a2fbeb87e4', N'9dcda18f-c78a-4dfe-a8f3-3010459d5787', N'a7efdc67-aa93-46cb-8410-0ddcfe0d5853', 0, CAST(N'2024-11-07T21:24:42.4538953' AS DateTime2), 25)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'bd8d3af5-169d-4ce1-ab89-b21df669e9d9', N'87482a50-6425-4411-a6b5-574e8b11c387', N'efbe3ff8-a8cb-408b-b2de-f0cdc5f03d55', 0, CAST(N'2024-11-07T20:31:36.7645844' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'e1eb07f7-e0bb-46b7-bd59-b320b24688ea', N'0e3b9ee0-7aa4-458c-8da7-639c72b88494', N'31314875-8f03-4874-be17-0f31c14f28ee', 0, CAST(N'2024-11-07T20:31:36.5812733' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'0ac18aee-5eb0-4157-bdce-b336edc39735', N'9dcda18f-c78a-4dfe-a8f3-3010459d5787', N'87fedc0d-caae-4890-80d9-a6e086d71a1c', 0, CAST(N'2024-11-07T21:24:42.3188497' AS DateTime2), 4)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'9d3621f4-c173-46fb-8b9b-b38b5e6c6b10', N'fe8e27cb-9f15-4ced-bf8f-fb8c4668d767', N'51ef79d2-b47e-41f1-a99d-f5c0e4f4416e', 0, CAST(N'2024-11-07T20:31:36.1071306' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'f986f7a2-5bc2-4df9-ad3a-b64bf8331360', N'db8c58cb-aec0-43f2-8277-d5d04069f7e4', N'f4c06feb-eb3d-4f75-95f9-10c0289de995', 0, CAST(N'2024-11-07T20:31:36.2038804' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'bd91a2cf-0631-4b5b-be75-b65242f806d8', N'911b67d7-c6ff-42ba-a710-8cd49cc2141f', N'b4ab63da-81d4-4ea1-8a5a-3c12154fa561', 0, CAST(N'2024-11-07T20:31:36.7527223' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'77b5f444-c3c4-4978-8f81-b720ebf435bc', N'ae628d0d-d84d-4b95-9134-a8a3788af737', N'fb40ad8f-098f-4fd1-8870-c05d1d25fae2', 0, CAST(N'2024-11-07T20:31:36.3126621' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'773e277c-3f01-4af9-b485-b81f8af3fa09', N'0e3b9ee0-7aa4-458c-8da7-639c72b88494', N'6f0a8890-c105-4fb4-874b-9d559847eca6', 0, CAST(N'2024-11-07T20:31:36.5245438' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'dc3bc37b-b707-405d-9ad3-b86b886668ed', N'0e3b9ee0-7aa4-458c-8da7-639c72b88494', N'79459d60-5db6-48b6-94bf-2121d9839e15', 0, CAST(N'2024-11-07T20:31:36.6163929' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'9678aac1-e935-4bec-b815-bb1ba4a6e406', N'87482a50-6425-4411-a6b5-574e8b11c387', N'3622e825-11bb-44fd-bc59-ce0c40aa9509', 0, CAST(N'2024-11-07T20:31:36.7684827' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'660cbed0-f21e-4c58-ab94-bbbc1182978a', N'4996b1df-3d3a-4057-a5dd-d6c90e183452', N'786e1a85-def5-4a2e-a70c-cfc2c0d8b239', 0, CAST(N'2024-11-07T20:33:14.3362495' AS DateTime2), 11)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'e623ec1c-568f-4fc3-9553-bc76e8b9339a', N'fe8e27cb-9f15-4ced-bf8f-fb8c4668d767', N'3a9ab36e-b834-4a20-ba32-a0d34fdc47da', 0, CAST(N'2024-11-07T20:31:36.1165504' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'f4b949fb-3258-4f53-a8e4-bc938dcc2701', N'87482a50-6425-4411-a6b5-574e8b11c387', N'35ca5805-aa8f-4dc0-a895-c2bae87a00eb', 0, CAST(N'2024-11-07T20:31:36.7803628' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'3af81677-8b10-42f3-a279-be0d6fb05d8e', N'911b67d7-c6ff-42ba-a710-8cd49cc2141f', N'fb40ad8f-098f-4fd1-8870-c05d1d25fae2', 0, CAST(N'2024-11-07T20:31:36.6814761' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'79655b74-4fc6-49a4-8515-be3eb17f657b', N'4996b1df-3d3a-4057-a5dd-d6c90e183452', N'31314875-8f03-4874-be17-0f31c14f28ee', 0, CAST(N'2024-11-07T20:33:14.3626792' AS DateTime2), 16)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'bb9e5d79-9307-42f5-9b4a-bec0774da726', N'911b67d7-c6ff-42ba-a710-8cd49cc2141f', N'1fb789cf-87b0-43b0-a45e-e85e3891a9ee', 0, CAST(N'2024-11-07T20:31:36.7237048' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'75f1b1b7-56bf-4a6f-b6d7-bf1603958b7e', N'1849fcbe-2a49-4e3c-8d9a-d12139acdcae', N'acf13799-4766-4be0-a514-693c0d238f34', 0, CAST(N'2024-11-07T20:31:36.4191655' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'1b17404e-7a4f-45c7-88de-bf3a044d1f52', N'db8c58cb-aec0-43f2-8277-d5d04069f7e4', N'6f0a8890-c105-4fb4-874b-9d559847eca6', 0, CAST(N'2024-11-07T20:31:36.1784424' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'322d0597-b0f6-4b29-a95a-c16ec43bb230', N'ae628d0d-d84d-4b95-9134-a8a3788af737', N'b4ab63da-81d4-4ea1-8a5a-3c12154fa561', 0, CAST(N'2024-11-07T20:31:36.3826016' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'7e9dc714-be9a-47fb-baab-c276a660a895', N'4996b1df-3d3a-4057-a5dd-d6c90e183452', N'999d3424-6bad-4d7b-8bd0-2b462b55dd45', 0, CAST(N'2024-11-07T20:33:14.2990121' AS DateTime2), 4)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'8c0d26b9-4d43-4879-a0e7-c277991ddb96', N'911b67d7-c6ff-42ba-a710-8cd49cc2141f', N'ad4a5bce-f3c4-44a7-85c5-fdb1c2d19d12', 0, CAST(N'2024-11-07T20:31:36.6490421' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'a76e0196-5d9f-4ea3-81e1-c2b4408d7e21', N'87482a50-6425-4411-a6b5-574e8b11c387', N'6f0a8890-c105-4fb4-874b-9d559847eca6', 0, CAST(N'2024-11-07T20:31:36.7841990' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'2b3b2ba9-e1d6-4220-89b3-c365f727c2de', N'db8c58cb-aec0-43f2-8277-d5d04069f7e4', N'1fb789cf-87b0-43b0-a45e-e85e3891a9ee', 0, CAST(N'2024-11-07T20:31:36.2381055' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'35a771f5-b6c4-49c1-88dd-c50ad2cc8df4', N'ae628d0d-d84d-4b95-9134-a8a3788af737', N'3a9ab36e-b834-4a20-ba32-a0d34fdc47da', 0, CAST(N'2024-11-07T20:31:36.3444844' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'03741bb3-fe5a-41f3-ae3d-c5fb8104265d', N'db8c58cb-aec0-43f2-8277-d5d04069f7e4', N'31314875-8f03-4874-be17-0f31c14f28ee', 0, CAST(N'2024-11-07T20:31:36.2318881' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'da838cef-ebe4-4448-98e3-c872a02414db', N'db8c58cb-aec0-43f2-8277-d5d04069f7e4', N'acf13799-4766-4be0-a514-693c0d238f34', 0, CAST(N'2024-11-07T20:31:36.1852334' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'04b52fc5-88ff-4bb2-8fec-c931c29a4e5f', N'9dcda18f-c78a-4dfe-a8f3-3010459d5787', N'1b68a81a-b654-4896-9195-84abfb081103', 0, CAST(N'2024-11-07T21:24:42.4586185' AS DateTime2), 26)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'473f07b9-3a4e-4ad5-8e29-ca4846012e16', N'4996b1df-3d3a-4057-a5dd-d6c90e183452', N'3c69d1e2-9204-431f-863f-a4ba07f3ac1d', 0, CAST(N'2024-11-07T20:33:14.3988127' AS DateTime2), 21)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'ec2f9f4c-78a5-4ab1-b4ff-cb4675850ee5', N'fe8e27cb-9f15-4ced-bf8f-fb8c4668d767', N'35ca5805-aa8f-4dc0-a895-c2bae87a00eb', 0, CAST(N'2024-11-07T20:31:36.0749926' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'6bc11e58-5488-4410-8f47-cc2aeee1669f', N'1849fcbe-2a49-4e3c-8d9a-d12139acdcae', N'3622e825-11bb-44fd-bc59-ce0c40aa9509', 0, CAST(N'2024-11-07T20:31:36.3971543' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'e0d18c33-3d6c-4835-aa3e-ccf1c51e8c3f', N'fe8e27cb-9f15-4ced-bf8f-fb8c4668d767', N'bf0b9144-be3b-4213-8f3c-f744035ed4b5', 0, CAST(N'2024-11-07T20:31:36.1093866' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'beab3de1-e796-42f3-9232-d1738d01d935', N'4996b1df-3d3a-4057-a5dd-d6c90e183452', N'f4c06feb-eb3d-4f75-95f9-10c0289de995', 0, CAST(N'2024-11-07T20:33:14.4558918' AS DateTime2), 31)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'd9137b0b-6693-4b95-b118-d258160705f4', N'4996b1df-3d3a-4057-a5dd-d6c90e183452', N'3a9ab36e-b834-4a20-ba32-a0d34fdc47da', 0, CAST(N'2024-11-07T20:33:14.3569424' AS DateTime2), 15)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'eddc8719-db70-4eba-93b9-d2b3612391bd', N'4996b1df-3d3a-4057-a5dd-d6c90e183452', N'b4ab63da-81d4-4ea1-8a5a-3c12154fa561', 0, CAST(N'2024-11-07T20:33:14.3033743' AS DateTime2), 5)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'80a468a2-f269-4920-91be-d645df70932c', N'ae628d0d-d84d-4b95-9134-a8a3788af737', N'51ef79d2-b47e-41f1-a99d-f5c0e4f4416e', 0, CAST(N'2024-11-07T20:31:36.3307549' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'78209387-898d-4109-a82a-d7cfaa5a06dc', N'fe8e27cb-9f15-4ced-bf8f-fb8c4668d767', N'4723cac1-52f7-43bb-8d3f-bfb3b6c28a96', 0, CAST(N'2024-11-07T20:31:36.0807596' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'973e2755-8b08-4193-b1c3-d9e9a28b5dfa', N'1849fcbe-2a49-4e3c-8d9a-d12139acdcae', N'999d3424-6bad-4d7b-8bd0-2b462b55dd45', 0, CAST(N'2024-11-07T20:31:36.4842907' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'fc10f78a-b38b-47ba-805d-db8f467c2bd0', N'87482a50-6425-4411-a6b5-574e8b11c387', N'c702e9e8-111b-4402-8ed0-5f939a7892a6', 0, CAST(N'2024-11-07T20:31:36.7605879' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'c247cce7-4ee6-4642-8060-dbde6d955fde', N'1849fcbe-2a49-4e3c-8d9a-d12139acdcae', N'87fedc0d-caae-4890-80d9-a6e086d71a1c', 0, CAST(N'2024-11-07T20:31:36.4918281' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'2badc72f-1c94-41dd-868b-dc67c376927e', N'db8c58cb-aec0-43f2-8277-d5d04069f7e4', N'35ca5805-aa8f-4dc0-a895-c2bae87a00eb', 0, CAST(N'2024-11-07T20:31:36.1760089' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'2f0ef551-794a-4a84-b6cc-e01f472d25d0', N'db8c58cb-aec0-43f2-8277-d5d04069f7e4', N'76f4c106-34b2-4175-a413-f0b67106218f', 0, CAST(N'2024-11-07T20:31:36.1569988' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'1ad2fc73-696f-47f3-8de9-e02d6706ccdf', N'9dcda18f-c78a-4dfe-a8f3-3010459d5787', N'999d3424-6bad-4d7b-8bd0-2b462b55dd45', 0, CAST(N'2024-11-07T21:24:42.3241111' AS DateTime2), 5)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'3f297fc2-049d-490a-99be-e0a3b5a41729', N'911b67d7-c6ff-42ba-a710-8cd49cc2141f', N'f4c06feb-eb3d-4f75-95f9-10c0289de995', 0, CAST(N'2024-11-07T20:31:36.6847742' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'3330cc76-e22c-4c6b-938a-e228fb0f8bd0', N'911b67d7-c6ff-42ba-a710-8cd49cc2141f', N'8b678550-a782-4ed9-a61f-15887cf5a73e', 0, CAST(N'2024-11-07T20:31:36.7340856' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'63b62d4b-148f-4f8a-a7d0-e344a104f3e2', N'9dcda18f-c78a-4dfe-a8f3-3010459d5787', N'4723cac1-52f7-43bb-8d3f-bfb3b6c28a96', 0, CAST(N'2024-11-07T21:24:42.4637882' AS DateTime2), 27)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'ab233243-f11a-4033-97dd-e36fdfa2d330', N'db8c58cb-aec0-43f2-8277-d5d04069f7e4', N'3a9ab36e-b834-4a20-ba32-a0d34fdc47da', 0, CAST(N'2024-11-07T20:31:36.2284015' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'db58b6cf-7268-494a-919c-e3e1638e1a38', N'db8c58cb-aec0-43f2-8277-d5d04069f7e4', N'8b678550-a782-4ed9-a61f-15887cf5a73e', 0, CAST(N'2024-11-07T20:31:36.2472494' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'853ba163-2b42-4c66-a20f-e415f99639b7', N'87482a50-6425-4411-a6b5-574e8b11c387', N'e6d88410-17f4-479b-8e2d-8b6d5c0324a7', 0, CAST(N'2024-11-07T20:31:36.7989759' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'2f8f060e-098d-423e-9b56-e4ef0656d21a', N'87482a50-6425-4411-a6b5-574e8b11c387', N'3c69d1e2-9204-431f-863f-a4ba07f3ac1d', 0, CAST(N'2024-11-07T20:31:36.7764925' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'bdf645f6-4ee9-4a30-a152-e52d2e755e0a', N'fe8e27cb-9f15-4ced-bf8f-fb8c4668d767', N'fb40ad8f-098f-4fd1-8870-c05d1d25fae2', 0, CAST(N'2024-11-07T20:31:36.0926263' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'ec78d81f-0bb7-4623-bde0-e6656ad770cd', N'db8c58cb-aec0-43f2-8277-d5d04069f7e4', N'fb40ad8f-098f-4fd1-8870-c05d1d25fae2', 0, CAST(N'2024-11-07T20:31:36.1987631' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'16d9456f-6163-4e86-be29-e829e67c23fa', N'fe8e27cb-9f15-4ced-bf8f-fb8c4668d767', N'f4c06feb-eb3d-4f75-95f9-10c0289de995', 0, CAST(N'2024-11-07T20:31:36.0949676' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'203cfbe1-c39a-4c16-a9c2-e84ca58ee87d', N'4996b1df-3d3a-4057-a5dd-d6c90e183452', N'0f8a3810-dc07-47e8-a089-7d6c08107382', 0, CAST(N'2024-11-07T20:33:14.3781744' AS DateTime2), 19)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'863c8019-2260-4f41-b635-e85578a5be35', N'fe8e27cb-9f15-4ced-bf8f-fb8c4668d767', N'87fedc0d-caae-4890-80d9-a6e086d71a1c', 0, CAST(N'2024-11-07T20:31:36.1504660' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'e473cd54-f94e-45c1-8e8c-e9ac0250aac2', N'ae628d0d-d84d-4b95-9134-a8a3788af737', N'87fedc0d-caae-4890-80d9-a6e086d71a1c', 0, CAST(N'2024-11-07T20:31:36.3790663' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'cd473ed8-9522-477c-a767-e9f929da24fd', N'ae628d0d-d84d-4b95-9134-a8a3788af737', N'76f4c106-34b2-4175-a413-f0b67106218f', 0, CAST(N'2024-11-07T20:31:36.2671442' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'410bed5d-1a26-4a28-b7ea-eb45c7d37bbc', N'fe8e27cb-9f15-4ced-bf8f-fb8c4668d767', N'0f8a3810-dc07-47e8-a089-7d6c08107382', 0, CAST(N'2024-11-07T20:31:36.1322799' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'012ca845-bf5d-48d7-8d66-ec206895cb28', N'911b67d7-c6ff-42ba-a710-8cd49cc2141f', N'c702e9e8-111b-4402-8ed0-5f939a7892a6', 0, CAST(N'2024-11-07T20:31:36.6346585' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'85900760-ead9-4147-b93b-ec7078885962', N'0e3b9ee0-7aa4-458c-8da7-639c72b88494', N'c702e9e8-111b-4402-8ed0-5f939a7892a6', 0, CAST(N'2024-11-07T20:31:36.5032116' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'a1140472-8143-4ead-b3ef-ed14b34785c9', N'87482a50-6425-4411-a6b5-574e8b11c387', N'8b678550-a782-4ed9-a61f-15887cf5a73e', 0, CAST(N'2024-11-07T20:31:36.8705543' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'36f81719-77a2-4d01-884e-ee49b52541e2', N'911b67d7-c6ff-42ba-a710-8cd49cc2141f', N'0f8a3810-dc07-47e8-a089-7d6c08107382', 0, CAST(N'2024-11-07T20:31:36.7268202' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'c7e9cf97-12bd-43dc-a3c0-ef86c0634acf', N'87482a50-6425-4411-a6b5-574e8b11c387', N'0f8a3810-dc07-47e8-a089-7d6c08107382', 0, CAST(N'2024-11-07T20:31:36.8615884' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'33dae73c-ece2-491e-9aaa-f0ddb298300f', N'87482a50-6425-4411-a6b5-574e8b11c387', N'da5e3dff-a649-4508-943d-0ecc32d4f7fc', 0, CAST(N'2024-11-07T20:31:36.8509469' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'c7b0f184-6806-4632-91f6-f0f2bb971cec', N'911b67d7-c6ff-42ba-a710-8cd49cc2141f', N'1b68a81a-b654-4896-9195-84abfb081103', 0, CAST(N'2024-11-07T20:31:36.6919020' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'50eb5351-1578-4739-b6fe-f2363e2f377e', N'87482a50-6425-4411-a6b5-574e8b11c387', N'1fb789cf-87b0-43b0-a45e-e85e3891a9ee', 0, CAST(N'2024-11-07T20:31:36.8570324' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'40f26344-f4d9-4235-949c-f27950da45b5', N'db8c58cb-aec0-43f2-8277-d5d04069f7e4', N'e296f2f3-e89c-49b9-b304-b76df59719ae', 0, CAST(N'2024-11-07T20:31:36.2442398' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'38bc4aaa-7f5c-48a8-9df4-f3184fd76c3d', N'db8c58cb-aec0-43f2-8277-d5d04069f7e4', N'ad4a5bce-f3c4-44a7-85c5-fdb1c2d19d12', 0, CAST(N'2024-11-07T20:31:36.1691087' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'26d8f7cd-e7be-4211-86af-f3e4f1eee984', N'fe8e27cb-9f15-4ced-bf8f-fb8c4668d767', N'6f0a8890-c105-4fb4-874b-9d559847eca6', 0, CAST(N'2024-11-07T20:31:36.0781921' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'1182e5a1-339a-451f-a942-f521fb364390', N'db8c58cb-aec0-43f2-8277-d5d04069f7e4', N'1b68a81a-b654-4896-9195-84abfb081103', 0, CAST(N'2024-11-07T20:31:36.2110207' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'c17c7aac-f617-4c68-a444-f69d4b07d504', N'87482a50-6425-4411-a6b5-574e8b11c387', N'b9ec64fd-8aac-44db-8541-67b1c6162676', 0, CAST(N'2024-11-07T20:31:36.7949477' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'fbc68bed-d6f5-46cd-a228-f69f0da08a53', N'ae628d0d-d84d-4b95-9134-a8a3788af737', N'8b678550-a782-4ed9-a61f-15887cf5a73e', 0, CAST(N'2024-11-07T20:31:36.3692636' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'fa346a31-c18a-45e0-889b-f7cc433965d3', N'9dcda18f-c78a-4dfe-a8f3-3010459d5787', N'35ca5805-aa8f-4dc0-a895-c2bae87a00eb', 0, CAST(N'2024-11-07T21:24:42.4833239' AS DateTime2), 30)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'2cf66110-cc05-445c-b88b-fa24d49ed82d', N'0e3b9ee0-7aa4-458c-8da7-639c72b88494', N'3622e825-11bb-44fd-bc59-ce0c40aa9509', 0, CAST(N'2024-11-07T20:31:36.5103606' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'dd60a19c-9de5-4019-a6e0-fb2bbf69aebb', N'4996b1df-3d3a-4057-a5dd-d6c90e183452', N'e296f2f3-e89c-49b9-b304-b76df59719ae', 0, CAST(N'2024-11-07T20:33:14.3931008' AS DateTime2), 20)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'9379303b-371a-4a0a-b318-fbcdde2c3f66', N'0e3b9ee0-7aa4-458c-8da7-639c72b88494', N'fb40ad8f-098f-4fd1-8870-c05d1d25fae2', 0, CAST(N'2024-11-07T20:31:36.5424582' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'1ff13ee8-04d5-404d-96f9-fc8176630304', N'ae628d0d-d84d-4b95-9134-a8a3788af737', N'3622e825-11bb-44fd-bc59-ce0c40aa9509', 0, CAST(N'2024-11-07T20:31:36.2780800' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'352dd8a3-dce2-475a-97d9-fd6b19610271', N'911b67d7-c6ff-42ba-a710-8cd49cc2141f', N'e6d88410-17f4-479b-8e2d-8b6d5c0324a7', 0, CAST(N'2024-11-07T20:31:36.6773660' AS DateTime2), 1)
INSERT [dbo].[EvaluationCriteria] ([Id], [EvaluationId], [CategoryCriteriaId], [IsDeleted], [UpdatedAt], [Sort]) VALUES (N'c736ca78-caaa-44d4-8e66-feed8b19e662', N'9dcda18f-c78a-4dfe-a8f3-3010459d5787', N'51ef79d2-b47e-41f1-a99d-f5c0e4f4416e', 0, CAST(N'2024-11-07T21:24:42.3442034' AS DateTime2), 8)
GO
INSERT [dbo].[MenuItems] ([Id], [Key], [Name], [ParentId], [Route], [Icon], [Sort]) VALUES (N'be782bc6-5b5f-4edc-a2c4-0dc8ad2af70e', N'evaluation-statistics', N'Thống kê đánh giá', N'fa70e2f4-8d7f-479d-a12a-f91508b8c33e', N'/statistics/evaluation-statistics', N'IconBarChartFill', 1)
INSERT [dbo].[MenuItems] ([Id], [Key], [Name], [ParentId], [Route], [Icon], [Sort]) VALUES (N'b67dc630-6c6f-4dd1-88a1-1380ddf043f6', N'units', N'Quản lý đơn vị/phòng ban', N'd7d627dc-8642-4131-ac61-f629a0f69929', N'/organization-management/units', N'IconDeploymentUnit', 4)
INSERT [dbo].[MenuItems] ([Id], [Key], [Name], [ParentId], [Route], [Icon], [Sort]) VALUES (N'8d34733f-09dd-4c18-8170-16e03456d202', N'evaluation-ratings', N'Danh mục thang điểm đánh giá', N'97e2f2a0-00c8-492e-8503-adbbcb791b1f', N'/categories/evaluation-ratings', N'IconScoreboardOutline', 1)
INSERT [dbo].[MenuItems] ([Id], [Key], [Name], [ParentId], [Route], [Icon], [Sort]) VALUES (N'93a76a6e-3f4c-4d02-9b67-3c938a873be1', N'users', N'Quản lý người dùng', N'd7d627dc-8642-4131-ac61-f629a0f69929', N'/organization-management/users', N'IconUser', 2)
INSERT [dbo].[MenuItems] ([Id], [Key], [Name], [ParentId], [Route], [Icon], [Sort]) VALUES (N'3172d91d-37cf-46ec-9eb8-62fd2a01e691', N'user-type', N'Quản lý loại người dùng', N'd7d627dc-8642-4131-ac61-f629a0f69929', N'/organization-management/user-type', N'IconPersonRolodex', 1)
INSERT [dbo].[MenuItems] ([Id], [Key], [Name], [ParentId], [Route], [Icon], [Sort]) VALUES (N'd0a617ce-7a4a-4556-a2d0-82503dfef228', N'dashboard', N'Trang tổng quan', NULL, N'/dashboard', N'IconDashboard', 1)
INSERT [dbo].[MenuItems] ([Id], [Key], [Name], [ParentId], [Route], [Icon], [Sort]) VALUES (N'78ca07f2-0549-449a-9ca4-8a950a40b567', N'evaluation-criteria', N'Danh mục tiêu chí đánh giá', N'97e2f2a0-00c8-492e-8503-adbbcb791b1f', N'/categories/evaluation-criteria', N'IconCardChecklist', 2)
INSERT [dbo].[MenuItems] ([Id], [Key], [Name], [ParentId], [Route], [Icon], [Sort]) VALUES (N'97e2f2a0-00c8-492e-8503-adbbcb791b1f', N'categories', N'Quản lý danh mục', NULL, NULL, NULL, 5)
INSERT [dbo].[MenuItems] ([Id], [Key], [Name], [ParentId], [Route], [Icon], [Sort]) VALUES (N'9f7dd98f-381f-4cec-8448-b1f7e3ce6531', N'global-management', N'Quản lý chung', NULL, NULL, NULL, 3)
INSERT [dbo].[MenuItems] ([Id], [Key], [Name], [ParentId], [Route], [Icon], [Sort]) VALUES (N'63a5cead-6c28-4993-8c46-d86458b4d8bb', N'evaluation-periods', N'Danh mục kỳ đánh giá', N'97e2f2a0-00c8-492e-8503-adbbcb791b1f', N'/categories/evaluation-periods', N'IconClipboardTextClock', 6)
INSERT [dbo].[MenuItems] ([Id], [Key], [Name], [ParentId], [Route], [Icon], [Sort]) VALUES (N'32cc32e8-8e12-4b5f-9089-e2c52227155d', N'evaluation-comments', N'Danh mục nhận xét đánh giá', N'97e2f2a0-00c8-492e-8503-adbbcb791b1f', N'/categories/evaluation-comments', N'IconComment', 5)
INSERT [dbo].[MenuItems] ([Id], [Key], [Name], [ParentId], [Route], [Icon], [Sort]) VALUES (N'51b36720-d531-4648-9efb-e80c5bdd04a5', N'roles', N'Quản lý vai trò', N'9f7dd98f-381f-4cec-8448-b1f7e3ce6531', N'/global-management/roles', N'IconUserShield', 1)
INSERT [dbo].[MenuItems] ([Id], [Key], [Name], [ParentId], [Route], [Icon], [Sort]) VALUES (N'f9518f77-2b01-4131-b229-f1f675f5ceca', N'evaluations', N'Quản lý phiếu đánh giá', NULL, N'/evaluations', N'IconDocument_justified', 2)
INSERT [dbo].[MenuItems] ([Id], [Key], [Name], [ParentId], [Route], [Icon], [Sort]) VALUES (N'd7d627dc-8642-4131-ac61-f629a0f69929', N'organization-management', N'Quản lý đơn vị và nhân sự', NULL, NULL, NULL, 4)
INSERT [dbo].[MenuItems] ([Id], [Key], [Name], [ParentId], [Route], [Icon], [Sort]) VALUES (N'fa70e2f4-8d7f-479d-a12a-f91508b8c33e', N'statistics', N'Thống kê', NULL, NULL, NULL, 6)
INSERT [dbo].[MenuItems] ([Id], [Key], [Name], [ParentId], [Route], [Icon], [Sort]) VALUES (N'6f9046d3-eb0e-4da1-97c1-f9509c240fd9', N'evaluation-pros-cons', N'Danh mục ưu và nhược điểm đánh giá', N'97e2f2a0-00c8-492e-8503-adbbcb791b1f', N'/categories/evaluation-pros-cons', N'IconThumbsUpDown', 4)
GO
INSERT [dbo].[RefreshToken] ([Id], [UserId], [Token], [JwtId], [IsUsed], [IsRevoked], [IssuedAt], [ExpiredAt]) VALUES (N'99e15709-f5dd-4ca2-8be8-b5589a497b89', N'd874e68c-9e4e-467a-9c18-9e582210d526', N'JxAN59STnqPYlG8Vvv79IrDKNaSiKm8rAFfPJwlEM5g=', N'5ae09c8a-47bf-4bdc-9b0c-0da6e791dacd', 0, 0, CAST(N'2024-10-31T15:11:59.3478762' AS DateTime2), CAST(N'2024-11-07T15:11:59.3479355' AS DateTime2))
INSERT [dbo].[RefreshToken] ([Id], [UserId], [Token], [JwtId], [IsUsed], [IsRevoked], [IssuedAt], [ExpiredAt]) VALUES (N'7fbd1a15-a396-4d84-b677-eb62ff5e4d16', N'a6ba15f2-d668-4059-a1c4-5b0deda85c47', N'gWP43cWlHhVFIUhpwp0rvy5XCDXuIZEKIGAFlC7ymns=', N'3fb34bf6-838a-45de-90ef-19e27599bf03', 0, 0, CAST(N'2024-11-05T22:47:10.3303632' AS DateTime2), CAST(N'2024-11-12T22:47:10.3303633' AS DateTime2))
GO
INSERT [dbo].[RoleMenuItems] ([Id], [RoleId], [MenuItemId]) VALUES (N'2f958c6a-5147-4e52-b455-0eb647768fe0', N'a6204804-82cf-4f94-a3e1-07cd10a8e579', N'd7d627dc-8642-4131-ac61-f629a0f69929')
INSERT [dbo].[RoleMenuItems] ([Id], [RoleId], [MenuItemId]) VALUES (N'b032e558-b8e5-4d42-98e6-10c9a75ce1a8', N'a6204804-82cf-4f94-a3e1-07cd10a8e579', N'9f7dd98f-381f-4cec-8448-b1f7e3ce6531')
INSERT [dbo].[RoleMenuItems] ([Id], [RoleId], [MenuItemId]) VALUES (N'cf717031-84db-4008-b9bf-18ad0637e1a2', N'a6204804-82cf-4f94-a3e1-07cd10a8e579', N'97e2f2a0-00c8-492e-8503-adbbcb791b1f')
INSERT [dbo].[RoleMenuItems] ([Id], [RoleId], [MenuItemId]) VALUES (N'f65c1ff9-ee8b-464e-9288-37c51711a9d9', N'a6204804-82cf-4f94-a3e1-07cd10a8e579', N'6f9046d3-eb0e-4da1-97c1-f9509c240fd9')
INSERT [dbo].[RoleMenuItems] ([Id], [RoleId], [MenuItemId]) VALUES (N'ce4e900f-f537-419b-9b94-3ead513beb70', N'fa00a51d-a46e-4d10-926e-5ba8ba68d432', N'f9518f77-2b01-4131-b229-f1f675f5ceca')
INSERT [dbo].[RoleMenuItems] ([Id], [RoleId], [MenuItemId]) VALUES (N'32384893-ee96-4bec-816b-4a999c0d5dce', N'a6204804-82cf-4f94-a3e1-07cd10a8e579', N'93a76a6e-3f4c-4d02-9b67-3c938a873be1')
INSERT [dbo].[RoleMenuItems] ([Id], [RoleId], [MenuItemId]) VALUES (N'7e78dc05-0a38-4912-9e40-5477bddbe7a8', N'a6204804-82cf-4f94-a3e1-07cd10a8e579', N'63a5cead-6c28-4993-8c46-d86458b4d8bb')
INSERT [dbo].[RoleMenuItems] ([Id], [RoleId], [MenuItemId]) VALUES (N'786af9f2-c67d-48aa-bc47-70630f8ff889', N'a6204804-82cf-4f94-a3e1-07cd10a8e579', N'78ca07f2-0549-449a-9ca4-8a950a40b567')
INSERT [dbo].[RoleMenuItems] ([Id], [RoleId], [MenuItemId]) VALUES (N'e284d8c5-b69a-4b95-91ac-74a5cfddbe34', N'a6204804-82cf-4f94-a3e1-07cd10a8e579', N'f9518f77-2b01-4131-b229-f1f675f5ceca')
INSERT [dbo].[RoleMenuItems] ([Id], [RoleId], [MenuItemId]) VALUES (N'bff62666-d9c2-4615-bc49-75aba7f6ea1d', N'a6204804-82cf-4f94-a3e1-07cd10a8e579', N'8d34733f-09dd-4c18-8170-16e03456d202')
INSERT [dbo].[RoleMenuItems] ([Id], [RoleId], [MenuItemId]) VALUES (N'73bd9f98-133e-4926-b679-7ad68e3673e2', N'a6204804-82cf-4f94-a3e1-07cd10a8e579', N'3172d91d-37cf-46ec-9eb8-62fd2a01e691')
INSERT [dbo].[RoleMenuItems] ([Id], [RoleId], [MenuItemId]) VALUES (N'025d0bb7-e5a5-4b60-a297-876e03974d6e', N'a6204804-82cf-4f94-a3e1-07cd10a8e579', N'51b36720-d531-4648-9efb-e80c5bdd04a5')
INSERT [dbo].[RoleMenuItems] ([Id], [RoleId], [MenuItemId]) VALUES (N'cb3d129b-eb9d-4cbc-ad5a-8d3c50244f60', N'a6204804-82cf-4f94-a3e1-07cd10a8e579', N'b67dc630-6c6f-4dd1-88a1-1380ddf043f6')
INSERT [dbo].[RoleMenuItems] ([Id], [RoleId], [MenuItemId]) VALUES (N'bbe2c297-58fe-4d82-b81d-c0eeb63f2205', N'a6204804-82cf-4f94-a3e1-07cd10a8e579', N'be782bc6-5b5f-4edc-a2c4-0dc8ad2af70e')
INSERT [dbo].[RoleMenuItems] ([Id], [RoleId], [MenuItemId]) VALUES (N'ca5e51be-fa78-4d14-9139-c1349e923bb1', N'a6204804-82cf-4f94-a3e1-07cd10a8e579', N'32cc32e8-8e12-4b5f-9089-e2c52227155d')
INSERT [dbo].[RoleMenuItems] ([Id], [RoleId], [MenuItemId]) VALUES (N'e99853a5-2965-469f-9c6e-c9fbbdcaf045', N'20a6ddc3-0e72-400e-80e0-dd5256182a9a', N'd0a617ce-7a4a-4556-a2d0-82503dfef228')
INSERT [dbo].[RoleMenuItems] ([Id], [RoleId], [MenuItemId]) VALUES (N'2b735f09-d568-4f8a-b8a6-d5dd4e0aaca4', N'a6204804-82cf-4f94-a3e1-07cd10a8e579', N'fa70e2f4-8d7f-479d-a12a-f91508b8c33e')
INSERT [dbo].[RoleMenuItems] ([Id], [RoleId], [MenuItemId]) VALUES (N'156419b1-b1b2-4790-9f1c-d8f5d90d3685', N'a6204804-82cf-4f94-a3e1-07cd10a8e579', N'd0a617ce-7a4a-4556-a2d0-82503dfef228')
INSERT [dbo].[RoleMenuItems] ([Id], [RoleId], [MenuItemId]) VALUES (N'94048182-40c0-44d9-b209-ffb7ff190593', N'fa00a51d-a46e-4d10-926e-5ba8ba68d432', N'd0a617ce-7a4a-4556-a2d0-82503dfef228')
GO
INSERT [dbo].[Roles] ([Id], [RoleName], [UpdatedAt], [IsDeleted]) VALUES (N'a6204804-82cf-4f94-a3e1-07cd10a8e579', N'QUẢN TRỊ HỆ THỐNG', CAST(N'2024-10-25T15:08:13.6002434' AS DateTime2), 0)
INSERT [dbo].[Roles] ([Id], [RoleName], [UpdatedAt], [IsDeleted]) VALUES (N'fa00a51d-a46e-4d10-926e-5ba8ba68d432', N'QUẢN LÝ ĐƠN VỊ', CAST(N'2024-11-07T11:17:18.0754407' AS DateTime2), 0)
INSERT [dbo].[Roles] ([Id], [RoleName], [UpdatedAt], [IsDeleted]) VALUES (N'459779cb-eece-4ac0-afed-791253c18be4', N'test1234566', CAST(N'2024-10-25T14:48:26.6279582' AS DateTime2), 1)
INSERT [dbo].[Roles] ([Id], [RoleName], [UpdatedAt], [IsDeleted]) VALUES (N'10aa2a01-5d85-428e-8b4f-7d41fce70a42', N'asdsad3334412', CAST(N'2024-10-25T14:57:39.2114150' AS DateTime2), 1)
INSERT [dbo].[Roles] ([Id], [RoleName], [UpdatedAt], [IsDeleted]) VALUES (N'338ef3e3-c086-4abb-bed4-a942d0d34ecd', N'1', CAST(N'2024-11-02T10:52:37.1795331' AS DateTime2), 1)
INSERT [dbo].[Roles] ([Id], [RoleName], [UpdatedAt], [IsDeleted]) VALUES (N'20a6ddc3-0e72-400e-80e0-dd5256182a9a', N'NGƯỜI ĐÁNH GIÁ', CAST(N'2024-10-30T17:16:10.1331331' AS DateTime2), 0)
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
INSERT [dbo].[User] ([Id], [UserTypeId], [UnitId], [FullName], [Email], [Password], [Phone], [Address], [Birthday], [PositionsName], [IsActive], [IsDeleted], [UpdatedAt]) VALUES (N'1e5535ae-d3f8-44e3-ad4e-0bed6df067eb', N'25baa22a-3368-4958-96a2-fe3a3591a35d', N'fe6717f3-92c1-48dd-acf6-a65dbefdb04e', N'TRẨN VĂN ĐỨC', N'ductran11012002@gmail.com', N'admin', N'0326393544', N'asdasd', CAST(N'2002-11-10T17:00:00.0000000' AS DateTime2), N'VCQL', 1, 1, CAST(N'2024-11-02T09:57:40.1360902' AS DateTime2))
INSERT [dbo].[User] ([Id], [UserTypeId], [UnitId], [FullName], [Email], [Password], [Phone], [Address], [Birthday], [PositionsName], [IsActive], [IsDeleted], [UpdatedAt]) VALUES (N'19a50fd8-5bae-49b6-ad01-4f5b32b10421', N'4bb20ca7-76b9-4137-b32a-1174b43a9765', N'7787a766-2655-457b-afa5-cc21e94ff712', N'TRẨN VĂN ĐỨC 2', N'admin2@gmail.com', N'123456', N'0523310840', N'asdasdasd', CAST(N'2024-10-27T17:00:00.0000000' AS DateTime2), N'LDHD', 1, 1, CAST(N'2024-10-31T15:14:02.2635821' AS DateTime2))
INSERT [dbo].[User] ([Id], [UserTypeId], [UnitId], [FullName], [Email], [Password], [Phone], [Address], [Birthday], [PositionsName], [IsActive], [IsDeleted], [UpdatedAt]) VALUES (N'a6ba15f2-d668-4059-a1c4-5b0deda85c47', N'25baa22a-3368-4958-96a2-fe3a3591a35d', N'7787a766-2655-457b-afa5-cc21e94ff712', N'ADMIN', N'admin@gmail.com', N'admin', N'03263935401', N'Lộc Ninh, Bình Phước', CAST(N'2002-01-20T00:00:00.0000000' AS DateTime2), N'LDHD', 1, 0, CAST(N'2024-10-31T15:01:27.4135003' AS DateTime2))
INSERT [dbo].[User] ([Id], [UserTypeId], [UnitId], [FullName], [Email], [Password], [Phone], [Address], [Birthday], [PositionsName], [IsActive], [IsDeleted], [UpdatedAt]) VALUES (N'7e1cb3e6-e94a-4177-95af-6f2296c5efe4', N'25baa22a-3368-4958-96a2-fe3a3591a35d', N'7787a766-2655-457b-afa5-cc21e94ff712', N'Hoàng', N'admin12@gmail.com', N'admin', N'032639354012', N'adasd', CAST(N'2024-11-12T17:00:00.0000000' AS DateTime2), N'VCNV', 1, 1, CAST(N'2024-11-02T09:58:54.6863731' AS DateTime2))
INSERT [dbo].[User] ([Id], [UserTypeId], [UnitId], [FullName], [Email], [Password], [Phone], [Address], [Birthday], [PositionsName], [IsActive], [IsDeleted], [UpdatedAt]) VALUES (N'd874e68c-9e4e-467a-9c18-9e582210d526', N'25baa22a-3368-4958-96a2-fe3a3591a35d', N'7787a766-2655-457b-afa5-cc21e94ff712', N'TRẨN VĂN ĐỨC', N'admin1@gmail.com', N'123456', N'0123456789', N'asdasdsadas', CAST(N'2002-01-10T00:00:00.0000000' AS DateTime2), N'LDHD', 1, 1, CAST(N'2024-10-31T15:11:44.9758699' AS DateTime2))
INSERT [dbo].[User] ([Id], [UserTypeId], [UnitId], [FullName], [Email], [Password], [Phone], [Address], [Birthday], [PositionsName], [IsActive], [IsDeleted], [UpdatedAt]) VALUES (N'c4b77588-43ec-4502-94a8-9f0457842122', N'4bb20ca7-76b9-4137-b32a-1174b43a9765', N'7787a766-2655-457b-afa5-cc21e94ff712', N'TRẨN VĂN ĐỨC', N'admin1@gmail.com', N'123456', N'0326393540', N'asdasdasd', CAST(N'2024-10-25T00:00:00.0000000' AS DateTime2), N'VCQL', 1, 1, CAST(N'2024-10-31T15:21:21.5973657' AS DateTime2))
GO
INSERT [dbo].[UserRoles] ([Id], [RoleId], [UserId]) VALUES (N'196e39dc-f75b-4af1-922e-4c7904180ed4', N'a6204804-82cf-4f94-a3e1-07cd10a8e579', N'a6ba15f2-d668-4059-a1c4-5b0deda85c47')
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
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Evaluation] CHECK CONSTRAINT [FK_Evaluation_CategoryTimeType_CategoryTimeTypeId]
GO
ALTER TABLE [dbo].[Evaluation]  WITH CHECK ADD  CONSTRAINT [FK_Evaluation_Unit_UnitId] FOREIGN KEY([UnitId])
REFERENCES [dbo].[Unit] ([Id])
GO
ALTER TABLE [dbo].[Evaluation] CHECK CONSTRAINT [FK_Evaluation_Unit_UnitId]
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
