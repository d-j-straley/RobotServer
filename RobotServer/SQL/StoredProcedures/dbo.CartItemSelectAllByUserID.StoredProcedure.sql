USE [RobotShop]
GO
/****** Object:  StoredProcedure [dbo].[CartItemSelectAllByUserID]    Script Date: 8/11/2024 4:39:51 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[CartItemSelectAllByUserID]
GO
/****** Object:  StoredProcedure [dbo].[CartItemSelectAllByUserID]    Script Date: 8/11/2024 4:39:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*
Copyright 2024 David James Straley

declare @UserID int
select @UserID = 1
exec dbo.CartItemSelectAllByUserID @UserID
*/

CREATE PROCEDURE [dbo].[CartItemSelectAllByUserID]
	-- Add the parameters for the stored procedure here
	@UserID as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	declare @CartID int
	select @CartID = CartID from Cart where UserID = @UserID 
	select * from CartItem where CartID = @CartID
END
GO
