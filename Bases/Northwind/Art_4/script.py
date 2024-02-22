#!/usr/bin/env python
# coding: utf-8
import os
import pandas as pd
import sys
sys.path.append(r'C:\Funciones')
import subprocess
# Aquí pondremos la funciones SQL MS PostgreSQL y demás conexiones 
from SQL_conexions import sql_conexion

# Ejecutar la query
conexion = sql_conexion(server='192.168.1.91', database='Northwind', username='sa', ruta_paswd=r'C:\\Credencials')  

query = """SELECT Employees.EmployeeID,
	CONCAT(Employees.FirstName, ' ', Employees.LastName) AS NOMBRE_EMPLEADO,
	YEAR(Orders.OrderDate) AS AÑO,
	COUNT(Orders.OrderID) AS N_ORDENES,
	SUM([Order Details].UnitPrice * [Order Details].Quantity) AS IMPORTE_TOTAL
FROM Employees
	INNER JOIN Orders ON Employees.EmployeeID = Orders.EmployeeID
    INNER JOIN [Order Details] ON Orders.OrderID = [Order Details].OrderID
GROUP BY Employees.EmployeeID, Employees.FirstName, Employees.LastName, YEAR(Orders.OrderDate)"""
df = pd.read_sql(query,conexion)
# Cerramos la conexión
conexion.close()

print(df)