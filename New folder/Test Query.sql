  SELECT * INTO disposable_customer_table FROM [ItcOrderManagements] WHERE SecZoneId=1;

  SELECT * from disposable_customer_table

USE iTrackSells

go

SELECT es.Id,es.EmployeeIdNo, es.FullName, ez.SecZoneId
FROM ItcEmployees es JOIN ItcEmployeeZones ez on es.Id=ez.ItcEmployeeId
join SecZones sz
ON sz.Id=ez.SecZoneId where sz.Id=19

go

select  om.Id,ct.CompanyName,buyer.Id as BuyerId,sz.Id,sz.Name as Zone from ItcOrderManagements om join ItcCustomerManagements ct on om.ItcCustomerManagementId=ct.Id
JOIN SecZones sz on sz.Id=om.SecZoneId
full outer JOIN ItcBuyer buyer on buyer.Name=ct.CompanyName

 where sz.Id=19 ; 
--where om.Id=20291;

--select  ct.CompanyName,buyer.Id as BuyerId,sz.Id,sz.Name as Zone 
select ct.Id, ct.CompanyName,buyer.Name as Buyer
from ItcCustomerManagements ct 
full outer JOIN ItcBuyer buyer on buyer.Name=ct.CompanyName

-- where sz.Id=19 ; 

Exec sp_generate_inserts 'disposable_customer_table'


--UPDATE ItcBuyer
--SET SecZoneId = (
--select sz.Id from ItcBuyer buyer join ItcCustomerManagements ct on buyer.Name=ct.CompanyName
--join ItcOrderManagements om on om.ItcCustomerManagementId=ct.Id
--JOIN SecZones sz on sz.Id=om.SecZoneId

--);
select  om.SecZoneId from ItcOrderManagements om join ItcCustomerManagements ct on om.ItcCustomerManagementId=ct.Id
JOIN SecZones sz on sz.Id=om.SecZoneId
full outer JOIN ItcBuyer buyer on buyer.Name=ct.CompanyName




ALTER TABLE ItcCustomerManagements
ADD SecZoneId [bigint] NULL;

--https://chartio.com/learn/sql-tips/how-to-update-a-column-based-on-a-filter-of-another-column/

--begin tran
--    UPDATE ct
--    SET ct.SecZoneId= om.SecZoneId
--    FROM  ItcCustomerManagements ct left join ItcOrderManagements om on om.ItcCustomerManagementId=ct.Id	
--commit tran

select ct.CompanyName,ct.SecZoneId as CustomerZone,sz.Id,sz.Name,om.Id,om.SecZoneId from  ItcCustomerManagements ct 
join ItcOrderManagements om on om.ItcCustomerManagementId=ct.Id
JOIN SecZones sz on sz.Id=om.SecZoneId

--begin tran
--    UPDATE b
--    SET b.SecZoneId= ct.SecZoneId
--    FROM  ItcBuyer b join ItcCustomerManagements ct on b.Name=ct.CompanyName
--commit tran

select buyer.Id, buyer.Name,ct.CompanyName,buyer.SecZoneId as BuyerZone,ct.SecZoneId as CustomerZone,sz.Id,sz.Name,om.Id from ItcBuyer buyer join ItcCustomerManagements ct on buyer.Name=ct.CompanyName
join ItcOrderManagements om on om.ItcCustomerManagementId=ct.Id
JOIN SecZones sz on sz.Id=om.SecZoneId

