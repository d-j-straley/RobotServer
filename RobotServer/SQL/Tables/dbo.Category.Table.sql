USE [RobotShop]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 8/11/2024 4:41:50 PM ******/
DROP TABLE IF EXISTS [dbo].[Category]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 8/11/2024 4:41:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[CategoryID] [int] NOT NULL,
	[CategoryName] [nvarchar](50) NOT NULL
) ON [PRIMARY]
GO
