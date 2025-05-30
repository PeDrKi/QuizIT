CREATE DATABASE QuizIT
GO
USE [QuizIT]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 12/20/2024 14:07:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [nvarchar](255) NOT NULL,
	[CreateAt] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Exam]    Script Date: 12/20/2024 14:07:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Exam](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CategoryId] [int] NOT NULL,
	[ExamName] [nvarchar](255) NOT NULL,
	[Time] [int] NOT NULL,
	[CreateAt] [datetime] NOT NULL,
	[CreateBy] [int] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[Level] [int] NULL,
 CONSTRAINT [PK__Exam__3214EC0716BD7875] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ExamDetail]    Script Date: 12/20/2024 14:07:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ExamDetail](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ExamId] [int] NOT NULL,
	[QuestionId] [int] NOT NULL,
	[Order] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[History]    Script Date: 12/20/2024 14:07:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[History](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ExamId] [int] NOT NULL,
	[UserId] [int] NOT NULL,
	[TimeDoExam] [float] NOT NULL,
	[Point] [int] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[JsonExamp] [ntext] NULL,
	[SessionId] [uniqueidentifier] NULL,
 CONSTRAINT [PK__History__3214EC07B7B0CB94] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HistoryDetail]    Script Date: 12/20/2024 14:07:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HistoryDetail](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[HistoryId] [int] NOT NULL,
	[QuestionId] [int] NOT NULL,
	[AnswerSelect] [varchar](1) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Question]    Script Date: 12/20/2024 14:07:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Question](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CategoryId] [int] NOT NULL,
	[Content] [nvarchar](max) NOT NULL,
	[AnswerA] [nvarchar](max) NOT NULL,
	[AnswerB] [nvarchar](max) NOT NULL,
	[AnswerC] [nvarchar](max) NOT NULL,
	[AnswerD] [nvarchar](max) NOT NULL,
	[AnswerCorrect] [varchar](1) NOT NULL,
	[CreatedAt] [date] NOT NULL,
	[CreatedBy] [int] NOT NULL,
 CONSTRAINT [PK__Question__3214EC073B688396] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rank]    Script Date: 12/20/2024 14:07:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rank](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ExamId] [int] NOT NULL,
	[UserId] [int] NOT NULL,
	[TimeDoExam] [float] NOT NULL,
	[Point] [int] NOT NULL,
 CONSTRAINT [PK__Rank__3214EC07CEA21799] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 12/20/2024 14:07:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](255) NOT NULL,
	[CreateAt] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 12/20/2024 14:07:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleId] [int] NOT NULL,
	[FullName] [nvarchar](255) NOT NULL,
	[UserName] [nvarchar](255) NOT NULL,
	[Password] [nvarchar](255) NOT NULL,
	[CreateAt] [datetime] NOT NULL,
	[ConfirmToken] [nvarchar](100) NULL,
	[IsActive] [bit] NULL,
	[Email] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([Id], [CategoryName], [CreateAt]) VALUES (1005, N'Cơ sở dữ liệu', CAST(N'2023-06-04T10:00:26.127' AS DateTime))
INSERT [dbo].[Category] ([Id], [CategoryName], [CreateAt]) VALUES (1006, N'Java', CAST(N'2023-06-04T10:00:30.960' AS DateTime))
INSERT [dbo].[Category] ([Id], [CategoryName], [CreateAt]) VALUES (1007, N'Mạng máy tính', CAST(N'2023-06-04T10:00:36.117' AS DateTime))
INSERT [dbo].[Category] ([Id], [CategoryName], [CreateAt]) VALUES (1008, N'chu de new', CAST(N'2024-05-14T13:32:56.700' AS DateTime))
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
SET IDENTITY_INSERT [dbo].[Exam] ON 

INSERT [dbo].[Exam] ([Id], [CategoryId], [ExamName], [Time], [CreateAt], [CreateBy], [IsActive], [Level]) VALUES (1, 1006, N'Đề trắc nghiệm Java số 1', 1, CAST(N'2023-06-04T10:31:13.280' AS DateTime), 3, 1, 1)
INSERT [dbo].[Exam] ([Id], [CategoryId], [ExamName], [Time], [CreateAt], [CreateBy], [IsActive], [Level]) VALUES (2, 1006, N'Đề trắc nghiệm Java số 2', 15, CAST(N'2023-06-04T10:37:03.733' AS DateTime), 3, 1, 1)
INSERT [dbo].[Exam] ([Id], [CategoryId], [ExamName], [Time], [CreateAt], [CreateBy], [IsActive], [Level]) VALUES (3, 1007, N'Đề trắc nghiệm Mạng máy tính số 1', 10, CAST(N'2023-06-04T10:48:19.070' AS DateTime), 3, 1, 1)
INSERT [dbo].[Exam] ([Id], [CategoryId], [ExamName], [Time], [CreateAt], [CreateBy], [IsActive], [Level]) VALUES (4, 1007, N'Đề ôn Mạng máy tính', 15, CAST(N'2023-06-04T10:48:58.350' AS DateTime), 3, 1, 1)
INSERT [dbo].[Exam] ([Id], [CategoryId], [ExamName], [Time], [CreateAt], [CreateBy], [IsActive], [Level]) VALUES (5, 1006, N'Đề ôn Java', 30, CAST(N'2023-06-04T10:49:57.907' AS DateTime), 3, 1, 1)
INSERT [dbo].[Exam] ([Id], [CategoryId], [ExamName], [Time], [CreateAt], [CreateBy], [IsActive], [Level]) VALUES (6, 1007, N'Đề trắc nghiệm Mạng máy tính số 2', 15, CAST(N'2023-06-05T10:09:00.950' AS DateTime), 3, 1, 1)
INSERT [dbo].[Exam] ([Id], [CategoryId], [ExamName], [Time], [CreateAt], [CreateBy], [IsActive], [Level]) VALUES (7, 1007, N'Đề ôn mạng máy tính', 15, CAST(N'2023-06-05T10:30:48.717' AS DateTime), 3, 1, 1)
INSERT [dbo].[Exam] ([Id], [CategoryId], [ExamName], [Time], [CreateAt], [CreateBy], [IsActive], [Level]) VALUES (8, 1008, N'demo đề', 1, CAST(N'2024-05-14T13:38:15.080' AS DateTime), 3, 1, 2)
SET IDENTITY_INSERT [dbo].[Exam] OFF
GO
SET IDENTITY_INSERT [dbo].[ExamDetail] ON 

INSERT [dbo].[ExamDetail] ([Id], [ExamId], [QuestionId], [Order]) VALUES (1, 1, 1113, 1)
INSERT [dbo].[ExamDetail] ([Id], [ExamId], [QuestionId], [Order]) VALUES (2, 1, 1114, 2)
INSERT [dbo].[ExamDetail] ([Id], [ExamId], [QuestionId], [Order]) VALUES (3, 1, 1118, 3)
INSERT [dbo].[ExamDetail] ([Id], [ExamId], [QuestionId], [Order]) VALUES (4, 1, 1117, 4)
INSERT [dbo].[ExamDetail] ([Id], [ExamId], [QuestionId], [Order]) VALUES (5, 1, 1115, 5)
INSERT [dbo].[ExamDetail] ([Id], [ExamId], [QuestionId], [Order]) VALUES (9, 2, 1113, 1)
INSERT [dbo].[ExamDetail] ([Id], [ExamId], [QuestionId], [Order]) VALUES (10, 2, 1125, 18)
INSERT [dbo].[ExamDetail] ([Id], [ExamId], [QuestionId], [Order]) VALUES (11, 2, 1124, 17)
INSERT [dbo].[ExamDetail] ([Id], [ExamId], [QuestionId], [Order]) VALUES (12, 2, 1126, 16)
INSERT [dbo].[ExamDetail] ([Id], [ExamId], [QuestionId], [Order]) VALUES (13, 2, 1127, 15)
INSERT [dbo].[ExamDetail] ([Id], [ExamId], [QuestionId], [Order]) VALUES (14, 2, 1128, 14)
INSERT [dbo].[ExamDetail] ([Id], [ExamId], [QuestionId], [Order]) VALUES (15, 2, 1129, 13)
INSERT [dbo].[ExamDetail] ([Id], [ExamId], [QuestionId], [Order]) VALUES (16, 2, 1130, 12)
INSERT [dbo].[ExamDetail] ([Id], [ExamId], [QuestionId], [Order]) VALUES (17, 2, 1123, 11)
INSERT [dbo].[ExamDetail] ([Id], [ExamId], [QuestionId], [Order]) VALUES (18, 2, 1122, 10)
INSERT [dbo].[ExamDetail] ([Id], [ExamId], [QuestionId], [Order]) VALUES (19, 2, 1121, 9)
INSERT [dbo].[ExamDetail] ([Id], [ExamId], [QuestionId], [Order]) VALUES (20, 2, 1120, 8)
INSERT [dbo].[ExamDetail] ([Id], [ExamId], [QuestionId], [Order]) VALUES (21, 2, 1118, 7)
INSERT [dbo].[ExamDetail] ([Id], [ExamId], [QuestionId], [Order]) VALUES (22, 2, 1119, 6)
INSERT [dbo].[ExamDetail] ([Id], [ExamId], [QuestionId], [Order]) VALUES (23, 2, 1117, 5)
INSERT [dbo].[ExamDetail] ([Id], [ExamId], [QuestionId], [Order]) VALUES (24, 2, 1116, 4)
INSERT [dbo].[ExamDetail] ([Id], [ExamId], [QuestionId], [Order]) VALUES (25, 2, 1115, 3)
INSERT [dbo].[ExamDetail] ([Id], [ExamId], [QuestionId], [Order]) VALUES (26, 2, 1114, 2)
INSERT [dbo].[ExamDetail] ([Id], [ExamId], [QuestionId], [Order]) VALUES (27, 2, 1131, 19)
INSERT [dbo].[ExamDetail] ([Id], [ExamId], [QuestionId], [Order]) VALUES (28, 2, 1132, 20)
INSERT [dbo].[ExamDetail] ([Id], [ExamId], [QuestionId], [Order]) VALUES (29, 3, 1157, 1)
INSERT [dbo].[ExamDetail] ([Id], [ExamId], [QuestionId], [Order]) VALUES (30, 3, 1156, 2)
INSERT [dbo].[ExamDetail] ([Id], [ExamId], [QuestionId], [Order]) VALUES (31, 3, 1153, 3)
INSERT [dbo].[ExamDetail] ([Id], [ExamId], [QuestionId], [Order]) VALUES (32, 3, 1155, 4)
INSERT [dbo].[ExamDetail] ([Id], [ExamId], [QuestionId], [Order]) VALUES (33, 3, 1151, 5)
INSERT [dbo].[ExamDetail] ([Id], [ExamId], [QuestionId], [Order]) VALUES (34, 3, 1149, 6)
INSERT [dbo].[ExamDetail] ([Id], [ExamId], [QuestionId], [Order]) VALUES (35, 3, 1152, 7)
INSERT [dbo].[ExamDetail] ([Id], [ExamId], [QuestionId], [Order]) VALUES (36, 3, 1146, 8)
INSERT [dbo].[ExamDetail] ([Id], [ExamId], [QuestionId], [Order]) VALUES (37, 3, 1147, 9)
INSERT [dbo].[ExamDetail] ([Id], [ExamId], [QuestionId], [Order]) VALUES (38, 3, 1148, 10)
INSERT [dbo].[ExamDetail] ([Id], [ExamId], [QuestionId], [Order]) VALUES (39, 3, 1143, 11)
INSERT [dbo].[ExamDetail] ([Id], [ExamId], [QuestionId], [Order]) VALUES (40, 3, 1145, 12)
INSERT [dbo].[ExamDetail] ([Id], [ExamId], [QuestionId], [Order]) VALUES (41, 4, 1143, 1)
INSERT [dbo].[ExamDetail] ([Id], [ExamId], [QuestionId], [Order]) VALUES (42, 4, 1144, 2)
INSERT [dbo].[ExamDetail] ([Id], [ExamId], [QuestionId], [Order]) VALUES (43, 4, 1145, 3)
INSERT [dbo].[ExamDetail] ([Id], [ExamId], [QuestionId], [Order]) VALUES (44, 4, 1146, 4)
INSERT [dbo].[ExamDetail] ([Id], [ExamId], [QuestionId], [Order]) VALUES (45, 4, 1147, 5)
INSERT [dbo].[ExamDetail] ([Id], [ExamId], [QuestionId], [Order]) VALUES (46, 4, 1148, 6)
INSERT [dbo].[ExamDetail] ([Id], [ExamId], [QuestionId], [Order]) VALUES (47, 4, 1157, 7)
INSERT [dbo].[ExamDetail] ([Id], [ExamId], [QuestionId], [Order]) VALUES (48, 4, 1156, 8)
INSERT [dbo].[ExamDetail] ([Id], [ExamId], [QuestionId], [Order]) VALUES (49, 4, 1155, 9)
INSERT [dbo].[ExamDetail] ([Id], [ExamId], [QuestionId], [Order]) VALUES (50, 4, 1154, 10)
INSERT [dbo].[ExamDetail] ([Id], [ExamId], [QuestionId], [Order]) VALUES (51, 4, 1153, 11)
INSERT [dbo].[ExamDetail] ([Id], [ExamId], [QuestionId], [Order]) VALUES (52, 4, 1152, 12)
INSERT [dbo].[ExamDetail] ([Id], [ExamId], [QuestionId], [Order]) VALUES (53, 4, 1151, 13)
INSERT [dbo].[ExamDetail] ([Id], [ExamId], [QuestionId], [Order]) VALUES (54, 4, 1150, 14)
INSERT [dbo].[ExamDetail] ([Id], [ExamId], [QuestionId], [Order]) VALUES (55, 4, 1149, 15)
INSERT [dbo].[ExamDetail] ([Id], [ExamId], [QuestionId], [Order]) VALUES (56, 5, 1113, 1)
INSERT [dbo].[ExamDetail] ([Id], [ExamId], [QuestionId], [Order]) VALUES (57, 5, 1121, 28)
INSERT [dbo].[ExamDetail] ([Id], [ExamId], [QuestionId], [Order]) VALUES (58, 5, 1120, 27)
INSERT [dbo].[ExamDetail] ([Id], [ExamId], [QuestionId], [Order]) VALUES (59, 5, 1124, 26)
INSERT [dbo].[ExamDetail] ([Id], [ExamId], [QuestionId], [Order]) VALUES (60, 5, 1123, 25)
INSERT [dbo].[ExamDetail] ([Id], [ExamId], [QuestionId], [Order]) VALUES (61, 5, 1126, 24)
INSERT [dbo].[ExamDetail] ([Id], [ExamId], [QuestionId], [Order]) VALUES (62, 5, 1127, 23)
INSERT [dbo].[ExamDetail] ([Id], [ExamId], [QuestionId], [Order]) VALUES (63, 5, 1128, 22)
INSERT [dbo].[ExamDetail] ([Id], [ExamId], [QuestionId], [Order]) VALUES (64, 5, 1129, 21)
INSERT [dbo].[ExamDetail] ([Id], [ExamId], [QuestionId], [Order]) VALUES (65, 5, 1130, 20)
INSERT [dbo].[ExamDetail] ([Id], [ExamId], [QuestionId], [Order]) VALUES (66, 5, 1131, 19)
INSERT [dbo].[ExamDetail] ([Id], [ExamId], [QuestionId], [Order]) VALUES (67, 5, 1132, 18)
INSERT [dbo].[ExamDetail] ([Id], [ExamId], [QuestionId], [Order]) VALUES (68, 5, 1133, 17)
INSERT [dbo].[ExamDetail] ([Id], [ExamId], [QuestionId], [Order]) VALUES (69, 5, 1134, 16)
INSERT [dbo].[ExamDetail] ([Id], [ExamId], [QuestionId], [Order]) VALUES (70, 5, 1135, 15)
INSERT [dbo].[ExamDetail] ([Id], [ExamId], [QuestionId], [Order]) VALUES (71, 5, 1136, 14)
INSERT [dbo].[ExamDetail] ([Id], [ExamId], [QuestionId], [Order]) VALUES (72, 5, 1137, 13)
INSERT [dbo].[ExamDetail] ([Id], [ExamId], [QuestionId], [Order]) VALUES (73, 5, 1138, 12)
INSERT [dbo].[ExamDetail] ([Id], [ExamId], [QuestionId], [Order]) VALUES (74, 5, 1139, 11)
INSERT [dbo].[ExamDetail] ([Id], [ExamId], [QuestionId], [Order]) VALUES (75, 5, 1140, 10)
INSERT [dbo].[ExamDetail] ([Id], [ExamId], [QuestionId], [Order]) VALUES (76, 5, 1142, 9)
INSERT [dbo].[ExamDetail] ([Id], [ExamId], [QuestionId], [Order]) VALUES (77, 5, 1141, 8)
INSERT [dbo].[ExamDetail] ([Id], [ExamId], [QuestionId], [Order]) VALUES (78, 5, 1119, 7)
INSERT [dbo].[ExamDetail] ([Id], [ExamId], [QuestionId], [Order]) VALUES (79, 5, 1118, 6)
INSERT [dbo].[ExamDetail] ([Id], [ExamId], [QuestionId], [Order]) VALUES (80, 5, 1117, 5)
INSERT [dbo].[ExamDetail] ([Id], [ExamId], [QuestionId], [Order]) VALUES (81, 5, 1116, 4)
INSERT [dbo].[ExamDetail] ([Id], [ExamId], [QuestionId], [Order]) VALUES (82, 5, 1115, 3)
INSERT [dbo].[ExamDetail] ([Id], [ExamId], [QuestionId], [Order]) VALUES (83, 5, 1114, 2)
INSERT [dbo].[ExamDetail] ([Id], [ExamId], [QuestionId], [Order]) VALUES (84, 5, 1122, 29)
INSERT [dbo].[ExamDetail] ([Id], [ExamId], [QuestionId], [Order]) VALUES (85, 5, 1125, 30)
INSERT [dbo].[ExamDetail] ([Id], [ExamId], [QuestionId], [Order]) VALUES (86, 1, 1116, 6)
INSERT [dbo].[ExamDetail] ([Id], [ExamId], [QuestionId], [Order]) VALUES (87, 1, 1119, 7)
INSERT [dbo].[ExamDetail] ([Id], [ExamId], [QuestionId], [Order]) VALUES (88, 1, 1120, 8)
INSERT [dbo].[ExamDetail] ([Id], [ExamId], [QuestionId], [Order]) VALUES (89, 1, 1121, 9)
INSERT [dbo].[ExamDetail] ([Id], [ExamId], [QuestionId], [Order]) VALUES (90, 1, 1122, 10)
INSERT [dbo].[ExamDetail] ([Id], [ExamId], [QuestionId], [Order]) VALUES (91, 6, 1143, 1)
INSERT [dbo].[ExamDetail] ([Id], [ExamId], [QuestionId], [Order]) VALUES (92, 6, 1144, 2)
INSERT [dbo].[ExamDetail] ([Id], [ExamId], [QuestionId], [Order]) VALUES (93, 6, 1145, 3)
INSERT [dbo].[ExamDetail] ([Id], [ExamId], [QuestionId], [Order]) VALUES (94, 6, 1146, 4)
INSERT [dbo].[ExamDetail] ([Id], [ExamId], [QuestionId], [Order]) VALUES (95, 6, 1157, 5)
INSERT [dbo].[ExamDetail] ([Id], [ExamId], [QuestionId], [Order]) VALUES (96, 6, 1156, 6)
INSERT [dbo].[ExamDetail] ([Id], [ExamId], [QuestionId], [Order]) VALUES (97, 6, 1155, 7)
INSERT [dbo].[ExamDetail] ([Id], [ExamId], [QuestionId], [Order]) VALUES (98, 6, 1147, 8)
INSERT [dbo].[ExamDetail] ([Id], [ExamId], [QuestionId], [Order]) VALUES (99, 6, 1148, 9)
INSERT [dbo].[ExamDetail] ([Id], [ExamId], [QuestionId], [Order]) VALUES (100, 6, 1152, 10)
INSERT [dbo].[ExamDetail] ([Id], [ExamId], [QuestionId], [Order]) VALUES (101, 6, 1151, 11)
INSERT [dbo].[ExamDetail] ([Id], [ExamId], [QuestionId], [Order]) VALUES (102, 6, 1150, 12)
GO
INSERT [dbo].[ExamDetail] ([Id], [ExamId], [QuestionId], [Order]) VALUES (103, 6, 1153, 13)
INSERT [dbo].[ExamDetail] ([Id], [ExamId], [QuestionId], [Order]) VALUES (104, 6, 1154, 14)
INSERT [dbo].[ExamDetail] ([Id], [ExamId], [QuestionId], [Order]) VALUES (105, 6, 1149, 15)
INSERT [dbo].[ExamDetail] ([Id], [ExamId], [QuestionId], [Order]) VALUES (106, 7, 1150, 1)
INSERT [dbo].[ExamDetail] ([Id], [ExamId], [QuestionId], [Order]) VALUES (107, 7, 1151, 2)
INSERT [dbo].[ExamDetail] ([Id], [ExamId], [QuestionId], [Order]) VALUES (108, 7, 1154, 3)
INSERT [dbo].[ExamDetail] ([Id], [ExamId], [QuestionId], [Order]) VALUES (109, 7, 1153, 4)
INSERT [dbo].[ExamDetail] ([Id], [ExamId], [QuestionId], [Order]) VALUES (110, 7, 1152, 5)
INSERT [dbo].[ExamDetail] ([Id], [ExamId], [QuestionId], [Order]) VALUES (111, 7, 1155, 6)
INSERT [dbo].[ExamDetail] ([Id], [ExamId], [QuestionId], [Order]) VALUES (114, 7, 1143, 7)
INSERT [dbo].[ExamDetail] ([Id], [ExamId], [QuestionId], [Order]) VALUES (115, 7, 1144, 8)
INSERT [dbo].[ExamDetail] ([Id], [ExamId], [QuestionId], [Order]) VALUES (116, 7, 1145, 9)
INSERT [dbo].[ExamDetail] ([Id], [ExamId], [QuestionId], [Order]) VALUES (117, 7, 1146, 10)
INSERT [dbo].[ExamDetail] ([Id], [ExamId], [QuestionId], [Order]) VALUES (118, 7, 1147, 11)
INSERT [dbo].[ExamDetail] ([Id], [ExamId], [QuestionId], [Order]) VALUES (119, 7, 1148, 12)
INSERT [dbo].[ExamDetail] ([Id], [ExamId], [QuestionId], [Order]) VALUES (120, 7, 1149, 13)
INSERT [dbo].[ExamDetail] ([Id], [ExamId], [QuestionId], [Order]) VALUES (121, 8, 1184, 1)
INSERT [dbo].[ExamDetail] ([Id], [ExamId], [QuestionId], [Order]) VALUES (122, 8, 1182, 2)
INSERT [dbo].[ExamDetail] ([Id], [ExamId], [QuestionId], [Order]) VALUES (123, 8, 1180, 3)
INSERT [dbo].[ExamDetail] ([Id], [ExamId], [QuestionId], [Order]) VALUES (124, 8, 1178, 4)
INSERT [dbo].[ExamDetail] ([Id], [ExamId], [QuestionId], [Order]) VALUES (125, 8, 1164, 5)
INSERT [dbo].[ExamDetail] ([Id], [ExamId], [QuestionId], [Order]) VALUES (126, 8, 1136, 6)
INSERT [dbo].[ExamDetail] ([Id], [ExamId], [QuestionId], [Order]) VALUES (127, 8, 1141, 7)
SET IDENTITY_INSERT [dbo].[ExamDetail] OFF
GO
SET IDENTITY_INSERT [dbo].[History] ON 

