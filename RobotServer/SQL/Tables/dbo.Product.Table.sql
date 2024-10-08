USE [RobotShop]
GO

/****** Object:  Table [dbo].[Product]    Script Date: 8/14/2024 3:48:49 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Product]') AND type in (N'U'))
DROP TABLE [dbo].[Product]
GO

/****** Object:  Table [dbo].[Product]    Script Date: 8/14/2024 3:48:49 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Product](
	[ProductID] [int] IDENTITY(1,1) NOT NULL,
	[CategoryID] [int] NULL,
	[Name] [nvarchar](100) NULL,
	[Description] [nvarchar](max) NULL,
	[ImageName] [nvarchar](max) NULL,
	[Price] [decimal](19, 4) NULL,
	[Discount] [decimal](9, 2) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO


