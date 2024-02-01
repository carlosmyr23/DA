-- Ejercicio 1 

USE Northwind;

-- 1 Obtener todas las columnas de la tabla region 

SELECT * FROM Region;

-- 2 Obtener las columnas Firstname y Lastname de la tabla Employees. 

SELECT Employees.FirstName,Employees.LastName FROM Employees;

-- 3 Obtener las columnas Firstname y Lastname de la tabla Employees. Ordenados por la columna Last name

SELECT Employees.FirstName,Employees.LastName FROM Employees
ORDER BY LastName;

-- 4 Generar una lista de selecci�n de la tabla employees, donde obtenga las siguientes columnas
-- EmployeeID
-- LastName y FirstName (Concatenadas)
-- Country, Region y city (Concatenada)

SELECT Employees.EmployeeID, Employees.LastName + ' ' + Employees.FirstName AS Full_name, Employees.Country + ' ' +  Employees.Region + ' '  + Employees.City AS Country_city FROM Employees;

--- 5 Obtener las filas  de la tabla orders  ordenadas por la columna freight de mayor a menor;
--- Las columnas que presentar� son OrderID, OrderDate, ShippedDate, CustomerID Freight

SELECT Orders.OrderID, Orders.OrderDate, ORDERS.OrderDate, Orders.ShippedDate, Orders.CustomerID, Orders.Freight FROM Orders
ORDER BY Orders.Freight DESC
;


