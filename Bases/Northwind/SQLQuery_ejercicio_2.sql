USE Northwind;

-- 6 Obtener los empleados que tengan el valor null en la columna regi�n 

SELECT * FROM Employees
WHERE Employees.Region IS NULL;

-- 7 Encontrar todos los apellidos (Lastname) cuya primera letra sea T
SELECT * FROM Employees 
WHERE LastName LIKE 'T%';
-- Con la letra D
SELECT * FROM Employees 
WHERE LastName LIKE 'D%';

--  8 Encontrar todos los apellidos (Lastname) cuya primera letra sea D y contenga T

SELECT * FROM Employees 
WHERE LastName LIKE 'D%T%';

-- 9 Liste la informaci�n de los pedidos sin embarcar (ShippedDate)

SELECT * FROM [Orders] WHERE ORDERS.ShippedDate IS NULL;

-- 10 Liste todos los campos de la tabla Suppliers cuya columna region sea NULL

SELECT * FROM Suppliers
WHERE Region IS NULL;


