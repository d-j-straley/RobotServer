USE [RobotShop]
GO
/****** Object:  Table [dbo].[CartItem]    Script Date: 8/11/2024 4:41:50 PM ******/
DROP TABLE IF EXISTS [dbo].[CartItem]
GO
/****** Object:  Table [dbo].[CartItem]    Script Date: 8/11/2024 4:41:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CartItem](
	[CartItemID] [int] IDENTITY(1,1) NOT NULL,
	[CartID] [int] NULL,
	[ProductID] [int] NOT NULL,
	[Price] [money] NULL,
	[Discount] [decimal](10, 2) NOT NULL
) ON [PRIMARY]
GO
