Use AdventureWorks2022

/*
DROP TABLE dbo.demoAutoPopulate
CREATE TABLE [dbo].[demoAutoPopulate](
  [RegularColumn] [NVARCHAR](50) NOT NULL PRIMARY KEY,
  [IdentityColumn] [INT] IDENTITY(1,1) NOT NULL,
  [RowversionColumn] [ROWVERSION] NOT NULL,
  [SequenceColumn] [INT] NOT NULL,
  [ComputedColumn] AS ([RegularColumn] + CONVERT([NVARCHAR], [IdentityColumn], (0))) PERSISTED
)
*/
--DROP SEQUENCE [dbo].[demoSequence]

--CREATE SEQUENCE dbo.demoSequence AS INT START WITH 1 INCREMENT BY 1

--INSERT INTO 
--  dbo.demoAutoPopulate (RegularColumn, SequenceColumn) 
--VALUES 
--('a', NEXT VALUE FOR dbo.demoSequence),
--('b', NEXT VALUE FOR dbo.demoSequence)

--DECLARE @i sql_variant 
--SELECT @i = NEXT VALUE FOR dbo.demoSequence
--SELECT @i = COALESCE(last_used_value, 0)
--SELECT @i = CASE WHEN last_used_value IS NULL THEN NULL ELSE current_value END FROM sys.sequences WHERE name = 'demoSequence'
--SELECT @i

--SELECT * FROM [demoAutoPopulate]

-- DROP TABLE [dbo].[demoAddress]
CREATE TABLE [dbo].[demoAddress](
  [AddressID] [INT] NOT NULL IDENTITY PRIMARY KEY
)
--CREATE TABLE [dbo].[demoAddress](
--  [AddressID] [INT] NOT NULL IDENTITY PRIMARY KEY,
--  [AddressLine1] [NVARCHAR](60) NULL
--)

INSERT INTO [dbo].[demoAddress]
DEFAULT VALUES

SELECT * FROM [dbo].[demoAddress]
