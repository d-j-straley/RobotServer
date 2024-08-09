USE [RobotShop]
GO

/****** Object:  Table [dbo].[Cart]    Script Date: 8/8/2024 7:29:00 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Cart](
	[CartID] [int] IDENTITY(1,1) NOT NULL,
	[ProductID] [int] NOT NULL,
	[CategoryID] [int] NULL,
	[Name] [nvarchar](100) NULL,
	[Description] [nvarchar](max) NULL,
	[ImageName] [nvarchar](max) NULL,
	[Price] [money] NULL,
	[Discount] [decimal](10, 2) NOT NULL,
	[UserID] [int] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

