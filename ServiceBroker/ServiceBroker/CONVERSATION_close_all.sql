USE [VERRA]

DECLARE @i INT = 0
DECLARE @handle UNIQUEIDENTIFIER 
DECLARE @service_id INT
DECLARE @service_name NVARCHAR(100)
DECLARE @far_service NVARCHAR(70)

DECLARE 
  conv_cur 
CURSOR FAST_FORWARD FOR 
  SELECT 
    CONVERSATION_HANDLE, 
    service_id, 
    far_service 
  FROM 
    SYS.CONVERSATION_ENDPOINTS 

OPEN conv_cur
FETCH NEXT FROM 
  conv_cur 
INTO 
  @handle, 
  @service_id, 
  @far_service
  
WHILE (@@FETCH_STATUS = 0 AND (@i<500000))
BEGIN

  SELECT TOP 1 
    @service_name = name 
  FROM 
    sys.services 
  WHERE 
    service_id = @service_id

  BEGIN
    END CONVERSATION @handle WITH CLEANUP
  END
  
  FETCH NEXT FROM 
    conv_cur 
  INTO 
    @handle, @service_id, @far_service;

  SET @i = @i + 1
END 
CLOSE conv_cur
DEALLOCATE conv_cur
