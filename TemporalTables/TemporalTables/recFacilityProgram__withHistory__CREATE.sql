USE [DB_WithTemporalTables]
GO

/*
DOCS:
https://learn.microsoft.com/en-us/sql/relational-databases/tables/partitioning-with-temporal-tables?view=sql-server-ver16
*/


CREATE TABLE 
  [dbo].[recFacilityProgram__withHistory]
  (
    [fiID] [int] NOT NULL,
    [programId] [int] NOT NULL,
    [resourceProgramStatusId] [int] NOT NULL,
    --[projectType] [int] NOT NULL,
    --[validatorProgramAuditorId] [int] NULL,
    --[notes] [nvarchar](1000) NULL,
    [statusEffectiveDate] [datetime2](7) CONSTRAINT [DF_lrecFacilityProgram_statusEffectiveDate] DEFAULT GETDATE() NOT NULL,
    --[programVersionId] [int] NOT NULL,
    [createDate] [datetime2](7) CONSTRAINT [DF_lrecFacilityProgram_createDate] DEFAULT GETDATE() NOT NULL,
    [lastModDate] [datetime2](7) CONSTRAINT [DF_lrecFacilityProgram_lastModDate] DEFAULT GETDATE() NOT NULL,
    [ValidFrom] [datetime2](2) 
      GENERATED ALWAYS AS ROW START 
      CONSTRAINT 
        [DF_recFacilityProgram_ValidFrom] 
      DEFAULT 
      (
        CONVERT([datetime2](2), '1900-01-01 00:00:00.00')
      ) 
      NOT NULL,
    [ValidTo] [datetime2](2) 
      GENERATED ALWAYS AS ROW END 
      CONSTRAINT 
        [DF_recFacilityProgram_ValidTo] 
      DEFAULT 
      (
        CONVERT([datetime2](2), '9999-12-31 23:59:59.99')
      ) 
      NOT NULL,

    PERIOD FOR SYSTEM_TIME (ValidFrom, ValidTo),

    --[registrationDate] [datetime2](7) NULL,
    CONSTRAINT 
      [PK_recFacilityProgram] 
    PRIMARY KEY
    (
      [fiID] ASC,
      [programId] ASC
    )
  )
WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = [dbo].[recFacilityProgram_history]));
GO

--ALTER TABLE [dbo].[recFacilityProgram]  WITH NOCHECK ADD  CONSTRAINT [FK_recFacilityProgram_ResourceProgramStatus] FOREIGN KEY([resourceProgramStatusId])
--REFERENCES [dbo].[ResourceProgramStatus] ([resourceProgramStatusId])
--GO

--ALTER TABLE [dbo].[recFacilityProgram] CHECK CONSTRAINT [FK_recFacilityProgram_ResourceProgramStatus]
--GO


