USE [RobotShop]
GO

/****** Object:  StoredProcedure [dbo].[CartSelectAll]    Script Date: 8/8/2024 7:31:00 PM ******/
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
exec CartSelectAll
*/

CREATE PROCEDURE [dbo].[CartSelectAll]
	-- Add the parameters for the stored procedure here

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here

select c.CartID, c.ProductID, c.Name, cat.CategoryName, c.Description, c.ImageName, c.Price, c.Discount
from Cart c, category cat
where c.categoryID = cat.categoryID

END
GO

