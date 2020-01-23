  SELECT * INTO disposable_customer_table FROM [ItcOrderManagements] WHERE SecZoneId=1;

  SELECT * from disposable_customer_table

  USE ITRACK_NEW_4

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


UPDATE ItcBuyer
SET SecZoneId = (
select sz.Id from ItcBuyer buyer join ItcCustomerManagements ct on buyer.Name=ct.CompanyName
join ItcOrderManagements om on om.ItcCustomerManagementId=ct.Id
JOIN SecZones sz on sz.Id=om.SecZoneId

);
select  om.SecZoneId from ItcOrderManagements om join ItcCustomerManagements ct on om.ItcCustomerManagementId=ct.Id
JOIN SecZones sz on sz.Id=om.SecZoneId
JOIN ItcBuyer buyer on buyer.Name=ct.CompanyName




ALTER TABLE ItcCustomerManagements
ADD SecZoneId [bigint] NULL;

--https://chartio.com/learn/sql-tips/how-to-update-a-column-based-on-a-filter-of-another-column/

begin tran
    UPDATE ct
    SET ct.SecZoneId= om.SecZoneId
    FROM  ItcCustomerManagements ct join ItcOrderManagements om on om.ItcCustomerManagementId=ct.Id	
commit tran

select ct.CompanyName,ct.SecZoneId as CustomerZone,sz.Id,sz.Name,om.Id,om.SecZoneId from  ItcCustomerManagements ct 
join ItcOrderManagements om on om.ItcCustomerManagementId=ct.Id
JOIN SecZones sz on sz.Id=om.SecZoneId

begin tran
    UPDATE b
    SET b.SecZoneId= ct.SecZoneId
    FROM  ItcBuyer b join ItcCustomerManagements ct on b.Name=ct.CompanyName
commit tran

select buyer.Id, buyer.Name,ct.CompanyName,buyer.SecZoneId as BuyerZone,ct.SecZoneId as CustomerZone,sz.Id,sz.Name,om.Id from ItcBuyer buyer join ItcCustomerManagements ct on buyer.Name=ct.CompanyName
join ItcOrderManagements om on om.ItcCustomerManagementId=ct.Id
JOIN SecZones sz on sz.Id=om.SecZoneId

go

   SELECT  om.[Id], om.SecZoneId, b.SecZoneId,b.Name
     
  FROM [iTrackSells].[dbo].ItcOrderManagements om join ItcBuyer b on om.SecZoneId=b.SecZoneId where( b.SecZoneId > 5 and( om.CreatedDate between '2019-10-01' and '2019-12-31'));


