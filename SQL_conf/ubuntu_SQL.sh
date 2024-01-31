# Instalar Docker en Ubuntu (Necesario para ejecutar el servidor SQL MS)
sudo apt install docker-ce

# En una terminal en Ubuntu descargamos el contenedor de MS SQL:
sudo docker pull mcr.microsoft.com/mssql/server:2022-CU10-ubuntu-22.04

# Ya descargado lo configuramos con el siguiente comando: 
sudo docker run -e 'ACCEPT_EULA=Y' -e 'MSSQL_SA_PASSWORD=<Tu_contraseña>' -e 'MSSQL_PID=Developer' -h sql22ubu22041 --name sql22ubu22041 -p 2233:2233 -d mcr.microsoft.com/mssql/server:2022-CU10-ubuntu-22.04

#Vemos si existe el contenedor con el siguiente comando 
docker ps -a
#####