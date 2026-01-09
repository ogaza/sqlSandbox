/*
https://learn.microsoft.com/en-us/sql/database-engine/service-broker/lesson-1-creating-the-conversation-objects?view=sql-server-ver17
*/

USE [VERRA]

-- Create the message types

IF NOT EXISTS (
  SELECT *
  FROM sys.service_message_types
  WHERE name = N'RequestMessage'
)
  CREATE MESSAGE TYPE [RequestMessage]
    VALIDATION = NONE
  --VALIDATION = WELL_FORMED_XML
GO

IF NOT EXISTS (
  SELECT *
  FROM sys.service_message_types
  WHERE name = N'ReplyMessage'
)
  CREATE MESSAGE TYPE [ReplyMessage]
    VALIDATION = NONE
    --VALIDATION = WELL_FORMED_XML
GO

-- Create contract
IF NOT EXISTS (
  SELECT *
  FROM sys.service_contracts
  WHERE name = N'SampleContract'
)
  CREATE CONTRACT [SampleContract](
    [RequestMessage] SENT BY INITIATOR,
    [ReplyMessage] SENT BY TARGET
  )
GO

-- Create the target queue and service
IF NOT EXISTS (
  SELECT *
  FROM sys.service_queues
  WHERE name = N'TargetQueue'
)
  CREATE QUEUE TargetQueue
GO

IF NOT EXISTS (
  SELECT *
  FROM sys.services
  WHERE name = N'TargetService'
)
  CREATE SERVICE [TargetService]
  ON QUEUE TargetQueue([SampleContract])
GO

-- Create the initiator queue and service

IF NOT EXISTS (
  SELECT *
  FROM sys.service_queues
  WHERE name = N'InitiatorQueue'
)
  CREATE QUEUE InitiatorQueue
GO

IF NOT EXISTS (
  SELECT *
  FROM sys.services
  WHERE name = N'InitiatorService'
)
  CREATE SERVICE [InitiatorService]
  ON QUEUE InitiatorQueue
GO