go
--b.SecZoneId is null and
 SELECT  om.[Id], om.SecZoneId, b.SecZoneId,b.Name
     
 FROM [iTrackSells].[dbo].ItcOrderManagements om  join ItcBuyer b on om.SecZoneId=b.SecZoneId where(b.SecZoneId is null and ( om.CreatedDate between '2019-01-01' and '2019-12-31'));

 go

 SELECT  om.[Id], om.SecZoneId, b.SecZoneId,b.Name,om.ItcCustomerManagementId
     
 FROM  ItcCustomerManagements ct join [iTrackSells].[dbo].ItcOrderManagements om  on om.ItcCustomerManagementId=ct.Id
 join ItcBuyer b on ct.CompanyName=b.Name 

 go

 Select count(om.Id) From ItcOrderManagements om  where( om.SecZoneId<>1 and om.SecZoneId <> 22) and ( om.CreatedDate between '2019-02-01' and '2019-12-31');

 go

 Select om.Id, ct.CompanyName from ItcOrderManagements om join ItcCustomerManagements ct on om.ItcCustomerManagementId=ct.Id where( om.SecZoneId<>1 and om.SecZoneId <> 22) and ( om.CreatedDate between '2019-02-01' and '2019-12-31');
 go 
 select ct.Id,ct.CompanyName,b.Name from ItcCustomerManagements ct join ItcBuyer b on b.Name=ct.CompanyName where( ct.SecZoneId<>1 and ct.SecZoneId <> 22)

 go
 
 select ct.Id,ct.CompanyName,b.Name,ct.SecZoneId,b.SecZoneId from  ItcCustomerManagements ct  full outer join ItcBuyer b on b.Name=ct.CompanyName where( ct.SecZoneId<>1 and ct.SecZoneId <> 22)

 go

select ct.Id,ct.CompanyName,b.Name,ct.SecZoneId,b.SecZoneId from  ItcCustomerManagements ct  full outer join ItcBuyer b on b.Name=ct.CompanyName
 where( ct.SecZoneId<>1 and ct.SecZoneId <> 22)
 
go

 --Order in Dhaka
select  om.Id, ct.Id,ct.CompanyName,om.SecZoneId, ct.SecZoneId from  ItcCustomerManagements ct  full outer join ItcOrderManagements om on om.ItcCustomerManagementId=ct.Id
where( ct.SecZoneId<>1 and ct.SecZoneId <> 22)
go
--Order in Gazipur
select  ct.Id as customerId,ct.CompanyName,om.Id,om.SecZoneId as orderdZone, ct.SecZoneId from  ItcCustomerManagements ct  join ItcOrderManagements om on om.ItcCustomerManagementId=ct.Id
where( ct.SecZoneId=1)
go


select  ct.Id,ct.CompanyName, ct.SecZoneId from  ItcCustomerManagements ct  
where ct.Id=4043
go
select  om.Id, om.SecZoneId,om.ItcCustomerManagementId from  ItcOrderManagements om  
where om.Id=20374
go

	--update ct
	--set ct.SecZoneId=19
	--FROM  ItcCustomerManagements ct 
	--where ct.Id=4043

 --go

 select  ct.Id as customerId,ct.CompanyName,om.Id,om.SecZoneId as orderdZone, ct.SecZoneId from ItcCustomerManagements ct full outer join ItcOrderManagements om on om.ItcCustomerManagementId=ct.Id
 where( ct.SecZoneId=19	or om.SecZoneId=1)
go

 --Order in Dhaka
select  ct.Id,ct.CompanyName,om.Id

from ItcOrderManagements om join  ItcCustomerManagements ct   on om.ItcCustomerManagementId=ct.Id

where( ct.SecZoneId<>1 and ct.SecZoneId <> 22)

go

SELECT ct.CompanyName, COUNT(om.Id)
FROM ItcCustomerManagements ct left JOIN ItcOrderManagements om  ON om.ItcCustomerManagementId= ct.Id
WHERE( ct.SecZoneId<>1 and ct.SecZoneId <> 22)
GROUP BY ct.CompanyName

SELECT ct.CompanyName,COUNT(om.Id) AS NumberOfOrders FROM ItcOrderManagements om
LEFT JOIN ItcCustomerManagements ct  ON om.ItcCustomerManagementId= ct.Id
WHERE( ct.SecZoneId<>1 and ct.SecZoneId <> 22)
GROUP BY ct.CompanyName;

GO
SELECT ct.CompanyName,COUNT(om.Id) AS NumberOfOrders FROM ItcOrderManagements om
LEFT JOIN ItcCustomerManagements ct  ON om.ItcCustomerManagementId= ct.Id

WHERE( ct.SecZoneId=1)
GROUP BY ct.CompanyName

go

