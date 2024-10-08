USE [RobotShop]
GO
/****** Object:  Table [dbo].[User]    Script Date: 8/11/2024 4:41:50 PM ******/
DROP TABLE IF EXISTS [dbo].[User]
GO
/****** Object:  Table [dbo].[User]    Script Date: 8/11/2024 4:41:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](100) NULL,
	[LastName] [nvarchar](100) NULL
) ON [PRIMARY]
GO
