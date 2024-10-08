USE [RobotShop]
GO
/****** Object:  StoredProcedure [dbo].[ProductSelectByProductID]    Script Date: 8/11/2024 4:39:51 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[ProductSelectByProductID]
GO
/****** Object:  StoredProcedure [dbo].[ProductSelectByProductID]    Script Date: 8/11/2024 4:39:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*
Copyright 2024 David James Straley

declare @ProductID int
select @ProductID = 1
exec ProductSelectAllByProductID @ProductID
*/

CREATE PROCEDURE [dbo].[ProductSelectByProductID]
	-- Add the parameters for the stored procedure here
@ProductID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here

select p.ProductID,p.CategoryID, cat.CategoryName, p.Name, p.Description, p.ImageName, p.Price, p.Discount
from Product p, category cat
where p.categoryID = cat.categoryID
and p.ProductID = @ProductID
END
GO