SELECT COUNT(ct.Id) AS TotalCompaniesInGazipur FROM ItcCustomerManagements ct
WHERE( ct.SecZoneId=1)
GROUP BY ct.CompanyName

go

SELECT ct.CompanyName , COUNT(*)
FROM ItcCustomerManagements ct
WHERE( ct.SecZoneId=1)
GROUP BY ct.CompanyName
HAVING ( COUNT(ct.Id) > 1 )
go


SELECT ct.CompanyName,ct.Id,ct.SecZoneId
FROM ItcCustomerManagements ct
WHERE( ct.CompanyName='KNIT PLUS LTD')
go

Select * From ItcCustomerManagements ct where ct.Id= 4631;
go

Select * From ItcCustomerManagements ct where ct.Id= 10408;
go

Select * From ItcOrderManagements ct where ct.ItcCustomerManagementId= 4631;
go
Select * From ItcOrderManagements ct where ct.ItcCustomerManagementId= 10408;
go
 --Order in Dhaka
select  om.Id, ct.Id,ct.CompanyName,om.SecZoneId, ct.SecZoneId from ItcOrderManagements om  left join ItcCustomerManagements ct  on ct.Id=om.ItcCustomerManagementId
where( ct.SecZoneId<>1 and ct.SecZoneId <> 22)
go
--Count Company
select ct.CompanyName, Count(om.Id) as 'Total Orders' from ItcOrderManagements om  left join ItcCustomerManagements ct  on ct.Id=om.ItcCustomerManagementId
where( ct.SecZoneId<>1 and ct.SecZoneId <> 22)
group by (ct.CompanyName)
go

SELECT ct.CompanyName, ct.Id as CustomerId,om.Id as OrderId
FROM ItcCustomerManagements ct
Left JOIN ItcOrderManagements om ON ct.Id = om.ItcCustomerManagementId
go

Select * from ItcCustomerManagements where Id=2

Select * from ItcOrderManagements where ItcCustomerManagementId=2


Select Count (Total) as TotalOrders From
(
SELECT ct.Id, Count(om.Id) as Total
FROM ItcCustomerManagements ct
Left JOIN ItcOrderManagements om ON ct.Id = om.ItcCustomerManagementId
Group By ct.Id
) As T
--where Total=0
go



SELECT ct.CompanyName, Count(om.Id) as Total
FROM ItcCustomerManagements ct
Left JOIN ItcOrderManagements om ON ct.Id = om.ItcCustomerManagementId
Group By ct.CompanyName
HAVING COUNT(om.Id) = 0;

-- Result -> List of companies which total order=0

go
SELECT ct.CompanyName, ct.Id as CustomerId,om.Id as OrderId
FROM ItcCustomerManagements ct
Left JOIN ItcOrderManagements om ON ct.Id = om.ItcCustomerManagementId
where( om.Id is null  )

-- Result -> List of companies which order is null 

go
SELECT ct.CompanyName, ct.Id as CustomerId,om.Id as OrderId
FROM ItcCustomerManagements ct
Left JOIN ItcOrderManagements om ON ct.Id = om.ItcCustomerManagementId
where( om.SecZoneId<>1 and om.SecZoneId <>22 )
--group by ct.CompanyName
go

SELECT 
t2.CompanyName,t2.Id
FROM
(
SELECT * from ItcOrderManagements om where  ( om.SecZoneId<>1 and om.SecZoneId <>22 )
--Group by om.ItcCustomerManagementId
 ) t1 
Right JOIN
(
Select * from  ItcCustomerManagements ct where( ct.SecZoneId<>1 and ct.SecZoneId <>22 )
--SELECT ks, COUNT(*) AS '# Late' FROM Table WHERE Age > Palt GROUP BY ks
) t2
ON t1.ItcCustomerManagementId = t2.Id
--where t1.ItcCustomerManagementId is null
go

---=================================================

SELECT *
FROM
   (
  SELECT  ct.CompanyName,ct.Id from ItcCustomerManagements ct where( ct.SecZoneId<>1 and ct.SecZoneId <>22 )
  ) t1
RIGHT JOIN
  (
  SELECT om.ItcCustomerManagementId,Count(om.Id) as 'Total Order' from ItcOrderManagements om 
  where  ( om.SecZoneId<>1 and om.SecZoneId <>22 )
  Group by om.ItcCustomerManagementId
  ) t2
