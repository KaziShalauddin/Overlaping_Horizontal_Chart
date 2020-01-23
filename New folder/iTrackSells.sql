USE [iTrackSells]
GO


/****** Object:  Table [dbo].[ItcBuyer]    Script Date: 1/22/2020 1:05:39 PM ******/
DROP TABLE [dbo].[ItcBuyer]
GO

/****** Object:  Table [dbo].[ItcBuyer]    Script Date: 1/22/2020 1:05:39 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[ItcBuyer](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NOT NULL,
	[Country] [nvarchar](250) NULL,
	[SunCode] [nvarchar](250) NULL,
	[EbitzCode] [nvarchar](250) NULL,
	[ITSCode] [nvarchar](250) NULL,
	[RegisterNo] [nvarchar](250) NULL,
	[CustomerCode] [nvarchar](250) NULL,
	[Status] [bit] NOT NULL,
	[CmnCompanyId] [int] NOT NULL,
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedBy] [int] NULL,
	[ModifiedDate] [datetime] NULL,
	[SecZoneId] [bigint] NULL
 CONSTRAINT [PK_ItcBuyer] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]


GO

CREATE TABLE [dbo].[SecZones](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[Status] [bit] NOT NULL,
	[CmnCompanyId] [int] NOT NULL,
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedBy] [int] NULL,
	[ModifiedDate] [datetime] NULL,
 CONSTRAINT [PK_DmsZones] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]


GO


CREATE TABLE [dbo].[ItcOrderManagements](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[ItcOrderTypeId] [bigint] NOT NULL,
	[OrderDate] [datetime] NOT NULL,
	[RquestedPickingTime] [datetime] NULL,
	[SecZoneId] [bigint] NULL,
	[SampleCollectionAddress] [nvarchar](500) NULL,
	[ContactNumber] [nvarchar](500) NULL,
	[ContactName] [nvarchar](250) NULL,
	[Note] [nvarchar](500) NULL,
	[Status] [bit] NOT NULL,
	[CmnCompanyId] [int] NOT NULL,
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedBy] [int] NULL,
	[ModifiedDate] [datetime] NULL,
	[ItcCustomerManagementId] [bigint] NOT NULL,
	[CourierName] [nvarchar](250) NULL,
	[TrackingNo] [nvarchar](250) NULL,
	[ItcSampleReceiptId] [bigint] NULL,
	[TotalTRF] [int] NULL,
	[TotalSample] [int] NULL,
	[SamplePreparationTrfRemarks] [nvarchar](250) NULL,
	[TrfCreateDate] [datetime] NULL,
	[InwordCreateDate] [datetime] NULL,
	[InwardCreatedBy] [int] NULL,
	[InwardUpdateDate] [datetime] NULL,
	[InwardUpdateBy] [int] NULL,
	[TrfCreatedBy] [int] NULL,
	[TrfUpdateDate] [datetime] NULL,
	[TrfUpdateBy] [int] NULL,
	[ItcOfficeId] [bigint] NULL,
 CONSTRAINT [PK_ItcOrderManagements] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]


GO

UPDATE ItcBuyer
SET col = ( SELECT other_col FROM [iTrackSells].[dbo].ItcCustomerManagements WHERE ItcCustomerManagements. = ItcBuyer. );


UPDATE ItcBuyer
SET SecZoneId = 1
WHERE Name = '"3 Suisses"';



SELECT * FROM ItcCustomerManagements
--WHERE ItcCustomerManagements.table_id = ItcBuyer.id