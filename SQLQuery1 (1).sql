--como ejecutar:  f5 y execute
----Comentario
/*
Comentario 
de varias 
lineas
sigo comenatario */

/*
Negro:Para definir los objetos(Si se pueden editar)
Azul:Son palabras reservadas(No se pueden editar)
Rosado:Son funciones del sistema
Verde:Son objetos del sistema
Marron:Son procedimientos almacenados
*/
/*

SQL:
CLASIFICACION:

DDL.- CREATE - DROP -  ALTER -  TRUNCATE - COMMENT - RENAME
DCL.-GRANT-REVOKE
DML.-INSERT-UPDATE-DELETE-LOCK-MERGE
DQL.- SELECT(Mostrar)
TCL.-COMMIT-ROLLBACK-SAVEPOINT-SET TRANSACTION

TRANSACT SQL:
Es un lenguaje que permite la ejecucion de cualquier tarea que se quiera efectuar sobre la base de datos
para crear  y manipular la informacion.

*/


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