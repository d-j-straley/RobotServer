USE [RobotShop]
GO
/****** Object:  Table [dbo].[Cart]    Script Date: 8/11/2024 4:41:50 PM ******/
DROP TABLE IF EXISTS [dbo].[Cart]
GO
/****** Object:  Table [dbo].[Cart]    Script Date: 8/11/2024 4:41:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cart](
	[CartID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NULL
) ON [PRIMARY]
GO
