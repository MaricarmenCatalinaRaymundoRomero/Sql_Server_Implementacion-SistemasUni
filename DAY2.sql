--Comentario
Otro comentario
/*
Comentario
de 
varias
lineas
Sigo
en comentario
*/

/*
Negro : Definir objetos, se puede editar
Azul  : Son palabras reservados, nose pueden editar
Rosado: Son funciones del sistema 
Verde : Son objetos del sistemas 
Marron: Son procedimientos almacenados 
*/

/*
SQL:  COMMAND TYPES  
	TRANSACT SQL	puedo crear y manipular la informacion,
					bajo la sintaxis definida
	Divido en
	DDLL: CREATE -DROP -TRUNCATE -COMENT -README
	DML: INSET -MERCH
	DQL: SELECT
	DCL: GRANT -REVOKE
	TCL: COMMIT -ROLLBACK -SAVEPOINT

-- Mostrar el nombre del servidor al que me encuentro conectado
*/
select @@SERVERNAME as Miservidor

-- Mostrar el nombre del servidor al que me encuentro 
select @@version as MiVersion
-- 13.2016
-- 14.2017
-- 15.2019
-- 16.2022
--SELECT- Mostrar, selccionar, visualizar
--Mostrar la base de datos del sistema 
select name
from sys.databases

--CREAR BASE DE DATOS 
create database BDPoliclinico
--Usar basedatos
use BDPoliclinico
--mostrar el nombre de las tablas
select name 
from sys.tables

--Crear la tabla paciente con la siguiente columnas
--Apellido materno / varchar 40
--Apellido Paterno / varchar 40
--Nombre / varchar 30
--Dni /numero 8
--Fecha de nacimiento / fecha
--Genero / 0 masculino 1 femenino BIT
--Direccion /  text
--Whastaspp / numero 9
--Foto / image
--Intagram / texto 20
--Tipo de sangre / texto 3
--Peso / numero 3
--Talla / numero 3

create table Paciente
(--inicio de tabla
NomPac varchar(30),
ApaPac varchar(40),
AmaPac varchar(40),
DniPac int,
FecPac date,
GenPac bit,
DirPac  text,
WhaPac int,
FotPac image,
InsPac varchar(20),
TsaPac varchar(3),
TllPac int,
PsoPac int
)--fin de tabla

--Eliminar una tabla 
drop table Paciente

--Tablas
--Pacientes,Medicos,Citas, Receta, Historia Clinica


--Insertar datos a una Tabla
/*
CONSIDERACIONES:
(varchar)TEXTO: Con Comillas simple
(int)NUMEROS: Sin Comillas
(date)FECHAS: Con comillas y de acuerdo  al ANSI 1252 AAA
IMAGENES: Con comillas Simple

*/

--Mostrar desde la  tabla  Paciente todos los datos
select*
from Paciente


--Vamos a insertar datos a la Tabla Paciente

insert Paciente --Que tabla?
values ('Juan','Perez','Vasquez',12345678,'2005-03-09',0,'Av. Tupac Amaru Nro 2545',999865447,'C:\Users\Administrator\Desktop\img\chico1.jpg','http://.ins.com/j_p','B+',171,65)         --Que valores?

--Para saber cuantos caracteres tiene un texto:
select len('http://www.ins.com/j_p')as Size


--Primera restriccion Primary Key

create table Paciente2
(--inicio de tabla
CodPac int primary key,--20230001
NomPac varchar(30),
ApaPac varchar(40),
AmaPac varchar(40),
DniPac int,
FecPac date,
GenPac bit,
DirPac  text,
WhaPac int,
FotPac image,
InsPac varchar(20),
TsaPac varchar(3),
TllPac int,
PsoPac int
)--fin de tabla

--Mostrar el contenido de la tabla Paciente2
select*
from Paciente2


--Vamos a insertar datos a Paciente2
insert Paciente2 --Que tabla? (Lo primero que verifica el SQL es la cantidad de la columna si hay 14, debemos restar -1. Es igual a 13 columnas )
values (721548,'Juan','Perez','Vasquez',12345678,'2005-03-09',0,'Av. Tupac Amaru Nro 2545',999865447,'C:\Users\Administrator\Desktop\img\chico1.jpg','http://.ins.com/j_p','B+',171,65)         

