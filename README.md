# Sql_Server_Implementacion-SistemasUni

###### NOTAS:
- No utilizar tildes, espacios o largos escrituras
- Cada base de datos  tiene una estructura
- Todo objeto debe utilizar con mayuscula y despues minuscula
- Son las primeras tres letras o referencias




### Modos de ver la instalacion de sql
- Por comandos cmd/ sqlcmd
- Windows/ SSMS


### Tipos de servidores de base de datos

- Database Engine
- Analysis Services
- Reporting Services
- Integration Services

### Como saber que estoy conectado a otro servidor?

- cmd/HOSTNAME

### Object Explorer:
Databases: Guarda nuestra carpetas
  -System Databases: 
  
- Master: 
Es la primera que se crea aun base de datos.
Ahi esta configuracion.
Registra todas las cuentas de inicio de sesion. 
Siempre debes mantener una copia de seguridad.

- TEMPDB:
Registra tablas y procedimientos al macenados temporales./ 
Crece automatica, segun vaya siendo necesario.

- MODEL: 
Es una plantilla.
Si elimino el model se elimina las bases de datos.

- MSDB: 
Contiene la tablas para la planificacion de trabajos. 
Si se elimina no podre realizar mis tareas.

## COMANDOS
Puedes crear bases de datos de diferentes herramientas. Aqui les dejo algunos ejercicios y con su respetivo herramienta.

EJERCICIOS:

1) COMANDO: NEW QUERY

```bash
----Comentario

/*
Comentario 
de varias 
lineas
sigo comentario */


Ya no estoy en comentario

--Mostrar el nombre del servidor al que me encuentro conectado- as(es una orden o como?)
select @@SERVERNAME as MiServidor
--RESULTADO: B205-02

--Mostrar la version del sql al que me encuentro
select @@version as MiVersion
--RESULTADO: Microsoft SQL Server 2016 (SP1) (KB3182545) - 13.0.4001.0 (X64)   Oct 28 2016 18:17:30   Copyright (c) Microsoft Corporation  Developer Edition (64-bit) on Windows Server 2019 Datacenter 6.3 <X64> (Build 17763: ) 
--11=2012
--12=2014
--13=2016
--14=2017
--15=2019
--16=2022

--SELECT -> Mostrar, Seleccionar, Visualizar
--Mostrar el nombre  las bases de datos desde el sistema
select name
from sys.databases

```
2) COMANDO CMD
   
```
C:\Users\Administrator>sqlcmd

1> select name
2> from sys.databases
3> go
name                                                                                                                    
--------------------------------------------------------------------------------------------------------------------------------
master                                                                                                                  
tempdb                                                                                                                  
model                                                                                                                   
msdb                                                                                                                    

(4 rows affected)
1> select @@version as MIVersion
2> go
MIVersion                                                                                                                                                                                                                               
----------------------------------------------------------------------------------------------------------------------------------
Microsoft SQL Server 2016 (SP1) (KB3182545) - 13.0.4001.0 (X64)
        Oct 28 2016 18:17:30
        Copyright (c) Microsoft Corporation
        Developer Edition (64-bit) on Windows Server 2019 Datacenter 6.3 <X64> (Build 17763: )

(1 rows affected)
```



3) AZURE

```bash
Requerimientos:(CREAR)
  -Nombredel servidor: B205-01
  -Usuario: sa, administrador
  -PASS:--------------
  -BD:master
```


## RUTAS

C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA

- Cuando se crea una base de datos se crea dos archivos  (log y MDF)
   * MDF(Archivo de datos principal)= Es el archivo principal y contiene toda la informacion de las bases de datos. Ahi se encuentra las tablas
   * NDF(Archivo de datos secundarios)
   * LDF(Archivo de datos transacciones)= Ahi se encuentra toda las transacciones. Todo esta en modo comando. Puedes recuperar el archivo. Primer comando es CREATE DATABASE.

## CREAR TABLAS
   - Es una estructura que esta compuesto por columnas, filas y encabezados.
   - Toda tabla debe tener un primary key(PK).
   - Se le pone a la primera columna. 
   - Debe tener un tipo de dato.


## TIPOS DE DATOS:
```
1)NUMERICOS.-
 INT
 MONEY

2)FECHA.-
 DATE
 DATETIME

3)ESTRUCTURA.-
 XML

4)TEXTO.-
 VARCHAR
 TEXT

5)GRAFICO.-
 IMAGE
 QR

6)GEODSICO.-
 GEOGRAPHIC

```

## ENTRAR BASE DE DATOS DESDE CMD(USE)

```
1> select name
2> from sys.databases
3> go
name                                                                                                                    
--------------------------------------------------------------------------------------------------------------------------------
master                                                                                                                  
tempdb                                                                                                                  
model                                                                                                                   
msdb                                                                                                                    
BDContabilidad                                                                                                          
BDMary                                                                                                                  
BDPoliclinico                                                                                                           
BDColegio                                                                                                               

(8 rows affected)
1> use BDPoliclinico
2> go
Changed database context to 'BDPoliclinico'.
```

## EJERCICIO CREAR UN BASE DE DATOS Y AGREGA UNA TABLA
```
--CREAR UNA BASE DE DATOS
create database BDPoliclinico
--Usar la base de datos
Use BDPoliclinico

--Mostrar el nombre de las tablas
select name 
from sys.tables

--TABLAS
--Paciente, Medicos, Citas, Receta, HistoriaClinica,...

--Crear la tabla paciente con la siguientes columnas:
--Nombre (texto= limite 30)
--Apellido paterno(texto = limite 40)
--Apellido Materno(texto = limite 40)
--Dni(numero = limite 8)
--Fecha nacimiento(fecha)
--Genero(0 Masculinno 1 Femenino//BIT)
--Direccion(texto = limite 50)
--Whatsapp(numero = limite 9)
--Foto(imagen)
--Instagram(texto = linite 20)
--Tipo de Sangre( texto = limite 3)
--Talla (numero o cm)
--Peso (numero = limite 3)


create table Paciente
(--inicio de tabla
NomPac varchar(30),
ApaPac varchar(40),
AmaPac varchar(40),
DniPac int,
FecPac date,
GenPac bit,
DirPac text,
WhatPac int,
FotPac image,
InsPac varchar(20),
TsaPac varchar(3),
TllPac int,
PsoPac int,
)--fin de tabla


--Eliminar una tabla

drop table Paciente
```
