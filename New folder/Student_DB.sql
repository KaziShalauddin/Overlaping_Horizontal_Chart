USE [Student_DB]
GO
/****** Object:  Table [dbo].[Marks]    Script Date: 1/26/2020 11:26:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Marks](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PupilName] [nvarchar](250) NOT NULL,
	[Subject] [nvarchar](250) NOT NULL,
	[Mark] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Marks] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pupils]    Script Date: 1/26/2020 11:26:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pupils](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Grade] [int] NOT NULL,
	[Parent] [nvarchar](250) NOT NULL,
	[Address] [nvarchar](250) NOT NULL,
 CONSTRAINT [PK_Student] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Marks] ON 
GO
INSERT [dbo].[Marks] ([Id], [PupilName], [Subject], [Mark]) VALUES (1, N'Noah', N'Mathematics', N'B+')
GO
INSERT [dbo].[Marks] ([Id], [PupilName], [Subject], [Mark]) VALUES (2, N'Noah', N'Drawing', N'B-')
GO
INSERT [dbo].[Marks] ([Id], [PupilName], [Subject], [Mark]) VALUES (3, N'James', N'Drawing', N'A-')
GO
INSERT [dbo].[Marks] ([Id], [PupilName], [Subject], [Mark]) VALUES (4, N'James', N'Sports', N'C')
GO
SET IDENTITY_INSERT [dbo].[Marks] OFF
GO
SET IDENTITY_INSERT [dbo].[Pupils] ON 
GO
INSERT [dbo].[Pupils] ([Id], [Name], [Grade], [Parent], [Address]) VALUES (1, N'Noah', 11, N'Michael Wilson	', N'72 Oxford Street 
')
GO
INSERT [dbo].[Pupils] ([Id], [Name], [Grade], [Parent], [Address]) VALUES (2, N'Kim', 8, N'Ed Thumpson	', N'67 York Street
')
GO
INSERT [dbo].[Pupils] ([Id], [Name], [Grade], [Parent], [Address]) VALUES (3, N'Viktor', 3, N'Brian Carter	', N'16 Darlinghurst Street
')
GO
INSERT [dbo].[Pupils] ([Id], [Name], [Grade], [Parent], [Address]) VALUES (4, N'James', 9, N'Helen Wright	', N'59 Paul Street
')
GO
INSERT [dbo].[Pupils] ([Id], [Name], [Grade], [Parent], [Address]) VALUES (5, N'Liam', 5, N'Karen Collins	', N'82 Newtown Park
')
GO
INSERT [dbo].[Pupils] ([Id], [Name], [Grade], [Parent], [Address]) VALUES (6, N'Sandra', 6, N'Karen Collins	', N'82 Newtown Park
')
GO
SET IDENTITY_INSERT [dbo].[Pupils] OFF
GO



------------------------------- Queries ---------------------------------------------

----Useful Link: https://documentation.play-sql.com/display/SQL/Matching+records+from+two+tables+-+the+JOIN

Use Student_DB
go

SELECT Pupils.Name, Pupils.Parent, Marks.Subject, Marks.Mark
FROM Pupils
Left JOIN Marks ON Pupils.Name = Marks.PupilName
go

--======================
SELECT Pupils.Name, Pupils.Parent, Marks.Subject, Marks.Mark
FROM Pupils
LEFT JOIN Marks ON Pupils.Name = Marks.PupilName
where Marks.Mark is null
go
SELECT COUNT(*)
FROM Pupils
LEFT JOIN Marks ON Pupils.Name = Marks.PupilName
where Marks.Mark is null
go

SELECT Pupils.Name, COUNT(*)
FROM Pupils
LEFT JOIN Marks ON Pupils.Name = Marks.PupilName
where Marks.Mark is null
group by Pupils.Name
go

--======================

SELECT Pupils.Name, Pupils.Parent, Marks.Subject, Marks.Mark
FROM Pupils
LEFT JOIN Marks ON Pupils.Name = Marks.PupilName
where Marks.Mark is not null
go

SELECT Pupils.Name, COUNT(*)
FROM Pupils
LEFT JOIN Marks ON Pupils.Name = Marks.PupilName
where Marks.Mark is not null
group by Pupils.Name
go

--======================

SELECT PupilName,Parent,Grade,Subject, Mark
FROM Pupils 
INNER JOIN Marks 
ON Pupils.Name = Marks.PupilName
go

SELECT COUNT(*) AS MatchingRows 
FROM Pupils 
INNER JOIN Marks 
ON Pupils.Name = Marks.PupilName
group by Pupils.Name


select  Pupils.Name, count(DISTINCT Pupils.Name) 
from Pupils
INNER JOIN Marks 
ON Pupils.Name = Marks.PupilName
group by Pupils.Name

SELECT Count(Total) AS totalOfRows 
FROM ( 

SELECT Pupils.Name as Total 
from Pupils
INNER JOIN Marks 
ON Pupils.Name = Marks.PupilName
group by Pupils.Name
)As T

Go 
--- =========== Temp Table -> Start =======================
create table #one (id int,acc nvarchar(25))
insert into #one (id , acc) values(1,'one') 
insert into #one (id , acc) values(2,'two') 
insert into #one (id , acc) values(3,'three') 

create table #two (acct nvarchar(25),ids int)
insert into #two (acct,ids) values('one',1) 
insert into #two (acct,ids) values('two',3) 
insert into #two (acct,ids) values('four',4) 
insert into #two (acct,ids) values('five',5) 


select ids from #two EXCEPT select id from #one 



SELECT Count(Total) AS totalOfRows 
FROM ( 

select ids as Total from #two EXCEPT select id from #one 

)As T
go
drop table #one 
drop table #two
Go

--- =========== Temp Table -> End =======================


SELECT Pupils.Name,  Marks.Subject, Marks.Mark
FROM Pupils
LEFT JOIN Marks ON Pupils.Name = Marks.PupilName
WHERE Marks.Subject = 'Mathematics'
go
SELECT Pupils.Name,  Marks.Subject, Marks.Mark
FROM Pupils
LEFT JOIN Marks ON Pupils.Name = Marks.PupilName AND Marks.Subject = 'Mathematics'
go
Select Count (Pupils.Id) as 'Total Students' From Pupils 
go

---===================================
  SELECT * INTO disposable_customer_table FROM [ItcOrderManagements] WHERE SecZoneId=1;

  SELECT * from disposable_customer_table