--Mostrar la columna Paciente2
select*
from Paciente2

--Mostrar
select*
from Paciente2
--Nuevamente
insert Paciente2 --Que tabla? (Lo primero que verifica el SQL es la cantidad de la columna si hay 14, debemos restar -1. Es igual a 13 columnas )
values (721549,'Juan','Perez','Vasquez',12345678,'2005-03-09',0,'Av. Tupac Amaru Nro 2545',999865447,'C:\Users\Administrator\Desktop\img\chico1.jpg','http://.ins.com/j_p','B+',171,65)         
--Violation of PRIMARY KEY constraint 'PK__Paciente__842A9E4AC185AEA2'. Cannot insert duplicate key in object 'dbo.Paciente2'. The duplicate key value is (721548).
--Mostrar
select*
from Paciente2



--Vamos a realizar que el dni sea UNICO(unique)



--A partir de la  Tabla Paciente2 crear Paciente3 donde el DNI sea un valor unico
create table Paciente3
(--inicio de tabla
CodPac int primary key,--20230001
NomPac varchar(30),
ApaPac varchar(40),
AmaPac varchar(40),
DniPac int unique,
FecPac date,
GenPac bit,
DirPac  text,
WhaPac int,
FotPac image,
InsPac varchar(20),
TsaPac varchar(3),
TllPac int,
PsoPac int
)--fin de tabla

--Mostrar 
select*
from Paciente3

--Insertar datos
insert Paciente3 --Que tabla?
values (721549,'Juan','Perez','Vasquez',12345678,'2005-03-09',0,'Av. Tupac Amaru Nro 2545',999865447,'C:\Users\Administrator\Desktop\img\chico1.jpg','http://.ins.com/j_p','B+',171,65) 

--Mostrar 
select*
from Paciente3
--Nuevament
insert Paciente3 --Que tabla?
values (7215549,'Juan','Perez','Vasquez',123456678,'2005-03-09',0,'Av. Tupac Amaru Nro 2545',999865447,'C:\Users\Administrator\Desktop\img\chico1.jpg','http://.ins.com/j_p','B+',171,65) 
-- Violation of PRIMARY KEY constraint 'PK__Paciente__842A9E4A4590A9E7'. Cannot insert duplicate key in object 'dbo.Paciente3'. The duplicate key value is (721549).No puede duplicar primary key
--Violation of UNIQUE KEY constraint 'UQ__Paciente__451F59BF72DD433B'. Cannot insert duplicate key in object 'dbo.Paciente3'. The duplicate key value is (12345678).No puede suplicar unique

--UNIQUE: Permite solo ingresar una sola vez un dato enb la columna, es decir NO SE REPITE
--Hay que tener cuidado al momento de poner unique


/*A partir de la tabla Paciente3 crear Paciente4 donde la fecha de nacimiento sea menor o igual que el dia de hoy y este valor
sea verificado antes de ingresar*/
create table Paciente4
(--inicio de tabla
CodPac int primary key,--20230001
NomPac varchar(30),
ApaPac varchar(40),
AmaPac varchar(40),
DniPac int unique,
FecPac date check(FecPac<=getdate()),--La fecha de nacimiento debe ser <= a la fecha actual
GenPac bit,
DirPac  text,
WhaPac int,
FotPac image,
InsPac varchar(20),
TsaPac varchar(3),
TllPac int,
PsoPac int
)--fin de tabla

--Comando para extraer y/o capturar la fecha instantanea
select getdate()asFechaHoy

--2023-07-01 10:26:44.577
--Insertar datos a la tabla Paciente4
insert Paciente4 --Que tabla? (Cuando es fecha de hoy o ayer va ingresar)
values (721549,'Juan','Perez','Vasquez',12345678,'2023-07-01',0,'Av. Tupac Amaru Nro 2545',999865447,'C:\Users\Administrator\Desktop\img\chico1.jpg','http://.ins.com/j_p','B+',171,65) 
--The INSERT statement conflicted with the CHECK constraint "CK__Paciente4__FecPa__4222D4EF". The conflict occurred in database "BDPoliclinico", table "dbo.Paciente4", column 'FecPac'.
--Mostrar la tabla Paciente4
select*
from Paciente4

--CHECK:Permite verificar  condiciones como >,<,=, and, or, not...

