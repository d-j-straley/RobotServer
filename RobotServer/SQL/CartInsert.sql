USE [RobotShop]
GO

/****** Object:  StoredProcedure [dbo].[CartInsert]    Script Date: 8/8/2024 7:30:34 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO




CREATE PROCEDURE [dbo].[CartInsert]

@ProductID int,
@CategoryID int,
@Name nvarchar(100),
@Description nvarchar(max),
@ImageName nvarchar(max),
@Price money,
@Discount decimal(10,2),
@NewCartID int output
AS
BEGIN

	SET NOCOUNT ON;

insert into Cart
(
ProductID,
CategoryID,
[Name],
[Description],
ImageName,
Price,
Discount
)
values
(
@ProductID,
@CategoryID,
@Name,
@Description,
@ImageName,
@Price,
@Discount
)

set @NewCartID = SCOPE_IDENTITY()

END
GO

