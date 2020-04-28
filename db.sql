USE [QuanLyCafe3]
GO
/****** Object:  Table [dbo].[account]    Script Date: 4/28/2020 9:40:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[account](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[username] [varchar](20) NULL,
	[password] [varchar](20) NOT NULL,
	[type] [nvarchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[bill]    Script Date: 4/28/2020 9:40:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[bill](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[datecheckin] [datetime] NULL DEFAULT (getdate()),
	[datecheckout] [datetime] NULL DEFAULT (NULL),
	[status] [nvarchar](20) NOT NULL DEFAULT ((0)),
	[idaccount] [int] NOT NULL,
	[idtable] [int] NOT NULL,
	[Tongtien] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[billinfo]    Script Date: 4/28/2020 9:40:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[billinfo](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idbill] [int] NOT NULL,
	[idfood] [int] NOT NULL,
	[count] [int] NOT NULL DEFAULT ((0)),
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[category]    Script Date: 4/28/2020 9:40:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[category](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[food]    Script Date: 4/28/2020 9:40:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[food](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
	[price] [float] NOT NULL,
	[idcategory] [int] NOT NULL,
	[image] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[nhacungcap]    Script Date: 4/28/2020 9:40:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[nhacungcap](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[ten] [nvarchar](50) NULL,
	[diachi] [nvarchar](50) NULL,
	[email] [varchar](50) NULL,
	[phone] [varchar](15) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[nhapsanpham]    Script Date: 4/28/2020 9:40:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[nhapsanpham](
	[idsanpham] [int] IDENTITY(1,1) NOT NULL,
	[idncc] [int] NULL,
	[tensanpham] [nvarchar](50) NULL,
	[tongtien] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[idsanpham] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[staff]    Script Date: 4/28/2020 9:40:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[staff](
	[idstaff] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[status] [nvarchar](20) NOT NULL,
	[position] [nvarchar](50) NOT NULL,
	[email] [nvarchar](50) NOT NULL,
	[idaccount] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idstaff] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[staff_audit]    Script Date: 4/28/2020 9:40:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[staff_audit](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idstaff] [int] NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[changedate] [datetime] NOT NULL,
	[action] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tablefood]    Script Date: 4/28/2020 9:40:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tablefood](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[status] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[account] ON 

INSERT [dbo].[account] ([id], [username], [password], [type]) VALUES (1, N'admin', N'12345678', N'admin')
INSERT [dbo].[account] ([id], [username], [password], [type]) VALUES (3, N'user3', N'12345678', N'staff')
INSERT [dbo].[account] ([id], [username], [password], [type]) VALUES (4, N'user4', N'12345678', N'staff')
INSERT [dbo].[account] ([id], [username], [password], [type]) VALUES (5, N'user5', N'12345678', N'staff')
INSERT [dbo].[account] ([id], [username], [password], [type]) VALUES (6, N'user6', N'12345678', N'staff')
INSERT [dbo].[account] ([id], [username], [password], [type]) VALUES (7, N'user7', N'12345678', N'staff')
INSERT [dbo].[account] ([id], [username], [password], [type]) VALUES (8, N'user8', N'12345678', N'staff')
INSERT [dbo].[account] ([id], [username], [password], [type]) VALUES (9, N'user9', N'12345678', N'staff')
INSERT [dbo].[account] ([id], [username], [password], [type]) VALUES (10, N'user10', N'12345678', N'staff')
INSERT [dbo].[account] ([id], [username], [password], [type]) VALUES (11, N'user11', N'12345678', N'staff')
INSERT [dbo].[account] ([id], [username], [password], [type]) VALUES (12, N'user12', N'12345678', N'staff')
SET IDENTITY_INSERT [dbo].[account] OFF
SET IDENTITY_INSERT [dbo].[bill] ON 

INSERT [dbo].[bill] ([id], [datecheckin], [datecheckout], [status], [idaccount], [idtable], [Tongtien]) VALUES (1, CAST(N'2020-04-26 14:37:01.410' AS DateTime), CAST(N'2020-04-26 14:37:51.387' AS DateTime), N'1', 1, 1, 352000)
INSERT [dbo].[bill] ([id], [datecheckin], [datecheckout], [status], [idaccount], [idtable], [Tongtien]) VALUES (2, CAST(N'2020-04-26 15:30:06.283' AS DateTime), CAST(N'2020-04-26 15:30:29.027' AS DateTime), N'1', 3, 1, 145000)
INSERT [dbo].[bill] ([id], [datecheckin], [datecheckout], [status], [idaccount], [idtable], [Tongtien]) VALUES (3, CAST(N'2020-04-27 17:53:10.783' AS DateTime), CAST(N'2020-04-27 17:53:17.950' AS DateTime), N'1', 8, 13, 58000)
INSERT [dbo].[bill] ([id], [datecheckin], [datecheckout], [status], [idaccount], [idtable], [Tongtien]) VALUES (4, CAST(N'2020-04-27 22:02:56.613' AS DateTime), CAST(N'2020-04-27 22:32:16.187' AS DateTime), N'1', 1, 3, 156000)
INSERT [dbo].[bill] ([id], [datecheckin], [datecheckout], [status], [idaccount], [idtable], [Tongtien]) VALUES (5, CAST(N'2020-04-27 23:02:23.367' AS DateTime), CAST(N'2020-04-27 23:02:43.623' AS DateTime), N'1', 1, 4, 412000)
INSERT [dbo].[bill] ([id], [datecheckin], [datecheckout], [status], [idaccount], [idtable], [Tongtien]) VALUES (6, CAST(N'2020-04-27 23:02:35.830' AS DateTime), CAST(N'2020-04-27 23:02:45.953' AS DateTime), N'1', 1, 14, 200000)
INSERT [dbo].[bill] ([id], [datecheckin], [datecheckout], [status], [idaccount], [idtable], [Tongtien]) VALUES (7, CAST(N'2020-04-28 10:40:07.487' AS DateTime), CAST(N'2020-04-28 10:40:26.710' AS DateTime), N'1', 1, 1, 220000)
INSERT [dbo].[bill] ([id], [datecheckin], [datecheckout], [status], [idaccount], [idtable], [Tongtien]) VALUES (8, CAST(N'2020-04-28 16:05:53.573' AS DateTime), CAST(N'2020-04-28 16:06:10.790' AS DateTime), N'1', 1, 1, 1180000)
INSERT [dbo].[bill] ([id], [datecheckin], [datecheckout], [status], [idaccount], [idtable], [Tongtien]) VALUES (9, CAST(N'2020-04-28 16:06:11.670' AS DateTime), CAST(N'2020-04-28 16:06:19.640' AS DateTime), N'1', 1, 11, 472000)
INSERT [dbo].[bill] ([id], [datecheckin], [datecheckout], [status], [idaccount], [idtable], [Tongtien]) VALUES (10, CAST(N'2020-04-28 16:09:56.603' AS DateTime), CAST(N'2020-04-28 16:10:15.203' AS DateTime), N'1', 1, 15, 668000)
INSERT [dbo].[bill] ([id], [datecheckin], [datecheckout], [status], [idaccount], [idtable], [Tongtien]) VALUES (11, CAST(N'2020-04-28 16:21:28.947' AS DateTime), CAST(N'2020-04-28 16:28:55.557' AS DateTime), N'1', 8, 13, 100000)
INSERT [dbo].[bill] ([id], [datecheckin], [datecheckout], [status], [idaccount], [idtable], [Tongtien]) VALUES (12, CAST(N'2020-04-28 16:28:58.483' AS DateTime), CAST(N'2020-04-28 16:29:03.143' AS DateTime), N'1', 8, 14, 100000)
INSERT [dbo].[bill] ([id], [datecheckin], [datecheckout], [status], [idaccount], [idtable], [Tongtien]) VALUES (13, CAST(N'2020-04-28 16:31:59.677' AS DateTime), CAST(N'2020-04-28 16:32:06.403' AS DateTime), N'1', 1, 15, 116000)
INSERT [dbo].[bill] ([id], [datecheckin], [datecheckout], [status], [idaccount], [idtable], [Tongtien]) VALUES (14, CAST(N'2020-04-28 16:21:21.590' AS DateTime), CAST(N'2020-04-28 16:33:21.957' AS DateTime), N'1', 3, 3, 116000)
INSERT [dbo].[bill] ([id], [datecheckin], [datecheckout], [status], [idaccount], [idtable], [Tongtien]) VALUES (15, CAST(N'2020-04-28 16:41:12.823' AS DateTime), CAST(N'2020-04-28 16:41:27.343' AS DateTime), N'1', 1, 1, 145000)
INSERT [dbo].[bill] ([id], [datecheckin], [datecheckout], [status], [idaccount], [idtable], [Tongtien]) VALUES (16, CAST(N'2020-04-28 16:35:58.463' AS DateTime), CAST(N'2020-04-28 16:36:00.977' AS DateTime), N'1', 3, 12, 116000)
INSERT [dbo].[bill] ([id], [datecheckin], [datecheckout], [status], [idaccount], [idtable], [Tongtien]) VALUES (17, CAST(N'2020-04-28 16:31:23.187' AS DateTime), CAST(N'2020-04-28 16:31:33.863' AS DateTime), N'1', 1, 14, 200000)
INSERT [dbo].[bill] ([id], [datecheckin], [datecheckout], [status], [idaccount], [idtable], [Tongtien]) VALUES (18, CAST(N'2020-04-28 16:31:52.277' AS DateTime), CAST(N'2020-04-28 16:31:57.033' AS DateTime), N'1', 1, 13, 200000)
INSERT [dbo].[bill] ([id], [datecheckin], [datecheckout], [status], [idaccount], [idtable], [Tongtien]) VALUES (19, CAST(N'2020-04-28 16:33:23.867' AS DateTime), CAST(N'2020-04-28 16:33:33.913' AS DateTime), N'1', 3, 3, 116000)
INSERT [dbo].[bill] ([id], [datecheckin], [datecheckout], [status], [idaccount], [idtable], [Tongtien]) VALUES (20, CAST(N'2020-04-28 16:36:04.297' AS DateTime), CAST(N'2020-04-28 16:36:07.773' AS DateTime), N'1', 3, 15, 220000)
INSERT [dbo].[bill] ([id], [datecheckin], [datecheckout], [status], [idaccount], [idtable], [Tongtien]) VALUES (21, CAST(N'2020-04-28 16:36:11.733' AS DateTime), CAST(N'2020-04-28 16:36:27.513' AS DateTime), N'1', 3, 15, 330000)
INSERT [dbo].[bill] ([id], [datecheckin], [datecheckout], [status], [idaccount], [idtable], [Tongtien]) VALUES (22, CAST(N'2020-04-28 18:22:11.263' AS DateTime), CAST(N'2020-04-28 18:22:26.970' AS DateTime), N'1', 1, 2, 145000)
INSERT [dbo].[bill] ([id], [datecheckin], [datecheckout], [status], [idaccount], [idtable], [Tongtien]) VALUES (23, CAST(N'2020-04-28 16:41:32.437' AS DateTime), CAST(N'2020-04-28 16:41:38.773' AS DateTime), N'1', 1, 14, 29000)
INSERT [dbo].[bill] ([id], [datecheckin], [datecheckout], [status], [idaccount], [idtable], [Tongtien]) VALUES (24, CAST(N'2020-04-28 18:23:25.803' AS DateTime), CAST(N'2020-04-28 18:23:36.980' AS DateTime), N'1', 1, 15, 203000)
INSERT [dbo].[bill] ([id], [datecheckin], [datecheckout], [status], [idaccount], [idtable], [Tongtien]) VALUES (25, CAST(N'2020-04-28 19:28:39.683' AS DateTime), NULL, N'0', 1, 4, NULL)
INSERT [dbo].[bill] ([id], [datecheckin], [datecheckout], [status], [idaccount], [idtable], [Tongtien]) VALUES (26, CAST(N'2020-04-28 19:37:00.287' AS DateTime), NULL, N'0', 1, 1, NULL)
INSERT [dbo].[bill] ([id], [datecheckin], [datecheckout], [status], [idaccount], [idtable], [Tongtien]) VALUES (27, CAST(N'2020-04-28 16:44:14.143' AS DateTime), CAST(N'2020-04-28 18:10:23.893' AS DateTime), N'1', 1, 5, 351000)
INSERT [dbo].[bill] ([id], [datecheckin], [datecheckout], [status], [idaccount], [idtable], [Tongtien]) VALUES (28, CAST(N'2020-04-28 18:12:18.993' AS DateTime), CAST(N'2020-04-28 18:22:54.090' AS DateTime), N'1', 1, 14, 174000)
INSERT [dbo].[bill] ([id], [datecheckin], [datecheckout], [status], [idaccount], [idtable], [Tongtien]) VALUES (29, CAST(N'2020-04-28 18:12:35.670' AS DateTime), NULL, N'0', 1, 12, NULL)
INSERT [dbo].[bill] ([id], [datecheckin], [datecheckout], [status], [idaccount], [idtable], [Tongtien]) VALUES (30, CAST(N'2020-04-28 18:18:40.360' AS DateTime), NULL, N'0', 1, 5, NULL)
INSERT [dbo].[bill] ([id], [datecheckin], [datecheckout], [status], [idaccount], [idtable], [Tongtien]) VALUES (31, CAST(N'2020-04-28 18:19:15.803' AS DateTime), CAST(N'2020-04-28 18:21:41.190' AS DateTime), N'1', 1, 3, 116000)
INSERT [dbo].[bill] ([id], [datecheckin], [datecheckout], [status], [idaccount], [idtable], [Tongtien]) VALUES (32, CAST(N'2020-04-28 18:25:42.380' AS DateTime), CAST(N'2020-04-28 18:25:49.260' AS DateTime), N'1', 1, 10, 116000)
INSERT [dbo].[bill] ([id], [datecheckin], [datecheckout], [status], [idaccount], [idtable], [Tongtien]) VALUES (33, CAST(N'2020-04-28 19:13:22.917' AS DateTime), CAST(N'2020-04-28 19:13:43.357' AS DateTime), N'1', 3, 2, 116000)
INSERT [dbo].[bill] ([id], [datecheckin], [datecheckout], [status], [idaccount], [idtable], [Tongtien]) VALUES (34, CAST(N'2020-04-28 19:00:03.377' AS DateTime), CAST(N'2020-04-28 19:00:16.270' AS DateTime), N'1', 1, 3, 236000)
INSERT [dbo].[bill] ([id], [datecheckin], [datecheckout], [status], [idaccount], [idtable], [Tongtien]) VALUES (35, CAST(N'2020-04-28 19:10:12.287' AS DateTime), CAST(N'2020-04-28 19:10:38.613' AS DateTime), N'1', 1, 3, 118000)
INSERT [dbo].[bill] ([id], [datecheckin], [datecheckout], [status], [idaccount], [idtable], [Tongtien]) VALUES (36, CAST(N'2020-04-28 19:33:03.973' AS DateTime), NULL, N'0', 1, 2, NULL)
SET IDENTITY_INSERT [dbo].[bill] OFF
SET IDENTITY_INSERT [dbo].[billinfo] ON 

INSERT [dbo].[billinfo] ([id], [idbill], [idfood], [count]) VALUES (1, 1, 39, 4)
INSERT [dbo].[billinfo] ([id], [idbill], [idfood], [count]) VALUES (2, 1, 30, 4)
INSERT [dbo].[billinfo] ([id], [idbill], [idfood], [count]) VALUES (3, 2, 1, 5)
INSERT [dbo].[billinfo] ([id], [idbill], [idfood], [count]) VALUES (4, 3, 1, 2)
INSERT [dbo].[billinfo] ([id], [idbill], [idfood], [count]) VALUES (5, 4, 34, 4)
INSERT [dbo].[billinfo] ([id], [idbill], [idfood], [count]) VALUES (6, 5, 1, 2)
INSERT [dbo].[billinfo] ([id], [idbill], [idfood], [count]) VALUES (7, 5, 31, 6)
INSERT [dbo].[billinfo] ([id], [idbill], [idfood], [count]) VALUES (8, 6, 8, 4)
INSERT [dbo].[billinfo] ([id], [idbill], [idfood], [count]) VALUES (9, 7, 4, 4)
INSERT [dbo].[billinfo] ([id], [idbill], [idfood], [count]) VALUES (10, 8, 30, 10)
INSERT [dbo].[billinfo] ([id], [idbill], [idfood], [count]) VALUES (11, 8, 31, 10)
INSERT [dbo].[billinfo] ([id], [idbill], [idfood], [count]) VALUES (12, 9, 30, 4)
INSERT [dbo].[billinfo] ([id], [idbill], [idfood], [count]) VALUES (13, 9, 31, 4)
INSERT [dbo].[billinfo] ([id], [idbill], [idfood], [count]) VALUES (14, 10, 16, 4)
INSERT [dbo].[billinfo] ([id], [idbill], [idfood], [count]) VALUES (15, 10, 29, 8)
INSERT [dbo].[billinfo] ([id], [idbill], [idfood], [count]) VALUES (19, 14, 1, 4)
INSERT [dbo].[billinfo] ([id], [idbill], [idfood], [count]) VALUES (20, 11, 8, 2)
INSERT [dbo].[billinfo] ([id], [idbill], [idfood], [count]) VALUES (22, 12, 32, 4)
INSERT [dbo].[billinfo] ([id], [idbill], [idfood], [count]) VALUES (25, 17, 8, 4)
INSERT [dbo].[billinfo] ([id], [idbill], [idfood], [count]) VALUES (26, 18, 1, 4)
INSERT [dbo].[billinfo] ([id], [idbill], [idfood], [count]) VALUES (27, 13, 38, 4)
INSERT [dbo].[billinfo] ([id], [idbill], [idfood], [count]) VALUES (28, 13, 39, 4)
INSERT [dbo].[billinfo] ([id], [idbill], [idfood], [count]) VALUES (29, 19, 34, 4)
INSERT [dbo].[billinfo] ([id], [idbill], [idfood], [count]) VALUES (33, 16, 4, 4)
INSERT [dbo].[billinfo] ([id], [idbill], [idfood], [count]) VALUES (34, 20, 4, 6)
INSERT [dbo].[billinfo] ([id], [idbill], [idfood], [count]) VALUES (35, 21, 8, 4)
INSERT [dbo].[billinfo] ([id], [idbill], [idfood], [count]) VALUES (41, 15, 1, 1)
INSERT [dbo].[billinfo] ([id], [idbill], [idfood], [count]) VALUES (42, 23, 1, 5)
INSERT [dbo].[billinfo] ([id], [idbill], [idfood], [count]) VALUES (46, 27, 5, 2)
INSERT [dbo].[billinfo] ([id], [idbill], [idfood], [count]) VALUES (47, 27, 1, 9)
INSERT [dbo].[billinfo] ([id], [idbill], [idfood], [count]) VALUES (55, 28, 1, 7)
INSERT [dbo].[billinfo] ([id], [idbill], [idfood], [count]) VALUES (56, 29, 4, 5)
INSERT [dbo].[billinfo] ([id], [idbill], [idfood], [count]) VALUES (58, 30, 1, 1)
INSERT [dbo].[billinfo] ([id], [idbill], [idfood], [count]) VALUES (59, 31, 1, 4)
INSERT [dbo].[billinfo] ([id], [idbill], [idfood], [count]) VALUES (62, 22, 1, 5)
INSERT [dbo].[billinfo] ([id], [idbill], [idfood], [count]) VALUES (63, 22, 4, 1)
INSERT [dbo].[billinfo] ([id], [idbill], [idfood], [count]) VALUES (64, 24, 19, 4)
INSERT [dbo].[billinfo] ([id], [idbill], [idfood], [count]) VALUES (65, 32, 33, 4)
INSERT [dbo].[billinfo] ([id], [idbill], [idfood], [count]) VALUES (74, 34, 30, 4)
INSERT [dbo].[billinfo] ([id], [idbill], [idfood], [count]) VALUES (77, 35, 31, 2)
INSERT [dbo].[billinfo] ([id], [idbill], [idfood], [count]) VALUES (78, 33, 1, 4)
INSERT [dbo].[billinfo] ([id], [idbill], [idfood], [count]) VALUES (79, 36, 1, 4)
INSERT [dbo].[billinfo] ([id], [idbill], [idfood], [count]) VALUES (80, 26, 1, 4)
SET IDENTITY_INSERT [dbo].[billinfo] OFF
SET IDENTITY_INSERT [dbo].[category] ON 

INSERT [dbo].[category] ([id], [name]) VALUES (1, N'CÀ PHÊ')
INSERT [dbo].[category] ([id], [name]) VALUES (2, N'TRÀ & MACCHIATO')
INSERT [dbo].[category] ([id], [name]) VALUES (3, N'THỨC UỐNG ĐÁ XAY')
INSERT [dbo].[category] ([id], [name]) VALUES (4, N'THỨC UỐNG TRÁI CÂY')
INSERT [dbo].[category] ([id], [name]) VALUES (5, N'BÁNH & SNACK')
SET IDENTITY_INSERT [dbo].[category] OFF
SET IDENTITY_INSERT [dbo].[food] ON 

INSERT [dbo].[food] ([id], [name], [price], [idcategory], [image]) VALUES (1, N'BẠC SỈU', 29000, 1, N'bạc sỉu.jpg')
INSERT [dbo].[food] ([id], [name], [price], [idcategory], [image]) VALUES (2, N'AMERICANO', 39000, 1, N'americano_large.jpg')
INSERT [dbo].[food] ([id], [name], [price], [idcategory], [image]) VALUES (3, N'CAPUCHINO', 45000, 1, N'capuchino.jpg')
INSERT [dbo].[food] ([id], [name], [price], [idcategory], [image]) VALUES (4, N'CARAMEL MACCHIATO', 55000, 1, N'caramel machiato.jpg')
INSERT [dbo].[food] ([id], [name], [price], [idcategory], [image]) VALUES (5, N'COLD BREW CAM SẢ', 45000, 1, N'cold brew cam sả.jpg')
INSERT [dbo].[food] ([id], [name], [price], [idcategory], [image]) VALUES (6, N'COLD BREW PHÚC BỒN TỬ', 50000, 1, N'cold brew phúc bồn tử.jpg')
INSERT [dbo].[food] ([id], [name], [price], [idcategory], [image]) VALUES (7, N'COLD BREW SỮA TƯƠI MACCHIATO', 50000, 1, N'cold brew sữa tươi macchiato.jpg')
INSERT [dbo].[food] ([id], [name], [price], [idcategory], [image]) VALUES (8, N'COLD BREW SỮA TƯƠI', 50000, 1, N'cold brew sữa tươi.jpg')
INSERT [dbo].[food] ([id], [name], [price], [idcategory], [image]) VALUES (9, N'COLD BREW TRUYÊ`N THÔ´NG', 45000, 1, N'cold brew truyền thống.jpg')
INSERT [dbo].[food] ([id], [name], [price], [idcategory], [image]) VALUES (10, N'CÀ PHÊ SỮA', 29000, 1, N'cà phê sữa.jpg')
INSERT [dbo].[food] ([id], [name], [price], [idcategory], [image]) VALUES (11, N'CÀ PHÊ ĐEN', 29000, 1, N'cà phê đen.jpg')
INSERT [dbo].[food] ([id], [name], [price], [idcategory], [image]) VALUES (12, N'ESPRESSO', 35000, 1, N'espresso.jpg')
INSERT [dbo].[food] ([id], [name], [price], [idcategory], [image]) VALUES (13, N'TRÀ ĐEN MACCHIATO', 55000, 2, N'blacktea_macchiat_large.png')
INSERT [dbo].[food] ([id], [name], [price], [idcategory], [image]) VALUES (14, N'TRÀ MATCHA LATTLE', 59000, 2, N'matcha_latte_large.png')
INSERT [dbo].[food] ([id], [name], [price], [idcategory], [image]) VALUES (15, N'TRÀ MATHCA MACCHIATO', 45000, 2, N'matcha_macchiato_large.png')
INSERT [dbo].[food] ([id], [name], [price], [idcategory], [image]) VALUES (16, N'TRÀ PHÚC BỒN TỬ', 49000, 2, N'tea_raspberry_large.png')
INSERT [dbo].[food] ([id], [name], [price], [idcategory], [image]) VALUES (17, N'TRÀ ĐÀO CAM SẢ', 45000, 2, N'tra_dao_cam_sa_on_bg_large.png')
INSERT [dbo].[food] ([id], [name], [price], [idcategory], [image]) VALUES (18, N'TRÀ OOLONG SEN AN NHIÊN', 45000, 2, N'trasen_large.png')
INSERT [dbo].[food] ([id], [name], [price], [idcategory], [image]) VALUES (19, N'TRÀ OOLONG VẢI NHƯ Ý', 45000, 2, N'travai_large.png')
INSERT [dbo].[food] ([id], [name], [price], [idcategory], [image]) VALUES (20, N'TRÀ CHERRY MACCHIATO', 55000, 2, N'tràcherrymacchiato.png')
INSERT [dbo].[food] ([id], [name], [price], [idcategory], [image]) VALUES (21, N'TRÀ XOÀI MACCHIATO', 56000, 2, N'xoai_mac_large.png')
INSERT [dbo].[food] ([id], [name], [price], [idcategory], [image]) VALUES (22, N'TRÀ XOÀI MACCHIATO', 55000, 2, N'xoai_nong_mac_large.png')
INSERT [dbo].[food] ([id], [name], [price], [idcategory], [image]) VALUES (23, N'CHANH SẢ ĐÁ XAY', 49000, 3, N'chanh_sa_da_xay_large.png')
INSERT [dbo].[food] ([id], [name], [price], [idcategory], [image]) VALUES (24, N'CHOCOLATE ĐÁ XAY', 59000, 3, N'chocolate_ice_blended_large.png')
INSERT [dbo].[food] ([id], [name], [price], [idcategory], [image]) VALUES (25, N'COOKIES ĐÁ XAY', 59000, 3, N'cookies_ice_blended_large.png')
INSERT [dbo].[food] ([id], [name], [price], [idcategory], [image]) VALUES (26, N'ĐÀO VIỆT QUẤT ĐÁ XAY', 59000, 3, N'dao_viet_quat_large.png')
INSERT [dbo].[food] ([id], [name], [price], [idcategory], [image]) VALUES (27, N'PHÚC BỒN TỬ CAM ĐÁ XAY', 59000, 3, N'daxay_raspberry_ice_large.png')
INSERT [dbo].[food] ([id], [name], [price], [idcategory], [image]) VALUES (28, N'MATCHA ĐÁ XAY', 59000, 3, N'matcha_ice_blended_large.png')
INSERT [dbo].[food] ([id], [name], [price], [idcategory], [image]) VALUES (29, N'ỔI HỒNG VIỆT QUẤT ĐÁ XAY', 59000, 3, N'oihong_viet_quat_ice_large.png')
INSERT [dbo].[food] ([id], [name], [price], [idcategory], [image]) VALUES (30, N'SINH TỐ VIỆT QUẤT', 59000, 4, N'blueberry_smoothie_large.png')
INSERT [dbo].[food] ([id], [name], [price], [idcategory], [image]) VALUES (31, N'SINH TỐ CAM XOÀI', 59000, 4, N'mango_smoothie_large.png')
INSERT [dbo].[food] ([id], [name], [price], [idcategory], [image]) VALUES (32, N'BÁNH PASSION CHEESE', 29000, 5, N'banh_passion_cheese_large.png')
INSERT [dbo].[food] ([id], [name], [price], [idcategory], [image]) VALUES (33, N'BÁNH CHOCOLATE', 29000, 5, N'choco_cake_large.png')
INSERT [dbo].[food] ([id], [name], [price], [idcategory], [image]) VALUES (34, N'BÁNH GẤU CHOCOLATE', 39000, 5, N'gau_chocolate_cake_large.png')
INSERT [dbo].[food] ([id], [name], [price], [idcategory], [image]) VALUES (35, N'BÁNH MATCHA', 29000, 5, N'matcha_cake_large.png')
INSERT [dbo].[food] ([id], [name], [price], [idcategory], [image]) VALUES (36, N'BÁNH MÌ CHÀ BÔNG PHÔ MAI', 32000, 5, N'phomaichabong_large.png')
INSERT [dbo].[food] ([id], [name], [price], [idcategory], [image]) VALUES (37, N'BÁNH CROISSANT BƠ TỎI', 29000, 5, N'sungtrau_cake_large.png')
INSERT [dbo].[food] ([id], [name], [price], [idcategory], [image]) VALUES (38, N'BÁNH TIRAMISU', 29000, 5, N'tiramisu_cake_large.png')
INSERT [dbo].[food] ([id], [name], [price], [idcategory], [image]) VALUES (39, N'BÁNH BÔNG LAN TRỨNG MUỐI', 29000, 5, N'trungmuoi_bong_lan_large.png')
SET IDENTITY_INSERT [dbo].[food] OFF
SET IDENTITY_INSERT [dbo].[staff] ON 

INSERT [dbo].[staff] ([idstaff], [name], [status], [position], [email], [idaccount]) VALUES (1, N'Phạm Văn Đình', N'Hoạt động', N'Ban Quản Lý', N'phamvandinh@gmail.com', 1)
INSERT [dbo].[staff] ([idstaff], [name], [status], [position], [email], [idaccount]) VALUES (3, N'Tạ Quốc Hùng', N'Hoạt động', N'Nhân Viên', N'taquochung@gmail.com', 3)
INSERT [dbo].[staff] ([idstaff], [name], [status], [position], [email], [idaccount]) VALUES (4, N'Nghiêm Khắc Lâm', N'Hoạt động', N'Nhân Viên', N'khaclam@gmail.com', 4)
INSERT [dbo].[staff] ([idstaff], [name], [status], [position], [email], [idaccount]) VALUES (5, N'Tạ Ngọc Hùng', N'Hoạt động', N'Nhân Viên', N'dinhvjps@gmail.com', 5)
INSERT [dbo].[staff] ([idstaff], [name], [status], [position], [email], [idaccount]) VALUES (6, N'Lê Hào', N'Ngưng Hoạt động', N'Nhân Viên', N'Lehao@gmail.com', 6)
INSERT [dbo].[staff] ([idstaff], [name], [status], [position], [email], [idaccount]) VALUES (7, N'Trịnh Ngọc Trinh', N'Ngưng hoạt động', N'Nhân Viên', N'Ngoctring@gmail.com', 7)
INSERT [dbo].[staff] ([idstaff], [name], [status], [position], [email], [idaccount]) VALUES (8, N'Lê Hào', N'Ngưng hoạt động', N'Nhân Viên', N'Lehao@gmail.com', 8)
INSERT [dbo].[staff] ([idstaff], [name], [status], [position], [email], [idaccount]) VALUES (9, N'Phạm thị A', N'Hoạt động', N'Nhân viên', N'phamthia@gmail.com', 9)
INSERT [dbo].[staff] ([idstaff], [name], [status], [position], [email], [idaccount]) VALUES (10, N'Phạm thị B', N'Hoạt động', N'Nhân viên', N'phamthib@gmail.com', 10)
INSERT [dbo].[staff] ([idstaff], [name], [status], [position], [email], [idaccount]) VALUES (11, N'Phạm thị C', N'Hoạt động', N'Nhân viên', N'phamthiC@gmail.com', 11)
INSERT [dbo].[staff] ([idstaff], [name], [status], [position], [email], [idaccount]) VALUES (12, N'Phạm thị D', N'Hoạt động', N'Bộ phận vệ sinh', N'phamthid@gmail.com', 12)
SET IDENTITY_INSERT [dbo].[staff] OFF
SET IDENTITY_INSERT [dbo].[staff_audit] ON 

INSERT [dbo].[staff_audit] ([id], [idstaff], [name], [changedate], [action]) VALUES (1, 7, N'Trịnh Ngọc Trinh', CAST(N'2020-04-13 16:52:21.640' AS DateTime), N'Delete')
INSERT [dbo].[staff_audit] ([id], [idstaff], [name], [changedate], [action]) VALUES (2, 7, N'Trịnh Ngọc Trinh', CAST(N'2020-04-13 17:06:31.953' AS DateTime), N'Insert')
INSERT [dbo].[staff_audit] ([id], [idstaff], [name], [changedate], [action]) VALUES (3, 7, N'Trịnh Ngọc Trinh', CAST(N'2020-04-13 17:20:14.297' AS DateTime), N'Update')
INSERT [dbo].[staff_audit] ([id], [idstaff], [name], [changedate], [action]) VALUES (4, 7, N'Trịnh Ngọc Hùng', CAST(N'2020-04-13 17:20:49.550' AS DateTime), N'Update')
INSERT [dbo].[staff_audit] ([id], [idstaff], [name], [changedate], [action]) VALUES (5, 8, N'Lê Hào', CAST(N'2020-04-15 10:44:29.543' AS DateTime), N'Insert')
INSERT [dbo].[staff_audit] ([id], [idstaff], [name], [changedate], [action]) VALUES (6, 8, N'Lê Hào', CAST(N'2020-04-15 10:45:03.343' AS DateTime), N'Delete')
INSERT [dbo].[staff_audit] ([id], [idstaff], [name], [changedate], [action]) VALUES (7, 8, N'Trịnh Ngọc Trinh', CAST(N'2020-04-15 10:45:22.970' AS DateTime), N'Insert')
INSERT [dbo].[staff_audit] ([id], [idstaff], [name], [changedate], [action]) VALUES (8, 8, N'Trịnh Ngọc Trinh', CAST(N'2020-04-15 10:45:37.587' AS DateTime), N'Delete')
INSERT [dbo].[staff_audit] ([id], [idstaff], [name], [changedate], [action]) VALUES (9, 7, N'Trịnh Ngọc Hùng', CAST(N'2020-04-23 22:17:36.593' AS DateTime), N'Delete')
INSERT [dbo].[staff_audit] ([id], [idstaff], [name], [changedate], [action]) VALUES (10, 7, N'pham dinh', CAST(N'2020-04-23 22:19:22.493' AS DateTime), N'Insert')
INSERT [dbo].[staff_audit] ([id], [idstaff], [name], [changedate], [action]) VALUES (11, 6, N'Lê Hào', CAST(N'2020-04-23 22:21:49.637' AS DateTime), N'Delete')
INSERT [dbo].[staff_audit] ([id], [idstaff], [name], [changedate], [action]) VALUES (12, 8, N'Lê Hào', CAST(N'2020-04-23 22:26:06.147' AS DateTime), N'Insert')
INSERT [dbo].[staff_audit] ([id], [idstaff], [name], [changedate], [action]) VALUES (13, 8, N'Lê Hào', CAST(N'2020-04-23 22:33:08.057' AS DateTime), N'Delete')
INSERT [dbo].[staff_audit] ([id], [idstaff], [name], [changedate], [action]) VALUES (14, 8, N'Lê Hào', CAST(N'2020-04-23 22:33:17.930' AS DateTime), N'Insert')
INSERT [dbo].[staff_audit] ([id], [idstaff], [name], [changedate], [action]) VALUES (15, 8, N'Lê Hào', CAST(N'2020-04-23 22:42:32.990' AS DateTime), N'Delete')
INSERT [dbo].[staff_audit] ([id], [idstaff], [name], [changedate], [action]) VALUES (16, 7, N'pham dinh', CAST(N'2020-04-24 14:06:24.957' AS DateTime), N'Delete')
INSERT [dbo].[staff_audit] ([id], [idstaff], [name], [changedate], [action]) VALUES (17, 5, N'Tạ Ngọc Hùng', CAST(N'2020-04-24 14:22:38.537' AS DateTime), N'Update')
INSERT [dbo].[staff_audit] ([id], [idstaff], [name], [changedate], [action]) VALUES (18, 5, N'Tạ Ngọc Hùng', CAST(N'2020-04-24 14:31:53.457' AS DateTime), N'Update')
INSERT [dbo].[staff_audit] ([id], [idstaff], [name], [changedate], [action]) VALUES (19, 6, N'Lê Hào', CAST(N'2020-04-24 14:43:41.547' AS DateTime), N'Insert')
INSERT [dbo].[staff_audit] ([id], [idstaff], [name], [changedate], [action]) VALUES (20, 7, N'Trịnh Ngọc Trinh', CAST(N'2020-04-26 15:37:58.277' AS DateTime), N'Insert')
INSERT [dbo].[staff_audit] ([id], [idstaff], [name], [changedate], [action]) VALUES (21, 8, N'Lê Hào', CAST(N'2020-04-26 15:40:22.000' AS DateTime), N'Insert')
INSERT [dbo].[staff_audit] ([id], [idstaff], [name], [changedate], [action]) VALUES (22, 9, N'Phạm thị A', CAST(N'2020-04-26 15:42:51.670' AS DateTime), N'Insert')
INSERT [dbo].[staff_audit] ([id], [idstaff], [name], [changedate], [action]) VALUES (23, 10, N'Phạm thị B', CAST(N'2020-04-26 15:43:18.810' AS DateTime), N'Insert')
INSERT [dbo].[staff_audit] ([id], [idstaff], [name], [changedate], [action]) VALUES (24, 11, N'Phạm thị C', CAST(N'2020-04-26 15:43:29.370' AS DateTime), N'Insert')
INSERT [dbo].[staff_audit] ([id], [idstaff], [name], [changedate], [action]) VALUES (25, 12, N'Phạm thị D', CAST(N'2020-04-26 15:43:45.407' AS DateTime), N'Insert')
SET IDENTITY_INSERT [dbo].[staff_audit] OFF
SET IDENTITY_INSERT [dbo].[tablefood] ON 

INSERT [dbo].[tablefood] ([id], [name], [status]) VALUES (1, N'Bàn 1', N'có người')
INSERT [dbo].[tablefood] ([id], [name], [status]) VALUES (2, N'Bàn 2', N'có người')
INSERT [dbo].[tablefood] ([id], [name], [status]) VALUES (3, N'Bàn 3', N'trống')
INSERT [dbo].[tablefood] ([id], [name], [status]) VALUES (4, N'Bàn 4', N'trống')
INSERT [dbo].[tablefood] ([id], [name], [status]) VALUES (5, N'Bàn 5', N'trống')
INSERT [dbo].[tablefood] ([id], [name], [status]) VALUES (6, N'Bàn 6', N'trống')
INSERT [dbo].[tablefood] ([id], [name], [status]) VALUES (7, N'Bàn 7', N'trống')
INSERT [dbo].[tablefood] ([id], [name], [status]) VALUES (8, N'Bàn 8', N'trống')
INSERT [dbo].[tablefood] ([id], [name], [status]) VALUES (9, N'Bàn 9', N'trống')
INSERT [dbo].[tablefood] ([id], [name], [status]) VALUES (10, N'Bàn 10', N'trống')
INSERT [dbo].[tablefood] ([id], [name], [status]) VALUES (11, N'Bàn 11', N'trống')
INSERT [dbo].[tablefood] ([id], [name], [status]) VALUES (12, N'Bàn 12', N'trống')
INSERT [dbo].[tablefood] ([id], [name], [status]) VALUES (13, N'Bàn 13', N'trống')
INSERT [dbo].[tablefood] ([id], [name], [status]) VALUES (14, N'Bàn 14', N'trống')
INSERT [dbo].[tablefood] ([id], [name], [status]) VALUES (15, N'Bàn 15', N'trống')
SET IDENTITY_INSERT [dbo].[tablefood] OFF
ALTER TABLE [dbo].[bill]  WITH CHECK ADD FOREIGN KEY([idaccount])
REFERENCES [dbo].[account] ([id])
GO
ALTER TABLE [dbo].[bill]  WITH CHECK ADD FOREIGN KEY([idtable])
REFERENCES [dbo].[tablefood] ([id])
GO
ALTER TABLE [dbo].[billinfo]  WITH CHECK ADD FOREIGN KEY([idbill])
REFERENCES [dbo].[bill] ([id])
GO
ALTER TABLE [dbo].[billinfo]  WITH CHECK ADD FOREIGN KEY([idfood])
REFERENCES [dbo].[food] ([id])
GO
ALTER TABLE [dbo].[food]  WITH CHECK ADD FOREIGN KEY([idcategory])
REFERENCES [dbo].[category] ([id])
GO
ALTER TABLE [dbo].[nhapsanpham]  WITH CHECK ADD FOREIGN KEY([idncc])
REFERENCES [dbo].[nhacungcap] ([id])
GO
ALTER TABLE [dbo].[staff]  WITH CHECK ADD FOREIGN KEY([idaccount])
REFERENCES [dbo].[account] ([id])
GO
/****** Object:  StoredProcedure [dbo].[add_bill]    Script Date: 4/28/2020 9:40:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[add_bill]
    @datecheckin DATETIME ,
    @datecheckout DATETIME ,
    @status NVARCHAR(20) ,
    @idaccount INT ,
    @idtable INT
AS
    BEGIN
        INSERT  dbo.bill
                ( datecheckin ,
                  datecheckout ,
                  status ,
                  idaccount ,
                  idtable
   	            )
        VALUES  ( @datecheckin ,
                  @datecheckout ,
                  @status ,
                  @idaccount ,
                  @idtable
                )
    END


GO
/****** Object:  StoredProcedure [dbo].[add_billinfo]    Script Date: 4/28/2020 9:40:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[add_billinfo]
@idbill INT,
@idfood INT,
@count INT
AS
BEGIN
	INSERT dbo.billinfo
	        ( idbill, idfood, count )
	VALUES  ( @idbill, -- idbill - int
	          @idfood, -- idfood - int
	          @count  -- count - int
	          )
END

GO
/****** Object:  StoredProcedure [dbo].[addproduct]    Script Date: 4/28/2020 9:40:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[addproduct]
@name NVARCHAR(50),
@price FLOAT ,
@idcategory INT,
@image NVARCHAR(50)
	--@parameter_name AS scalar_data_type ( = default_value ), ...
-- WITH ENCRYPTION, RECOMPILE, EXECUTE AS CALLER|SELF|OWNER| 'user_name'
AS
BEGIN
	INSERT dbo.food
	        ( name, price, idcategory, image )
	VALUES  ( @name, -- name - nvarchar(50)
	          @price, -- price - float
	          @idcategory, -- idcategory - int
	          @image  -- image - nvarchar(50)
	          )
END

GO
/****** Object:  StoredProcedure [dbo].[Addstaffaccount]    Script Date: 4/28/2020 9:40:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[Addstaffaccount]
@name NVARCHAR(50),
@status NVARCHAR(20),
@position NVARCHAR(50),
@email NVARCHAR(50),
@idaccount INT,
@username VARCHAR(20),
@password VARCHAR(20),
@type NVARCHAR(20)
AS BEGIN

INSERT dbo.account
        ( username, password, type )
VALUES  ( @username ,@password,@type  )

INSERT dbo.staff
        ( name ,
          status ,
          position ,
          email ,
          idaccount
        )
VALUES  ( @name,@status,@position,@email,@idaccount)

END

GO
/****** Object:  StoredProcedure [dbo].[Addstaffaccountlatest]    Script Date: 4/28/2020 9:40:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[Addstaffaccountlatest]
@name NVARCHAR(50),
@status NVARCHAR(20),
@position NVARCHAR(50),
@email NVARCHAR(50),
@idaccount INT,
@username VARCHAR(20),
@password VARCHAR(20),
@type NVARCHAR(20)
AS BEGIN

DECLARE @count INT = @idaccount;
SET @count = @idaccount -1;


DBCC CHECKIDENT ('dbo.account', RESEED, @count )
DBCC CHECKIDENT ('dbo.staff', RESEED, @count )

INSERT dbo.account
        ( username, password, type )
VALUES  ( @username ,@password,@type  )

INSERT dbo.staff
        ( name ,
          status ,
          position ,
          email ,
          idaccount
        )
VALUES  ( @name,@status,@position,@email,@idaccount)

END

GO
/****** Object:  StoredProcedure [dbo].[customer_table]    Script Date: 4/28/2020 9:40:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[customer_table]
@id INT
AS
BEGIN
	UPDATE dbo.tablefood SET status=N'có người' WHERE id=@id
END

GO
/****** Object:  StoredProcedure [dbo].[delete_billinfo]    Script Date: 4/28/2020 9:40:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[delete_billinfo]
@idbill INT
AS
BEGIN
DELETE FROM dbo.billinfo WHERE idbill=@idbill
END

GO
/****** Object:  StoredProcedure [dbo].[delete_billinfo_idfood]    Script Date: 4/28/2020 9:40:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[delete_billinfo_idfood]
@idfood INT,
@idbill INT
AS
BEGIN
DELETE FROM dbo.billinfo WHERE idfood=@idfood AND idbill=@idbill
END

GO
/****** Object:  StoredProcedure [dbo].[deletestaffaccount]    Script Date: 4/28/2020 9:40:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[deletestaffaccount]
@id INT
AS
BEGIN
	DELETE FROM dbo.staff WHERE idstaff=@id
	DELETE FROM dbo.account WHERE id=@id
END

GO
/****** Object:  StoredProcedure [dbo].[empty_table]    Script Date: 4/28/2020 9:40:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[empty_table]
@id INT
AS
BEGIN
	UPDATE dbo.tablefood SET status=N'trống' WHERE id=@id
END

GO
/****** Object:  StoredProcedure [dbo].[top10bestsell]    Script Date: 4/28/2020 9:40:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[top10bestsell]
	--@parameter_name AS scalar_data_type ( = default_value ), ...
-- WITH ENCRYPTION, RECOMPILE, EXECUTE AS CALLER|SELF|OWNER| 'user_name'
AS
	BEGIN
		SELECT  f.id
FROM    dbo.food f ,
        ( SELECT TOP ( 10 )
                    *
          FROM      ( SELECT    SUM(c.count) AS TREND ,
                                c.idfood
                      FROM      ( SELECT    a.idfood ,
                                            a.count
                                  FROM      dbo.billinfo a ,
                                            ( SELECT    id
                                              FROM      dbo.bill WHERE status='1'
                                            ) b
                                  WHERE     a.idbill = b.id
                                ) c
                      GROUP BY  c.idfood
                    ) d
          ORDER BY  d.TREND DESC
        ) e
WHERE   e.idfood = f.id
	END

GO
/****** Object:  StoredProcedure [dbo].[updateimageproduct]    Script Date: 4/28/2020 9:40:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[updateimageproduct]
@id INT,
@image NVARCHAR(50)
	--@parameter_name AS scalar_data_type ( = default_value ), ...
-- WITH ENCRYPTION, RECOMPILE, EXECUTE AS CALLER|SELF|OWNER| 'user_name'
AS
BEGIN
UPDATE dbo.food SET image=@image WHERE id=@id
END

GO
/****** Object:  StoredProcedure [dbo].[updatestaff]    Script Date: 4/28/2020 9:40:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[updatestaff]
    @id INT ,
    @name NVARCHAR(50) ,
    @status NVARCHAR(20) ,
    @position NVARCHAR(50) ,
    @email NVARCHAR(50) ,
    @idaccount INT
AS
    BEGIN
        UPDATE  dbo.staff
        SET     name = @name ,
                status = @status ,
                position = @position ,
                email = @email ,
                idaccount = @idaccount
        WHERE   idstaff = @id
    END

GO
