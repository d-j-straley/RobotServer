USE [RobotShop]
GO
/****** Object:  StoredProcedure [dbo].[ProductSelectAll]    Script Date: 8/11/2024 4:39:51 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[ProductSelectAll]
GO
/****** Object:  StoredProcedure [dbo].[ProductSelectAll]    Script Date: 8/11/2024 4:39:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*
Copyright 2024 David James Straley

exec ProductSelectAll
*/

CREATE PROCEDURE [dbo].[ProductSelectAll]
	-- Add the parameters for the stored procedure here

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here

select p.ProductID,p.CategoryID, cat.CategoryName, p.Name, p.Description, p.ImageName, p.Price, p.Discount
from Product p, category cat
where p.categoryID = cat.categoryID
order by cat.CategoryName, p.Name ASC
END
GO
