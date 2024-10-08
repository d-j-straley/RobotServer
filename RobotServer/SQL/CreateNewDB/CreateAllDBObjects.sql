USE [RobotShop]
GO
/****** Object:  Table [dbo].[Cart]    Script Date: 8/11/2024 4:45:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Cart]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Cart](
	[CartID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[CartItem]    Script Date: 8/11/2024 4:45:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CartItem]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[CartItem](
	[CartItemID] [int] IDENTITY(1,1) NOT NULL,
	[CartID] [int] NULL,
	[ProductID] [int] NOT NULL,
	[Price] [money] NULL,
	[Discount] [decimal](10, 2) NOT NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Category]    Script Date: 8/11/2024 4:45:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Category]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Category](
	[CategoryID] [int] NOT NULL,
	[CategoryName] [nvarchar](50) NOT NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Product]    Script Date: 8/11/2024 4:45:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Product]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Product](
	[ProductID] [int] IDENTITY(1,1) NOT NULL,
	[CategoryID] [int] NULL,
	[Name] [nvarchar](100) NULL,
	[Description] [nvarchar](max) NULL,
	[ImageName] [nvarchar](max) NULL,
	[Price] [money] NULL,
	[Discount] [decimal](10, 2) NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[User]    Script Date: 8/11/2024 4:45:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[User]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[User](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](100) NULL,
	[LastName] [nvarchar](100) NULL
) ON [PRIMARY]
END
GO
/****** Object:  StoredProcedure [dbo].[CartDeleteByCartID]    Script Date: 8/11/2024 4:45:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CartDeleteByCartID]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[CartDeleteByCartID] AS' 
END
GO

/*
declare @CartID int
select @CartID = 2003
exec dbo.CartDeleteByCartID @CartID
*/
ALTER PROCEDURE [dbo].[CartDeleteByCartID]
	-- Add the parameters for the stored procedure here
	@CartID as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	delete from CartItem where CartID = @CartID
	delete from Cart where CartID = @CartID
END
GO
/****** Object:  StoredProcedure [dbo].[CartDeleteByUserID]    Script Date: 8/11/2024 4:45:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CartDeleteByUserID]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[CartDeleteByUserID] AS' 
END
GO


/*
Copyright 2024 David James Straley

declare @UserID int
select @UserID = 1
exec dbo.CartDeleteByUserID @UserID
*/
ALTER PROCEDURE [dbo].[CartDeleteByUserID]
	-- Add the parameters for the stored procedure here
	@UserID as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	declare @CartID int
	select @CartID = CartID from Cart where UserID = @UserID
	delete from CartItem  where CartID = @CartID

	delete from Cart where CartID = @UserID
END
GO
/****** Object:  StoredProcedure [dbo].[CartInsert]    Script Date: 8/11/2024 4:45:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CartInsert]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[CartInsert] AS' 
END
GO

/*
Copywrite 2024 David James Straley
*/

ALTER PROCEDURE [dbo].[CartInsert]
@UserID int,
@NewCartID int output
AS
BEGIN

	SET NOCOUNT ON;

insert into Cart
(
UserID
)
values
(
@UserID
)

set @NewCartID = SCOPE_IDENTITY()

END
GO
/****** Object:  StoredProcedure [dbo].[CartItemDeleteByCartItemID]    Script Date: 8/11/2024 4:45:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CartItemDeleteByCartItemID]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[CartItemDeleteByCartItemID] AS' 
END
GO


/*
Copyright 2024 David James Straley

declare @CartItemID int
select @CartItemID = 1
exec dbo.CartItemDeleteByCartItemID @CartIemID
*/
ALTER PROCEDURE [dbo].[CartItemDeleteByCartItemID]
	-- Add the parameters for the stored procedure here
	@CartItemID as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	delete from CartItem where CartItemID = @CartItemID
