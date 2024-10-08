USE [RobotShop]
GO

/****** Object:  StoredProcedure [dbo].[ProductInsert]    Script Date: 8/14/2024 3:46:35 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


/*
Copyright 2024 David James Straley
*/

CREATE OR ALTER PROCEDURE [dbo].[ProductInsert]

@CategoryID int,
@Name nvarchar(100),
@Description nvarchar(max),
@ImageName nvarchar(max),
@Price money,
@Discount decimal(10,2),
@NewProductID int output
AS
BEGIN

	SET NOCOUNT ON;

insert into Product
(
CategoryID,
[Name],
[Description],
ImageName,
Price,
Discount
)
values
(
@CategoryID,
@Name,
@Description,
@ImageName,
@Price,
@Discount
)

set @NewProductID = SCOPE_IDENTITY()

END
GO


