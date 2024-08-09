USE [RobotShop]
GO

/****** Object:  Table [dbo].[Category]    Script Date: 8/8/2024 7:29:20 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Category](
	[CategoryID] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [nvarchar](50) NULL
) ON [PRIMARY]
GO