/*A partir de la tabla Paciente4 crear Paciente5 donde el tipo de sangre sea verificado en el ingreso de una 
sea verificado antes de ingresar*/
create table Paciente5
(--inicio de tabla
CodPac int primary key,--20230001
NomPac varchar(30),
ApaPac varchar(40),
AmaPac varchar(40),
DniPac int unique,
FecPac date check(FecPac<=getdate()),--La fecha de nacimiento debe ser <= a la fecha actual
GenPac bit,
DirPac  text,
WhaPac int,
FotPac image,
InsPac varchar(20),
TsaPac varchar(3) check(TsaPac in('A+','A-','B+','B-','AB+','AB-','O+','O-')),--Solo ingresar esos tipos de datos
TllPac int,
PsoPac int
)--fin de tabla

--Mostrar
select*
from Paciente5

--Insertar
insert Paciente5 --Que tabla?El tipo de sangreno esta en la lista y sale error
values (721549,'Juan','Perez','Vasquez',12345678,'2023-07-01',0,'Av. Tupac Amaru Nro 2545',999865447,'C:\Users\Administrator\Desktop\img\chico1.jpg','http://.ins.com/j_p','H2O',171,65) 

insert Paciente5 --Que tabla?El tipo de sangre si esta en la lista
values (721550,'Juan','Perez','Vasquez',12345638,'2023-06-30',0,'Av. Tupac Amaru Nro 2545',999865447,'C:\Users\Administrator\Desktop\img\chico1.jpg','http://.ins.com/j_p','B+',171,65) 



/*A partir de la tabla Paciente5 crear Paciente6 donde el DNI solo debe ser aceptado con 7 u 8 numeros*/
create table Paciente6
(--inicio de tabla
CodPac int primary key,--20230001
NomPac varchar(30),
ApaPac varchar(40),
AmaPac varchar(40),
DniPac int unique check(DniPac>= 1000000 and DniPac<=99999999),--Puede tener un unique y un check / Tendra un limite
FecPac date check(FecPac<=getdate()),--La fecha de nacimiento debe ser <= a la fecha actual
GenPac bit,
DirPac  text,
WhaPac int,
FotPac image,
InsPac varchar(20),
TsaPac varchar(3) check(TsaPac in('A+','A-','B+','B-','AB+','AB-','O+','O-')),--Solo ingresar esos tipos de datos
TllPac int,
PsoPac int
)--fin de tabla

--Mostrar
select*
from Paciente6

--Insertar 
insert Paciente6 --Que tabla? Donde el DNI tiene maximode 7 u 8 caracteres
values (721550,'Juan','Perez','Vasquez',12345638,'2023-06-30',0,'Av. Tupac Amaru Nro 2545',999865447,'C:\Users\Administrator\Desktop\img\chico1.jpg','http://.ins.com/j_p','B+',171,65) 


/*A partir de la tabla Paciente6 crear Paciente7 donde la talla sea un numero positivo yse encuentre  el rango de 10cm hasta 250cm*/
create table Paciente7
(--inicio de tabla
CodPac int primary key,--20230001
NomPac varchar(30),
ApaPac varchar(40),
AmaPac varchar(40),
DniPac int unique check(DniPac>= 1000000 and DniPac<=99999999),--Puede tener un unique y un check / Tendra un limite
FecPac date check(FecPac<=getdate()),--La fecha de nacimiento debe ser <= a la fecha actual
GenPac bit,
DirPac  text,
WhaPac int,
FotPac image,
InsPac varchar(20),
TsaPac varchar(3) check(TsaPac in('A+','A-','B+','B-','AB+','AB-','O+','O-')),--Solo ingresar esos tipos de datos
TllPac int check(TllPac>=0 and (TllPac>=10 and TllPac<=250)),--Tiene el limite de las tallas de 10 a 250
PsoPac int
)--fin de tabla

--Mostrar 
select*
from Paciente7

--Insertar 
insert Paciente7 --Que tabla? No acepta numero negativos, solo numeros positivos
values (721550,'Juan','Perez','Vasquez',12345638,'2023-06-30',0,'Av. Tupac Amaru Nro 2545',999865447,'C:\Users\Administrator\Desktop\img\chico1.jpg','http://.ins.com/j_p','B+',171,65) 


