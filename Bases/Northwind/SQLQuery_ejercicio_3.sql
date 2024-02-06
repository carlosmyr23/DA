USE Northwind;

-- 11 Obtener los empleados alfabéticamente por Firstname y Lastname

SELECT * FROM Employees 
	ORDER BY FirstName, LastName;

-- 12 Obtener los empleados cuando la columna title tenga el valor de Sales
-- Representatives y el campo city tenga los valores de Seattle o Redmond

SELECT * FROM Employees
WHERE Title = 'Sales Representative' 
AND City = 'Seattle' OR City = 'Redmond';

-- 13 Obtener las columnas company name contact title, city y country de los clientes 
-- que están en la Ciudad de México o alguna ciudad de España excepto madrid

SELECT CompanyName, ContactName, City, Country 
	FROM Customers 
	WHERE (Country LIKE '%Mexico' OR Country LIKE '%Spain')
	AND City NOT LIKE '%Madrid';

--- 14 Obtener la lista de órdenes y mostrar una columna en donde se calcule el
--- impuesto del 16% cuando el valor de la columna Freight >= 100

SELECT ORDERID, 
       FREIGHT, 
       CASE 
           WHEN FREIGHT >= 100 THEN FREIGHT * 1.16 
           ELSE FREIGHT 
       END AS TOTAL_CON_IVA    
FROM ORDERS;

--- 15 Obtener el número de empleados para cada ciudad

SELECT City, 
Count(EmployeeID) AS NUM_EMPLEADOS
FROM Employees
GROUP BY City;
