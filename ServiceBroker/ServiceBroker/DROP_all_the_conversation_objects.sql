USE VERRA
GO

-- Drop the initiator queue and service if they already exist.

IF EXISTS (
  SELECT *
  FROM sys.services
  WHERE name = N'InitiatorService'
)
DROP SERVICE [InitiatorService]
GO

IF EXISTS (
  SELECT *
  FROM sys.service_queues
  WHERE name = N'InitiatorQueue'
)
DROP QUEUE InitiatorQueue
GO

-- Drop the target queue and service if they already exist.

IF EXISTS (
  SELECT *
  FROM sys.services
  WHERE name = N'TargetService'
)
DROP SERVICE [TargetService]
GO

IF EXISTS (
  SELECT *
  FROM sys.service_queues
  WHERE name = N'TargetQueue'
)
DROP QUEUE TargetQueue
GO

IF EXISTS (
  SELECT *
  FROM sys.service_contracts
  WHERE name = N'SampleContract'
)
  DROP CONTRACT [SampleContract]
GO

IF EXISTS (
  SELECT *
  FROM sys.service_message_types
  WHERE name = N'ReplyMessage'
)
  DROP MESSAGE TYPE [ReplyMessage]
GO

IF EXISTS (
  SELECT *
  FROM sys.service_message_types
  WHERE name = N'RequestMessage'
)
  DROP MESSAGE TYPE [RequestMessage]
GO