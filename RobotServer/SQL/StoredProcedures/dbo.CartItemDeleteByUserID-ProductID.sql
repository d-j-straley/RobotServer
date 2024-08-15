USE [RobotShop]
GO

/****** Object:  StoredProcedure [dbo].[CartItemDeleteByUserID-ProductID]    Script Date: 8/14/2024 4:13:53 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


/*
Copyright 2024 David James Straley

declare @UserID int
declare @ProductID int
select @UserID = 1
select @ProductID = 1
exec dbo.[CartItemDeleteByUserID-ProductID] @UserID, @ProductID
*/

CREATE OR ALTER   PROCEDURE [dbo].[CartItemDeleteByUserID-ProductID]
	-- Add the parameters for the stored procedure here
	@UserID as int,
	@ProductID as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	declare @CartID int
	select @CartID = CartID from Cart where UserID = @UserID
	/* This removes all the items of type Product from the cart;
	 * it does not just decrement the number of such items.
	 */
	delete from CartItem where CartID = @CartID and ProductID = @ProductID
END
GO

