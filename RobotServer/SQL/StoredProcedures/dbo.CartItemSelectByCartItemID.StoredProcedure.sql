USE [RobotShop]
GO
/****** Object:  StoredProcedure [dbo].[CartItemSelectByCartItemID]    Script Date: 8/11/2024 4:39:51 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[CartItemSelectByCartItemID]
GO
/****** Object:  StoredProcedure [dbo].[CartItemSelectByCartItemID]    Script Date: 8/11/2024 4:39:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*
Copyright 2024 David James Straley

declare @CartItemID int
select @CartItemID = 1
exec dbo.CartItemSekectByCartItemID @CartIemID
*/

CREATE PROCEDURE [dbo].[CartItemSelectByCartItemID]
	-- Add the parameters for the stored procedure here
	@CartItemID as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	-- specify the column names later, once this table becomes solid
	select * from CartItem where CartItemID = @CartItemID
END
GO
