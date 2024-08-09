USE [RobotShop]
GO

/****** Object:  StoredProcedure [dbo].[ProductSelectAll]    Script Date: 8/8/2024 7:31:34 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
/*
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

select p.ProductID, p.Name, cat.CategoryName, p.Description, p.ImageName, p.Price, p.Discount
from Product p, category cat
where p.categoryID = cat.categoryID

END
GO

