/*
Receive the request
*/

DECLARE @RecvReqDlgHandle AS UNIQUEIDENTIFIER
DECLARE @RecvReqMsg AS NVARCHAR (100)
DECLARE @RecvReqMsgName AS sysname

BEGIN TRANSACTION
WAITFOR (
  RECEIVE TOP (1) 
    @RecvReqDlgHandle = conversation_handle,
    @RecvReqMsg = message_body,
    @RecvReqMsgName = message_type_name 
  FROM 
    TargetQueue
), 
TIMEOUT 1000

SELECT @RecvReqMsg AS ReceivedRequestMsg

COMMIT TRANSACTION
GO

/*
send a reply
*/

--IF @RecvReqMsgName = N'RequestMessage'
--BEGIN
--  DECLARE @ReplyMsg AS NVARCHAR (100);
--  SELECT @ReplyMsg = N'<ReplyMsg>Message for Initiator service.</ReplyMsg>';
--  SEND ON CONVERSATION (@RecvReqDlgHandle)
--  MESSAGE TYPE [ReplyMessage] (@ReplyMsg);
--  END CONVERSATION @RecvReqDlgHandle;
--END

--SELECT @ReplyMsg AS SentReplyMsg

--COMMIT TRANSACTION
--GO