END
GO
/****** Object:  StoredProcedure [dbo].[CartItemInsert]    Script Date: 8/11/2024 4:45:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CartItemInsert]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[CartItemInsert] AS' 
END
GO

/*
Copyright 2024 David James Straley
*/

ALTER PROCEDURE [dbo].[CartItemInsert]
@CartID int,
@ProductID int,
@Price money,
@Discount decimal(10,2),
@NewCartItemID int output
AS
BEGIN

	SET NOCOUNT ON;

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
/****** Object:  StoredProcedure [dbo].[CartItemSelectAllByUserID]    Script Date: 8/11/2024 4:45:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CartItemSelectAllByUserID]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[CartItemSelectAllByUserID] AS' 
END
GO

/*
Copyright 2024 David James Straley

declare @UserID int
select @UserID = 1
exec dbo.CartItemSelectAllByUserID @UserID
*/

ALTER PROCEDURE [dbo].[CartItemSelectAllByUserID]
	-- Add the parameters for the stored procedure here
	@UserID as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	declare @CartID int
	select @CartID = CartID from Cart where UserID = @UserID 
	select * from CartItem where CartID = @CartID
END
GO
/****** Object:  StoredProcedure [dbo].[CartItemSelectByCartItemID]    Script Date: 8/11/2024 4:45:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CartItemSelectByCartItemID]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[CartItemSelectByCartItemID] AS' 
END
GO

/*
Copyright 2024 David James Straley

declare @CartItemID int
select @CartItemID = 1
exec dbo.CartItemSekectByCartItemID @CartIemID
*/

ALTER PROCEDURE [dbo].[CartItemSelectByCartItemID]
	-- Add the parameters for the stored procedure here
	@CartItemID as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	select * from CartItem where CartItemID = @CartItemID
END
GO
/****** Object:  StoredProcedure [dbo].[CartSelectByCartID]    Script Date: 8/11/2024 4:45:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CartSelectByCartID]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[CartSelectByCartID] AS' 
END
GO

/*
Copyright 2024  David James Straley

declare @CartID int 
select @CartID = 2000
exec CartSelectByCartID @CartID
*/

ALTER procedure [dbo].[CartSelectByCartID]
	@CartID int
as
begin
set nocount on;



select c.CartID, c.UserID
from Cart c
where c.CartID = @CartID

END
GO
/****** Object:  StoredProcedure [dbo].[CartSelectByUserID]    Script Date: 8/11/2024 4:45:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CartSelectByUserID]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[CartSelectByUserID] AS' 
END
GO


/*
Copyright 2024  David James Straley

declare @CartID int 
select @CartID = 2000
exec CartSelectByUserID @UserID
*/

ALTER procedure [dbo].[CartSelectByUserID]
	@UserID int
as
begin
set nocount on;



select c.CartID, c.UserID
from Cart c
where c.UserID = @UserID

END
GO
/****** Object:  StoredProcedure [dbo].[ProductInsert]    Script Date: 8/11/2024 4:45:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ProductInsert]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[ProductInsert] AS' 
END
GO

/*
Copyright 2024 David James Straley
*/

ALTER PROCEDURE [dbo].[ProductInsert]

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
/****** Object:  StoredProcedure [dbo].[ProductSelectAll]    Script Date: 8/11/2024 4:45:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ProductSelectAll]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[ProductSelectAll] AS' 
END
GO

/*
Copyright 2024 David James Straley

exec ProductSelectAll
*/

ALTER PROCEDURE [dbo].[ProductSelectAll]
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
/****** Object:  StoredProcedure [dbo].[ProductSelectByProductID]    Script Date: 8/11/2024 4:45:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ProductSelectByProductID]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[ProductSelectByProductID] AS' 
END
GO

/*
Copyright 2024 David James Straley

declare @ProductID int
select @ProductID = 1
exec ProductSelectAllByProductID @ProductID
*/

ALTER PROCEDURE [dbo].[ProductSelectByProductID]
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
