USE [RobotShop]
GO

/****** Object:  Table [dbo].[CartItem]    Script Date: 8/14/2024 3:48:20 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CartItem]') AND type in (N'U'))
DROP TABLE [dbo].[CartItem]
GO

/****** Object:  Table [dbo].[CartItem]    Script Date: 8/14/2024 3:48:20 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[CartItem](
	[CartItemID] [int] IDENTITY(1,1) NOT NULL,
	[CartID] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
	[Price] [decimal](19, 4) NULL,
	[Discount] [decimal](9, 2) NULL
) ON [PRIMARY]
GO


