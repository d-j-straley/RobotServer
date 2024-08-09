USE [RobotShop]
GO

/****** Object:  StoredProcedure [dbo].[CartDeleteByCartID]    Script Date: 8/8/2024 7:30:20 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


/*
declare @CartID int
select @CartID = 2003
exec dbo.CartDeleteByCartID @CartID
*/
CREATE PROCEDURE [dbo].[CartDeleteByCartID]
	-- Add the parameters for the stored procedure here
	@CartID as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	delete from Cart where CartID = @CartID
END
GO