/*A partir de la tabla Paciente7 crear Paciente8 con los siguientes requerimientos 
Si no ingresa la foto por defecto debe ingresar un grafico sin foto
El wasap de tener 9 digitos  y debe iniciar en 9 */
create table Paciente8
(--inicio de tabla
CodPac int primary key,--20230001
NomPac varchar(30),
ApaPac varchar(40),
AmaPac varchar(40),
DniPac int unique check(DniPac>= 1000000 and DniPac<=99999999),--Puede tener un unique y un check / Tendra un limite
FecPac date check(FecPac<=getdate()),--La fecha de nacimiento debe ser <= a la fecha actual
GenPac bit,
DirPac  text,
WhaPac int check(WhaPac>=900000000 and WhaPac<=999999999),
FotPac image default'C:\Users\Administrator\Desktop\img\SinFoto.jpg',
InsPac varchar(20),
TsaPac varchar(3) check(TsaPac in('A+','A-','B+','B-','AB+','AB-','O+','O-')),--Solo ingresar esos tipos de datos
TllPac int check(TllPac>=0 and (TllPac>=10 and TllPac<=250)),--Tiene el limite de las tallas de 10 a 250
PsoPac int
)--fin de tabla

--Mostrar
select*
from Paciente8
--Insertar 
insert Paciente7 --Que tabla? No acepta numero negativos, solo numeros positivos
values (721552,'Juan','Perez','Vasquez',12345699,'2023-06-30',0,'Av. Tupac Amaru Nro 2545',999865447,default,'http://.ins.com/j_p','B+',171,65) 



/*A partir de la tabla Paciente8 crear PacienteFinal con los siguientes requerimientos 
No debemos ingresar el codigo, este debe ser secuencial de 1 en 1 a partir  del 202300001
*/
create table PacienteFinal
(--inicio de tabla
CodPac int primary key identity (20230001,1),--20230001 Numero inicial=20230001/contador=1
NomPac varchar(30),
ApaPac varchar(40),
AmaPac varchar(40),
DniPac int unique check(DniPac>= 1000000 and DniPac<=99999999),--Puede tener un unique y un check / Tendra un limite
FecPac date check(FecPac<=getdate()),--La fecha de nacimiento debe ser <= a la fecha actual
GenPac bit,
DirPac  text,
WhaPac int check(WhaPac>=900000000 and WhaPac<=999999999),
FotPac image default'C:\Users\Administrator\Desktop\img\SinFoto.jpg',
InsPac varchar(20),
TsaPac varchar(3) check(TsaPac in('A+','A-','B+','B-','AB+','AB-','O+','O-')),--Solo ingresar esos tipos de datos
TllPac int check(TllPac>=0 and (TllPac>=10 and TllPac<=250)),--Tiene el limite de las tallas de 10 a 250
PsoPac int
)--fin de tabla

--Mostrar
select*
from PacienteFinal

----OJITO:Para insertar
insert PacienteFinal(NomPac,DniPac,FecPac,GenPac,WhaPac,TllPac,PsoPac)
values('Maricarmen','72105885','2004-12-15',1,986355054,160,60)

insert PacienteFinal(NomPac,DniPac,FecPac,GenPac,WhaPac,TllPac,PsoPac)
values('Rosa','72105890','2010-12-16',1,986355060,150,50),('Jorge','72105880','2009-12-10',0,986357054,180,80)

insert PacienteFinal(NomPac,DniPac,FecPac,GenPac,WhaPac,TllPac,PsoPac)
values('Jorge','72105880','2009-12-10',0,986357054,180,80)

--Mostrar
select*
from PacienteFinal



--TIPS:

create table T1
(
C1 int,--(1,2,3..) check 
C2 int default 100,
C3 as case c1
   when 1 then C2+100
   when 2 then C2-100
   when 3 then C2*5
   end,
C4 as IIF(C1>1,'Aprovado','Desaprovado'),
C5 as IIF(C1>2,C2*100,C2+1)
)

--Mostrar
select*
from T1

--Insertar
insert T1(C1,C2)
values(2,1000),(1,10),(3,5)

--Mostrar
select*
from T1

--Insert solo c1

insert T1(c1)
values(4),(5),(6)


--Mostrar las caracteristicas y/o restricciones que tiene una tabla

sp_help'PacienteFinal'