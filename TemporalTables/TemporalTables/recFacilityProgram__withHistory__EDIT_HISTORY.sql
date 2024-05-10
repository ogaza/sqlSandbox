USE [DB_WithTemporalTables];

/*
DOCS:
https://learn.microsoft.com/en-us/sql/relational-databases/tables/partitioning-with-temporal-tables?view=sql-server-ver16
*/

--ALTER TABLE 
--  [dbo].[recFacilityProgram__withHistory] 
--SET 
--( 
--  SYSTEM_VERSIONING = OFF
--)
--GO

--DELETE 
--  recFacilityProgram_history
--WHERE 
--  resourceProgramStatusId = 2;
;

--ALTER TABLE 
--  [dbo].[recFacilityProgram__withHistory] 
--SET 
--( 
--  SYSTEM_VERSIONING = ON
--  (HISTORY_TABLE = [dbo].[recFacilityProgram_history])
--)
--GO

SELECT 'recFacilityProgram';
SELECT 
  [fiID],
  [programId],
  [resourceProgramStatusId],
  [statusEffectiveDate],
  [createDate],
  [lastModDate],
  [ValidFrom],
  [ValidTo]
FROM 
  [recFacilityProgram__withHistory]
GO

SELECT 'HISTORY of recFacilityProgram';
SELECT  
  [fiID],
  [programId],
  [resourceProgramStatusId],
  [statusEffectiveDate],
  [createDate],
  [lastModDate],
  [ValidFrom],
  [ValidTo]
FROM 
  [recFacilityProgram_history]
