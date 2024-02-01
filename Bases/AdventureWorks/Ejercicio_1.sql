USE AdventureWorks2022;

---- 1 Seleccionar datos simples: Selecciona todos los registros de la tabla Sales.Customer.
SELECT * FROM SALES.Customer;

--- 2 Selecciona todos los productos de la tabla Production.Product donde el precio de lista sea superior a $500.

SELECT *
	FROM Production.Product
	WHERE Production.Product.ListPrice > 500;

--- 3 Selecciona los productos de la tabla Production.Product ordenados por nombre en orden alfab�tico.


SELECT * FROM Production.Product
	ORDER BY Production.Product.Name;

--- 4 Selecciona los nombres de los productos de la tabla Production.Product junto con sus categor�as de la tabla Production.ProductCategory.

SELECT  Production.Product.ProductID,
		Production.Product.Name		
FROM Production.Product
INNER JOIN  
		Production.ProductCategory
ON Production.Product.ProductID = Production.ProductCategory.ProductCategoryID; 

---- 5 Obten la cantidad total de productos vendidos y el monto total de ventas para cada producto de la tabla Sales.SalesOrderDetail
SELECT ProductID, SUM(OrderQty) AS TotalQuantitySold, SUM(LineTotal) AS TotalSalesAmount
FROM Sales.SalesOrderDetail
GROUP BY ProductID;