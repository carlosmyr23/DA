USE Northwind;

-- 16.-Muestre los empreados que hayan colocado más de 15 pedidos.
SELECT Orders.EmployeeID,
	   Employees.FirstName + ' ' + Employees.LastName  AS EMPLEADO, 
	   COUNT(Orders.OrderID) AS PEDIDOS 
FROM Employees 
INNER JOIN Orders ON Employees.EmployeeID = Orders.EmployeeID
GROUP BY Orders.EmployeeID, Employees.FirstName, Employees.LastName
HAVING COUNT(Employees.EmployeeID) > 15
ORDER BY PEDIDOS ASC
;

-- 17 Clientes que hayan solicitado más de 20 pedidos

SELECT Customers.CustomerID, Customers.ContactName,
	   COUNT(Orders.OrderID) AS PEDIDOS	   
FROM Orders
INNER JOIN Customers ON Customers.CustomerID = Orders.CustomerID
GROUP BY Customers.CustomerID, Customers.ContactName
HAVING COUNT(Orders.OrderID) > 20
ORDER BY COUNT(Orders.OrderID) ASC;

-- 18 Muestre los empleados que más hayan colocado pedidos para los países Germany, Brazil

SELECT Orders.EmployeeID,
       Orders.ShipCountry,
       CONCAT(Employees.FirstName, ' ', Employees.LastName) AS NOMBRE_EMPLEADO,
       COUNT(OrderID) AS N_PEDIDOS
FROM Orders
INNER JOIN Employees ON Orders.EmployeeID = Employees.EmployeeID
WHERE Orders.ShipCountry IN ('Germany', 'Brazil')
GROUP BY Orders.EmployeeID, Orders.ShipCountry, Employees.FirstName, Employees.LastName
ORDER BY Orders.ShipCountry;

-- 19 Obtener un reporte en donde se muestre la cantidad de ordenes por cada vendedor 

SELECT Orders.EmployeeID, COUNT(OrderID) AS N_ORDENES
FROM Orders
INNER JOIN Employees ON Orders.EmployeeID = Employees.EmployeeID
GROUP BY Orders.EmployeeID;

-- 20. Obtener un reporte por vendedor que muestre el número de órdenes y el 
-- importe vendido para cada año de operaciones

SELECT Employees.EmployeeID,
	CONCAT(Employees.FirstName, ' ', Employees.LastName) AS NOMBRE_EMPLEADO,
	YEAR(Orders.OrderDate) AS AÑO,
	COUNT(Orders.OrderID) AS N_ORDENES,
	SUM([Order Details].UnitPrice * [Order Details].Quantity) AS IMPORTE_TOTAL
FROM Employees
	INNER JOIN Orders ON Employees.EmployeeID = Orders.EmployeeID
    INNER JOIN [Order Details] ON Orders.OrderID = [Order Details].OrderID
GROUP BY Employees.EmployeeID, Employees.FirstName, Employees.LastName, YEAR(Orders.OrderDate);