INSERT [dbo].[History] ([Id], [ExamId], [UserId], [TimeDoExam], [Point], [CreatedAt], [JsonExamp], [SessionId]) VALUES (1053, 8, 3, 0, 0, CAST(N'2024-12-20T14:06:39.663' AS DateTime), N'{
  "$id": "1",
  "Category": {
    "$id": "2",
    "Id": 1008,
    "CategoryName": "chu de new",
    "CreateAt": "2024-05-14T13:32:56.7"
  },
  "CreateByNavigation": {
    "$id": "3",
    "Role": {
      "$id": "4",
      "User": [
        {
          "$ref": "3"
        },
        {
          "$id": "5",
          "Role": {
            "$ref": "4"
          },
          "Exam": [],
          "History": [],
          "Question": [],
          "Rank": [],
          "Id": 1,
          "RoleId": 1,
          "FullName": "Hà Duy Anh",
          "UserName": "duyanh",
          "Password": "202cb962ac59075b964b07152d234b70",
          "CreateAt": "2023-05-29T19:59:37.617",
          "ConfirmToken": null,
          "IsActive": true,
          "Email": "vietsocial@gmail.com"
        },
        {
          "$id": "6",
          "Role": {
            "$ref": "4"
          },
          "Exam": [],
          "History": [],
          "Question": [],
          "Rank": [],
          "Id": 9,
          "RoleId": 1,
          "FullName": "thanhvien",
          "UserName": "thanhvien",
          "Password": "e81c20665a765669ba51389b362ec15e",
          "CreateAt": "2024-05-14T13:33:15.56",
          "ConfirmToken": null,
          "IsActive": true,
          "Email": "vietsocial@gmail.com"
        }
      ],
      "Id": 1,
      "RoleName": "Admin",
      "CreateAt": "2023-05-23T22:16:56.967"
    },
    "Exam": [
      {
        "$ref": "1"
      },
      {
        "$id": "7",
        "Category": {
          "$id": "8",
          "Id": 1006,
          "CategoryName": "Java",
          "CreateAt": "2023-06-04T10:00:30.96"
        },
        "CreateByNavigation": {
          "$ref": "3"
        },
        "ExamDetail": [
          {
            "$id": "9",
            "Exam": {
              "$ref": "7"
            },
            "Question": {
              "$id": "10",
              "Category": {
                "$ref": "8"
              },
              "CreatedByNavigation": {
                "$ref": "3"
              },
              "ExamDetail": [
                {
                  "$ref": "9"
                },
                {
                  "$id": "11",
                  "Exam": {
                    "$id": "12",
                    "Category": {
                      "$ref": "8"
                    },
                    "CreateByNavigation": {
                      "$ref": "3"
                    },
                    "ExamDetail": [
                      {
                        "$ref": "11"
                      },
                      {
                        "$id": "13",
                        "Exam": {
                          "$ref": "12"
                        },
                        "Question": {
                          "$id": "14",
                          "Category": {
                            "$ref": "8"
                          },
                          "CreatedByNavigation": {
                            "$ref": "3"
                          },
                          "ExamDetail": [
                            {
                              "$ref": "13"
                            },
                            {
                              "$id": "15",
                              "Exam": {
                                "$id": "16",
                                "Category": {
                                  "$ref": "8"
                                },
                                "CreateByNavigation": {
                                  "$ref": "3"
                                },
                                "ExamDetail": [
                                  {
                                    "$id": "17",
                                    "Exam": {
                                      "$ref": "16"
                                    },
                                    "Question": {
                                      "$ref": "10"
                                    },
                                    "Id": 56,
                                    "ExamId": 5,
                                    "QuestionId": 1113,
                                    "Order": 1
                                  },
                                  {
                                    "$ref": "15"
                                  },
                                  {
                                    "$id": "18",
                                    "Exam": {
                                      "$ref": "16"
                                    },
                                    "Question": {
                                      "$id": "19",
                                      "Category": {
                                        "$ref": "8"
                                      },
                                      "CreatedByNavigation": {
                                        "$ref": "3"
                                      },
                                      "ExamDetail": [
                                        {
                                          "$id": "20",
                                          "Exam": {
                                            "$ref": "7"
                                          },
                                          "Question": {
                                            "$ref": "19"
                                          },
                                          "Id": 89,
                                          "ExamId": 1,
                                          "QuestionId": 1121,
                                          "Order": 9
                                        },
                                        {
                                          "$id": "21",
                                          "Exam": {
                                            "$ref": "12"
                                          },
                                          "Question": {
                                            "$ref": "19"
                                          },
                                          "Id": 19,
                                          "ExamId": 2,
                                          "QuestionId": 1121,
                                          "Order": 9
                                        },
                                        {
                                          "$ref": "18"
                                        }
                                      ],
                                      "HistoryDetail": [],
                                      "Id": 1121,
                                      "CategoryId": 1006,
                                      "Content": "Ngôn ngữ lập trình Java cung cấp các chức năng nào sau đây?",
                                      "AnswerA": "Tất cả đáp án trên",
                                      "AnswerB": "Giao diện lập trình ứng dụng",
                                      "AnswerC": "Bộ công cụ giao diện người dùng",
                                      "AnswerD": "Thư viện tích hợp",
                                      "AnswerCorrect": "A",
                                      "CreatedAt": "2023-06-04T00:00:00",
                                      "CreatedBy": 3
                                    },
                                    "Id": 57,
                                    "ExamId": 5,
                                    "QuestionId": 1121,
                                    "Order": 28
                                  },
                                  {
                                    "$id": "22",
                                    "Exam": {
                                      "$ref": "16"
                                    },
                                    "Question": {
                                      "$id": "23",
                                      "Category": {
                                        "$ref": "8"
                                      },
                                      "CreatedByNavigation": {
                                        "$ref": "3"
                                      },
                                      "ExamDetail": [
                                        {
                                          "$id": "24",
                                          "Exam": {
                                            "$ref": "7"
                                          },
                                          "Question": {
                                            "$ref": "23"
                                          },
                                          "Id": 88,
                                          "ExamId": 1,
                                          "QuestionId": 1120,
                                          "Order": 8
                                        },
                                        {
                                          "$id": "25",
                                          "Exam": {
                                            "$ref": "12"
                                          },
                                          "Question": {
                                            "$ref": "23"
                                          },
                                          "Id": 20,
                                          "ExamId": 2,
                                          "QuestionId": 1120,
                                          "Order": 8
                                        },
                                        {
                                          "$ref": "22"
                                        }
                                      ],
                                      "HistoryDetail": [],
                                      "Id": 1120,
                                      "CategoryId": 1006,
                                      "Content": "Khi biên dịch gặp lỗi Exception in thread main java.lang.NoClassDefFoundError: myprogram. Lỗi này có nghĩa gì?",
                                      "AnswerA": "Đường dẫn chương trình sai",
                                      "AnswerB": "Không có hàm main",
                                      "AnswerC": "Không khai báo class",
                                      "AnswerD": "Không có từ khóa public tại mở đầu khai báo class",
                                      "AnswerCorrect": "A",
                                      "CreatedAt": "2023-06-04T00:00:00",
                                      "CreatedBy": 3
                                    },
                                    "Id": 58,
                                    "ExamId": 5,
                                    "QuestionId": 1120,
                                    "Order": 27
                                  },
                                  {
                                    "$id": "26",
                                    "Exam": {
                                      "$ref": "16"
                                    },
                                    "Question": {
                                      "$id": "27",
                                      "Category": {
                                        "$ref": "8"
                                      },
                                      "CreatedByNavigation": {
                                        "$ref": "3"
                                      },
                                      "ExamDetail": [
                                        {
                                          "$id": "28",
                                          "Exam": {
                                            "$ref": "12"
                                          },
                                          "Question": {
                                            "$ref": "27"
                                          },
                                          "Id": 11,
                                          "ExamId": 2,
                                          "QuestionId": 1124,
                                          "Order": 17
                                        },
                                        {
                                          "$ref": "26"
                                        }
                                      ],
                                      "HistoryDetail": [],
                                      "Id": 1124,
                                      "CategoryId": 1006,
                                      "Content": "Nếu phương thức của bạn ghi đè một trong số các phương thức của lớp cha, bạn có thể gọi phương thức bị ghi đè thông qua từ khóa nào?",
                                      "AnswerA": "parent",
                                      "AnswerB": "super",
                                      "AnswerC": "this",
                                      "AnswerD": "static",
                                      "AnswerCorrect": "B",
                                      "CreatedAt": "2023-06-04T00:00:00",
                                      "CreatedBy": 3
                                    },
                                    "Id": 59,
                                    "ExamId": 5,
                                    "QuestionId": 1124,
                                    "Order": 26
                                  },
                                  {
                                    "$id": "29",
                                    "Exam": {
                                      "$ref": "16"
                                    },
                                    "Question": {
                                      "$id": "30",
                                      "Category": {
                                        "$ref": "8"
                                      },
                                      "CreatedByNavigation": {
                                        "$ref": "3"
                                      },
                                      "ExamDetail": [
                                        {
                                          "$id": "31",
                                          "Exam": {
                                            "$ref": "12"
                                          },
                                          "Question": {
                                            "$ref": "30"
                                          },
                                          "Id": 17,
                                          "ExamId": 2,
                                          "QuestionId": 1123,
                                          "Order": 11
                                        },
                                        {
                                          "$ref": "29"
                                        }
                                      ],
                                      "HistoryDetail": [],
                                      "Id": 1123,
                                      "CategoryId": 1006,
                                      "Content": "Java Virtual Machine là gì?",
                                      "AnswerA": "Là một thành phần của Java platform dùng để đọc mã bytecode trong file .class",
                                      "AnswerB": "Là chương trình biên dịch của java dùng để biên dịch file nguồn java thành mã bytecode",
                                      "AnswerC": "Là chương trình chạy cho java",
                                      "AnswerD": "Tất cả các đáp án đều đúng",
                                      "AnswerCorrect": "A",
                                      "CreatedAt": "2023-06-04T00:00:00",
                                      "CreatedBy": 3
                                    },
                                    "Id": 60,
                                    "ExamId": 5,
                                    "QuestionId": 1123,
                                    "Order": 25
                                  },
                                  {
                                    "$id": "32",
                                    "Exam": {
                                      "$ref": "16"
                                    },
                                    "Question": {
                                      "$id": "33",
                                      "Category": {
                                        "$ref": "8"
                                      },
                                      "CreatedByNavigation": {
                                        "$ref": "3"
                                      },
                                      "ExamDetail": [
                                        {
                                          "$id": "34",
                                          "Exam": {
                                            "$ref": "12"
                                          },
                                          "Question": {
                                            "$ref": "33"
                                          },
                                          "Id": 12,
                                          "ExamId": 2,
                                          "QuestionId": 1126,
                                          "Order": 16
                                        },
                                        {
                                          "$ref": "32"
                                        }
                                      ],
                                      "HistoryDetail": [],
                                      "Id": 1126,
                                      "CategoryId": 1006,
                                      "Content": "Trong các khai báo sau đâu là khai báo không hợp lệ?",
                                      "AnswerA": "int a1[][] = new int[][3]",
                                      "AnswerB": "int a2[][] = new int[2][3]",
                                      "AnswerC": "int a3[][] = new int[2][]",
                                      "AnswerD": "int a4[][] = {{}, {}, {}}",
                                      "AnswerCorrect": "A",
                                      "CreatedAt": "2023-06-04T00:00:00",
                                      "CreatedBy": 3
                                    },
                                    "Id": 61,
                                    "ExamId": 5,
                                    "QuestionId": 1126,
                                    "Order": 24
                                  },
                                  {
                                    "$id": "35",
                                    "Exam": {
                                      "$ref": "16"
                                    },
                                    "Question": {
                                      "$id": "36",
                                      "Category": {
                                        "$ref": "8"
                                      },
                                      "CreatedByNavigation": {
                                        "$ref": "3"
                                      },
                                      "ExamDetail": [
                                        {
                                          "$id": "37",
                                          "Exam": {
                                            "$ref": "12"
                                          },
                                          "Question": {
                                            "$ref": "36"
                                          },
                                          "Id": 13,
                                          "ExamId": 2,
                                          "QuestionId": 1127,
                                          "Order": 15
                                        },
                                        {
                                          "$ref": "35"
                                        }
                                      ],
                                      "HistoryDetail": [],
                                      "Id": 1127,
                                      "CategoryId": 1006,
                                      "Content": "Có mấy cách để truyền tham số vào cho một phương thức?",
                                      "AnswerA": "2",
                                      "AnswerB": "1",
                                      "AnswerC": "3",
                                      "AnswerD": "4",
                                      "AnswerCorrect": "A",
                                      "CreatedAt": "2023-06-04T00:00:00",
                                      "CreatedBy": 3
                                    },
                                    "Id": 62,
                                    "ExamId": 5,
                                    "QuestionId": 1127,
                                    "Order": 23
                                  },
                                  {
                                    "$id": "38",
                                    "Exam": {
                                      "$ref": "16"
                                    },
                                    "Question": {
                                      "$id": "39",
                                      "Category": {
                                        "$ref": "8"
                                      },
                                      "CreatedByNavigation": {
                                        "$ref": "3"
                                      },
                                      "ExamDetail": [
                                        {
                                          "$id": "40",
                                          "Exam": {
                                            "$ref": "12"
                                          },
                                          "Question": {
                                            "$ref": "39"
                                          },
                                          "Id": 14,
                                          "ExamId": 2,
                                          "QuestionId": 1128,
                                          "Order": 14
                                        },
                                        {
                                          "$ref": "38"
                                        }
                                      ],
                                      "HistoryDetail": [],
                                      "Id": 1128,
                                      "CategoryId": 1006,
                                      "Content": "Đâu là khai báo biến hợp lệ?",
                                      "AnswerA": "theOne",
                                      "AnswerB": "the One",
                                      "AnswerC": "1the_One",
                                      "AnswerD": "$the One",
                                      "AnswerCorrect": "A",
                                      "CreatedAt": "2023-06-04T00:00:00",
                                      "CreatedBy": 3
                                    },
                                    "Id": 63,
                                    "ExamId": 5,
                                    "QuestionId": 1128,
                                    "Order": 22
                                  },
                                  {
                                    "$id": "41",
                                    "Exam": {
                                      "$ref": "16"
                                    },
                                    "Question": {
                                      "$id": "42",
                                      "Category": {
                                        "$ref": "8"
                                      },
                                      "CreatedByNavigation": {
                                        "$ref": "3"
                                      },
                                      "ExamDetail": [
                                        {
                                          "$id": "43",
                                          "Exam": {
                                            "$ref": "12"
                                          },
                                          "Question": {
                                            "$ref": "42"
                                          },
                                          "Id": 15,
                                          "ExamId": 2,
                                          "QuestionId": 1129,
                                          "Order": 13
                                        },
                                        {
                                          "$ref": "41"
                                        }
                                      ],
                                      "HistoryDetail": [],
                                      "Id": 1129,
                                      "CategoryId": 1006,
                                      "Content": "Với giá trị nào của x, thì biểu thức x % 3 == 0 trả về true với x là kiểu số nguyên?",
                                      "AnswerA": "2",
                                      "AnswerB": "7",
                                      "AnswerC": "4",
                                      "AnswerD": "9",
                                      "AnswerCorrect": "D",
                                      "CreatedAt": "2023-06-04T00:00:00",
                                      "CreatedBy": 3
                                    },
                                    "Id": 64,
                                    "ExamId": 5,
                                    "QuestionId": 1129,
                                    "Order": 21
                                  },
                                  {
                                    "$id": "44",
                                    "Exam": {
                                      "$ref": "16"
                                    },
                                    "Question": {
                                      "$id": "45",
                                      "Category": {
                                        "$ref": "8"
                                      },
                                      "CreatedByNavigation": {
                                        "$ref": "3"
                                      },
                                      "ExamDetail": [
                                        {
                                          "$id": "46",
                                          "Exam": {
                                            "$ref": "12"
                                          },
                                          "Question": {
                                            "$ref": "45"
                                          },
                                          "Id": 16,
                                          "ExamId": 2,
                                          "QuestionId": 1130,
                                          "Order": 12
                                        },
                                        {
                                          "$ref": "44"
                                        }
                                      ],
                                      "HistoryDetail": [],
                                      "Id": 1130,
                                      "CategoryId": 1006,
                                      "Content": "Kiểu dữ liệu nào trong Java chứa giá trị bao gồm cả chữ và số?",
                                      "AnswerA": "int",
                                      "AnswerB": "byte",
                                      "AnswerC": "char",
                                      "AnswerD": "String",
                                      "AnswerCorrect": "D",
                                      "CreatedAt": "2023-06-04T00:00:00",
                                      "CreatedBy": 3
                                    },
                                    "Id": 65,
                                    "ExamId": 5,
                                    "QuestionId": 1130,
                                    "Order": 20
                                  },
                                  {
                                    "$id": "47",
                                    "Exam": {
                                      "$ref": "16"
                                    },
                                    "Question": {
                                      "$id": "48",
                                      "Category": {
                                        "$ref": "8"
                                      },
                                      "CreatedByNavigation": {
                                        "$ref": "3"
                                      },
                                      "ExamDetail": [
                                        {
                                          "$id": "49",
                                          "Exam": {
                                            "$ref": "12"
                                          },
                                          "Question": {
                                            "$ref": "48"
                                          },
                                          "Id": 27,
                                          "ExamId": 2,
                                          "QuestionId": 1131,
                                          "Order": 19
                                        },
                                        {
                                          "$ref": "47"
                                        }
                                      ],
                                      "HistoryDetail": [],
                                      "Id": 1131,
                                      "CategoryId": 1006,
                                      "Content": "Đối tượng trong Java là gì?",
                                      "AnswerA": "Các lớp được tạo thể hiện từ đó",
                                      "AnswerB": "Một thể hiện của lớp",
                                      "AnswerC": "Một tham chiếu đến một thuộc tính",
                                      "AnswerD": "Một biến",
                                      "AnswerCorrect": "B",
                                      "CreatedAt": "2023-06-04T00:00:00",
                                      "CreatedBy": 3
                                    },
                                    "Id": 66,
                                    "ExamId": 5,
                                    "QuestionId": 1131,
                                    "Order": 19
                                  },
                                  {
                                    "$id": "50",
                                    "Exam": {
                                      "$ref": "16"
                                    },
                                    "Question": {
                                      "$id": "51",
                                      "Category": {
                                        "$ref": "8"
                                      },
                                      "CreatedByNavigation": {
                                        "$ref": "3"
                                      },
                                      "ExamDetail": [
                                        {
                                          "$id": "52",
                                          "Exam": {
                                            "$ref": "12"
                                          },
                                          "Question": {
                                            "$ref": "51"
                                          },
                                          "Id": 28,
                                          "ExamId": 2,
                                          "QuestionId": 1132,
                                          "Order": 20
                                        },
                                        {
                                          "$ref": "50"
                                        }
                                      ],
                                      "HistoryDetail": [],
                                      "Id": 1132,
                                      "CategoryId": 1006,
                                      "Content": "Đâu không phải là thành phần trong cấu trúc của lớp trong Java.",
                                      "AnswerA": "Tên lớp",
                                      "AnswerB": "Thuộc tính",
                                      "AnswerC": "Phương thức",
                                      "AnswerD": "Biến",
                                      "AnswerCorrect": "D",
                                      "CreatedAt": "2023-06-04T00:00:00",
                                      "CreatedBy": 3
                                    },
                                    "Id": 67,
                                    "ExamId": 5,
                                    "QuestionId": 1132,
                                    "Order": 18
                                  },
                                  {
                                    "$id": "53",
                                    "Exam": {
                                      "$ref": "16"
                                    },
                                    "Question": {
                                      "$id": "54",
                                      "Category": {
                                        "$ref": "8"
                                      },
                                      "CreatedByNavigation": {
                                        "$ref": "3"
                                      },
                                      "ExamDetail": [
                                        {
                                          "$ref": "53"
                                        }
                                      ],
                                      "HistoryDetail": [],
                                      "Id": 1133,
                                      "CategoryId": 1006,
                                      "Content": "Giả sử đã định nghĩa lớp XX với một phương thức thông thường là Display, sau đó sinh ra đối tượng objX từ lớp XX. Để gọi phương thức Display ta sử dụng cú pháp nào?",
                                      "AnswerA": "XX.Display;",
                                      "AnswerB": "XX.Display();",
                                      "AnswerC": "objX.Display();",
                                      "AnswerD": "Display();",
                                      "AnswerCorrect": "C",
                                      "CreatedAt": "2023-06-04T00:00:00",
                                      "CreatedBy": 3
                                    },
                                    "Id": 68,
                                    "ExamId": 5,
                                    "QuestionId": 1133,
                                    "Order": 17
                                  },
                                  {
                                    "$id": "55",
                                    "Exam": {
                                      "$ref": "16"
                                    },
                                    "Question": {
                                      "$id": "56",
                                      "Category": {
                                        "$ref": "8"
                                      },
                                      "CreatedByNavigation": {
                                        "$ref": "3"
                                      },
                                      "ExamDetail": [
                                        {
                                          "$ref": "55"
                                        }
                                      ],
                                      "HistoryDetail": [],
                                      "Id": 1134,
                                      "CategoryId": 1006,
                                      "Content": "Tên đầu tiên của Java là gì?",
                                      "AnswerA": "Java",
                                      "AnswerB": "Oak",
                                      "AnswerC": "Cafe",
                                      "AnswerD": "James golings",
                                      "AnswerCorrect": "B",
                                      "CreatedAt": "2023-06-04T00:00:00",
                                      "CreatedBy": 3
                                    },
                                    "Id": 69,
                                    "ExamId": 5,
                                    "QuestionId": 1134,
                                    "Order": 16
                                  },
                                  {
                                    "$id": "57",
                                    "Exam": {
                                      "$ref": "16"
                                    },
                                    "Question": {
                                      "$id": "58",
                                      "Category": {
                                        "$ref": "8"
                                      },
                                      "CreatedByNavigation": {
                                        "$ref": "3"
                                      },
                                      "ExamDetail": [
                                        {
                                          "$ref": "57"
                                        }
                                      ],
                                      "HistoryDetail": [],
                                      "Id": 1135,
                                      "CategoryId": 1006,
                                      "Content": "Gói nào trong java chứa lớp Scanner dùng để nhập dữ liệu từ bàn phím?",
                                      "AnswerA": "java.net",
                                      "AnswerB": "java.io",
                                      "AnswerC": "java.util",
                                      "AnswerD": "java.awt",
                                      "AnswerCorrect": "C",
                                      "CreatedAt": "2023-06-04T00:00:00",
                                      "CreatedBy": 3
                                    },
                                    "Id": 70,
                                    "ExamId": 5,
                                    "QuestionId": 1135,
                                    "Order": 15
                                  },
                                  {
                                    "$id": "59",
                                    "Exam": {
                                      "$ref": "16"
                                    },
                                    "Question": {
                                      "$id": "60",
                                      "Category": {
                                        "$ref": "8"
                                      },
                                      "CreatedByNavigation": {
                                        "$ref": "3"
                                      },
                                      "ExamDetail": [
                                        {
                                          "$id": "61",
                                          "Exam": {
                                            "$ref": "1"
                                          },
                                          "Question": {
                                            "$ref": "60"
                                          },
                                          "Id": 126,
                                          "ExamId": 8,
                                          "QuestionId": 1136,
                                          "Order": 6
                                        },
                                        {
                                          "$ref": "59"
                                        }
                                      ],
                                      "HistoryDetail": [],
                                      "Id": 1136,
                                      "CategoryId": 1006,
                                      "Content": "Đâu là khai báo đúng về lớp Cat?",
                                      "AnswerA": "class public Cat{}",
                                      "AnswerB": "public class Cat{}",
                                      "AnswerC": "interface Cat{}",
                                      "AnswerD": "static Cat{}",
                                      "AnswerCorrect": "B",
                                      "CreatedAt": "2023-06-04T00:00:00",
                                      "CreatedBy": 3
                                    },
                                    "Id": 71,
                                    "ExamId": 5,
                                    "QuestionId": 1136,
                                    "Order": 14
                                  },
                                  {
                                    "$id": "62",
                                    "Exam": {
                                      "$ref": "16"
                                    },
                                    "Question": {
                                      "$id": "63",
                                      "Category": {
                                        "$ref": "8"
                                      },
                                      "CreatedByNavigation": {
                                        "$ref": "3"
                                      },
                                      "ExamDetail": [
                                        {
                                          "$ref": "62"
                                        }
                                      ],
                                      "HistoryDetail": [],
                                      "Id": 1137,
                                      "CategoryId": 1006,
                                      "Content": "Muốn chạy được chương trình Java, chỉ cần cài phần mền nào sau đây?",
                                      "AnswerA": "JDK",
                                      "AnswerB": "Java Platform",
                                      "AnswerC": "Eclipse",
                                      "AnswerD": "Netbeans",
                                      "AnswerCorrect": "B",
                                      "CreatedAt": "2023-06-04T00:00:00",
                                      "CreatedBy": 3
                                    },
                                    "Id": 72,
                                    "ExamId": 5,
                                    "QuestionId": 1137,
                                    "Order": 13
                                  },
                                  {
                                    "$id": "64",
                                    "Exam": {
                                      "$ref": "16"
                                    },
                                    "Question": {
                                      "$id": "65",
                                      "Category": {
                                        "$ref": "8"
                                      },
                                      "CreatedByNavigation": {
                                        "$ref": "3"
                                      },
                                      "ExamDetail": [
                                        {
                                          "$ref": "64"
                                        }
                                      ],
                                      "HistoryDetail": [],
                                      "Id": 1138,
                                      "CategoryId": 1006,
                                      "Content": "Phương thức next() của lớp Scanner dùng để làm gì?",
                                      "AnswerA": "Nhập một chuỗi",
                                      "AnswerB": "Nhập một số nguyên",
                                      "AnswerC": "Nhập một ký tự",
                                      "AnswerD": "Không có phương thức này",
                                      "AnswerCorrect": "A",
                                      "CreatedAt": "2023-06-04T00:00:00",
                                      "CreatedBy": 3
                                    },
                                    "Id": 73,
                                    "ExamId": 5,
                                    "QuestionId": 1138,
                                    "Order": 12
                                  },
                                  {
                                    "$id": "66",
                                    "Exam": {
                                      "$ref": "16"
                                    },
                                    "Question": {
                                      "$id": "67",
                                      "Category": {
                                        "$ref": "8"
                                      },
                                      "CreatedByNavigation": {
                                        "$ref": "3"
                                      },
                                      "ExamDetail": [
                                        {
                                          "$ref": "66"
                                        }
                                      ],
                                      "HistoryDetail": [],
                                      "Id": 1139,
                                      "CategoryId": 1006,
                                      "Content": "Trong câu lệnh sau: public static void main(String[] agrs) thì phần tử agrs[0] chứa giá trị gì?",
                                      "AnswerA": "Tên của chương trình",
                                      "AnswerB": "Số lượng tham số",
                                      "AnswerC": "Tham số đầu tiên trong danh sách tham số",
                                      "AnswerD": "Không câu nào đúng",
                                      "AnswerCorrect": "C",
                                      "CreatedAt": "2023-06-04T00:00:00",
                                      "CreatedBy": 3
                                    },
                                    "Id": 74,
                                    "ExamId": 5,
                                    "QuestionId": 1139,
                                    "Order": 11
                                  },
                                  {
                                    "$id": "68",
                                    "Exam": {
                                      "$ref": "16"
                                    },
                                    "Question": {
                                      "$id": "69",
                                      "Category": {
                                        "$ref": "8"
                                      },
                                      "CreatedByNavigation": {
                                        "$ref": "3"
                                      },
                                      "ExamDetail": [
                                        {
                                          "$ref": "68"
                                        }
                                      ],
                                      "HistoryDetail": [],
                                      "Id": 1140,
                                      "CategoryId": 1006,
                                      "Content": "Đâu không phải là một kiểu dữ liệu nguyên thủy trong Java?",
                                      "AnswerA": "double",
                                      "AnswerB": "int",
                                      "AnswerC": "long",
                                      "AnswerD": "long float",
                                      "AnswerCorrect": "D",
                                      "CreatedAt": "2023-06-04T00:00:00",
                                      "CreatedBy": 3
                                    },
                                    "Id": 75,
                                    "ExamId": 5,
                                    "QuestionId": 1140,
                                    "Order": 10
                                  },
                                  {
                                    "$id": "70",
                                    "Exam": {
                                      "$ref": "16"
                                    },
                                    "Question": {
                                      "$id": "71",
                                      "Category": {
                                        "$ref": "8"
                                      },
                                      "CreatedByNavigation": {
                                        "$ref": "3"
                                      },
                                      "ExamDetail": [
                                        {
                                          "$ref": "70"
                                        }
                                      ],
                                      "HistoryDetail": [],
                                      "Id": 1142,
                                      "CategoryId": 1006,
                                      "Content": "Biến dữ liệu là các biến dạng nào sau đây?",
                                      "AnswerA": "Biến lớp và Tham số",
                                      "AnswerB": "Biến cục bộ và Tham số",
                                      "AnswerC": "Biến cục bộ và biến lớp",
                                      "AnswerD": "Các đáp án đều sai",
                                      "AnswerCorrect": "B",
                                      "CreatedAt": "2023-06-04T00:00:00",
                                      "CreatedBy": 3
                                    },
                                    "Id": 76,
                                    "ExamId": 5,
                                    "QuestionId": 1142,
                                    "Order": 9
                                  },
                                  {
                                    "$id": "72",
                                    "Exam": {
                                      "$ref": "16"
                                    },
                                    "Question": {
                                      "$id": "73",
                                      "Category": {
                                        "$ref": "8"
                                      },
                                      "CreatedByNavigation": {
                                        "$ref": "3"
                                      },
                                      "ExamDetail": [
                                        {
                                          "$id": "74",
                                          "Exam": {
                                            "$ref": "1"
                                          },
                                          "Question": {
                                            "$ref": "73"
                                          },
                                          "Id": 127,
                                          "ExamId": 8,
                                          "QuestionId": 1141,
                                          "Order": 7
                                        },
                                        {
                                          "$ref": "72"
                                        }
                                      ],
                                      "HistoryDetail": [],
                                      "Id": 1141,
                                      "CategoryId": 1006,
                                      "Content": "Trong Java, kiểu dữ liệu nào là một địa chỉ của đối tượng hoặc một mảng được tạo ra trong bộ nhớ?",
                                      "AnswerA": "Kiểu format",
                                      "AnswerB": "Không có đáp án đúng",
                                      "AnswerC": "Kiểu primitive",
                                      "AnswerD": "Kiểu reference",
                                      "AnswerCorrect": "D",
                                      "CreatedAt": "2023-06-04T00:00:00",
                                      "CreatedBy": 3
                                    },
                                    "Id": 77,
                                    "ExamId": 5,
                                    "QuestionId": 1141,
                                    "Order": 8
                                  },
                                  {
                                    "$id": "75",
                                    "Exam": {
                                      "$ref": "16"
                                    },
                                    "Question": {
                                      "$id": "76",
                                      "Category": {
                                        "$ref": "8"
                                      },
                                      "CreatedByNavigation": {
                                        "$ref": "3"
                                      },
                                      "ExamDetail": [
                                        {
                                          "$id": "77",
                                          "Exam": {
                                            "$ref": "7"
                                          },
                                          "Question": {
                                            "$ref": "76"
                                          },
                                          "Id": 87,
                                          "ExamId": 1,
                                          "QuestionId": 1119,
                                          "Order": 7
                                        },
                                        {
                                          "$id": "78",
                                          "Exam": {
                                            "$ref": "12"
                                          },
                                          "Question": {
                                            "$ref": "76"
                                          },
                                          "Id": 22,
                                          "ExamId": 2,
                                          "QuestionId": 1119,
                                          "Order": 6
                                        },
                                        {
                                          "$ref": "75"
                                        }
                                      ],
                                      "HistoryDetail": [],
                                      "Id": 1119,
                                      "CategoryId": 1006,
                                      "Content": "Một lớp trong Java có thể có bao nhiêu lớp cha?",
                                      "AnswerA": "2",
                                      "AnswerB": "1",
                                      "AnswerC": "3",
                                      "AnswerD": "4",
                                      "AnswerCorrect": "B",
                                      "CreatedAt": "2023-06-04T00:00:00",
                                      "CreatedBy": 3
                                    },
                                    "Id": 78,
                                    "ExamId": 5,
                                    "QuestionId": 1119,
                                    "Order": 7
                                  },
                                  {
                                    "$id": "79",
                                    "Exam": {
                                      "$ref": "16"
                                    },
                                    "Question": {
                                      "$id": "80",
                                      "Category": {
                                        "$ref": "8"
                                      },
                                      "CreatedByNavigation": {
                                        "$ref": "3"
                                      },
                                      "ExamDetail": [
                                        {
                                          "$id": "81",
                                          "Exam": {
                                            "$ref": "7"
                                          },
                                          "Question": {
                                            "$ref": "80"
                                          },
                                          "Id": 3,
                                          "ExamId": 1,
                                          "QuestionId": 1118,
                                          "Order": 3
                                        },
                                        {
                                          "$id": "82",
                                          "Exam": {
                                            "$ref": "12"
                                          },
                                          "Question": {
                                            "$ref": "80"
                                          },
                                          "Id": 21,
                                          "ExamId": 2,
                                          "QuestionId": 1118,
                                          "Order": 7
                                        },
                                        {
                                          "$ref": "79"
                                        }
                                      ],
                                      "HistoryDetail": [],
                                      "Id": 1118,
                                      "CategoryId": 1006,
                                      "Content": "Một lớp trong Java có bao nhiêu lớp con?",
                                      "AnswerA": "2",
                                      "AnswerB": "3",
                                      "AnswerC": "Vô số",
                                      "AnswerD": "4",
                                      "AnswerCorrect": "C",
                                      "CreatedAt": "2023-06-04T00:00:00",
                                      "CreatedBy": 3
                                    },
                                    "Id": 79,
                                    "ExamId": 5,
                                    "QuestionId": 1118,
                                    "Order": 6
                                  },
                                  {
                                    "$id": "83",
                                    "Exam": {
                                      "$ref": "16"
                                    },
                                    "Question": {
                                      "$id": "84",
                                      "Category": {
                                        "$ref": "8"
                                      },
                                      "CreatedByNavigation": {
                                        "$ref": "3"
                                      },
                                      "ExamDetail": [
                                        {
                                          "$id": "85",
                                          "Exam": {
                                            "$ref": "7"
                                          },
                                          "Question": {
                                            "$ref": "84"
                                          },
                                          "Id": 4,
                                          "ExamId": 1,
                                          "QuestionId": 1117,
                                          "Order": 4
                                        },
                                        {
                                          "$id": "86",
                                          "Exam": {
                                            "$ref": "12"
                                          },
                                          "Question": {
                                            "$ref": "84"
                                          },
                                          "Id": 23,
                                          "ExamId": 2,
                                          "QuestionId": 1117,
                                          "Order": 5
                                        },
                                        {
                                          "$ref": "83"
                                        }
                                      ],
                                      "HistoryDetail": [],
                                      "Id": 1117,
                                      "CategoryId": 1006,
                                      "Content": "Kiểu enum là gì?",
                                      "AnswerA": "Là kiểu dữ liệu gồm các trường chứa một tập hợp cố định các hằng số",
                                      "AnswerB": "Là kiểu dữ liệu liệt kê các biến số",
                                      "AnswerC": "Là một kiểu dữ liệu trong java",
                                      "AnswerD": "Tất cả đều sai",
                                      "AnswerCorrect": "A",
                                      "CreatedAt": "2023-06-04T00:00:00",
                                      "CreatedBy": 3
                                    },
                                    "Id": 80,
                                    "ExamId": 5,
                                    "QuestionId": 1117,
                                    "Order": 5
                                  },
                                  {
                                    "$id": "87",
                                    "Exam": {
                                      "$ref": "16"
                                    },
                                    "Question": {
                                      "$id": "88",
                                      "Category": {
                                        "$ref": "8"
                                      },
                                      "CreatedByNavigation": {
                                        "$ref": "3"
                                      },
                                      "ExamDetail": [
                                        {
                                          "$id": "89",
                                          "Exam": {
                                            "$ref": "7"
                                          },
                                          "Question": {
                                            "$ref": "88"
                                          },
                                          "Id": 86,
                                          "ExamId": 1,
                                          "QuestionId": 1116,
                                          "Order": 6
                                        },
                                        {
                                          "$id": "90",
                                          "Exam": {
                                            "$ref": "12"
                                          },
                                          "Question": {
                                            "$ref": "88"
                                          },
                                          "Id": 24,
                                          "ExamId": 2,
                                          "QuestionId": 1116,
                                          "Order": 4
                                        },
                                        {
                                          "$ref": "87"
                                        }
                                      ],
                                      "HistoryDetail": [],
                                      "Id": 1116,
                                      "CategoryId": 1006,
                                      "Content": "Phạm vi truy cập của một đối tượng khi được khai bao protected là gì?",
                                      "AnswerA": "Có thể được truy cập từ bất kỳ vị trí nào trong chương trình",
                                      "AnswerB": "Có thể được truy cập từ các lớp trong cùng package",
                                      "AnswerC": "Có thể được truy cập từ các lớp trong cùng package và lớp con nằm trong package khác",
                                      "AnswerD": "Chỉ có thể truy cập từ các phương thức khác trong class đó",
                                      "AnswerCorrect": "C",
                                      "CreatedAt": "2023-06-04T00:00:00",
                                      "CreatedBy": 3
                                    },
                                    "Id": 81,
                                    "ExamId": 5,
                                    "QuestionId": 1116,
                                    "Order": 4
                                  },
                                  {
                                    "$id": "91",
                                    "Exam": {
                                      "$ref": "16"
                                    },
                                    "Question": {
                                      "$id": "92",
                                      "Category": {
                                        "$ref": "8"
                                      },
                                      "CreatedByNavigation": {
                                        "$ref": "3"
                                      },
                                      "ExamDetail": [
                                        {
                                          "$id": "93",
                                          "Exam": {
                                            "$ref": "7"
                                          },
                                          "Question": {
                                            "$ref": "92"
                                          },
                                          "Id": 5,
                                          "ExamId": 1,
                                          "QuestionId": 1115,
                                          "Order": 5
                                        },
                                        {
                                          "$id": "94",
                                          "Exam": {
                                            "$ref": "12"
                                          },
                                          "Question": {
                                            "$ref": "92"
                                          },
                                          "Id": 25,
                                          "ExamId": 2,
                                          "QuestionId": 1115,
                                          "Order": 3
                                        },
                                        {
                                          "$ref": "91"
                                        }
                                      ],
                                      "HistoryDetail": [],
                                      "Id": 1115,
                                      "CategoryId": 1006,
                                      "Content": "Phạm vi truy cập của một đối tượng khi được khai báo public là gì?",
                                      "AnswerA": "Có thể được truy cập từ bất kỳ vị trí nào trong chương trình",
                                      "AnswerB": "Có thể được truy cập từ các lớp trong cùng package",
                                      "AnswerC": "Có thể được truy cập từ các lớp trong cùng package và lớp con nằm trong package khác",
                                      "AnswerD": "Chỉ có thể truy cập từ các phương thức khác trong class đó",
                                      "AnswerCorrect": "A",
                                      "CreatedAt": "2023-06-04T00:00:00",
                                      "CreatedBy": 3
                                    },
                                    "Id": 82,
                                    "ExamId": 5,
                                    "QuestionId": 1115,
                                    "Order": 3
                                  },
                                  {
                                    "$id": "95",
                                    "Exam": {
                                      "$ref": "16"
                                    },
                                    "Question": {
                                      "$id": "96",
                                      "Category": {
                                        "$ref": "8"
                                      },
                                      "CreatedByNavigation": {
                                        "$ref": "3"
                                      },
                                      "ExamDetail": [
                                        {
                                          "$id": "97",
                                          "Exam": {
                                            "$ref": "7"
                                          },
                                          "Question": {
                                            "$ref": "96"
                                          },
                                          "Id": 2,
                                          "ExamId": 1,
                                          "QuestionId": 1114,
                                          "Order": 2
                                        },
                                        {
                                          "$id": "98",
                                          "Exam": {
                                            "$ref": "12"
                                          },
                                          "Question": {
                                            "$ref": "96"
                                          },
                                          "Id": 26,
                                          "ExamId": 2,
                                          "QuestionId": 1114,
                                          "Order": 2
                                        },
                                        {
                                          "$ref": "95"
                                        }
                                      ],
                                      "HistoryDetail": [],
                                      "Id": 1114,
                                      "CategoryId": 1006,
                                      "Content": "Cho xâu kí tự s=”ABCDEF”. Để lấy kỳ tự thứ ‘E’ của xâu ký tự s(String) dùng câu lệnh nào sau đây?",
                                      "AnswerA": "s.charAt(5)",
                                      "AnswerB": "s.charAt(4)",
                                      "AnswerC": "s[5]",
                                      "AnswerD": "s[4]",
                                      "AnswerCorrect": "B",
                                      "CreatedAt": "2023-06-04T00:00:00",
                                      "CreatedBy": 3
                                    },
                                    "Id": 83,
                                    "ExamId": 5,
                                    "QuestionId": 1114,
                                    "Order": 2
                                  },
                                  {
                                    "$id": "99",
                                    "Exam": {
                                      "$ref": "16"
                                    },
                                    "Question": {
                                      "$id": "100",
                                      "Category": {
                                        "$ref": "8"
                                      },
                                      "CreatedByNavigation": {
                                        "$ref": "3"
                                      },
                                      "ExamDetail": [
                                        {
                                          "$id": "101",
                                          "Exam": {
                                            "$ref": "7"
                                          },
                                          "Question": {
                                            "$ref": "100"
                                          },
                                          "Id": 90,
                                          "ExamId": 1,
                                          "QuestionId": 1122,
                                          "Order": 10
                                        },
                                        {
                                          "$id": "102",
                                          "Exam": {
                                            "$ref": "12"
                                          },
                                          "Question": {
                                            "$ref": "100"
                                          },
                                          "Id": 18,
                                          "ExamId": 2,
                                          "QuestionId": 1122,
                                          "Order": 10
                                        },
                                        {
                                          "$ref": "99"
                                        }
                                      ],
                                      "HistoryDetail": [],
                                      "Id": 1122,
                                      "CategoryId": 1006,
                                      "Content": "Java chạy trên hệ điều hành nào sau đây?",
                                      "AnswerA": "Microsoft Windows",
                                      "AnswerB": "Linux",
                                      "AnswerC": "Sun Solaris OS",
                                      "AnswerD": "Tất cả các đáp án đều đúng",
                                      "AnswerCorrect": "D",
                                      "CreatedAt": "2023-06-04T00:00:00",
                                      "CreatedBy": 3
                                    },
                                    "Id": 84,
                                    "ExamId": 5,
                                    "QuestionId": 1122,
                                    "Order": 29
                                  }
                                ],
                                "History": [],
                                "Rank": [],
                                "Id": 5,
                                "CategoryId": 1006,
                                "ExamName": "Đề ôn Java",
                                "Time": 30,
                                "CreateAt": "2023-06-04T10:49:57.907",
                                "CreateBy": 3,
                                "IsActive": true,
                                "Level": 1
                              },
                              "Question": {
                                "$ref": "14"
                              },
                              "Id": 85,
                              "ExamId": 5,
                              "QuestionId": 1125,
                              "Order": 30
                            }
                          ],
                          "HistoryDetail": [],
                          "Id": 1125,
                          "CategoryId": 1006,
                          "Content": "Phát biểu nào sau đây là đúng?",
                          "AnswerA": "Mảng có thể lưu giữ các phần tử thuộc nhiều kiểu dữ liệu khác nhau",
                          "AnswerB": "Chỉ số của mảng có thể sử dụng kiểu số thực (float, double)",
                          "AnswerC": "Biểu thức array.length được sử dụng để trả về số phần tử trong mảng",
                          "AnswerD": "Một phần tử của mảng không thể truyền vào trong một phương thức",
                          "AnswerCorrect": "C",
                          "CreatedAt": "2023-06-04T00:00:00",
                          "CreatedBy": 3
                        },
                        "Id": 10,
                        "ExamId": 2,
                        "QuestionId": 1125,
                        "Order": 18
                      },
                      {
                        "$ref": "28"
                      },
                      {
                        "$ref": "34"
                      },
                      {
                        "$ref": "37"
                      },
                      {
                        "$ref": "40"
                      },
                      {
                        "$ref": "43"
                      },
                      {
                        "$ref": "46"
                      },
                      {
                        "$ref": "31"
                      },
                      {
                        "$ref": "102"
                      },
                      {
                        "$ref": "21"
                      },
                      {
                        "$ref": "25"
                      },
                      {
                        "$ref": "82"
                      },
                      {
                        "$ref": "78"
                      },
                      {
                        "$ref": "86"
                      },
                      {
                        "$ref": "90"
                      },
                      {
                        "$ref": "94"
                      },
                      {
                        "$ref": "98"
                      },
                      {
                        "$ref": "49"
                      },
                      {
                        "$ref": "52"
                      }
                    ],
                    "History": [],
                    "Rank": [],
                    "Id": 2,
                    "CategoryId": 1006,
                    "ExamName": "Đề trắc nghiệm Java số 2",
                    "Time": 15,
                    "CreateAt": "2023-06-04T10:37:03.733",
                    "CreateBy": 3,
                    "IsActive": true,
                    "Level": 1
                  },
                  "Question": {
                    "$ref": "10"
                  },
                  "Id": 9,
                  "ExamId": 2,
                  "QuestionId": 1113,
                  "Order": 1
                },
                {
                  "$ref": "17"
                }
              ],
              "HistoryDetail": [],
              "Id": 1113,
              "CategoryId": 1006,
              "Content": "Đâu là câu sai về ngôn ngữ Java?",
              "AnswerA": "Ngôn ngữ Java có phân biệt chữ hoa – chữ thường",
              "AnswerB": "Java là ngôn ngữ lập trình hướng đối tượng",
              "AnswerC": "Dấu chấm phẩy được sử dụng để kết thúc lệnh trong java",
              "AnswerD": "Chương trình viết bằng Java chỉ có thể chạy trên hệ điều hành Window",
              "AnswerCorrect": "D",
              "CreatedAt": "2023-06-04T00:00:00",
              "CreatedBy": 3
            },
            "Id": 1,
            "ExamId": 1,
            "QuestionId": 1113,
            "Order": 1
          },
          {
            "$ref": "97"
          },
          {
            "$ref": "81"
          },
          {
            "$ref": "85"
          },
          {
            "$ref": "93"
          },
          {
            "$ref": "89"
          },
          {
            "$ref": "77"
          },
          {
            "$ref": "24"
          },
          {
            "$ref": "20"
          },
          {
            "$ref": "101"
          }
        ],
        "History": [],
        "Rank": [],
        "Id": 1,
        "CategoryId": 1006,
        "ExamName": "Đề trắc nghiệm Java số 1",
        "Time": 1,
        "CreateAt": "2023-06-04T10:31:13.28",
        "CreateBy": 3,
        "IsActive": true,
        "Level": 1
      },
      {
        "$ref": "12"
      },
      {
        "$id": "103",
        "Category": {
          "$id": "104",
          "Id": 1007,
          "CategoryName": "Mạng máy tính",
          "CreateAt": "2023-06-04T10:00:36.117"
        },
        "CreateByNavigation": {
          "$ref": "3"
        },
        "ExamDetail": [
          {
            "$id": "105",
            "Exam": {
              "$ref": "103"
            },
            "Question": {
              "$id": "106",
              "Category": {
                "$ref": "104"
              },
              "CreatedByNavigation": {
                "$ref": "3"
              },
              "ExamDetail": [
                {
                  "$ref": "105"
                },
                {
                  "$id": "107",
                  "Exam": {
                    "$id": "108",
                    "Category": {
                      "$ref": "104"
                    },
                    "CreateByNavigation": {
                      "$ref": "3"
                    },
                    "ExamDetail": [
                      {
                        "$ref": "107"
                      },
                      {
                        "$id": "109",
                        "Exam": {
                          "$ref": "108"
                        },
                        "Question": {
                          "$id": "110",
                          "Category": {
                            "$ref": "104"
                          },
                          "CreatedByNavigation": {
                            "$ref": "3"
                          },
                          "ExamDetail": [
                            {
                              "$id": "111",
                              "Exam": {
                                "$ref": "103"
                              },
                              "Question": {
                                "$ref": "110"
                              },
                              "Id": 39,
                              "ExamId": 3,
                              "QuestionId": 1143,
                              "Order": 11
                            },
                            {
                              "$ref": "109"
                            },
                            {
                              "$id": "112",
                              "Exam": {
                                "$id": "113",
                                "Category": {
                                  "$ref": "104"
                                },
                                "CreateByNavigation": {
                                  "$ref": "3"
                                },
                                "ExamDetail": [
                                  {
                                    "$id": "114",
                                    "Exam": {
                                      "$ref": "113"
                                    },
                                    "Question": {
                                      "$ref": "106"
                                    },
                                    "Id": 95,
                                    "ExamId": 6,
                                    "QuestionId": 1157,
                                    "Order": 5
                                  },
                                  {
                                    "$ref": "112"
                                  },
                                  {
                                    "$id": "115",
                                    "Exam": {
                                      "$ref": "113"
                                    },
                                    "Question": {
                                      "$id": "116",
                                      "Category": {
                                        "$ref": "104"
                                      },
                                      "CreatedByNavigation": {
                                        "$ref": "3"
                                      },
                                      "ExamDetail": [
                                        {
                                          "$id": "117",
                                          "Exam": {
                                            "$ref": "108"
                                          },
                                          "Question": {
                                            "$ref": "116"
                                          },
                                          "Id": 42,
                                          "ExamId": 4,
                                          "QuestionId": 1144,
                                          "Order": 2
                                        },
                                        {
                                          "$ref": "115"
                                        },
                                        {
                                          "$id": "118",
                                          "Exam": {
                                            "$id": "119",
                                            "Category": {
                                              "$ref": "104"
                                            },
                                            "CreateByNavigation": {
                                              "$ref": "3"
                                            },
                                            "ExamDetail": [
                                              {
                                                "$id": "120",
                                                "Exam": {
                                                  "$ref": "119"
                                                },
                                                "Question": {
                                                  "$ref": "110"
                                                },
                                                "Id": 114,
                                                "ExamId": 7,
                                                "QuestionId": 1143,
                                                "Order": 7
                                              },
                                              {
                                                "$ref": "118"
                                              },
                                              {
                                                "$id": "121",
                                                "Exam": {
                                                  "$ref": "119"
                                                },
                                                "Question": {
                                                  "$id": "122",
                                                  "Category": {
                                                    "$ref": "104"
                                                  },
                                                  "CreatedByNavigation": {
                                                    "$ref": "3"
                                                  },
                                                  "ExamDetail": [
                                                    {
                                                      "$id": "123",
                                                      "Exam": {
                                                        "$ref": "108"
                                                      },
                                                      "Question": {
                                                        "$ref": "122"
                                                      },
                                                      "Id": 54,
                                                      "ExamId": 4,
                                                      "QuestionId": 1150,
                                                      "Order": 14
                                                    },
                                                    {
                                                      "$id": "124",
                                                      "Exam": {
                                                        "$ref": "113"
                                                      },
                                                      "Question": {
                                                        "$ref": "122"
                                                      },
                                                      "Id": 102,
                                                      "ExamId": 6,
                                                      "QuestionId": 1150,
                                                      "Order": 12
                                                    },
                                                    {
                                                      "$ref": "121"
                                                    }
                                                  ],
                                                  "HistoryDetail": [],
                                                  "Id": 1150,
                                                  "CategoryId": 1007,
                                                  "Content": "Để nối Router và máy tính ta phải bấm cáp kiểu nào?",
                                                  "AnswerA": "Thẳng",
                                                  "AnswerB": "Chéo",
                                                  "AnswerC": "Kiểu nào cũng được",
                                                  "AnswerD": "Tất cả đều sai",
                                                  "AnswerCorrect": "A",
                                                  "CreatedAt": "2023-06-04T00:00:00",
                                                  "CreatedBy": 3
                                                },
                                                "Id": 106,
                                                "ExamId": 7,
                                                "QuestionId": 1150,
                                                "Order": 1
                                              },
                                              {
                                                "$id": "125",
                                                "Exam": {
                                                  "$ref": "119"
                                                },
                                                "Question": {
                                                  "$id": "126",
                                                  "Category": {
                                                    "$ref": "104"
                                                  },
                                                  "CreatedByNavigation": {
                                                    "$ref": "3"
                                                  },
                                                  "ExamDetail": [
                                                    {
                                                      "$id": "127",
                                                      "Exam": {
                                                        "$ref": "103"
                                                      },
                                                      "Question": {
                                                        "$ref": "126"
                                                      },
                                                      "Id": 33,
                                                      "ExamId": 3,
                                                      "QuestionId": 1151,
                                                      "Order": 5
                                                    },
                                                    {
                                                      "$id": "128",
                                                      "Exam": {
                                                        "$ref": "108"
                                                      },
                                                      "Question": {
                                                        "$ref": "126"
                                                      },
                                                      "Id": 53,
                                                      "ExamId": 4,
                                                      "QuestionId": 1151,
                                                      "Order": 13
                                                    },
                                                    {
                                                      "$id": "129",
                                                      "Exam": {
                                                        "$ref": "113"
                                                      },
                                                      "Question": {
                                                        "$ref": "126"
                                                      },
                                                      "Id": 101,
                                                      "ExamId": 6,
                                                      "QuestionId": 1151,
                                                      "Order": 11
                                                    },
                                                    {
                                                      "$ref": "125"
                                                    }
                                                  ],
                                                  "HistoryDetail": [],
                                                  "Id": 1151,
                                                  "CategoryId": 1007,
                                                  "Content": "Định nghĩa giao thức (protocol) là gì?",
                                                  "AnswerA": "Là các tín hiệu nhị phân truyền đi trước khi truyền dữ liệu thật sự",
                                                  "AnswerB": "Là cơ chế “bắt tay ba lần” mà mọi thiết bị mạng đều phải thực hiện khi khởi động",
                                                  "AnswerC": "Là một tập các đặc tả mà mọi nhà sản xuất sản phẩm mạng phải dựa theo để thiết kế sản phẩm của mình",
                                                  "AnswerD": "Tất cả đáp án trên",
                                                  "AnswerCorrect": "A",
                                                  "CreatedAt": "2023-06-04T00:00:00",
                                                  "CreatedBy": 3
                                                },
                                                "Id": 107,
                                                "ExamId": 7,
                                                "QuestionId": 1151,
                                                "Order": 2
                                              },
                                              {
                                                "$id": "130",
                                                "Exam": {
                                                  "$ref": "119"
                                                },
                                                "Question": {
                                                  "$id": "131",
                                                  "Category": {
                                                    "$ref": "104"
                                                  },
                                                  "CreatedByNavigation": {
                                                    "$ref": "3"
                                                  },
                                                  "ExamDetail": [
                                                    {
                                                      "$id": "132",
                                                      "Exam": {
                                                        "$ref": "108"
                                                      },
                                                      "Question": {
                                                        "$ref": "131"
                                                      },
                                                      "Id": 50,
                                                      "ExamId": 4,
                                                      "QuestionId": 1154,
                                                      "Order": 10
                                                    },
                                                    {
                                                      "$id": "133",
                                                      "Exam": {
                                                        "$ref": "113"
                                                      },
                                                      "Question": {
                                                        "$ref": "131"
                                                      },
                                                      "Id": 104,
                                                      "ExamId": 6,
                                                      "QuestionId": 1154,
                                                      "Order": 14
                                                    },
                                                    {
                                                      "$ref": "130"
                                                    }
                                                  ],
                                                  "HistoryDetail": [],
                                                  "Id": 1154,
                                                  "CategoryId": 1007,
                                                  "Content": "Chức năng chính của router là?",
                                                  "AnswerA": "Kết nối LAN với LAN",
                                                  "AnswerB": "Chia nhỏ broadcast domain",
                                                  "AnswerC": "Tất cả đều đúng",
                                                  "AnswerD": "Tất cả đều sai",
                                                  "AnswerCorrect": "B",
                                                  "CreatedAt": "2023-06-04T00:00:00",
                                                  "CreatedBy": 3
                                                },
                                                "Id": 108,
                                                "ExamId": 7,
                                                "QuestionId": 1154,
                                                "Order": 3
                                              },
                                              {
                                                "$id": "134",
                                                "Exam": {
                                                  "$ref": "119"
                                                },
                                                "Question": {
                                                  "$id": "135",
                                                  "Category": {
                                                    "$ref": "104"
                                                  },
                                                  "CreatedByNavigation": {
                                                    "$ref": "3"
                                                  },
                                                  "ExamDetail": [
                                                    {
                                                      "$id": "136",
                                                      "Exam": {
                                                        "$ref": "103"
                                                      },
                                                      "Question": {
                                                        "$ref": "135"
                                                      },
                                                      "Id": 31,
                                                      "ExamId": 3,
                                                      "QuestionId": 1153,
                                                      "Order": 3
                                                    },
                                                    {
                                                      "$id": "137",
                                                      "Exam": {
                                                        "$ref": "108"
                                                      },
                                                      "Question": {
                                                        "$ref": "135"
                                                      },
                                                      "Id": 51,
                                                      "ExamId": 4,
                                                      "QuestionId": 1153,
                                                      "Order": 11
                                                    },
                                                    {
                                                      "$id": "138",
                                                      "Exam": {
                                                        "$ref": "113"
                                                      },
                                                      "Question": {
                                                        "$ref": "135"
                                                      },
                                                      "Id": 103,
                                                      "ExamId": 6,
                                                      "QuestionId": 1153,
                                                      "Order": 13
                                                    },
                                                    {
                                                      "$ref": "134"
                                                    }
                                                  ],
                                                  "HistoryDetail": [],
                                                  "Id": 1153,
                                                  "CategoryId": 1007,
                                                  "Content": "Subnet mask trong một cổng seria của router là 11111000. Số thập phân của nó là gì?",
                                                  "AnswerA": "210",
                                                  "AnswerB": "224",
                                                  "AnswerC": "240",
                                                  "AnswerD": "248",
                                                  "AnswerCorrect": "D",
                                                  "CreatedAt": "2023-06-04T00:00:00",
                                                  "CreatedBy": 3
                                                },
                                                "Id": 109,
                                                "ExamId": 7,
                                                "QuestionId": 1153,
                                                "Order": 4
                                              },
                                              {
                                                "$id": "139",
                                                "Exam": {
                                                  "$ref": "119"
                                                },
                                                "Question": {
                                                  "$id": "140",
                                                  "Category": {
                                                    "$ref": "104"
                                                  },
                                                  "CreatedByNavigation": {
                                                    "$ref": "3"
                                                  },
                                                  "ExamDetail": [
                                                    {
                                                      "$id": "141",
                                                      "Exam": {
                                                        "$ref": "103"
                                                      },
                                                      "Question": {
                                                        "$ref": "140"
                                                      },
                                                      "Id": 35,
                                                      "ExamId": 3,
                                                      "QuestionId": 1152,
                                                      "Order": 7
                                                    },
                                                    {
                                                      "$id": "142",
                                                      "Exam": {
                                                        "$ref": "108"
                                                      },
                                                      "Question": {
                                                        "$ref": "140"
                                                      },
                                                      "Id": 52,
                                                      "ExamId": 4,
                                                      "QuestionId": 1152,
                                                      "Order": 12
                                                    },
                                                    {
                                                      "$id": "143",
                                                      "Exam": {
                                                        "$ref": "113"
                                                      },
                                                      "Question": {
                                                        "$ref": "140"
                                                      },
                                                      "Id": 100,
                                                      "ExamId": 6,
                                                      "QuestionId": 1152,
                                                      "Order": 10
                                                    },
                                                    {
                                                      "$ref": "139"
                                                    }
                                                  ],
                                                  "HistoryDetail": [],
                                                  "Id": 1152,
                                                  "CategoryId": 1007,
                                                  "Content": "Để kết nối hai HUB với nhau ta sử dụng kiểu bấm cáp nào?",
                                                  "AnswerA": "Thẳng (straight-through)",
                                                  "AnswerB": "Chéo (cross-over)",
                                                  "AnswerC": "Console",
                                                  "AnswerD": "Tất cả đều đúng",
                                                  "AnswerCorrect": "B",
                                                  "CreatedAt": "2023-06-04T00:00:00",
                                                  "CreatedBy": 3
                                                },
                                                "Id": 110,
                                                "ExamId": 7,
                                                "QuestionId": 1152,
                                                "Order": 5
                                              },
                                              {
                                                "$id": "144",
                                                "Exam": {
                                                  "$ref": "119"
                                                },
                                                "Question": {
                                                  "$id": "145",
                                                  "Category": {
                                                    "$ref": "104"
                                                  },
                                                  "CreatedByNavigation": {
                                                    "$ref": "3"
                                                  },
                                                  "ExamDetail": [
                                                    {
                                                      "$id": "146",
                                                      "Exam": {
                                                        "$ref": "103"
                                                      },
                                                      "Question": {
                                                        "$ref": "145"
                                                      },
                                                      "Id": 32,
                                                      "ExamId": 3,
                                                      "QuestionId": 1155,
                                                      "Order": 4
                                                    },
                                                    {
                                                      "$id": "147",
                                                      "Exam": {
                                                        "$ref": "108"
                                                      },
                                                      "Question": {
                                                        "$ref": "145"
                                                      },
                                                      "Id": 49,
                                                      "ExamId": 4,
                                                      "QuestionId": 1155,
                                                      "Order": 9
                                                    },
                                                    {
                                                      "$id": "148",
                                                      "Exam": {
                                                        "$ref": "113"
                                                      },
                                                      "Question": {
                                                        "$ref": "145"
                                                      },
                                                      "Id": 97,
                                                      "ExamId": 6,
                                                      "QuestionId": 1155,
                                                      "Order": 7
                                                    },
                                                    {
                                                      "$ref": "144"
                                                    }
                                                  ],
                                                  "HistoryDetail": [],
                                                  "Id": 1155,
                                                  "CategoryId": 1007,
                                                  "Content": "Modem dùng để?",
                                                  "AnswerA": "Giao tiếp với mạng",
                                                  "AnswerB": "Truyền dữ liệu đi xa",
                                                  "AnswerC": "Truyền dữ liệu trong mạng LAN",
                                                  "AnswerD": "A và B",
                                                  "AnswerCorrect": "D",
                                                  "CreatedAt": "2023-06-04T00:00:00",
                                                  "CreatedBy": 3
                                                },
                                                "Id": 111,
                                                "ExamId": 7,
                                                "QuestionId": 1155,
                                                "Order": 6
                                              },
                                              {
                                                "$id": "149",
                                                "Exam": {
                                                  "$ref": "119"
                                                },
                                                "Question": {
                                                  "$id": "150",
                                                  "Category": {
                                                    "$ref": "104"
                                                  },
                                                  "CreatedByNavigation": {
                                                    "$ref": "3"
                                                  },
                                                  "ExamDetail": [
                                                    {
                                                      "$id": "151",
                                                      "Exam": {
                                                        "$ref": "103"
                                                      },
                                                      "Question": {
                                                        "$ref": "150"
                                                      },
                                                      "Id": 40,
                                                      "ExamId": 3,
                                                      "QuestionId": 1145,
                                                      "Order": 12
                                                    },
                                                    {
                                                      "$id": "152",
                                                      "Exam": {
                                                        "$ref": "108"
                                                      },
                                                      "Question": {
                                                        "$ref": "150"
                                                      },
                                                      "Id": 43,
                                                      "ExamId": 4,
                                                      "QuestionId": 1145,
                                                      "Order": 3
                                                    },
                                                    {
                                                      "$id": "153",
                                                      "Exam": {
                                                        "$ref": "113"
                                                      },
                                                      "Question": {
                                                        "$ref": "150"
                                                      },
                                                      "Id": 93,
                                                      "ExamId": 6,
                                                      "QuestionId": 1145,
                                                      "Order": 3
                                                    },
                                                    {
                                                      "$ref": "149"
                                                    }
                                                  ],
                                                  "HistoryDetail": [],
                                                  "Id": 1145,
                                                  "CategoryId": 1007,
                                                  "Content": "Thiết bị Bridge nằm ở tầng nào của mô hình OSI?",
                                                  "AnswerA": "Tầng 1",
                                                  "AnswerB": "Tầng 2",
                                                  "AnswerC": "Tầng 3",
                                                  "AnswerD": "Tất cả đều sai",
                                                  "AnswerCorrect": "B",
                                                  "CreatedAt": "2023-06-04T00:00:00",
                                                  "CreatedBy": 3
                                                },
                                                "Id": 116,
                                                "ExamId": 7,
                                                "QuestionId": 1145,
                                                "Order": 9
                                              },
                                              {
                                                "$id": "154",
                                                "Exam": {
                                                  "$ref": "119"
                                                },
                                                "Question": {
                                                  "$id": "155",
                                                  "Category": {
                                                    "$ref": "104"
                                                  },
                                                  "CreatedByNavigation": {
                                                    "$ref": "3"
                                                  },
                                                  "ExamDetail": [
                                                    {
                                                      "$id": "156",
                                                      "Exam": {
                                                        "$ref": "103"
                                                      },
                                                      "Question": {
                                                        "$ref": "155"
                                                      },
                                                      "Id": 36,
                                                      "ExamId": 3,
                                                      "QuestionId": 1146,
                                                      "Order": 8
                                                    },
                                                    {
                                                      "$id": "157",
                                                      "Exam": {
                                                        "$ref": "108"
                                                      },
                                                      "Question": {
                                                        "$ref": "155"
                                                      },
                                                      "Id": 44,
                                                      "ExamId": 4,
                                                      "QuestionId": 1146,
                                                      "Order": 4
                                                    },
                                                    {
                                                      "$id": "158",
                                                      "Exam": {
                                                        "$ref": "113"
                                                      },
                                                      "Question": {
                                                        "$ref": "155"
                                                      },
                                                      "Id": 94,
                                                      "ExamId": 6,
                                                      "QuestionId": 1146,
                                                      "Order": 4
                                                    },
                                                    {
                                                      "$ref": "154"
                                                    }
                                                  ],
                                                  "HistoryDetail": [],
                                                  "Id": 1146,
                                                  "CategoryId": 1007,
                                                  "Content": "Thiết bị router có bao nhiêu Broadcast domain?",
                                                  "AnswerA": "1 broadcast/1port",
                                                  "AnswerB": "2",
                                                  "AnswerC": "3",
                                                  "AnswerD": "4",
                                                  "AnswerCorrect": "B",
                                                  "CreatedAt": "2023-06-04T00:00:00",
                                                  "CreatedBy": 3
                                                },
                                                "Id": 117,
                                                "ExamId": 7,
                                                "QuestionId": 1146,
                                                "Order": 10
                                              },
                                              {
                                                "$id": "159",
                                                "Exam": {
                                                  "$ref": "119"
                                                },
                                                "Question": {
                                                  "$id": "160",
                                                  "Category": {
                                                    "$ref": "104"
                                                  },
                                                  "CreatedByNavigation": {
                                                    "$ref": "3"
                                                  },
                                                  "ExamDetail": [
                                                    {
                                                      "$id": "161",
                                                      "Exam": {
                                                        "$ref": "103"
                                                      },
                                                      "Question": {
                                                        "$ref": "160"
                                                      },
                                                      "Id": 37,
                                                      "ExamId": 3,
                                                      "QuestionId": 1147,
                                                      "Order": 9
                                                    },
                                                    {
                                                      "$id": "162",
                                                      "Exam": {
                                                        "$ref": "108"
                                                      },
                                                      "Question": {
                                                        "$ref": "160"
                                                      },
                                                      "Id": 45,
                                                      "ExamId": 4,
                                                      "QuestionId": 1147,
                                                      "Order": 5
                                                    },
                                                    {
                                                      "$id": "163",
                                                      "Exam": {
                                                        "$ref": "113"
                                                      },
                                                      "Question": {
                                                        "$ref": "160"
                                                      },
                                                      "Id": 98,
                                                      "ExamId": 6,
                                                      "QuestionId": 1147,
                                                      "Order": 8
                                                    },
                                                    {
                                                      "$ref": "159"
                                                    }
                                                  ],
                                                  "HistoryDetail": [],
                                                  "Id": 1147,
                                                  "CategoryId": 1007,
                                                  "Content": "Thiết bị Router có bao nhiêu collision domain?",
                                                  "AnswerA": "1",
                                                  "AnswerB": "2",
                                                  "AnswerC": "3",
                                                  "AnswerD": "4",
                                                  "AnswerCorrect": "A",
                                                  "CreatedAt": "2023-06-04T00:00:00",
                                                  "CreatedBy": 3
                                                },
                                                "Id": 118,
                                                "ExamId": 7,
                                                "QuestionId": 1147,
                                                "Order": 11
                                              },
                                              {
                                                "$id": "164",
                                                "Exam": {
                                                  "$ref": "119"
                                                },
                                                "Question": {
                                                  "$id": "165",
                                                  "Category": {
                                                    "$ref": "104"
                                                  },
                                                  "CreatedByNavigation": {
                                                    "$ref": "3"
                                                  },
                                                  "ExamDetail": [
                                                    {
                                                      "$id": "166",
                                                      "Exam": {
                                                        "$ref": "103"
                                                      },
                                                      "Question": {
                                                        "$ref": "165"
                                                      },
                                                      "Id": 38,
                                                      "ExamId": 3,
                                                      "QuestionId": 1148,
                                                      "Order": 10
                                                    },
                                                    {
                                                      "$id": "167",
                                                      "Exam": {
                                                        "$ref": "108"
                                                      },
                                                      "Question": {
                                                        "$ref": "165"
                                                      },
                                                      "Id": 46,
                                                      "ExamId": 4,
                                                      "QuestionId": 1148,
                                                      "Order": 6
                                                    },
                                                    {
                                                      "$id": "168",
                                                      "Exam": {
                                                        "$ref": "113"
                                                      },
                                                      "Question": {
                                                        "$ref": "165"
                                                      },
                                                      "Id": 99,
                                                      "ExamId": 6,
                                                      "QuestionId": 1148,
                                                      "Order": 9
                                                    },
                                                    {
                                                      "$ref": "164"
                                                    }
                                                  ],
                                                  "HistoryDetail": [],
                                                  "Id": 1148,
                                                  "CategoryId": 1007,
                                                  "Content": "Cáp UTP có thể kết nối tối đa bao nhiêu mét?",
                                                  "AnswerA": "10",
                                                  "AnswerB": "20",
                                                  "AnswerC": "100",
                                                  "AnswerD": "200",
                                                  "AnswerCorrect": "C",
                                                  "CreatedAt": "2023-06-04T00:00:00",
                                                  "CreatedBy": 3
                                                },
                                                "Id": 119,
                                                "ExamId": 7,
                                                "QuestionId": 1148,
                                                "Order": 12
                                              },
                                              {
                                                "$id": "169",
                                                "Exam": {
                                                  "$ref": "119"
                                                },
                                                "Question": {
                                                  "$id": "170",
                                                  "Category": {
                                                    "$ref": "104"
                                                  },
                                                  "CreatedByNavigation": {
                                                    "$ref": "3"
                                                  },
                                                  "ExamDetail": [
                                                    {
                                                      "$id": "171",
                                                      "Exam": {
                                                        "$ref": "103"
                                                      },
                                                      "Question": {
                                                        "$ref": "170"
                                                      },
                                                      "Id": 34,
                                                      "ExamId": 3,
                                                      "QuestionId": 1149,
                                                      "Order": 6
                                                    },
                                                    {
                                                      "$id": "172",
                                                      "Exam": {
                                                        "$ref": "108"
                                                      },
                                                      "Question": {
                                                        "$ref": "170"
                                                      },
                                                      "Id": 55,
                                                      "ExamId": 4,
                                                      "QuestionId": 1149,
                                                      "Order": 15
                                                    },
                                                    {
                                                      "$id": "173",
                                                      "Exam": {
                                                        "$ref": "113"
                                                      },
                                                      "Question": {
                                                        "$ref": "170"
                                                      },
                                                      "Id": 105,
                                                      "ExamId": 6,
                                                      "QuestionId": 1149,
                                                      "Order": 15
                                                    },
                                                    {
                                                      "$ref": "169"
                                                    }
                                                  ],
                                                  "HistoryDetail": [],
                                                  "Id": 1149,
                                                  "CategoryId": 1007,
                                                  "Content": "Cáp quang có thể kết nối tối đa bao nhiêu mét?",
                                                  "AnswerA": "1000",
                                                  "AnswerB": "2000",
                                                  "AnswerC": "500",
                                                  "AnswerD": "Dưới 500",
                                                  "AnswerCorrect": "B",
                                                  "CreatedAt": "2023-06-04T00:00:00",
                                                  "CreatedBy": 3
                                                },
                                                "Id": 120,
                                                "ExamId": 7,
                                                "QuestionId": 1149,
                                                "Order": 13
                                              }
                                            ],
                                            "History": [],
                                            "Rank": [],
                                            "Id": 7,
                                            "CategoryId": 1007,
                                            "ExamName": "Đề ôn mạng máy tính",
                                            "Time": 15,
                                            "CreateAt": "2023-06-05T10:30:48.717",
                                            "CreateBy": 3,
                                            "IsActive": true,
                                            "Level": 1
                                          },
                                          "Question": {
                                            "$ref": "116"
                                          },
                                          "Id": 115,
                                          "ExamId": 7,
                                          "QuestionId": 1144,
                                          "Order": 8
                                        }
                                      ],
                                      "HistoryDetail": [],
                                      "Id": 1144,
                                      "CategoryId": 1007,
                                      "Content": "Thiết bị Switch thông thường nằm ở tầng nào của mô hình OSI?",
                                      "AnswerA": "Tầng 1",
                                      "AnswerB": "Tầng 2",
                                      "AnswerC": "Tầng 3",
                                      "AnswerD": "Tất cả đều sai",
                                      "AnswerCorrect": "B",
                                      "CreatedAt": "2023-06-04T00:00:00",
                                      "CreatedBy": 3
                                    },
                                    "Id": 92,
                                    "ExamId": 6,
                                    "QuestionId": 1144,
                                    "Order": 2
                                  },
                                  {
                                    "$ref": "153"
                                  },
                                  {
                                    "$ref": "158"
                                  },
                                  {
                                    "$id": "174",
                                    "Exam": {
                                      "$ref": "113"
                                    },
                                    "Question": {
                                      "$id": "175",
                                      "Category": {
                                        "$ref": "104"
                                      },
                                      "CreatedByNavigation": {
                                        "$ref": "3"
                                      },
                                      "ExamDetail": [
                                        {
                                          "$id": "176",
                                          "Exam": {
                                            "$ref": "103"
                                          },
                                          "Question": {
                                            "$ref": "175"
                                          },
                                          "Id": 30,
                                          "ExamId": 3,
                                          "QuestionId": 1156,
                                          "Order": 2
                                        },
                                        {
                                          "$id": "177",
                                          "Exam": {
                                            "$ref": "108"
                                          },
                                          "Question": {
                                            "$ref": "175"
                                          },
                                          "Id": 48,
                                          "ExamId": 4,
                                          "QuestionId": 1156,
                                          "Order": 8
                                        },
                                        {
                                          "$ref": "174"
                                        }
                                      ],
                                      "HistoryDetail": [],
                                      "Id": 1156,
                                      "CategoryId": 1007,
                                      "Content": "Dịch vụ nào cho phép người sử dụng từ một trạm làm việc của mình có thể đăng nhập vào một trạm ở xa qua mạng và có thể làm việc với hệ thống?",
                                      "AnswerA": "Telnet",
                                      "AnswerB": "Email",
                                      "AnswerC": "FTP",
                                      "AnswerD": "WWW",
                                      "AnswerCorrect": "A",
                                      "CreatedAt": "2023-06-04T00:00:00",
                                      "CreatedBy": 3
                                    },
                                    "Id": 96,
                                    "ExamId": 6,
                                    "QuestionId": 1156,
                                    "Order": 6
                                  },
                                  {
                                    "$ref": "148"
                                  },
                                  {
                                    "$ref": "163"
                                  },
                                  {
                                    "$ref": "168"
                                  },
                                  {
                                    "$ref": "143"
                                  },
                                  {
                                    "$ref": "129"
                                  },
                                  {
                                    "$ref": "124"
                                  },
                                  {
                                    "$ref": "138"
                                  },
                                  {
                                    "$ref": "133"
                                  },
                                  {
                                    "$ref": "173"
                                  }
                                ],
                                "History": [],
                                "Rank": [],
                                "Id": 6,
                                "CategoryId": 1007,
                                "ExamName": "Đề trắc nghiệm Mạng máy tính số 2",
                                "Time": 15,
                                "CreateAt": "2023-06-05T10:09:00.95",
                                "CreateBy": 3,
                                "IsActive": true,
                                "Level": 1
                              },
                              "Question": {
                                "$ref": "110"
                              },
                              "Id": 91,
                              "ExamId": 6,
                              "QuestionId": 1143,
                              "Order": 1
                            },
                            {
                              "$ref": "120"
                            }
                          ],
                          "HistoryDetail": [],
                          "Id": 1143,
                          "CategoryId": 1007,
                          "Content": "Thiết bị hub thông thường nằm ở tầng nào của mô hình OSI?",
                          "AnswerA": "Tầng 1",
                          "AnswerB": "Tầng 2",
                          "AnswerC": "Tầng 3",
                          "AnswerD": "Tất cả đều sai",
                          "AnswerCorrect": "A",
                          "CreatedAt": "2023-06-04T00:00:00",
                          "CreatedBy": 3
                        },
                        "Id": 41,
                        "ExamId": 4,
                        "QuestionId": 1143,
                        "Order": 1
                      },
                      {
                        "$ref": "117"
                      },
                      {
                        "$ref": "152"
                      },
                      {
                        "$ref": "157"
                      },
                      {
                        "$ref": "162"
                      },
                      {
                        "$ref": "167"
                      },
                      {
                        "$ref": "177"
                      },
                      {
                        "$ref": "147"
                      },
                      {
                        "$ref": "132"
                      },
                      {
                        "$ref": "137"
                      },
                      {
                        "$ref": "142"
                      },
                      {
                        "$ref": "128"
                      },
                      {
                        "$ref": "123"
                      },
                      {
                        "$ref": "172"
                      }
                    ],
                    "History": [],
                    "Rank": [],
                    "Id": 4,
                    "CategoryId": 1007,
                    "ExamName": "Đề ôn Mạng máy tính",
                    "Time": 15,
                    "CreateAt": "2023-06-04T10:48:58.35",
                    "CreateBy": 3,
                    "IsActive": true,
                    "Level": 1
                  },
                  "Question": {
                    "$ref": "106"
                  },
                  "Id": 47,
                  "ExamId": 4,
                  "QuestionId": 1157,
                  "Order": 7
                },
                {
                  "$ref": "114"
                }
              ],
              "HistoryDetail": [],
              "Id": 1157,
              "CategoryId": 1007,
              "Content": "Phát biểu nào sau đây mô tả đúng nhất cho cấu hình Star?",
              "AnswerA": "Cần ít cáp hơn nhiều so với các cấu hình khác",
              "AnswerB": "Khi cáp đứt tại một điểm nào đó làm toàn bộ mạng ngưng hoạt động",
              "AnswerC": "Khó tái lập cấu hình hơn so với các cấu hình khác",
              "AnswerD": "Dễ kiểm soát và quản lý tập trung",
              "AnswerCorrect": "D",
              "CreatedAt": "2023-06-04T00:00:00",
              "CreatedBy": 3
            },
            "Id": 29,
            "ExamId": 3,
            "QuestionId": 1157,
            "Order": 1
          },
          {
            "$ref": "176"
          },
          {
            "$ref": "136"
          },
          {
            "$ref": "146"
          },
          {
            "$ref": "127"
          },
          {
            "$ref": "171"
          },
          {
            "$ref": "141"
          },
          {
            "$ref": "156"
          },
          {
            "$ref": "161"
          },
          {
            "$ref": "166"
          },
          {
            "$ref": "111"
          },
          {
            "$ref": "151"
          }
        ],
        "History": [],
        "Rank": [],
        "Id": 3,
        "CategoryId": 1007,
        "ExamName": "Đề trắc nghiệm Mạng máy tính số 1",
        "Time": 10,
        "CreateAt": "2023-06-04T10:48:19.07",
        "CreateBy": 3,
        "IsActive": true,
        "Level": 1
      },
      {
        "$ref": "108"
      },
      {
        "$ref": "16"
      },
      {
        "$ref": "113"
      },
      {
        "$ref": "119"
      }
    ],
    "History": [],
    "Question": [
      {
        "$id": "178",
        "Category": {
          "$ref": "2"
        },
        "CreatedByNavigation": {
          "$ref": "3"
        },
        "ExamDetail": [
          {
            "$id": "179",
            "Exam": {
              "$ref": "1"
            },
            "Question": {
              "$ref": "178"
            },
            "Id": 121,
            "ExamId": 8,
            "QuestionId": 1184,
            "Order": 1
          }
        ],
        "HistoryDetail": [],
        "Id": 1184,
        "CategoryId": 1008,
        "Content": "fd",
        "AnswerA": "fds",
        "AnswerB": "sfd",
        "AnswerC": "fsd",
        "AnswerD": "dsf",
        "AnswerCorrect": "B",
        "CreatedAt": "2024-05-14T00:00:00",
        "CreatedBy": 3
      },
      {
        "$id": "180",
        "Category": {
          "$id": "181",
          "Id": 1005,
          "CategoryName": "Cơ sở dữ liệu",
          "CreateAt": "2023-06-04T10:00:26.127"
        },
        "CreatedByNavigation": {
          "$ref": "3"
        },
        "ExamDetail": [
          {
            "$id": "182",
            "Exam": {
              "$ref": "1"
            },
            "Question": {
              "$ref": "180"
            },
            "Id": 122,
            "ExamId": 8,
            "QuestionId": 1182,
            "Order": 2
          }
        ],
        "HistoryDetail": [],
        "Id": 1182,
        "CategoryId": 1005,
        "Content": "Đâu là câu lệnh điều kiện trong truy vấn CSDL?",
        "AnswerA": "Select",
        "AnswerB": "Where",
        "AnswerC": "Like",
        "AnswerD": "Having",
        "AnswerCorrect": "B",
        "CreatedAt": "2024-05-14T00:00:00",
        "CreatedBy": 3
      },
      {
        "$id": "183",
        "Category": {
          "$ref": "181"
        },
        "CreatedByNavigation": {
          "$ref": "3"
        },
        "ExamDetail": [
          {
            "$id": "184",
            "Exam": {
              "$ref": "1"
            },
            "Question": {
              "$ref": "183"
            },
            "Id": 123,
            "ExamId": 8,
            "QuestionId": 1180,
            "Order": 3
          }
        ],
        "HistoryDetail": [],
        "Id": 1180,
        "CategoryId": 1005,
        "Content": "Trường khóa chính là thường được gọi là gì?",
        "AnswerA": "Single Key",
        "AnswerB": "First Key",
        "AnswerC": "Unique Key",
        "AnswerD": "Primary Key",
        "AnswerCorrect": "D",
        "CreatedAt": "2024-05-14T00:00:00",
        "CreatedBy": 3
      },
      {
        "$id": "185",
        "Category": {
          "$ref": "181"
        },
        "CreatedByNavigation": {
          "$ref": "3"
        },
        "ExamDetail": [
          {
            "$id": "186",
            "Exam": {
              "$ref": "1"
            },
            "Question": {
              "$ref": "185"
            },
            "Id": 124,
            "ExamId": 8,
            "QuestionId": 1178,
            "Order": 4
          }
        ],
        "HistoryDetail": [],
        "Id": 1178,
        "CategoryId": 1005,
        "Content": "Thực thể là gì?",
        "AnswerA": "Các đối tượng dữ liệu",
        "AnswerB": "Các mối liên kết giữa các đối tượng",
        "AnswerC": "Các quan hệ",
        "AnswerD": "Các đối tượng và mối liên kết giữa các đối tượng",
        "AnswerCorrect": "A",
        "CreatedAt": "2024-05-14T00:00:00",
        "CreatedBy": 3
      },
      {
        "$id": "187",
        "Category": {
          "$ref": "181"
        },
        "CreatedByNavigation": {
          "$ref": "3"
        },
        "ExamDetail": [
          {
            "$id": "188",
            "Exam": {
              "$ref": "1"
            },
            "Question": {
              "$ref": "187"
            },
            "Id": 125,
            "ExamId": 8,
            "QuestionId": 1164,
            "Order": 5
          }
        ],
        "HistoryDetail": [],
        "Id": 1164,
        "CategoryId": 1005,
        "Content": "SQL là tên viết tắt của?",
        "AnswerA": "Structure Query Language",
        "AnswerB": "Structure Question Language",
        "AnswerC": "Query Structure Language",
        "AnswerD": "Structure Query Locator",
        "AnswerCorrect": "A",
        "CreatedAt": "2023-06-05T00:00:00",
        "CreatedBy": 3
      },
      {
        "$ref": "60"
      },
      {
        "$ref": "73"
      },
      {
        "$ref": "10"
      },
      {
        "$ref": "14"
      },
      {
        "$ref": "19"
      },
      {
        "$ref": "23"
      },
      {
        "$ref": "27"
      },
      {
        "$ref": "30"
      },
      {
        "$ref": "33"
      },
      {
        "$ref": "36"
      },
      {
        "$ref": "39"
      },
      {
        "$ref": "42"
      },
      {
        "$ref": "45"
      },
      {
        "$ref": "48"
      },
      {
        "$ref": "51"
      },
      {
        "$ref": "54"
      },
      {
        "$ref": "56"
      },
      {
        "$ref": "58"
      },
      {
        "$ref": "63"
      },
      {
        "$ref": "65"
      },
      {
        "$ref": "67"
      },
      {
        "$ref": "69"
      },
      {
        "$ref": "71"
      },
      {
        "$ref": "76"
      },
      {
        "$ref": "80"
      },
      {
        "$ref": "84"
      },
      {
        "$ref": "88"
      },
      {
        "$ref": "92"
      },
      {
        "$ref": "96"
      },
      {
        "$ref": "100"
      },
      {
        "$ref": "106"
      },
      {
        "$ref": "110"
      },
      {
        "$ref": "116"
      },
      {
        "$ref": "122"
      },
      {
        "$ref": "126"
      },
      {
        "$ref": "131"
      },
      {
        "$ref": "135"
      },
      {
        "$ref": "140"
      },
      {
        "$ref": "145"
      },
      {
        "$ref": "150"
      },
      {
        "$ref": "155"
      },
      {
        "$ref": "160"
      },
      {
        "$ref": "165"
      },
      {
        "$ref": "170"
      },
      {
        "$ref": "175"
      },
      {
        "$id": "189",
        "Category": {
          "$ref": "181"
        },
        "CreatedByNavigation": {
          "$ref": "3"
        },
        "ExamDetail": [],
        "HistoryDetail": [],
        "Id": 1158,
        "CategoryId": 1005,
        "Content": "Một hệ quản trị CSDL không có chức năng nào trong các chức năng dưới đây?",
        "AnswerA": "Cung cấp môi trường tạo lập CSDL",
        "AnswerB": "Cung cấp môi trường cập nhật và khai thác dữ liệu",
        "AnswerC": "Cung cấp công cụ quản lí bộ nhớ",
        "AnswerD": "Cung cấp công cụ kiểm soát, điều khiển truy cập vào CSDL",
        "AnswerCorrect": "C",
        "CreatedAt": "2023-06-05T00:00:00",
        "CreatedBy": 3
      },
      {
        "$id": "190",
        "Category": {
          "$ref": "181"
        },
        "CreatedByNavigation": {
          "$ref": "3"
        },
        "ExamDetail": [],
        "HistoryDetail": [],
        "Id": 1159,
        "CategoryId": 1005,
        "Content": "Ngôn ngữ định nghĩa dữ liệu thật chất là?",
        "AnswerA": "Ngôn ngữ lập trình Pascal",
        "AnswerB": "Ngôn ngữ C",
        "AnswerC": "Các kí hiệu toán học dùng để thực hiện các tính toán",
        "AnswerD": "Hệ thống các kí hiệu để mô tả CSDL",
        "AnswerCorrect": "D",
        "CreatedAt": "2023-06-05T00:00:00",
        "CreatedBy": 3
      },
      {
        "$id": "191",
        "Category": {
          "$ref": "181"
        },
        "CreatedByNavigation": {
          "$ref": "3"
        },
        "ExamDetail": [],
        "HistoryDetail": [],
        "Id": 1160,
        "CategoryId": 1005,
        "Content": "Ngôn ngữ định nghĩa dữ liệu bao gồm các lệnh cho phép?",
        "AnswerA": "Đảm bảo tính độc lập dữ liệu",
        "AnswerB": "Khai báo kiểu dữ liệu, cấu trúc dữ liệu và các ràng buộc trên dữ liệu của CSDL",
        "AnswerC": "Mô tả các đối tượng được lưu trữ trong CSDL",
        "AnswerD": "Khai báo kiểu dữ liệu của CSDL",
        "AnswerCorrect": "B",
        "CreatedAt": "2023-06-05T00:00:00",
        "CreatedBy": 3
      },
      {
        "$id": "192",
        "Category": {
          "$ref": "181"
        },
        "CreatedByNavigation": {
          "$ref": "3"
        },
        "ExamDetail": [],
        "HistoryDetail": [],
        "Id": 1161,
        "CategoryId": 1005,
        "Content": "Những nhiệm vụ nào dưới đây không thuộc nhiệm vụ của công cụ kiểm soát, điều khiển truy cập vào CSDL?",
        "AnswerA": "Duy trì tính nhất quán của CSDL",
        "AnswerB": "Cập nhật (thêm, sửa, xóa dữ liệu)",
        "AnswerC": "Khôi phục CSDL khi có sự cố",
        "AnswerD": "Phát hiện và ngăn chặn sự truy cập không được phép",
        "AnswerCorrect": "B",
        "CreatedAt": "2023-06-05T00:00:00",
        "CreatedBy": 3
      },
      {
        "$id": "193",
        "Category": {
          "$ref": "181"
        },
        "CreatedByNavigation": {
          "$ref": "3"
        },
        "ExamDetail": [],
        "HistoryDetail": [],
        "Id": 1162,
        "CategoryId": 1005,
        "Content": "Đặc trưng của một mô hình dữ liệu?",
        "AnswerA": "Mô hình dữ liệu đơn giản",
        "AnswerB": "Biểu diễn dữ liệu đơn giản và không cấu trúc",
        "AnswerC": "Tính ổn định, tính đơn giản, cần phải kiểm tra dư thừa , đối xứng và có cơ sở lý thuyết vững chắc",
        "AnswerD": "Người sử dụng có quyền truy nhập tại mọi lúc, mọi nơi",
        "AnswerCorrect": "C",
        "CreatedAt": "2023-06-05T00:00:00",
        "CreatedBy": 3
      },
      {
        "$id": "194",
        "Category": {
          "$ref": "181"
        },
        "CreatedByNavigation": {
          "$ref": "3"
        },
        "ExamDetail": [],
        "HistoryDetail": [],
        "Id": 1163,
        "CategoryId": 1005,
        "Content": "Liên kết giữa các bảng được dựa trên?",
        "AnswerA": "Thuộc tính khóa",
        "AnswerB": "Các thuộc tính trùng tên nhau giữa các bảng",
        "AnswerC": "Ý định của người quản trị hệ CSDL",
        "AnswerD": "Ý định ghép các bảng thành một bảng có nhiều thuộc tính hơn",
        "AnswerCorrect": "A",
        "CreatedAt": "2023-06-05T00:00:00",
        "CreatedBy": 3
      },
      {
        "$id": "195",
        "Category": {
          "$ref": "181"
        },
        "CreatedByNavigation": {
          "$ref": "3"
        },
        "ExamDetail": [],
        "HistoryDetail": [],
        "Id": 1165,
        "CategoryId": 1005,
        "Content": "Thực thể là gì?",
        "AnswerA": "Các đối tượng dữ liệu",
        "AnswerB": "Các quan hệ",
        "AnswerC": "Các mối liên kết giữa các đối tượng",
        "AnswerD": "Các đối tượng và mối liên kết giữa các đối tượng",
        "AnswerCorrect": "A",
        "CreatedAt": "2023-06-05T00:00:00",
        "CreatedBy": 3
      },
      {
        "$id": "196",
        "Category": {
          "$ref": "181"
        },
        "CreatedByNavigation": {
          "$ref": "3"
        },
        "ExamDetail": [],
        "HistoryDetail": [],
        "Id": 1166,
        "CategoryId": 1005,
        "Content": "Trong quá trình cập nhật dữ liệu, được hệ quản trị CSDL kiểm soát để đảm bảo tính chất nào?",
        "AnswerA": "Tính chất ràng buộc toàn vẹn",
        "AnswerB": "Tính độc lập",
        "AnswerC": "Tính nhất quán",
        "AnswerD": "Tính bảo mật",
        "AnswerCorrect": "C",
        "CreatedAt": "2023-06-05T00:00:00",
        "CreatedBy": 3
      },
      {
        "$id": "197",
        "Category": {
          "$ref": "181"
        },
        "CreatedByNavigation": {
          "$ref": "3"
        },
        "ExamDetail": [],
        "HistoryDetail": [],
        "Id": 1167,
        "CategoryId": 1005,
        "Content": "Trường khóa chính là thường được gọi là gì?",
        "AnswerA": "Single Key",
        "AnswerB": "Unique Key",
        "AnswerC": "First Key",
        "AnswerD": "Primary Key",
        "AnswerCorrect": "D",
        "CreatedAt": "2023-06-05T00:00:00",
        "CreatedBy": 3
      },
      {
        "$id": "198",
        "Category": {
          "$ref": "181"
        },
        "CreatedByNavigation": {
          "$ref": "3"
        },
        "ExamDetail": [],
        "HistoryDetail": [],
        "Id": 1168,
        "CategoryId": 1005,
        "Content": "Khẳng định nào sau đây về CSDL quan hệ là đúng?",
        "AnswerA": "Tập hợp các bảng dữ liệu",
        "AnswerB": "Cơ sở dữ liệu được tạo ra từ hệ QTCSDL Access",
        "AnswerC": "Cơ sở dữ liệu mà giữa các dữ liệu có quan hệ với nhau",
        "AnswerD": "Cơ sở dữ liệu được xây dựng trên mô hình dữ liệu quan hệ",
        "AnswerCorrect": "D",
        "CreatedAt": "2023-06-05T00:00:00",
        "CreatedBy": 3
      },
      {
        "$id": "199",
        "Category": {
          "$ref": "181"
        },
        "CreatedByNavigation": {
          "$ref": "3"
        },
        "ExamDetail": [],
        "HistoryDetail": [],
        "Id": 1169,
        "CategoryId": 1005,
        "Content": "Đâu là câu lệnh điều kiện trong truy vấn CSDL?",
        "AnswerA": "Select",
        "AnswerB": "Where",
        "AnswerC": "Having",
        "AnswerD": "Like",
        "AnswerCorrect": "B",
        "CreatedAt": "2023-06-05T00:00:00",
        "CreatedBy": 3
      },
      {
        "$id": "200",
        "Category": {
          "$ref": "181"
        },
        "CreatedByNavigation": {
          "$ref": "3"
        },
        "ExamDetail": [],
        "HistoryDetail": [],
        "Id": 1170,
        "CategoryId": 1005,
        "Content": "Lệnh tạo database là gì?",
        "AnswerA": "Create Database demo sửa",
        "AnswerB": "Alter Databse",
        "AnswerC": "Select demo sửa",
        "AnswerD": "Drop Datable",
        "AnswerCorrect": "B",
        "CreatedAt": "2023-06-05T00:00:00",
        "CreatedBy": 3
      },
      {
        "$id": "201",
        "Category": {
          "$ref": "181"
        },
        "CreatedByNavigation": {
          "$ref": "3"
        },
        "ExamDetail": [],
        "HistoryDetail": [],
        "Id": 1171,
        "CategoryId": 1005,
        "Content": "Một hệ quản trị CSDL không có chức năng nào trong các chức năng dưới đây?",
        "AnswerA": "Cung cấp môi trường tạo lập CSDL",
        "AnswerB": "Cung cấp môi trường cập nhật và khai thác dữ liệu",
        "AnswerC": "Cung cấp công cụ quản lí bộ nhớ",
        "AnswerD": "Cung cấp công cụ kiểm soát, điều khiển truy cập vào CSDL",
        "AnswerCorrect": "C",
        "CreatedAt": "2024-05-14T00:00:00",
        "CreatedBy": 3
      },
      {
        "$id": "202",
        "Category": {
          "$ref": "181"
        },
        "CreatedByNavigation": {
          "$ref": "3"
        },
        "ExamDetail": [],
        "HistoryDetail": [],
        "Id": 1172,
        "CategoryId": 1005,
        "Content": "Ngôn ngữ định nghĩa dữ liệu thật chất là?",
        "AnswerA": "Ngôn ngữ lập trình Pascal",
        "AnswerB": "Ngôn ngữ C",
        "AnswerC": "Các kí hiệu toán học dùng để thực hiện các tính toán",
        "AnswerD": "Hệ thống các kí hiệu để mô tả CSDL",
        "AnswerCorrect": "D",
        "CreatedAt": "2024-05-14T00:00:00",
        "CreatedBy": 3
      },
      {
        "$id": "203",
        "Category": {
          "$ref": "181"
        },
        "CreatedByNavigation": {
          "$ref": "3"
        },
        "ExamDetail": [],
        "HistoryDetail": [],
        "Id": 1173,
        "CategoryId": 1005,
        "Content": "Ngôn ngữ định nghĩa dữ liệu bao gồm các lệnh cho phép?",
        "AnswerA": "Đảm bảo tính độc lập dữ liệu",
        "AnswerB": "Khai báo kiểu dữ liệu, cấu trúc dữ liệu và các ràng buộc trên dữ liệu của CSDL",
        "AnswerC": "Mô tả các đối tượng được lưu trữ trong CSDL",
        "AnswerD": "Khai báo kiểu dữ liệu của CSDL",
        "AnswerCorrect": "B",
        "CreatedAt": "2024-05-14T00:00:00",
        "CreatedBy": 3
      },
      {
        "$id": "204",
        "Category": {
          "$ref": "181"
        },
        "CreatedByNavigation": {
          "$ref": "3"
        },
        "ExamDetail": [],
        "HistoryDetail": [],
        "Id": 1174,
        "CategoryId": 1005,
        "Content": "Những nhiệm vụ nào dưới đây không thuộc nhiệm vụ của công cụ kiểm soát, điều khiển truy cập vào CSDL?",
        "AnswerA": "Duy trì tính nhất quán của CSDL",
        "AnswerB": "Cập nhật (thêm, sửa, xóa dữ liệu)",
        "AnswerC": "Khôi phục CSDL khi có sự cố",
        "AnswerD": "Phát hiện và ngăn chặn sự truy cập không được phép",
        "AnswerCorrect": "B",
        "CreatedAt": "2024-05-14T00:00:00",
        "CreatedBy": 3
      },
      {
        "$id": "205",
        "Category": {
          "$ref": "181"
        },
        "CreatedByNavigation": {
          "$ref": "3"
        },
        "ExamDetail": [],
        "HistoryDetail": [],
        "Id": 1175,
        "CategoryId": 1005,
        "Content": "Đặc trưng của một mô hình dữ liệu?",
        "AnswerA": "Mô hình dữ liệu đơn giản",
        "AnswerB": "Biểu diễn dữ liệu đơn giản và không cấu trúc",
        "AnswerC": "Tính ổn định, tính đơn giản, cần phải kiểm tra dư thừa , đối xứng và có cơ sở lý thuyết vững chắc",
        "AnswerD": "Người sử dụng có quyền truy nhập tại mọi lúc, mọi nơi",
        "AnswerCorrect": "C",
        "CreatedAt": "2024-05-14T00:00:00",
        "CreatedBy": 3
      },
      {
        "$id": "206",
        "Category": {
          "$ref": "181"
        },
        "CreatedByNavigation": {
          "$ref": "3"
        },
        "ExamDetail": [],
        "HistoryDetail": [],
        "Id": 1176,
        "CategoryId": 1005,
        "Content": "Liên kết giữa các bảng được dựa trên?",
        "AnswerA": "Thuộc tính khóa",
        "AnswerB": "Các thuộc tính trùng tên nhau giữa các bảng",
        "AnswerC": "Ý định của người quản trị hệ CSDL",
        "AnswerD": "Ý định ghép các bảng thành một bảng có nhiều thuộc tính hơn",
        "AnswerCorrect": "A",
        "CreatedAt": "2024-05-14T00:00:00",
        "CreatedBy": 3
      },
      {
        "$id": "207",
        "Category": {
          "$ref": "181"
        },
        "CreatedByNavigation": {
          "$ref": "3"
        },
        "ExamDetail": [],
        "HistoryDetail": [],
        "Id": 1177,
        "CategoryId": 1005,
        "Content": "SQL là tên viết tắt của?",
        "AnswerA": "Structure Query Language",
        "AnswerB": "Query Structure Language",
        "AnswerC": "Structure Question Language",
        "AnswerD": "Structure Query Locator",
        "AnswerCorrect": "A",
        "CreatedAt": "2024-05-14T00:00:00",
        "CreatedBy": 3
      },
      {
        "$id": "208",
        "Category": {
          "$ref": "181"
        },
        "CreatedByNavigation": {
          "$ref": "3"
        },
        "ExamDetail": [],
        "HistoryDetail": [],
        "Id": 1179,
        "CategoryId": 1005,
        "Content": "Trong quá trình cập nhật dữ liệu, được hệ quản trị CSDL kiểm soát để đảm bảo tính chất nào?",
        "AnswerA": "Tính chất ràng buộc toàn vẹn",
        "AnswerB": "Tính độc lập",
        "AnswerC": "Tính nhất quán",
        "AnswerD": "Tính bảo mật",
        "AnswerCorrect": "C",
        "CreatedAt": "2024-05-14T00:00:00",
        "CreatedBy": 3
      },
      {
        "$id": "209",
        "Category": {
          "$ref": "181"
        },
        "CreatedByNavigation": {
          "$ref": "3"
        },
        "ExamDetail": [],
        "HistoryDetail": [],
        "Id": 1181,
        "CategoryId": 1005,
        "Content": "Khẳng định nào sau đây về CSDL quan hệ là đúng?",
        "AnswerA": "Tập hợp các bảng dữ liệu",
        "AnswerB": "Cơ sở dữ liệu được tạo ra từ hệ QTCSDL Access",
        "AnswerC": "Cơ sở dữ liệu mà giữa các dữ liệu có quan hệ với nhau",
        "AnswerD": "Cơ sở dữ liệu được xây dựng trên mô hình dữ liệu quan hệ",
        "AnswerCorrect": "D",
        "CreatedAt": "2024-05-14T00:00:00",
        "CreatedBy": 3
      },
      {
        "$id": "210",
        "Category": {
          "$ref": "8"
        },
        "CreatedByNavigation": {
          "$ref": "3"
        },
        "ExamDetail": [],
        "HistoryDetail": [],
        "Id": 1183,
        "CategoryId": 1006,
        "Content": "demo cau hoi",
        "AnswerA": "A",
        "AnswerB": "B",
        "AnswerC": "C",
        "AnswerD": "D",
        "AnswerCorrect": "C",
        "CreatedAt": "2024-05-14T00:00:00",
        "CreatedBy": 3
      }
    ],
    "Rank": [],
    "Id": 3,
    "RoleId": 1,
    "FullName": "Admin",
    "UserName": "admin",
    "Password": "fe01ce2a7fbac8fafaed7c982a04e229",
    "CreateAt": "2023-05-29T19:59:51.413",
    "ConfirmToken": null,
    "IsActive": true,
    "Email": "vietsocial@gmail.com"
  },
  "ExamDetail": [
    {
      "$ref": "179"
    },
    {
      "$ref": "182"
    },
    {
      "$ref": "184"
    },
    {
      "$ref": "186"
    },
    {
      "$ref": "188"
    },
    {
      "$ref": "61"
    },
    {
      "$ref": "74"
    }
  ],
  "History": [],
  "Rank": [],
  "Id": 8,
  "CategoryId": 1008,
  "ExamName": "demo đề",
  "Time": 1,
  "CreateAt": "2024-05-14T13:38:15.08",
  "CreateBy": 3,
  "IsActive": true,
  "Level": 2
}', N'd36d2441-f463-42db-963c-4dd493e9dc0f')
SET IDENTITY_INSERT [dbo].[History] OFF
GO
SET IDENTITY_INSERT [dbo].[Question] ON 