ON t1.Id=t2.ItcCustomerManagementId
--ORDER BY Activity

SELECT *
FROM
   (
  SELECT  ct.CompanyName,ct.Id from ItcCustomerManagements ct where( ct.SecZoneId<>1 and ct.SecZoneId <>22 )
  ) t1
Left JOIN
  (
  SELECT om.ItcCustomerManagementId from ItcOrderManagements om 
  where  ( om.SecZoneId<>1 and om.SecZoneId <>22 )
  Group By om.ItcCustomerManagementId
  ) t2
ON t1.Id=t2.ItcCustomerManagementId


 ---=============== Customers who Orderd =========

SELECT ct.CompanyName,Count(om.Id) as Total

FROM ItcCustomerManagements ct
Left JOIN ItcOrderManagements om ON ct.Id = om.ItcCustomerManagementId
Where (ct.SecZoneId <>1 and ct.SecZoneId<>22

  ) --Dhaka
--Where (ct.SecZoneId =1 ) --Gazipur
--Where (ct.SecZoneId =1 ) --CTG
Group By ct.CompanyName

Having Count(om.Id)=0 ---> 9532 2794 1589 10265 6475 10112

DELETE FROM ItcOrderManagements WHERE ItcCustomerManagementId =10112;
-- Result -> Counts Total Orders for every company
Select ct.CompanyName,ct.SecZoneId  from ItcCustomerManagements ct where ct.SecZoneId is null;
Select ct.CompanyName,ct.SecZoneId  from ItcCustomerManagements ct where ct.Id= 10112;
Select om.Id,om.SecZoneId  from ItcOrderManagements om where om.ItcCustomerManagementId= 10112;

Select ct.CompanyName,ct.SecZoneId,ct.Id  from ItcCustomerManagements ct where ct.CompanyName = ' DEDLUX APPARELS LTD'

go
SELECT ct.CompanyName,ct.Id
FROM ItcCustomerManagements ct
Where (ct.SecZoneId <>1 and ct.SecZoneId<>22)
--- Results 2151rows ---> Dhaka
go
SELECT ct.CompanyName,ct.Id
FROM ItcCustomerManagements ct
Where (ct.SecZoneId =1 )
--- Results 574rows ---> Gazipur
go

SELECT ct.CompanyName,ct.Id
FROM ItcCustomerManagements ct
Where (ct.SecZoneId =22 )
--- Results 574rows ---> CTG
go

--Select * From ItcCustomerManagements ct Left Join 
DELETE FROM ItcCustomerManagements WHERE SecZoneId is null;
go

SELECT om.Id,ct.Id,ct.CompanyName,ct.Phone

FROM ItcCustomerManagements ct
Left JOIN ItcOrderManagements om ON ct.Id = om.ItcCustomerManagementId
Where (ct.SecZoneId <>1 and ct.SecZoneId<>22
 and om.id is not null
  ) --Dhaka
--Where (ct.SecZoneId =1 ) --Gazipur
--Where (ct.SecZoneId =1 ) --CTG
go
CREATE proc sp_TotalOrderedCompanies
AS
SELECT Count(Total) AS totalOfRows 
FROM ( 
SELECT ct.CompanyName as Total

FROM ItcCustomerManagements ct
Left JOIN ItcOrderManagements om ON ct.Id = om.ItcCustomerManagementId
Where (ct.SecZoneId <>1 and ct.SecZoneId<>22
 and om.id is not null
  )
)As T 

go
 Exec sp_TotalOrderedCompanies
 go
 CREATE proc sp_TotalNotOrderedCompanies
AS
SELECT Count(Total) AS totalOfRows 
FROM ( 
SELECT ct.CompanyName as Total

FROM ItcCustomerManagements ct
Left JOIN ItcOrderManagements om ON ct.Id = om.ItcCustomerManagementId
Where (ct.SecZoneId <>1 and ct.SecZoneId<>22
 and om.id is null
  )
)As T 

go
Exec sp_TotalNotOrderedCompanies