USE [DB_WithTemporalTables];

CREATE TABLE 
  [dbo].[ResourceProgramStatus] 
  (
    resourceProgramStatusId INT IDENTITY NOT NULL, 
    programId INT NOT NULL, 
    code varchar(32) NOT NULL, 
    --name nvarchar(128) NOT NULL, 
    --equivalentResourceStatusCode    varchar(32)   NOT NULL, 
    -- displayOrder int NOT NULL, 
    --resourceProgramPubliclyVisible BIT NOT NULL, 
    -- resourceProgramExternalStatusId INT NULL, 
    --createdAt datetime2(7) NOT NULL, 
    CONSTRAINT 
      [PK_ResourceProgramStatus] 
    PRIMARY KEY 
    (
      resourceProgramStatusId
    ), 
    CONSTRAINT [UK_ResourceProgramStatus_Code] UNIQUE (code), 
    -- CONSTRAINT [FK_ResourceProgramStatus_Program] FOREIGN KEY (programId) REFERENCES [program].[Program] (programId), 
    -- CONSTRAINT [FK_ResourceProgramStatus_resourceProgramExternalStatus] 
    -- FOREIGN KEY (resourceProgramExternalStatusId) 
    -- REFERENCES [program].[resourceProgramExternalStatus] (resourceProgramExternalStatusId)
  );
GO

ALTER TABLE [dbo].[ResourceProgramStatus] ENABLE CHANGE_TRACKING;
GO