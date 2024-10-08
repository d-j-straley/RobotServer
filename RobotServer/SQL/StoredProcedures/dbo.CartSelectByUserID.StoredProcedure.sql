USE [RobotShop]
GO
/****** Object:  StoredProcedure [dbo].[CartSelectByUserID]    Script Date: 8/11/2024 4:39:51 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[CartSelectByUserID]
GO
/****** Object:  StoredProcedure [dbo].[CartSelectByUserID]    Script Date: 8/11/2024 4:39:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


/*
Copyright 2024  David James Straley

declare @CartID int 
select @CartID = 2000
exec CartSelectByUserID @UserID
*/

CREATE procedure [dbo].[CartSelectByUserID]
	@UserID int
as
begin
set nocount on;



select c.CartID, c.UserID
from Cart c
where c.UserID = @UserID

END
GO
