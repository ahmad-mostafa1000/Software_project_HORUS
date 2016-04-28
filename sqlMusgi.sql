USE [master]
GO
/****** Object:  Database [SWE_Project]    Script Date: 4/28/2016 7:26:58 PM ******/
CREATE DATABASE [SWE_Project]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SWE_Project', FILENAME = N'F:\sql\MSSQL12.MSSQLSERVER\MSSQL\DATA\SWE_Project.mdf' , SIZE = 3264KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'SWE_Project_log', FILENAME = N'F:\sql\MSSQL12.MSSQLSERVER\MSSQL\DATA\SWE_Project_log.ldf' , SIZE = 832KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [SWE_Project] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SWE_Project].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SWE_Project] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SWE_Project] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SWE_Project] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SWE_Project] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SWE_Project] SET ARITHABORT OFF 
GO
ALTER DATABASE [SWE_Project] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [SWE_Project] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SWE_Project] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SWE_Project] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SWE_Project] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SWE_Project] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SWE_Project] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SWE_Project] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SWE_Project] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SWE_Project] SET  DISABLE_BROKER 
GO
ALTER DATABASE [SWE_Project] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SWE_Project] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SWE_Project] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SWE_Project] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SWE_Project] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SWE_Project] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SWE_Project] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SWE_Project] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [SWE_Project] SET  MULTI_USER 
GO
ALTER DATABASE [SWE_Project] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SWE_Project] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SWE_Project] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SWE_Project] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [SWE_Project] SET DELAYED_DURABILITY = DISABLED 
GO
USE [SWE_Project]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 4/28/2016 7:26:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Account](
	[ID] [int] IDENTITY(100,1) NOT NULL,
	[Username] [nvarchar](50) NULL,
	[Password] [nvarchar](50) NOT NULL,
	[UserType] [varchar](50) NOT NULL,
	[Cash] [float] NOT NULL CONSTRAINT [DF_Account_Cash]  DEFAULT ((0)),
 CONSTRAINT [PK_Account] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Chief]    Script Date: 4/28/2016 7:26:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Chief](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Account_ID] [int] NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Chief] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Customer]    Script Date: 4/28/2016 7:26:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Account_ID] [int] NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Sex] [nvarchar](50) NOT NULL,
	[BirthDate] [nvarchar](50) NOT NULL,
	[Adress] [nvarchar](50) NOT NULL,
	[Phone] [int] NOT NULL,
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Food]    Script Date: 4/28/2016 7:26:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Food](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Price] [float] NOT NULL,
	[Estimated_Time] [float] NOT NULL,
	[Image] [image] NULL,
 CONSTRAINT [PK_Food] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Food_Order]    Script Date: 4/28/2016 7:26:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Food_Order](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Order_ID] [int] NOT NULL,
	[Food_ID] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[EstimatedTime] [float] NOT NULL,
	[Total_Price] [float] NOT NULL,
 CONSTRAINT [PK_Food_Orders] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Make_Order]    Script Date: 4/28/2016 7:26:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Make_Order](
	[Account_ID] [int] NOT NULL,
	[Order_ID] [int] NOT NULL,
 CONSTRAINT [PK_Make_Order] PRIMARY KEY CLUSTERED 
(
	[Account_ID] ASC,
	[Order_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Orderr]    Script Date: 4/28/2016 7:26:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orderr](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Account_ID] [int] NOT NULL,
	[Chief_ID] [int] NULL,
	[DateTime] [datetime] NOT NULL,
	[isReady] [nchar](10) NOT NULL,
	[Estimated_Time] [float] NOT NULL,
	[Total_Price] [float] NOT NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[Orderr] ADD  CONSTRAINT [DF_Order_isReady]  DEFAULT (N'N') FOR [isReady]
GO
ALTER TABLE [dbo].[Orderr] ADD  CONSTRAINT [DF_Order_Estimated_Time]  DEFAULT ((0.0)) FOR [Estimated_Time]
GO
ALTER TABLE [dbo].[Orderr] ADD  CONSTRAINT [DF_Order_Total_Price]  DEFAULT ((0)) FOR [Total_Price]
GO
ALTER TABLE [dbo].[Chief]  WITH NOCHECK ADD  CONSTRAINT [FK_Chief_Account] FOREIGN KEY([Account_ID])
REFERENCES [dbo].[Account] ([ID])
GO
ALTER TABLE [dbo].[Chief] CHECK CONSTRAINT [FK_Chief_Account]
GO
ALTER TABLE [dbo].[Customer]  WITH NOCHECK ADD  CONSTRAINT [FK_Customer_Account] FOREIGN KEY([Account_ID])
REFERENCES [dbo].[Account] ([ID])
GO
ALTER TABLE [dbo].[Customer] CHECK CONSTRAINT [FK_Customer_Account]
GO
ALTER TABLE [dbo].[Food_Order]  WITH NOCHECK ADD  CONSTRAINT [FK_Food_Order_Order] FOREIGN KEY([Order_ID])
REFERENCES [dbo].[Orderr] ([ID])
GO
ALTER TABLE [dbo].[Food_Order] CHECK CONSTRAINT [FK_Food_Order_Order]
GO
ALTER TABLE [dbo].[Food_Order]  WITH NOCHECK ADD  CONSTRAINT [FK_FoodOrder_Food] FOREIGN KEY([Food_ID])
REFERENCES [dbo].[Food] ([ID])
GO
ALTER TABLE [dbo].[Food_Order] CHECK CONSTRAINT [FK_FoodOrder_Food]
GO
ALTER TABLE [dbo].[Make_Order]  WITH NOCHECK ADD  CONSTRAINT [FK_Make_Order_Account] FOREIGN KEY([Account_ID])
REFERENCES [dbo].[Account] ([ID])
GO
ALTER TABLE [dbo].[Make_Order] CHECK CONSTRAINT [FK_Make_Order_Account]
GO
ALTER TABLE [dbo].[Make_Order]  WITH NOCHECK ADD  CONSTRAINT [FK_Make_Order_Order] FOREIGN KEY([Order_ID])
REFERENCES [dbo].[Orderr] ([ID])
GO
ALTER TABLE [dbo].[Make_Order] CHECK CONSTRAINT [FK_Make_Order_Order]
GO
ALTER TABLE [dbo].[Orderr]  WITH NOCHECK ADD  CONSTRAINT [FK_Orderr_Chief] FOREIGN KEY([Chief_ID])
REFERENCES [dbo].[Chief] ([ID])
GO
ALTER TABLE [dbo].[Orderr] CHECK CONSTRAINT [FK_Orderr_Chief]
GO
/****** Object:  StoredProcedure [dbo].[Add_money]    Script Date: 4/28/2016 7:26:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Add_money]
@acId int,
@cash float

as
begin

Declare @mycash float

select @mycash=Cash from Account where ID = @acId

update Account set Cash=(@cash + @mycash) where ID = @acId 



end
GO
/****** Object:  StoredProcedure [dbo].[AddFood]    Script Date: 4/28/2016 7:26:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[AddFood]

@name varchar(50),
@price float,
@est float

as
begin

Insert InTo Food(Name,Price,Estimated_Time) values (@name,@price,@est)


end

GO
/****** Object:  StoredProcedure [dbo].[AddFoodToOrder]    Script Date: 4/28/2016 7:26:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[AddFoodToOrder]

@orderID int,
@foodID int,
@quantity int

as
begin

Insert InTo Food_Order(Order_ID,Food_ID,Quantity,Total_Price,EstimatedTime) values (@orderID,@foodID,@quantity,(Select F.Price from Food F where F.ID = @foodID),((Select F.Estimated_Time from Food F where F.ID = @foodID)))

Declare @total_price float
declare @est float

Select @total_price=(Quantity*Total_Price) from Food_Order F where ID in (Select Top 1 ID From Food_Order ORDER BY ID DESC)
Select @est=(Quantity*EstimatedTime) from Food_Order F where ID in (Select Top 1 ID From Food_Order ORDER BY ID DESC)

Update Food_Order SET Total_Price=@total_price where ID in (Select Top 1 ID From Food_Order ORDER BY ID DESC)
Update Food_Order SET EstimatedTime=@est where ID in (Select Top 1 ID From Food_Order ORDER BY ID DESC)

Declare @totalOrderPrice float
Declare @totalEST float

Select  @totalOrderPrice=Total_Price,@totalEST=Estimated_Time from Orderr where ID=@orderID

Update Orderr set Total_Price=( @totalOrderPrice+@total_price) where ID=@orderID
Update Orderr set Total_Price=(@est+ @totalEST) where ID=@orderID

end

GO
/****** Object:  StoredProcedure [dbo].[AddOrder]    Script Date: 4/28/2016 7:26:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[AddOrder]

@acID int

as
begin

Insert InTo Orderr (Account_ID,DateTime) values (@acID,GETDATE())

DECLARE @orderid int

Select Top 1 @orderid=ID From Orderr ORDER BY ID DESC

Insert into Make_Order (Account_ID,Order_ID) values (@acID,@orderid)

end

GO
/****** Object:  StoredProcedure [dbo].[CheckUserNamePassword]    Script Date: 4/28/2016 7:26:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CheckUserNamePassword] 
@Uname int,
@Pass nvarchar(50)
AS 
SELECT  A.UserType
FROM Account A
WHERE @Uname = A.ID AND DECRYPTBYPASSPHRASE('**********',A.password)=@Pass



GO
/****** Object:  StoredProcedure [dbo].[CreateAccount]    Script Date: 4/28/2016 7:26:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CreateAccount]
@pass nvarchar(50),
@Utype varchar(50)
AS
BEGIN
INSERT INTO Account(Password,UserType)
Values (ENCRYPTBYPASSPHRASE('**********',@pass),@Utype)
END


GO
/****** Object:  StoredProcedure [dbo].[DeleteChief]    Script Date: 4/28/2016 7:26:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[DeleteChief]

@id int

as
begin

Declare @acID int

select @acID=Account_ID from Chief where ID = @id

delete  from Chief where ID = @id

delete  from Account where ID = @acID

end

GO
/****** Object:  StoredProcedure [dbo].[DeleteCustomer]    Script Date: 4/28/2016 7:26:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[DeleteCustomer]

@id int

as
begin

Declare @acID int

select @acID=Account_ID from Customer where ID = @id

delete  from Customer where ID = @id

delete  from Account where ID = @acID

end

GO
/****** Object:  StoredProcedure [dbo].[Get_id_from_account]    Script Date: 4/28/2016 7:26:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Get_id_from_account]

as
begin

select ID, Username from Account

end

GO
/****** Object:  StoredProcedure [dbo].[InsertChief]    Script Date: 4/28/2016 7:26:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[InsertChief]

@Name varchar(50)

as
begin

Insert InTo Chief(Name) Values (@Name) 

DECLARE	@return_value int
Declare @id int

Select @id=ID From Customer where Name = @Name

EXEC	@return_value = [dbo].[CreateAccount]
		@name = @Name,
		@pass = "Password",
		@Utype = N'Chief'

end

Select Top 1 @id=ID From Account ORDER BY ID DESC

Update Account set Username = @Name where ID = @id

Update Chief SET Account_ID = @id where ID in (Select Top 1 ID From Chief ORDER BY ID DESC)

GO
/****** Object:  StoredProcedure [dbo].[InsertCustomer]    Script Date: 4/28/2016 7:26:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[InsertCustomer]

@Name varchar(50),
@Sex nvarchar(50),
@BDate nvarchar(50),
@Adress nvarchar(50),
@Phone int

as
begin

Insert InTo Customer (Name,Sex,BirthDate,Adress,Phone) Values (@Name,@Sex,@BDate,@Adress,@Phone) 

DECLARE	@return_value int
Declare @id int

Select @id=ID From Customer where Name = @Name and Sex = @Sex and @BDate = BirthDate and Adress = @Adress and Phone = @Phone

EXEC	@return_value = [dbo].[CreateAccount]
		@pass = "Password",
		@Utype = N'Customer'

end

Select Top 1 @id=ID From Account ORDER BY ID DESC

Update Account set Username = @Name where ID = @id

Update Customer SET Account_ID = @id where ID in (Select Top 1 ID From Customer ORDER BY ID DESC)


GO
/****** Object:  StoredProcedure [dbo].[view_menu]    Script Date: 4/28/2016 7:26:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[view_menu]

as
begin

Select * from Food
end


GO
USE [master]
GO
ALTER DATABASE [SWE_Project] SET  READ_WRITE 
GO
