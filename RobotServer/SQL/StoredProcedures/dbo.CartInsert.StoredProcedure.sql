USE [RobotShop]
GO
/****** Object:  StoredProcedure [dbo].[CartInsert]    Script Date: 8/11/2024 4:39:51 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[CartInsert]
GO
/****** Object:  StoredProcedure [dbo].[CartInsert]    Script Date: 8/11/2024 4:39:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*
Copywrite 2024 David James Straley
*/

CREATE PROCEDURE [dbo].[CartInsert]
@UserID int,
@NewCartID int output
AS
BEGIN

	SET NOCOUNT ON;

insert into Cart
(
UserID
)
values
(
@UserID
)

set @NewCartID = SCOPE_IDENTITY()

END
GO
