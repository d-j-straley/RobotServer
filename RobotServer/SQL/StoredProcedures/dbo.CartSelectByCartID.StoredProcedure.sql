USE [RobotShop]
GO
/****** Object:  StoredProcedure [dbo].[CartSelectByCartID]    Script Date: 8/11/2024 4:39:51 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[CartSelectByCartID]
GO
/****** Object:  StoredProcedure [dbo].[CartSelectByCartID]    Script Date: 8/11/2024 4:39:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*
Copyright 2024  David James Straley

declare @CartID int 
select @CartID = 2000
exec CartSelectByCartID @CartID
*/

CREATE procedure [dbo].[CartSelectByCartID]
	@CartID int
as
begin
set nocount on;



select c.CartID, c.UserID
from Cart c
where c.CartID = @CartID

END
GO
