--USE VERRA;

/*
01 Turn on the service broker for the VERRA DB
*/

--ALTER DATABASE VERRA
--SET ENABLE_BROKER

/*
02 Define a message type
*/

--CREATE MESSAGE TYPE VerraMsgType
-- -- AUTHORIZATION dbo
--VALIDATION = NONE

/*
03 Define a contract
*/

--CREATE CONTRACT myContract(
--  VerraMsgType SENT BY ANY
--)

/*
04 Queues
*/

--CREATE QUEUE myInitiatorQueue
--CREATE QUEUE myTrgetQueue

/*
05 Services

When queues are defined for both sides of a conversation
the services should also be defined for both sides of
the conversation
*/

--CREATE SERVICE myInitiatorService
--ON QUEUE myInitiatorQueue (myContract)

--CREATE SERVICE myTrgetService
--ON QUEUE myTrgetQueue (myContract)

/*
06 Routes

not used in MIRECS, so may not be necessary
*/

--CREATE ROUTE myRoute
--WITH SERVICE_NAME = '...'

/*
07 Priorities
as above - not used in MIRECS so probably may be skipped for the time being
*/

--CREATE BROKER PRIORITY ...

/*
08 Group Conversations

as above - skipped for the time being
*/

