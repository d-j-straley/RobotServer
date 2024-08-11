USE [RobotShop]
GO
/****** Object:  StoredProcedure [dbo].[CartItemInsert]    Script Date: 8/11/2024 4:39:51 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[CartItemInsert]
GO
/****** Object:  StoredProcedure [dbo].[CartItemInsert]    Script Date: 8/11/2024 4:39:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*
Copyright 2024 David James Straley
*/

CREATE PROCEDURE [dbo].[CartItemInsert]
@CartID int,
@ProductID int,
@Price money,
@Discount decimal(10,2),
@NewCartItemID int output
AS
BEGIN

	SET NOCOUNT ON;

insert into CartItem
(
CartID,
ProductID,
Price,
Discount
)
values
(
@CartID,
@ProductID,
@Price,
@Discount
)

set @NewCartItemID = SCOPE_IDENTITY()

END
GO
