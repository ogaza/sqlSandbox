/* Using DELETE (p. 218) */

Use AdventureWorks2022;

/*
Copies of the existing tables
*/ 

---------------------------------------------------------------------
-- [dbo].[demoProduct]
---------------------------------------------------------------------

--If exists(
--	select 
--		* 
--	from 
--		sys.objects 
--	where 
--		object_id = OBJECT_ID(N'[dbo].[demoProduct]')
--		and type in (N'U')
--)
--	DROP TABLE [dbo].[demoProduct];

-- Select * into [dbo].[demoProduct] from Production.Product;

---------------------------------------------------------------------
-- [dbo].[demoCustomer]
---------------------------------------------------------------------

--IF EXISTS (
--	SELECT * FROM sys.objects
--	WHERE 
--		object_id = OBJECT_ID(N'[dbo].[demoCustomer]')
--		AND type in (N'U')
--	)	
--	DROP TABLE [dbo].[demoCustomer];

--GO

--SELECT * INTO dbo.demoCustomer FROM Sales.Customer;


---------------------------------------------------------------------
-- [dbo].[demoAddress]
---------------------------------------------------------------------

--IF EXISTS (
--	SELECT * FROM sys.objects
--	WHERE 
--		object_id = OBJECT_ID(N'[dbo].[demoAddress]')
--		AND type in (N'U')
--	)

--DROP TABLE [dbo].[demoAddress];
--GO

--SELECT 
--	* 
--INTO 
--	dbo.demoAddress 
--FROM 
--	Person.Address;

---------------------------------------------------------------------
-- [dbo].[demoSalesOrderHeader]
---------------------------------------------------------------------

--IF EXISTS (
--	SELECT 
--		* 
--	FROM 
--		sys.objects
--	WHERE 
--		object_id = OBJECT_ID(N'[dbo].[demoSalesOrderHeader]')
--		AND type in (N'U')
--	)
--	DROP TABLE [dbo].[demoSalesOrderHeader];

--GO
--SELECT * INTO dbo.demoSalesOrderHeader FROM Sales.SalesOrderHeader;

---------------------------------------------------------------------
-- [dbo].[demoSalesOrderDetail]
---------------------------------------------------------------------

--IF EXISTS (
--	SELECT * FROM sys.objects
--	WHERE object_id = OBJECT_ID(N'[dbo].[demoSalesOrderDetail]')
--	AND type in (N'U')
--	)
--	DROP TABLE [dbo].[demoSalesOrderDetail];

--GO
--SELECT * INTO dbo.demoSalesOrderDetail FROM Sales.SalesOrderDetail;

---------------------------------------------------------------------
-- DELETING
---------------------------------------------------------------------

/*
Running a SELECT statement before deleting data is a
good idea and enables you to test your WHERE clause. 
Make sure you know which rows will be deleted before 
you delete them.
*/

--GO
----1
--SELECT CustomerID
--FROM dbo.demoCustomer;

----2
--DELETE dbo.demoCustomer;

----3
--SELECT CustomerID
--FROM dbo.demoCustomer;

----4
--SELECT ProductID
--FROM dbo.demoProduct
--WHERE ProductID > 900;

----5
--DELETE dbo.demoProduct
--WHERE ProductID > 900;

----6
--SELECT ProductID
--FROM dbo.demoProduct
--WHERE ProductID > 900;

/*
Deleting from a Table Using a Join or a Subquery (p. 221)
*/

/*
You can also remove rows from a table that is involved in a join to restrict 
which rows the statement deletes. You may delete rows from only one of the tables. 
Often developers will use a subquery instead of a join to accomplish the same thing.
*/

--1 
/*
-- drop demo tables
DROP TABLE dbo.demoSalesOrderDetail
DROP TABLE dbo.demoSalesOrderHeader

-- create and populate the demo tables
SELECT * INTO dbo.demoSalesOrderDetail FROM Sales.SalesOrderDetail
SELECT * INTO dbo.demoSalesOrderHeader FROM Sales.SalesOrderHeader

write SELECT  statements first to test your WHERE clause 
and to make sure you will delete the correct rows
*/

--SELECT 
--  d.SalesOrderID, 
--  SalesOrderNumber 
--FROM 
--  dbo.demoSalesOrderDetail AS 
--  d 
--  INNER JOIN 
--  dbo.demoSalesOrderHeader AS 
--  h 
--    ON 
--      d.SalesOrderID = h.SalesOrderID 
--WHERE 
--  h.SalesOrderNumber = 'SO71797'

--2 
/*
The syntax and this example used an INNER JOIN , 
but you can also use an OUTER JOIN
*/
--DELETE 
--  d 
--FROM 
--  dbo.demoSalesOrderDetail AS 
--  d 
--  INNER JOIN 
--  dbo.demoSalesOrderHeader AS 
--  h 
--    ON 
--    d.SalesOrderID = h.SalesOrderID 
--WHERE 
--  h.SalesOrderNumber = 'SO71797' 

/*
Using the alias ensures that the DELETE  part 
of the statement is tied to the SELECT  part of the statement
This helps to avoid accidental deletion of all the records a table 
like in the following command:

DELETE dbo.demoSalesOrderDetail 
SELECT d.SalesOrderID 
FROM 
  dbo.demoSalesOrderDetail AS d 
  INNER JOIN 
  dbo.demoSalesOrderHeader AS h 
    ON d.SalesOrderID = h.SalesOrderID 
WHERE 
  h.SalesOrderNumber = 'SO71797'; 
*/

--4 
/*
DROP TABLE [dbo].[demoProduct]
DROP TABLE dbo.demoSalesOrderDetail

SELECT * INTO [dbo].[demoProduct] from Production.Product
SELECT * INTO dbo.demoSalesOrderDetail FROM Sales.SalesOrderDetail
*/

--SELECT 
--  SalesOrderID, 
--  ProductID 
--FROM 
--  dbo.demoSalesOrderDetail 
--WHERE 
--  ProductID NOT IN (
--    SELECT ProductID 
--    FROM dbo.demoProduct 
--    WHERE ProductID IS NOT NULL
--  )

----5 
--DELETE FROM 
--  dbo.demoSalesOrderDetail 
--WHERE 
--  ProductID NOT IN (
--    SELECT ProductID 
--    FROM dbo.demoProduct 
--    WHERE ProductID IS NOT NULL
--  ) 

---------------------------------------------------------------------
-- Truncating 
---------------------------------------------------------------------