INSERT [dbo].[Question] ([Id], [CategoryId], [Content], [AnswerA], [AnswerB], [AnswerC], [AnswerD], [AnswerCorrect], [CreatedAt], [CreatedBy]) VALUES (1113, 1006, N'Đâu là câu sai về ngôn ngữ Java?', N'Ngôn ngữ Java có phân biệt chữ hoa – chữ thường', N'Java là ngôn ngữ lập trình hướng đối tượng', N'Dấu chấm phẩy được sử dụng để kết thúc lệnh trong java', N'Chương trình viết bằng Java chỉ có thể chạy trên hệ điều hành Window', N'D', CAST(N'2023-06-04' AS Date), 3)
INSERT [dbo].[Question] ([Id], [CategoryId], [Content], [AnswerA], [AnswerB], [AnswerC], [AnswerD], [AnswerCorrect], [CreatedAt], [CreatedBy]) VALUES (1114, 1006, N'Cho xâu kí tự s=”ABCDEF”. Để lấy kỳ tự thứ ‘E’ của xâu ký tự s(String) dùng câu lệnh nào sau đây?', N's.charAt(5)', N's.charAt(4)', N's[5]', N's[4]', N'B', CAST(N'2023-06-04' AS Date), 3)
INSERT [dbo].[Question] ([Id], [CategoryId], [Content], [AnswerA], [AnswerB], [AnswerC], [AnswerD], [AnswerCorrect], [CreatedAt], [CreatedBy]) VALUES (1115, 1006, N'Phạm vi truy cập của một đối tượng khi được khai báo public là gì?', N'Có thể được truy cập từ bất kỳ vị trí nào trong chương trình', N'Có thể được truy cập từ các lớp trong cùng package', N'Có thể được truy cập từ các lớp trong cùng package và lớp con nằm trong package khác', N'Chỉ có thể truy cập từ các phương thức khác trong class đó', N'A', CAST(N'2023-06-04' AS Date), 3)
INSERT [dbo].[Question] ([Id], [CategoryId], [Content], [AnswerA], [AnswerB], [AnswerC], [AnswerD], [AnswerCorrect], [CreatedAt], [CreatedBy]) VALUES (1116, 1006, N'Phạm vi truy cập của một đối tượng khi được khai bao protected là gì?', N'Có thể được truy cập từ bất kỳ vị trí nào trong chương trình', N'Có thể được truy cập từ các lớp trong cùng package', N'Có thể được truy cập từ các lớp trong cùng package và lớp con nằm trong package khác', N'Chỉ có thể truy cập từ các phương thức khác trong class đó', N'C', CAST(N'2023-06-04' AS Date), 3)
INSERT [dbo].[Question] ([Id], [CategoryId], [Content], [AnswerA], [AnswerB], [AnswerC], [AnswerD], [AnswerCorrect], [CreatedAt], [CreatedBy]) VALUES (1117, 1006, N'Kiểu enum là gì?', N'Là kiểu dữ liệu gồm các trường chứa một tập hợp cố định các hằng số', N'Là kiểu dữ liệu liệt kê các biến số', N'Là một kiểu dữ liệu trong java', N'Tất cả đều sai', N'A', CAST(N'2023-06-04' AS Date), 3)
INSERT [dbo].[Question] ([Id], [CategoryId], [Content], [AnswerA], [AnswerB], [AnswerC], [AnswerD], [AnswerCorrect], [CreatedAt], [CreatedBy]) VALUES (1118, 1006, N'Một lớp trong Java có bao nhiêu lớp con?', N'2', N'3', N'Vô số', N'4', N'C', CAST(N'2023-06-04' AS Date), 3)
INSERT [dbo].[Question] ([Id], [CategoryId], [Content], [AnswerA], [AnswerB], [AnswerC], [AnswerD], [AnswerCorrect], [CreatedAt], [CreatedBy]) VALUES (1119, 1006, N'Một lớp trong Java có thể có bao nhiêu lớp cha?', N'2', N'1', N'3', N'4', N'B', CAST(N'2023-06-04' AS Date), 3)
INSERT [dbo].[Question] ([Id], [CategoryId], [Content], [AnswerA], [AnswerB], [AnswerC], [AnswerD], [AnswerCorrect], [CreatedAt], [CreatedBy]) VALUES (1120, 1006, N'Khi biên dịch gặp lỗi Exception in thread main java.lang.NoClassDefFoundError: myprogram. Lỗi này có nghĩa gì?', N'Đường dẫn chương trình sai', N'Không có hàm main', N'Không khai báo class', N'Không có từ khóa public tại mở đầu khai báo class', N'A', CAST(N'2023-06-04' AS Date), 3)
INSERT [dbo].[Question] ([Id], [CategoryId], [Content], [AnswerA], [AnswerB], [AnswerC], [AnswerD], [AnswerCorrect], [CreatedAt], [CreatedBy]) VALUES (1121, 1006, N'Ngôn ngữ lập trình Java cung cấp các chức năng nào sau đây?', N'Tất cả đáp án trên', N'Giao diện lập trình ứng dụng', N'Bộ công cụ giao diện người dùng', N'Thư viện tích hợp', N'A', CAST(N'2023-06-04' AS Date), 3)
INSERT [dbo].[Question] ([Id], [CategoryId], [Content], [AnswerA], [AnswerB], [AnswerC], [AnswerD], [AnswerCorrect], [CreatedAt], [CreatedBy]) VALUES (1122, 1006, N'Java chạy trên hệ điều hành nào sau đây?', N'Microsoft Windows', N'Linux', N'Sun Solaris OS', N'Tất cả các đáp án đều đúng', N'D', CAST(N'2023-06-04' AS Date), 3)
INSERT [dbo].[Question] ([Id], [CategoryId], [Content], [AnswerA], [AnswerB], [AnswerC], [AnswerD], [AnswerCorrect], [CreatedAt], [CreatedBy]) VALUES (1123, 1006, N'Java Virtual Machine là gì?', N'Là một thành phần của Java platform dùng để đọc mã bytecode trong file .class', N'Là chương trình biên dịch của java dùng để biên dịch file nguồn java thành mã bytecode', N'Là chương trình chạy cho java', N'Tất cả các đáp án đều đúng', N'A', CAST(N'2023-06-04' AS Date), 3)
INSERT [dbo].[Question] ([Id], [CategoryId], [Content], [AnswerA], [AnswerB], [AnswerC], [AnswerD], [AnswerCorrect], [CreatedAt], [CreatedBy]) VALUES (1124, 1006, N'Nếu phương thức của bạn ghi đè một trong số các phương thức của lớp cha, bạn có thể gọi phương thức bị ghi đè thông qua từ khóa nào?', N'parent', N'super', N'this', N'static', N'B', CAST(N'2023-06-04' AS Date), 3)
INSERT [dbo].[Question] ([Id], [CategoryId], [Content], [AnswerA], [AnswerB], [AnswerC], [AnswerD], [AnswerCorrect], [CreatedAt], [CreatedBy]) VALUES (1125, 1006, N'Phát biểu nào sau đây là đúng?', N'Mảng có thể lưu giữ các phần tử thuộc nhiều kiểu dữ liệu khác nhau', N'Chỉ số của mảng có thể sử dụng kiểu số thực (float, double)', N'Biểu thức array.length được sử dụng để trả về số phần tử trong mảng', N'Một phần tử của mảng không thể truyền vào trong một phương thức', N'C', CAST(N'2023-06-04' AS Date), 3)
INSERT [dbo].[Question] ([Id], [CategoryId], [Content], [AnswerA], [AnswerB], [AnswerC], [AnswerD], [AnswerCorrect], [CreatedAt], [CreatedBy]) VALUES (1126, 1006, N'Trong các khai báo sau đâu là khai báo không hợp lệ?', N'int a1[][] = new int[][3]', N'int a2[][] = new int[2][3]', N'int a3[][] = new int[2][]', N'int a4[][] = {{}, {}, {}}', N'A', CAST(N'2023-06-04' AS Date), 3)
INSERT [dbo].[Question] ([Id], [CategoryId], [Content], [AnswerA], [AnswerB], [AnswerC], [AnswerD], [AnswerCorrect], [CreatedAt], [CreatedBy]) VALUES (1127, 1006, N'Có mấy cách để truyền tham số vào cho một phương thức?', N'2', N'1', N'3', N'4', N'A', CAST(N'2023-06-04' AS Date), 3)
INSERT [dbo].[Question] ([Id], [CategoryId], [Content], [AnswerA], [AnswerB], [AnswerC], [AnswerD], [AnswerCorrect], [CreatedAt], [CreatedBy]) VALUES (1128, 1006, N'Đâu là khai báo biến hợp lệ?', N'theOne', N'the One', N'1the_One', N'$the One', N'A', CAST(N'2023-06-04' AS Date), 3)
INSERT [dbo].[Question] ([Id], [CategoryId], [Content], [AnswerA], [AnswerB], [AnswerC], [AnswerD], [AnswerCorrect], [CreatedAt], [CreatedBy]) VALUES (1129, 1006, N'Với giá trị nào của x, thì biểu thức x % 3 == 0 trả về true với x là kiểu số nguyên?', N'2', N'7', N'4', N'9', N'D', CAST(N'2023-06-04' AS Date), 3)
INSERT [dbo].[Question] ([Id], [CategoryId], [Content], [AnswerA], [AnswerB], [AnswerC], [AnswerD], [AnswerCorrect], [CreatedAt], [CreatedBy]) VALUES (1130, 1006, N'Kiểu dữ liệu nào trong Java chứa giá trị bao gồm cả chữ và số?', N'int', N'byte', N'char', N'String', N'D', CAST(N'2023-06-04' AS Date), 3)
INSERT [dbo].[Question] ([Id], [CategoryId], [Content], [AnswerA], [AnswerB], [AnswerC], [AnswerD], [AnswerCorrect], [CreatedAt], [CreatedBy]) VALUES (1131, 1006, N'Đối tượng trong Java là gì?', N'Các lớp được tạo thể hiện từ đó', N'Một thể hiện của lớp', N'Một tham chiếu đến một thuộc tính', N'Một biến', N'B', CAST(N'2023-06-04' AS Date), 3)
INSERT [dbo].[Question] ([Id], [CategoryId], [Content], [AnswerA], [AnswerB], [AnswerC], [AnswerD], [AnswerCorrect], [CreatedAt], [CreatedBy]) VALUES (1132, 1006, N'Đâu không phải là thành phần trong cấu trúc của lớp trong Java.', N'Tên lớp', N'Thuộc tính', N'Phương thức', N'Biến', N'D', CAST(N'2023-06-04' AS Date), 3)
INSERT [dbo].[Question] ([Id], [CategoryId], [Content], [AnswerA], [AnswerB], [AnswerC], [AnswerD], [AnswerCorrect], [CreatedAt], [CreatedBy]) VALUES (1133, 1006, N'Giả sử đã định nghĩa lớp XX với một phương thức thông thường là Display, sau đó sinh ra đối tượng objX từ lớp XX. Để gọi phương thức Display ta sử dụng cú pháp nào?', N'XX.Display;', N'XX.Display();', N'objX.Display();', N'Display();', N'C', CAST(N'2023-06-04' AS Date), 3)
INSERT [dbo].[Question] ([Id], [CategoryId], [Content], [AnswerA], [AnswerB], [AnswerC], [AnswerD], [AnswerCorrect], [CreatedAt], [CreatedBy]) VALUES (1134, 1006, N'Tên đầu tiên của Java là gì?', N'Java', N'Oak', N'Cafe', N'James golings', N'B', CAST(N'2023-06-04' AS Date), 3)
INSERT [dbo].[Question] ([Id], [CategoryId], [Content], [AnswerA], [AnswerB], [AnswerC], [AnswerD], [AnswerCorrect], [CreatedAt], [CreatedBy]) VALUES (1135, 1006, N'Gói nào trong java chứa lớp Scanner dùng để nhập dữ liệu từ bàn phím?', N'java.net', N'java.io', N'java.util', N'java.awt', N'C', CAST(N'2023-06-04' AS Date), 3)
INSERT [dbo].[Question] ([Id], [CategoryId], [Content], [AnswerA], [AnswerB], [AnswerC], [AnswerD], [AnswerCorrect], [CreatedAt], [CreatedBy]) VALUES (1136, 1006, N'Đâu là khai báo đúng về lớp Cat?', N'class public Cat{}', N'public class Cat{}', N'interface Cat{}', N'static Cat{}', N'B', CAST(N'2023-06-04' AS Date), 3)
INSERT [dbo].[Question] ([Id], [CategoryId], [Content], [AnswerA], [AnswerB], [AnswerC], [AnswerD], [AnswerCorrect], [CreatedAt], [CreatedBy]) VALUES (1137, 1006, N'Muốn chạy được chương trình Java, chỉ cần cài phần mền nào sau đây?', N'JDK', N'Java Platform', N'Eclipse', N'Netbeans', N'B', CAST(N'2023-06-04' AS Date), 3)
INSERT [dbo].[Question] ([Id], [CategoryId], [Content], [AnswerA], [AnswerB], [AnswerC], [AnswerD], [AnswerCorrect], [CreatedAt], [CreatedBy]) VALUES (1138, 1006, N'Phương thức next() của lớp Scanner dùng để làm gì?', N'Nhập một chuỗi', N'Nhập một số nguyên', N'Nhập một ký tự', N'Không có phương thức này', N'A', CAST(N'2023-06-04' AS Date), 3)
INSERT [dbo].[Question] ([Id], [CategoryId], [Content], [AnswerA], [AnswerB], [AnswerC], [AnswerD], [AnswerCorrect], [CreatedAt], [CreatedBy]) VALUES (1139, 1006, N'Trong câu lệnh sau: public static void main(String[] agrs) thì phần tử agrs[0] chứa giá trị gì?', N'Tên của chương trình', N'Số lượng tham số', N'Tham số đầu tiên trong danh sách tham số', N'Không câu nào đúng', N'C', CAST(N'2023-06-04' AS Date), 3)
INSERT [dbo].[Question] ([Id], [CategoryId], [Content], [AnswerA], [AnswerB], [AnswerC], [AnswerD], [AnswerCorrect], [CreatedAt], [CreatedBy]) VALUES (1140, 1006, N'Đâu không phải là một kiểu dữ liệu nguyên thủy trong Java?', N'double', N'int', N'long', N'long float', N'D', CAST(N'2023-06-04' AS Date), 3)
INSERT [dbo].[Question] ([Id], [CategoryId], [Content], [AnswerA], [AnswerB], [AnswerC], [AnswerD], [AnswerCorrect], [CreatedAt], [CreatedBy]) VALUES (1141, 1006, N'Trong Java, kiểu dữ liệu nào là một địa chỉ của đối tượng hoặc một mảng được tạo ra trong bộ nhớ?', N'Kiểu format', N'Không có đáp án đúng', N'Kiểu primitive', N'Kiểu reference', N'D', CAST(N'2023-06-04' AS Date), 3)
INSERT [dbo].[Question] ([Id], [CategoryId], [Content], [AnswerA], [AnswerB], [AnswerC], [AnswerD], [AnswerCorrect], [CreatedAt], [CreatedBy]) VALUES (1142, 1006, N'Biến dữ liệu là các biến dạng nào sau đây?', N'Biến lớp và Tham số', N'Biến cục bộ và Tham số', N'Biến cục bộ và biến lớp', N'Các đáp án đều sai', N'B', CAST(N'2023-06-04' AS Date), 3)
INSERT [dbo].[Question] ([Id], [CategoryId], [Content], [AnswerA], [AnswerB], [AnswerC], [AnswerD], [AnswerCorrect], [CreatedAt], [CreatedBy]) VALUES (1143, 1007, N'Thiết bị hub thông thường nằm ở tầng nào của mô hình OSI?', N'Tầng 1', N'Tầng 2', N'Tầng 3', N'Tất cả đều sai', N'A', CAST(N'2023-06-04' AS Date), 3)
INSERT [dbo].[Question] ([Id], [CategoryId], [Content], [AnswerA], [AnswerB], [AnswerC], [AnswerD], [AnswerCorrect], [CreatedAt], [CreatedBy]) VALUES (1144, 1007, N'Thiết bị Switch thông thường nằm ở tầng nào của mô hình OSI?', N'Tầng 1', N'Tầng 2', N'Tầng 3', N'Tất cả đều sai', N'B', CAST(N'2023-06-04' AS Date), 3)
INSERT [dbo].[Question] ([Id], [CategoryId], [Content], [AnswerA], [AnswerB], [AnswerC], [AnswerD], [AnswerCorrect], [CreatedAt], [CreatedBy]) VALUES (1145, 1007, N'Thiết bị Bridge nằm ở tầng nào của mô hình OSI?', N'Tầng 1', N'Tầng 2', N'Tầng 3', N'Tất cả đều sai', N'B', CAST(N'2023-06-04' AS Date), 3)
INSERT [dbo].[Question] ([Id], [CategoryId], [Content], [AnswerA], [AnswerB], [AnswerC], [AnswerD], [AnswerCorrect], [CreatedAt], [CreatedBy]) VALUES (1146, 1007, N'Thiết bị router có bao nhiêu Broadcast domain?', N'1 broadcast/1port', N'2', N'3', N'4', N'B', CAST(N'2023-06-04' AS Date), 3)
INSERT [dbo].[Question] ([Id], [CategoryId], [Content], [AnswerA], [AnswerB], [AnswerC], [AnswerD], [AnswerCorrect], [CreatedAt], [CreatedBy]) VALUES (1147, 1007, N'Thiết bị Router có bao nhiêu collision domain?', N'1', N'2', N'3', N'4', N'A', CAST(N'2023-06-04' AS Date), 3)
INSERT [dbo].[Question] ([Id], [CategoryId], [Content], [AnswerA], [AnswerB], [AnswerC], [AnswerD], [AnswerCorrect], [CreatedAt], [CreatedBy]) VALUES (1148, 1007, N'Cáp UTP có thể kết nối tối đa bao nhiêu mét?', N'10', N'20', N'100', N'200', N'C', CAST(N'2023-06-04' AS Date), 3)
INSERT [dbo].[Question] ([Id], [CategoryId], [Content], [AnswerA], [AnswerB], [AnswerC], [AnswerD], [AnswerCorrect], [CreatedAt], [CreatedBy]) VALUES (1149, 1007, N'Cáp quang có thể kết nối tối đa bao nhiêu mét?', N'1000', N'2000', N'500', N'Dưới 500', N'B', CAST(N'2023-06-04' AS Date), 3)
INSERT [dbo].[Question] ([Id], [CategoryId], [Content], [AnswerA], [AnswerB], [AnswerC], [AnswerD], [AnswerCorrect], [CreatedAt], [CreatedBy]) VALUES (1150, 1007, N'Để nối Router và máy tính ta phải bấm cáp kiểu nào?', N'Thẳng', N'Chéo', N'Kiểu nào cũng được', N'Tất cả đều sai', N'A', CAST(N'2023-06-04' AS Date), 3)
INSERT [dbo].[Question] ([Id], [CategoryId], [Content], [AnswerA], [AnswerB], [AnswerC], [AnswerD], [AnswerCorrect], [CreatedAt], [CreatedBy]) VALUES (1151, 1007, N'Định nghĩa giao thức (protocol) là gì?', N'Là các tín hiệu nhị phân truyền đi trước khi truyền dữ liệu thật sự', N'Là cơ chế “bắt tay ba lần” mà mọi thiết bị mạng đều phải thực hiện khi khởi động', N'Là một tập các đặc tả mà mọi nhà sản xuất sản phẩm mạng phải dựa theo để thiết kế sản phẩm của mình', N'Tất cả đáp án trên', N'A', CAST(N'2023-06-04' AS Date), 3)
INSERT [dbo].[Question] ([Id], [CategoryId], [Content], [AnswerA], [AnswerB], [AnswerC], [AnswerD], [AnswerCorrect], [CreatedAt], [CreatedBy]) VALUES (1152, 1007, N'Để kết nối hai HUB với nhau ta sử dụng kiểu bấm cáp nào?', N'Thẳng (straight-through)', N'Chéo (cross-over)', N'Console', N'Tất cả đều đúng', N'B', CAST(N'2023-06-04' AS Date), 3)
INSERT [dbo].[Question] ([Id], [CategoryId], [Content], [AnswerA], [AnswerB], [AnswerC], [AnswerD], [AnswerCorrect], [CreatedAt], [CreatedBy]) VALUES (1153, 1007, N'Subnet mask trong một cổng seria của router là 11111000. Số thập phân của nó là gì?', N'210', N'224', N'240', N'248', N'D', CAST(N'2023-06-04' AS Date), 3)
INSERT [dbo].[Question] ([Id], [CategoryId], [Content], [AnswerA], [AnswerB], [AnswerC], [AnswerD], [AnswerCorrect], [CreatedAt], [CreatedBy]) VALUES (1154, 1007, N'Chức năng chính của router là?', N'Kết nối LAN với LAN', N'Chia nhỏ broadcast domain', N'Tất cả đều đúng', N'Tất cả đều sai', N'B', CAST(N'2023-06-04' AS Date), 3)
INSERT [dbo].[Question] ([Id], [CategoryId], [Content], [AnswerA], [AnswerB], [AnswerC], [AnswerD], [AnswerCorrect], [CreatedAt], [CreatedBy]) VALUES (1155, 1007, N'Modem dùng để?', N'Giao tiếp với mạng', N'Truyền dữ liệu đi xa', N'Truyền dữ liệu trong mạng LAN', N'A và B', N'D', CAST(N'2023-06-04' AS Date), 3)
INSERT [dbo].[Question] ([Id], [CategoryId], [Content], [AnswerA], [AnswerB], [AnswerC], [AnswerD], [AnswerCorrect], [CreatedAt], [CreatedBy]) VALUES (1156, 1007, N'Dịch vụ nào cho phép người sử dụng từ một trạm làm việc của mình có thể đăng nhập vào một trạm ở xa qua mạng và có thể làm việc với hệ thống?', N'Telnet', N'Email', N'FTP', N'WWW', N'A', CAST(N'2023-06-04' AS Date), 3)
INSERT [dbo].[Question] ([Id], [CategoryId], [Content], [AnswerA], [AnswerB], [AnswerC], [AnswerD], [AnswerCorrect], [CreatedAt], [CreatedBy]) VALUES (1157, 1007, N'Phát biểu nào sau đây mô tả đúng nhất cho cấu hình Star?', N'Cần ít cáp hơn nhiều so với các cấu hình khác', N'Khi cáp đứt tại một điểm nào đó làm toàn bộ mạng ngưng hoạt động', N'Khó tái lập cấu hình hơn so với các cấu hình khác', N'Dễ kiểm soát và quản lý tập trung', N'D', CAST(N'2023-06-04' AS Date), 3)
INSERT [dbo].[Question] ([Id], [CategoryId], [Content], [AnswerA], [AnswerB], [AnswerC], [AnswerD], [AnswerCorrect], [CreatedAt], [CreatedBy]) VALUES (1158, 1005, N'Một hệ quản trị CSDL không có chức năng nào trong các chức năng dưới đây?', N'Cung cấp môi trường tạo lập CSDL', N'Cung cấp môi trường cập nhật và khai thác dữ liệu', N'Cung cấp công cụ quản lí bộ nhớ', N'Cung cấp công cụ kiểm soát, điều khiển truy cập vào CSDL', N'C', CAST(N'2023-06-05' AS Date), 3)
INSERT [dbo].[Question] ([Id], [CategoryId], [Content], [AnswerA], [AnswerB], [AnswerC], [AnswerD], [AnswerCorrect], [CreatedAt], [CreatedBy]) VALUES (1159, 1005, N'Ngôn ngữ định nghĩa dữ liệu thật chất là?', N'Ngôn ngữ lập trình Pascal', N'Ngôn ngữ C', N'Các kí hiệu toán học dùng để thực hiện các tính toán', N'Hệ thống các kí hiệu để mô tả CSDL', N'D', CAST(N'2023-06-05' AS Date), 3)
INSERT [dbo].[Question] ([Id], [CategoryId], [Content], [AnswerA], [AnswerB], [AnswerC], [AnswerD], [AnswerCorrect], [CreatedAt], [CreatedBy]) VALUES (1160, 1005, N'Ngôn ngữ định nghĩa dữ liệu bao gồm các lệnh cho phép?', N'Đảm bảo tính độc lập dữ liệu', N'Khai báo kiểu dữ liệu, cấu trúc dữ liệu và các ràng buộc trên dữ liệu của CSDL', N'Mô tả các đối tượng được lưu trữ trong CSDL', N'Khai báo kiểu dữ liệu của CSDL', N'B', CAST(N'2023-06-05' AS Date), 3)
INSERT [dbo].[Question] ([Id], [CategoryId], [Content], [AnswerA], [AnswerB], [AnswerC], [AnswerD], [AnswerCorrect], [CreatedAt], [CreatedBy]) VALUES (1161, 1005, N'Những nhiệm vụ nào dưới đây không thuộc nhiệm vụ của công cụ kiểm soát, điều khiển truy cập vào CSDL?', N'Duy trì tính nhất quán của CSDL', N'Cập nhật (thêm, sửa, xóa dữ liệu)', N'Khôi phục CSDL khi có sự cố', N'Phát hiện và ngăn chặn sự truy cập không được phép', N'B', CAST(N'2023-06-05' AS Date), 3)
INSERT [dbo].[Question] ([Id], [CategoryId], [Content], [AnswerA], [AnswerB], [AnswerC], [AnswerD], [AnswerCorrect], [CreatedAt], [CreatedBy]) VALUES (1162, 1005, N'Đặc trưng của một mô hình dữ liệu?', N'Mô hình dữ liệu đơn giản', N'Biểu diễn dữ liệu đơn giản và không cấu trúc', N'Tính ổn định, tính đơn giản, cần phải kiểm tra dư thừa , đối xứng và có cơ sở lý thuyết vững chắc', N'Người sử dụng có quyền truy nhập tại mọi lúc, mọi nơi', N'C', CAST(N'2023-06-05' AS Date), 3)
INSERT [dbo].[Question] ([Id], [CategoryId], [Content], [AnswerA], [AnswerB], [AnswerC], [AnswerD], [AnswerCorrect], [CreatedAt], [CreatedBy]) VALUES (1163, 1005, N'Liên kết giữa các bảng được dựa trên?', N'Thuộc tính khóa', N'Các thuộc tính trùng tên nhau giữa các bảng', N'Ý định của người quản trị hệ CSDL', N'Ý định ghép các bảng thành một bảng có nhiều thuộc tính hơn', N'A', CAST(N'2023-06-05' AS Date), 3)
INSERT [dbo].[Question] ([Id], [CategoryId], [Content], [AnswerA], [AnswerB], [AnswerC], [AnswerD], [AnswerCorrect], [CreatedAt], [CreatedBy]) VALUES (1164, 1005, N'SQL là tên viết tắt của?', N'Structure Query Language', N'Structure Question Language', N'Query Structure Language', N'Structure Query Locator', N'A', CAST(N'2023-06-05' AS Date), 3)
INSERT [dbo].[Question] ([Id], [CategoryId], [Content], [AnswerA], [AnswerB], [AnswerC], [AnswerD], [AnswerCorrect], [CreatedAt], [CreatedBy]) VALUES (1165, 1005, N'Thực thể là gì?', N'Các đối tượng dữ liệu', N'Các quan hệ', N'Các mối liên kết giữa các đối tượng', N'Các đối tượng và mối liên kết giữa các đối tượng', N'A', CAST(N'2023-06-05' AS Date), 3)
INSERT [dbo].[Question] ([Id], [CategoryId], [Content], [AnswerA], [AnswerB], [AnswerC], [AnswerD], [AnswerCorrect], [CreatedAt], [CreatedBy]) VALUES (1166, 1005, N'Trong quá trình cập nhật dữ liệu, được hệ quản trị CSDL kiểm soát để đảm bảo tính chất nào?', N'Tính chất ràng buộc toàn vẹn', N'Tính độc lập', N'Tính nhất quán', N'Tính bảo mật', N'C', CAST(N'2023-06-05' AS Date), 3)
INSERT [dbo].[Question] ([Id], [CategoryId], [Content], [AnswerA], [AnswerB], [AnswerC], [AnswerD], [AnswerCorrect], [CreatedAt], [CreatedBy]) VALUES (1167, 1005, N'Trường khóa chính là thường được gọi là gì?', N'Single Key', N'Unique Key', N'First Key', N'Primary Key', N'D', CAST(N'2023-06-05' AS Date), 3)
INSERT [dbo].[Question] ([Id], [CategoryId], [Content], [AnswerA], [AnswerB], [AnswerC], [AnswerD], [AnswerCorrect], [CreatedAt], [CreatedBy]) VALUES (1168, 1005, N'Khẳng định nào sau đây về CSDL quan hệ là đúng?', N'Tập hợp các bảng dữ liệu', N'Cơ sở dữ liệu được tạo ra từ hệ QTCSDL Access', N'Cơ sở dữ liệu mà giữa các dữ liệu có quan hệ với nhau', N'Cơ sở dữ liệu được xây dựng trên mô hình dữ liệu quan hệ', N'D', CAST(N'2023-06-05' AS Date), 3)
INSERT [dbo].[Question] ([Id], [CategoryId], [Content], [AnswerA], [AnswerB], [AnswerC], [AnswerD], [AnswerCorrect], [CreatedAt], [CreatedBy]) VALUES (1169, 1005, N'Đâu là câu lệnh điều kiện trong truy vấn CSDL?', N'Select', N'Where', N'Having', N'Like', N'B', CAST(N'2023-06-05' AS Date), 3)
INSERT [dbo].[Question] ([Id], [CategoryId], [Content], [AnswerA], [AnswerB], [AnswerC], [AnswerD], [AnswerCorrect], [CreatedAt], [CreatedBy]) VALUES (1170, 1005, N'Lệnh tạo database là gì?', N'Create Database demo sửa', N'Alter Databse', N'Select demo sửa', N'Drop Datable', N'B', CAST(N'2023-06-05' AS Date), 3)
INSERT [dbo].[Question] ([Id], [CategoryId], [Content], [AnswerA], [AnswerB], [AnswerC], [AnswerD], [AnswerCorrect], [CreatedAt], [CreatedBy]) VALUES (1171, 1005, N'Một hệ quản trị CSDL không có chức năng nào trong các chức năng dưới đây?', N'Cung cấp môi trường tạo lập CSDL', N'Cung cấp môi trường cập nhật và khai thác dữ liệu', N'Cung cấp công cụ quản lí bộ nhớ', N'Cung cấp công cụ kiểm soát, điều khiển truy cập vào CSDL', N'C', CAST(N'2024-05-14' AS Date), 3)
INSERT [dbo].[Question] ([Id], [CategoryId], [Content], [AnswerA], [AnswerB], [AnswerC], [AnswerD], [AnswerCorrect], [CreatedAt], [CreatedBy]) VALUES (1172, 1005, N'Ngôn ngữ định nghĩa dữ liệu thật chất là?', N'Ngôn ngữ lập trình Pascal', N'Ngôn ngữ C', N'Các kí hiệu toán học dùng để thực hiện các tính toán', N'Hệ thống các kí hiệu để mô tả CSDL', N'D', CAST(N'2024-05-14' AS Date), 3)
INSERT [dbo].[Question] ([Id], [CategoryId], [Content], [AnswerA], [AnswerB], [AnswerC], [AnswerD], [AnswerCorrect], [CreatedAt], [CreatedBy]) VALUES (1173, 1005, N'Ngôn ngữ định nghĩa dữ liệu bao gồm các lệnh cho phép?', N'Đảm bảo tính độc lập dữ liệu', N'Khai báo kiểu dữ liệu, cấu trúc dữ liệu và các ràng buộc trên dữ liệu của CSDL', N'Mô tả các đối tượng được lưu trữ trong CSDL', N'Khai báo kiểu dữ liệu của CSDL', N'B', CAST(N'2024-05-14' AS Date), 3)
INSERT [dbo].[Question] ([Id], [CategoryId], [Content], [AnswerA], [AnswerB], [AnswerC], [AnswerD], [AnswerCorrect], [CreatedAt], [CreatedBy]) VALUES (1174, 1005, N'Những nhiệm vụ nào dưới đây không thuộc nhiệm vụ của công cụ kiểm soát, điều khiển truy cập vào CSDL?', N'Duy trì tính nhất quán của CSDL', N'Cập nhật (thêm, sửa, xóa dữ liệu)', N'Khôi phục CSDL khi có sự cố', N'Phát hiện và ngăn chặn sự truy cập không được phép', N'B', CAST(N'2024-05-14' AS Date), 3)
INSERT [dbo].[Question] ([Id], [CategoryId], [Content], [AnswerA], [AnswerB], [AnswerC], [AnswerD], [AnswerCorrect], [CreatedAt], [CreatedBy]) VALUES (1175, 1005, N'Đặc trưng của một mô hình dữ liệu?', N'Mô hình dữ liệu đơn giản', N'Biểu diễn dữ liệu đơn giản và không cấu trúc', N'Tính ổn định, tính đơn giản, cần phải kiểm tra dư thừa , đối xứng và có cơ sở lý thuyết vững chắc', N'Người sử dụng có quyền truy nhập tại mọi lúc, mọi nơi', N'C', CAST(N'2024-05-14' AS Date), 3)
INSERT [dbo].[Question] ([Id], [CategoryId], [Content], [AnswerA], [AnswerB], [AnswerC], [AnswerD], [AnswerCorrect], [CreatedAt], [CreatedBy]) VALUES (1176, 1005, N'Liên kết giữa các bảng được dựa trên?', N'Thuộc tính khóa', N'Các thuộc tính trùng tên nhau giữa các bảng', N'Ý định của người quản trị hệ CSDL', N'Ý định ghép các bảng thành một bảng có nhiều thuộc tính hơn', N'A', CAST(N'2024-05-14' AS Date), 3)
INSERT [dbo].[Question] ([Id], [CategoryId], [Content], [AnswerA], [AnswerB], [AnswerC], [AnswerD], [AnswerCorrect], [CreatedAt], [CreatedBy]) VALUES (1177, 1005, N'SQL là tên viết tắt của?', N'Structure Query Language', N'Query Structure Language', N'Structure Question Language', N'Structure Query Locator', N'A', CAST(N'2024-05-14' AS Date), 3)
INSERT [dbo].[Question] ([Id], [CategoryId], [Content], [AnswerA], [AnswerB], [AnswerC], [AnswerD], [AnswerCorrect], [CreatedAt], [CreatedBy]) VALUES (1178, 1005, N'Thực thể là gì?', N'Các đối tượng dữ liệu', N'Các mối liên kết giữa các đối tượng', N'Các quan hệ', N'Các đối tượng và mối liên kết giữa các đối tượng', N'A', CAST(N'2024-05-14' AS Date), 3)
INSERT [dbo].[Question] ([Id], [CategoryId], [Content], [AnswerA], [AnswerB], [AnswerC], [AnswerD], [AnswerCorrect], [CreatedAt], [CreatedBy]) VALUES (1179, 1005, N'Trong quá trình cập nhật dữ liệu, được hệ quản trị CSDL kiểm soát để đảm bảo tính chất nào?', N'Tính chất ràng buộc toàn vẹn', N'Tính độc lập', N'Tính nhất quán', N'Tính bảo mật', N'C', CAST(N'2024-05-14' AS Date), 3)
INSERT [dbo].[Question] ([Id], [CategoryId], [Content], [AnswerA], [AnswerB], [AnswerC], [AnswerD], [AnswerCorrect], [CreatedAt], [CreatedBy]) VALUES (1180, 1005, N'Trường khóa chính là thường được gọi là gì?', N'Single Key', N'First Key', N'Unique Key', N'Primary Key', N'D', CAST(N'2024-05-14' AS Date), 3)
INSERT [dbo].[Question] ([Id], [CategoryId], [Content], [AnswerA], [AnswerB], [AnswerC], [AnswerD], [AnswerCorrect], [CreatedAt], [CreatedBy]) VALUES (1181, 1005, N'Khẳng định nào sau đây về CSDL quan hệ là đúng?', N'Tập hợp các bảng dữ liệu', N'Cơ sở dữ liệu được tạo ra từ hệ QTCSDL Access', N'Cơ sở dữ liệu mà giữa các dữ liệu có quan hệ với nhau', N'Cơ sở dữ liệu được xây dựng trên mô hình dữ liệu quan hệ', N'D', CAST(N'2024-05-14' AS Date), 3)
INSERT [dbo].[Question] ([Id], [CategoryId], [Content], [AnswerA], [AnswerB], [AnswerC], [AnswerD], [AnswerCorrect], [CreatedAt], [CreatedBy]) VALUES (1182, 1005, N'Đâu là câu lệnh điều kiện trong truy vấn CSDL?', N'Select', N'Where', N'Like', N'Having', N'B', CAST(N'2024-05-14' AS Date), 3)
INSERT [dbo].[Question] ([Id], [CategoryId], [Content], [AnswerA], [AnswerB], [AnswerC], [AnswerD], [AnswerCorrect], [CreatedAt], [CreatedBy]) VALUES (1183, 1006, N'demo cau hoi', N'A', N'B', N'C', N'D', N'C', CAST(N'2024-05-14' AS Date), 3)
INSERT [dbo].[Question] ([Id], [CategoryId], [Content], [AnswerA], [AnswerB], [AnswerC], [AnswerD], [AnswerCorrect], [CreatedAt], [CreatedBy]) VALUES (1184, 1008, N'fd', N'fds', N'sfd', N'fsd', N'dsf', N'B', CAST(N'2024-05-14' AS Date), 3)
SET IDENTITY_INSERT [dbo].[Question] OFF
GO
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([Id], [RoleName], [CreateAt]) VALUES (1, N'Admin', CAST(N'2023-05-23T22:16:56.967' AS DateTime))
INSERT [dbo].[Role] ([Id], [RoleName], [CreateAt]) VALUES (2, N'Khách hàng', CAST(N'2023-05-23T22:17:02.637' AS DateTime))
SET IDENTITY_INSERT [dbo].[Role] OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([Id], [RoleId], [FullName], [UserName], [Password], [CreateAt], [ConfirmToken], [IsActive], [Email]) VALUES (1, 1, N'Hà Duy Anh', N'duyanh', N'202cb962ac59075b964b07152d234b70', CAST(N'2023-05-29T19:59:37.617' AS DateTime), NULL, 1, N'vietsocial@gmail.com')
INSERT [dbo].[User] ([Id], [RoleId], [FullName], [UserName], [Password], [CreateAt], [ConfirmToken], [IsActive], [Email]) VALUES (3, 1, N'Admin', N'admin', N'fe01ce2a7fbac8fafaed7c982a04e229', CAST(N'2023-05-29T19:59:51.413' AS DateTime), NULL, 1, N'vietsocial@gmail.com')
INSERT [dbo].[User] ([Id], [RoleId], [FullName], [UserName], [Password], [CreateAt], [ConfirmToken], [IsActive], [Email]) VALUES (4, 2, N'Văn Chiến', N'chien', N'202cb962ac59075b964b07152d234b70', CAST(N'2023-06-04T08:59:26.400' AS DateTime), NULL, 1, N'vietsocial@gmail.com')
INSERT [dbo].[User] ([Id], [RoleId], [FullName], [UserName], [Password], [CreateAt], [ConfirmToken], [IsActive], [Email]) VALUES (5, 2, N'Vũ Hiếu', N'vuhieu', N'202cb962ac59075b964b07152d234b70', CAST(N'2023-06-04T20:06:16.193' AS DateTime), NULL, 1, N'vietsocial@gmail.com')
INSERT [dbo].[User] ([Id], [RoleId], [FullName], [UserName], [Password], [CreateAt], [ConfirmToken], [IsActive], [Email]) VALUES (6, 2, N'Công Phúc', N'congphuc', N'202cb962ac59075b964b07152d234b70', CAST(N'2023-06-05T10:25:43.660' AS DateTime), NULL, 1, N'vietsocial@gmail.com')
INSERT [dbo].[User] ([Id], [RoleId], [FullName], [UserName], [Password], [CreateAt], [ConfirmToken], [IsActive], [Email]) VALUES (7, 2, N'demo', N'demo', N'fe01ce2a7fbac8fafaed7c982a04e229', CAST(N'2024-05-14T11:36:29.470' AS DateTime), NULL, 1, N'vietsocial@gmail.com')
INSERT [dbo].[User] ([Id], [RoleId], [FullName], [UserName], [Password], [CreateAt], [ConfirmToken], [IsActive], [Email]) VALUES (8, 2, N'sinhvien', N'sinhvien', N'615ad206666f8086103305b8f77173f4', CAST(N'2024-05-14T13:29:04.243' AS DateTime), NULL, 1, N'vietsocial@gmail.com')
INSERT [dbo].[User] ([Id], [RoleId], [FullName], [UserName], [Password], [CreateAt], [ConfirmToken], [IsActive], [Email]) VALUES (9, 1, N'thanhvien', N'thanhvien', N'e81c20665a765669ba51389b362ec15e', CAST(N'2024-05-14T13:33:15.560' AS DateTime), NULL, 1, N'vietsocial@gmail.com')
SET IDENTITY_INSERT [dbo].[User] OFF
GO
ALTER TABLE [dbo].[Category] ADD  DEFAULT (getdate()) FOR [CreateAt]
GO
ALTER TABLE [dbo].[Exam] ADD  CONSTRAINT [DF__Exam__CreateAt__34C8D9D1]  DEFAULT (getdate()) FOR [CreateAt]
GO
ALTER TABLE [dbo].[History] ADD  CONSTRAINT [DF_History_CreatedAt]  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[Question] ADD  CONSTRAINT [DF__Question__Create__36B12243]  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[Role] ADD  DEFAULT (getdate()) FOR [CreateAt]
GO
ALTER TABLE [dbo].[User] ADD  DEFAULT (getdate()) FOR [CreateAt]
GO
ALTER TABLE [dbo].[Exam]  WITH CHECK ADD  CONSTRAINT [FK__Exam__CategoryId__3A81B327] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Category] ([Id])
GO
ALTER TABLE [dbo].[Exam] CHECK CONSTRAINT [FK__Exam__CategoryId__3A81B327]
GO
ALTER TABLE [dbo].[Exam]  WITH CHECK ADD  CONSTRAINT [FK__Exam__CreateBy__3B75D760] FOREIGN KEY([CreateBy])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[Exam] CHECK CONSTRAINT [FK__Exam__CreateBy__3B75D760]
GO
ALTER TABLE [dbo].[ExamDetail]  WITH CHECK ADD  CONSTRAINT [FK__ExamDetai__ExamI__3C69FB99] FOREIGN KEY([ExamId])
REFERENCES [dbo].[Exam] ([Id])
GO
ALTER TABLE [dbo].[ExamDetail] CHECK CONSTRAINT [FK__ExamDetai__ExamI__3C69FB99]
GO
ALTER TABLE [dbo].[ExamDetail]  WITH CHECK ADD  CONSTRAINT [FK__ExamDetai__Quest__3D5E1FD2] FOREIGN KEY([QuestionId])
REFERENCES [dbo].[Question] ([Id])
GO
ALTER TABLE [dbo].[ExamDetail] CHECK CONSTRAINT [FK__ExamDetai__Quest__3D5E1FD2]
GO
ALTER TABLE [dbo].[History]  WITH CHECK ADD  CONSTRAINT [FK__History__ExamId__3E52440B] FOREIGN KEY([ExamId])
REFERENCES [dbo].[Exam] ([Id])
GO
ALTER TABLE [dbo].[History] CHECK CONSTRAINT [FK__History__ExamId__3E52440B]
GO
ALTER TABLE [dbo].[History]  WITH CHECK ADD  CONSTRAINT [FK__History__UserId__3F466844] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[History] CHECK CONSTRAINT [FK__History__UserId__3F466844]
GO
ALTER TABLE [dbo].[HistoryDetail]  WITH CHECK ADD  CONSTRAINT [FK__HistoryEx__Histo__403A8C7D] FOREIGN KEY([HistoryId])
REFERENCES [dbo].[History] ([Id])
GO
ALTER TABLE [dbo].[HistoryDetail] CHECK CONSTRAINT [FK__HistoryEx__Histo__403A8C7D]
GO
ALTER TABLE [dbo].[HistoryDetail]  WITH CHECK ADD  CONSTRAINT [FK__HistoryEx__Quest__412EB0B6] FOREIGN KEY([QuestionId])
REFERENCES [dbo].[Question] ([Id])
GO
ALTER TABLE [dbo].[HistoryDetail] CHECK CONSTRAINT [FK__HistoryEx__Quest__412EB0B6]
GO
ALTER TABLE [dbo].[Question]  WITH CHECK ADD  CONSTRAINT [FK__Question__Catego__4222D4EF] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Category] ([Id])
GO
ALTER TABLE [dbo].[Question] CHECK CONSTRAINT [FK__Question__Catego__4222D4EF]
GO
ALTER TABLE [dbo].[Question]  WITH CHECK ADD  CONSTRAINT [FK__Question__Create__4316F928] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[Question] CHECK CONSTRAINT [FK__Question__Create__4316F928]
GO
ALTER TABLE [dbo].[Rank]  WITH CHECK ADD  CONSTRAINT [FK__Rank__ExamId__440B1D61] FOREIGN KEY([ExamId])
REFERENCES [dbo].[Exam] ([Id])
GO
ALTER TABLE [dbo].[Rank] CHECK CONSTRAINT [FK__Rank__ExamId__440B1D61]
GO
ALTER TABLE [dbo].[Rank]  WITH CHECK ADD  CONSTRAINT [FK__Rank__UserId__44FF419A] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[Rank] CHECK CONSTRAINT [FK__Rank__UserId__44FF419A]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD FOREIGN KEY([RoleId])
REFERENCES [dbo].[Role] ([Id])
GO
