USE [DB_WithTemporalTables]
GO

ALTER TABLE 
  [dbo].[recFacilityProgram__withHistory] 
SET 
( 
  SYSTEM_VERSIONING = OFF
)
GO

IF EXISTS (
  SELECT * 
  FROM sys.objects 
  WHERE 
    object_id = OBJECT_ID(N'[dbo].[recFacilityProgram__withHistory]') 
    AND 
    type in (N'U')
)
  DROP TABLE [dbo].[recFacilityProgram__withHistory]
GO

IF EXISTS (
  SELECT * 
  FROM sys.objects 
  WHERE 
    object_id = OBJECT_ID(N'[dbo].[recFacilityProgram_history]') 
    AND 
    type in (N'U')
)
  DROP TABLE [dbo].[recFacilityProgram_history]
GO