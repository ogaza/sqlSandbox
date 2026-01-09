/*
https://learn.microsoft.com/en-us/sql/database-engine/service-broker/lesson-2-beginning-a-conversation-and-transmitting-messages?view=sql-server-ver17
*/

USE VERRA
GO

/*
Begin a conversation and send a request message
*/

DECLARE @InitDlgHandle AS UNIQUEIDENTIFIER
DECLARE @RequestMsg AS NVARCHAR (100)

BEGIN TRANSACTION

BEGIN DIALOG @InitDlgHandle
FROM SERVICE [InitiatorService]
TO SERVICE N'TargetService'
ON CONTRACT [SampleContract]
WITH ENCRYPTION = OFF

SELECT @RequestMsg = N'Message for Target service sent on ' + CONVERT(NVARCHAR, GETDATE(), 14)
--SELECT @RequestMsg = N'<RequestMsg>Message for Target service.</RequestMsg>'
;

SEND ON CONVERSATION (@InitDlgHandle)
MESSAGE TYPE [RequestMessage] (@RequestMsg)

SELECT @RequestMsg AS SentRequestMsg

COMMIT TRANSACTION
GO

--SELECT *  FROM TargetQueue
