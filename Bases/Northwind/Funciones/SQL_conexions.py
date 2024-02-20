#!/usr/bin/env python
# coding: utf-8

#!/usr/bin/env python
# coding: utf-8

import pyodbc
import pandas as pd

def sql_conexion(server, database, username, ruta_paswd):    
    try:
        # Lee la contraseña desde el archivo de claves
        password = str(pd.read_csv(fr'{ruta_paswd}\keyword.key', header=None)[0].dropna().to_list()[0])
        # Cadena de conexión
        conn_str = f'DRIVER={{SQL Server}};SERVER={server};DATABASE={database};UID={username};PWD={password}'
        # Intenta establecer la conexión
        conexion = pyodbc.connect(conn_str)
        print('Conexión exitosa')
        return conexion
    except pyodbc.Error as ex:
        sqlstate = ex.args[0]
        print(f'Error de conexión con SQL Server: {sqlstate}')
    except FileNotFoundError:
        print('Error: No se encontró el archivo de contraseña')
    except Exception as e:
        print('Error inesperado:', e)

