USE [RobotShop]
GO

/****** Object:  StoredProcedure [dbo].[CartItemInsert]    Script Date: 8/14/2024 4:41:06 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


/*
Copyright 2024 David James Straley

By default, the Price and Discount are not allowed!
Therefore, those values will be pulled directly from the database
table for the specified Product.  This is done so as to ensure
that the User can't spoof the system by creating their own front 
end whereby they upload their own price for an item!
For the case where we want to create specialized pricing of some
sort for a given CartItem, we'll create a specialized stored procedure.
This is why we are *not* just making "Price" and "Discount" to be optional
items herein, because we want to be absolutely sure that the User cannot
put in his/her own price.

Declare @UserID int
Declare @ProductID int
select @UserID = 1
select @ProductID = 1

exec CartItemInsert @UserID, @ProductID
*/

CREATE OR ALTER PROCEDURE [dbo].[CartItemInsert]
@UserID int,
@ProductID int,
@NewCartItemID int output
AS
BEGIN

	SET NOCOUNT ON;

/* Translate UserID into CartID */
Declare @CartID int
select @CartID = cartID from Cart where UserID = @UserID 

/* 
Pull the default pricing data from the Product table 
and put it in here.
*/

Declare @Price Decimal(19,4)
Declare @Discount Decimal(9,2)

select @Price = Price, @Discount = Discount
from dbo.Product
where ProductID = @ProductID

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


