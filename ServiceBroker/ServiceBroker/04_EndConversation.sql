USE VERRA;

DECLARE @RecvReplyMsg AS NVARCHAR (100)
DECLARE @RecvReplyDlgHandle AS UNIQUEIDENTIFIER

BEGIN TRANSACTION
WAITFOR (
  RECEIVE TOP (1) 
    @RecvReplyDlgHandle = conversation_handle,
    @RecvReplyMsg = message_body
  FROM 
    TargetQueue
), 
TIMEOUT 1000

SELECT @RecvReplyDlgHandle AS DlgHandle, @RecvReplyMsg AS ReceivedReplyMsg

END CONVERSATION 
  @RecvReplyDlgHandle
WITH 
  CLEANUP

COMMIT TRANSACTION
GO