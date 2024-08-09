USE [RobotShop]
GO

/****** Object:  Table [dbo].[Category2]    Script Date: 8/9/2024 10:33:49 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Category](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CategoryID] [int] NOT NULL,
	[CategoryName] [nvarchar](50) NOT NULL
) ON [PRIMARY]
GO


