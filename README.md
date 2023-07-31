# Sql_Server_Implementacion-SistemasUni

###### NOTAS:
- No utilizar tildes, espacios o largos escrituras
- Cada base de datos  tiene una estructura
- Todo objeto debe utilizar con mayuscula y despues minuscula
- Son las primeras tres letras o referencias



# DAY 01
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

# DAY 02

- Mostrar= select
- Desde=  from
- Todos= *

## PRIMARY KEY
- No se puede repetir el dato a pesar que guardes varias veces.
- DNI debe ser unico, no debe repetirse.

```
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
```

- Vamos a insertar datos a Paciente2
```  
insert Paciente2 --Que tabla? (Lo primero que verifica el SQL es la cantidad de la columna si hay 14, debemos restar -1. Es igual a 13 columnas )
values (721548,'Juan','Perez','Vasquez',12345678,'2005-03-09',0,'Av. Tupac Amaru Nro 2545',999865447,'C:\Users\Administrator\Desktop\img\chico1.jpg','http://.ins.com/j_p','B+',171,65)        

--Mostrar la columna Paciente2
select*
from Paciente2
---------------------------------------------------------------------------
```


- A partir de la  Tabla Paciente2 crear Paciente3 donde el DNI sea un valor unico
```
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
```
- UNIQUE: Permite solo ingresar una sola vez un dato enb la columna, es decir NO SE REPITE
- Hay que tener cuidado al momento de poner unique


- A partir de la tabla Paciente3 crear Paciente4 donde la fecha de nacimiento sea menor o igual que el dia de hoy y este valor
sea verificado antes de ingresar
```
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
```
- CHECK:Permite verificar  condiciones como >,<,=, and, or, not...



- A partir de la tabla Paciente4 crear Paciente5 donde el tipo de sangre sea verificado en el ingreso de una
sea verificado antes de ingresar
```
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
```


- A partir de la tabla Paciente5 crear Paciente6 donde el DNI solo debe ser aceptado con 7 u 8 numeros
```
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
```

# DAY 03

- REPORTE
- Consulta I
- Consulta Generales o globales:

1.Crear un reporte donde se muestre que categorias de productos realiza la empresa Megagis
```
select*--- (* = todas las columnas)
from Categorias-- Desde la tabla categoria
```

2.Mostrar un reporte que muestre todos los productos que la empresa Mega vende
```
select*
from Productos
```

3.Mostrar un reporte de las ventas que produce la empresa Mega
```
select*
from Venta
```

4.Cuantos clientes tiene la empresa mega?
```
select count(*)---count(*)=sintaxis de cuantos clientes hay en la empresa
from Clientes
```

5. Mostrar los productos en orden de precio unitario
```
select*
from Productos
order  by 6 --(Aqui mandamos que la columna 6 pueda tener sus atributos en orden de menor a mayor)

--ORDER BY:realiza un ordenamiento por defecto en forma ascendente de la columna "elegida"
```

6.Crear un reporte de los clientes que ordene por la ciudad	DESCendentemente
```
select*
from Clientes
order by City desc
```
### CONSULTAS PARCIALES

7.Mostrar un reporte de los 5 productos mas "caros" o de precio mayor
```
select top 5* --top= muestra la cantidad que quieres mostrar
from Productos
order by 6 desc 
```

8.Mostrar un reporte de los 5 productos  "menos" 
```
select top 5* --top= muestra la cantidad que quieres mostrar
from Productos
order by 6  --Quitamos "desc" para que no se descendese
```

9. Crear un reporte de los productos donde elo precio unitario sea menor que 100
```
select*
from Productos
where UnitPrice <500--Condiciones
order by 6 --Para que ordene de menor a mayor
```
10. Crear un reporte de los productos donde el precio unitario sea mayor que 500
```
select*
from Productos
where UnitPrice >500--Condiciones
order by 6

select*
from Productos
where not UnitPrice >500--Not=Niega la consulta
order by 6

--WHERE: Permite generar condicionamientos bajo algun requerimiento que pude ser:
-->,<,=, and, or,not,like, in...
```

11.Mostrar los productos en los siguientes rangos de precio:
- de 100 a 200
- de 500 a 1000
- mayor que 3000
```
select*
from Productos
where UnitPrice>100 and UnitPrice<200
order by 6

select*
from Productos
where UnitPrice>500 and UnitPrice<1000
order by 6

select*
from Productos
where UnitPrice>3000
order by 6
                 
---Solo en uno 
select*
from Productos
where (UnitPrice>100 and UnitPrice<200)or(UnitPrice>500 and UnitPrice<1000)or(UnitPrice>3000)
order by 6
```
12.Mostrar los productos cuyo nombre inicien con la letra c
```
select*
from Productos
where ProductName like 'c%' -- like'c%'=Muestra los productos que comience con C

```

13.Crear un reporte de losproductos cuyo nombre sea  la antepenultima letra sea "r"

```
select*
from Productos
where ProductName like '%r__'
```

14.Ayuda tener la consulta solo con el nombre roja

```
select*
from Productos
where ProductName like '%roja'
```

15.Mostrar todos los productos cuyo nombre sea mayor que g
```
select*
from Productos
where ProductName>'g'
order by 2
```

16.Mostrar los productos cuya categoria se 2,4 y 7                

```
select*
from Productos
where CodCat=2

select*
from Productos
where CodCat=4

select*
from Productos
where CodCat=7

select*
from Productos
where CodCat in (2,4,7)--El parentesis depende si es varchar o int
order by 4
```

17.Mostrar y exportar a un reporte los productos con las siguientes caracterisitcas:
- Precio mayor que 800
- Stock menor que 10
- y en su contenido de nombre tenga la letra "a"
```
select*
from Productos
where UnitPrice>800 and UnitsInStock<10 and ProductName like '%a%'

select*
from Productos
where UnitPrice>800 or UnitsInStock<10 or ProductName like '%a%'
```
18.Cuantos años de datos en venta tiene?
```
select distinct
year(OrderDate)
from Venta


select year(OrderDate)---Solo extrae el año
from Venta

select month(OrderDate)--Solo extrae los meses
from Venta

```
19.Mostrar el numero de dia del año que nos encontramos
```
select dayofyear('2023-07-08') as FechaHoy

select*
from Venta
where OrderDate=2013-07-08

select 2013-07-08 --cuando no pones comillas, no define una fecha esto

select*
from Venta
where OrderDate='2013'

select DATEPART(weekday,getdate())as DiaSemana--DATEPART=Para detraer una parte/te va extraer numeros
select DATENAME(weekday,getdate())as DiaSemana--DATENAME=Te va extraer letra


--Cantidad de caracteres de una frase

select len('Por una mirada un mundo, por una sonrisa un cielo por un beso yo no se que te diera.GUSTAVO')---Cuenta la cantidad

select ASCII('ñ')--
select CHAR(241)--
```

### HERRAMIENTA INSCRIPTACION SHA256/100L5
- PK?
- FK?

- DOS O MAS TABLAS

1.Mostrar un reporte con los siguientes datos:Nombre del Producto, precio y nombre de la categoria a la pertenece
```
--Que tablas son?
Categorias, Productos
--Estan relacionadas?
si / son solo dos relaciones, no mas de tres
--Cuales son las columnas en comun?
CodCat
--Unir y Habilitar la columnnas en comun?
select ProductName,UnitPrice,CategoryName
from Categorias
join Productos--Ya unimos
on Categorias.CodCat=Productos.CodCat--on=seleccionar la categoria
--Que condicion?
--Que orden y/o agrupamiento
--Que columnas 

--Nuevamente otro orden
select ProductName,UnitPrice,CategoryName
from Productos
join Categorias--Ya unimos
on Categorias.CodCat=Productos.CodCat

--Nuevamente otro orden 2--INCORRECTO
select *
from Productos
join Categorias--Ya unimos
on Categorias.CodCat=Productos.CodCat

```
- MOSTRAR UN REPORTE DE LA VENTA U ORDEN NRO 12666 LOS SIGUIENTES DATOS:
      * Fecha  
      * El nombre y apellido del Empleado 
      * Nombre de la empresa Cliente
```
--Que tablas son?
Empleado, Ventas, Clientes
--Estan relacionadas?
si 
--Cuales son las columnas en comun?
CodEmp, CodCli
--Unir y Habilitar la columnnas en comun?
select OrderDate,FirstName,LastName,CompanyName--Finalmente Aqui las columnas
from Empleados
join Venta
on Empleados.CodEmp= Venta.CodEmp
join Clientes--Viene de CompanyName
on Venta.CodCli=Clientes.CodCli
--join CuartaTabla
--on Clientes.CC=CuartaTabla.CC
--join QuintaTabla
--on CuartaTabla.CCC=QuintaTabla.CCC

where CodOrd=10666 --Ventas

--Que condicion?
--Que orden y/o agrupamiento
--Que columnas 
```


CREAR UN REPORTE DEL AÑO 2013 CON LAS SIGUIENTES DATOS:
- El numero de la orden de venta, fecha, los productos y el nombre del proveedor de cada producto
- CantidadCC=CT-1
```
--Que tablas son?
Venta,VentasDetalle,Productos,Proveedor
--Estan relacionadas?
si 
--Cuales son las columnas en comun?
CodOrd,CodPro,CodPrv
--Unir y Habilitar la columnnas en comun?
select VentasDetalle.CodOrd as Codigo,OrderDate as Fechita,ProductName as Producto,CompanyName as Cliente--Finalmente Aqui las columnas
from Proveedores
join Productos
on Proveedores.CodPrv= Productos.CodPrv
join VentasDetalle--Viene de CompanyName
on Productos.CodPro=VentasDetalle.CodPro
join Venta
on VentasDetalle.CodOrd=Venta.CodOrd
where year(orderdate)=2013
```

# DAY 04

- Crearemos una base de datos y despues le vamos a relacionar. Lo vamos escribir igual que la imagen, si hay errores lo vamos utilizar unos metodos que es  el DML.
![image](https://github.com/MaricarmenCatalinaRaymundoRomero/Sql_Server_Implementacion-SistemasUni/assets/129924045/95fc4488-fc63-4203-9ac5-b20fd9efa8ea)

```
CREATE DATABASE BDPoliclinico
--Crear la tabla Especialidad

create table Especialidad
(--inicia la tabla
CodEsp int not null,--obligatorio
NomEsp varchar(30),
DesEsp varchar(50),
CodPro date--Para luego eliminar
--Aqui añadimos la columna Imagen de Especialidad
)--fin de la tabla

select*
from Especialidad

--Para el caso de la Tabla Medico

create table Medico
(--inicio de la tabla
CodMed  int primary key,
NomMed varchar(30),
ApaMed varchar(40),
AmaMed varchar(40),
WhaMed int,--Añadir la restriccion de Numeros 900000000 hasta 999999999
TsaPac varchar(3),--Eliminar esta columna
CodESP int--Para relacionar con la Tabla
--adicionar la columna Email del medico EmaMed
)--fin de la tabla



select*
from Medico

--LA TABLA DE PACIENTEFINAL

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


select*
from PacienteFinal


--DML--> OJITO, ESTOS PROCEDIMIENTOS SON MUY"PELIGROSO", Tener cuidado
--------------------------------------------------------------------------------------------
```

- SUGERENCIA:Antes de Eliminar columnas realice un Backup(Copia de Seguridad)
   * Que Objeto
	 * Que Accion

- Eliminar la columna CodPro de la Tabla Especialidad
```
alter table Especialidad--Que Objeto(Tabla)
drop column CodPro--Que Accion (Eliminar)  
```
- Eliminar la columna TsaPac de la Tabla Medico
```
alter table Medico--Que Objeto
drop column TsaPac--Que Accion
```

- PARA EL CASO DE ADICIONAR COLUMNAS
    * Que Objeto(Tabla)
    * Que Accion(Adicionar)


- Aqui añadimos la columna Imagen de Especialidad(CodIma)
```
alter table Especialidad--Que Objeto(Tabla)
add CodIma image--Que Accion(Adicionar)
```

- Adicionar la columna EmaMed de la tabla Medico
```
alter table Medico--Que Objeto(Tabla)
add EmaMed varchar(50)--Que Accion(Adicionar)
```


- PAR EL CASO DE LAS RESTRICCIONES
    * Añadir la restriccion de Numeros de Whatsapp de la tabla Medico
```
--VER LAS RESTRICCIONES
sp_help Medico

alter Table Medico--Que Objeto(Tabla)
add check(WhaMed>=900000000 and WhaMed<=999999999)--Que accion (Adicionar)
```

- PARA RELACIONAR DOS TABLAS
    * OJITO OJITO: Primero las dos tablas deben tener PK
    * Vamos a adicionar el PK a Especialidad a la columna CodEsp
```
alter table Especialidad --Que Objeto(Tabla)
add primary key(CodEsp)--Que Accion(Adicionar)
```

- Relacionado Medico con Especialidad
```
alter table Medico--Que Objeto(Tabla)ORIGEN
add foreign key(CodEsp) references Especialidad--Que Accion(Relacionar y/o Referenciar)DESTINO
```

### Finalmente
- Crear la tabla Cita Relacionado inmediatamente con Medico y Paciente
```
create table Cita
 (--inicio de tabla
 CodCit int primary key,
 FecCit date,
 CodMed int references Medico,
 CodPac int references PacienteFinal,
 TurCit varchar(15)
 )--fin de la tabla
```

## CONSULTAS 

### Modificar y/o Actualizar datos
  
```
select*
from Productos
```

- REQUERIMIENTOS
    * Que tabla
    * Que nuevo dato a asignar
    * Que condicion

- En la tabla Productos asignar un nuevo precio al producto de codigo 14 siendo 13.99 soles
```
update Productos--Que tabla
set UnitPrice = 13.99--Que nuevo dato a asignar(set= asignar, get =   )
where CodPro = 14--Que condicion
```

- Eliminar datos-->> con Transacction
```
select*
from Productos
```
- En la Tabla productos modificar asignado los siguiente nuevos datos al producto de codigo 7:
    * Nombre:Arroz Caserita Superior
    * Categoria: Abarrotes 7
    * Adicionar la stock 100 unidades
```
  update Productos--Que tabla
	set ProductName='Arroz Caserita Superior',CodCat=7,UnitsInStock=UnitsInStock+100--Que nuevo dato a asignar
	where CodPro= 7--Que condicion
```
```
 --Mostrar 
	select*
	from Productos
	WHERE CodCat=7

	--7	    Arroz Caserita Superior		2.79
	--14	Aceite Vegetal CAPRI Botella 1L		13.99
	--28	Aceite de Oliva Extra Virgen Botella 1L		14.99
	--51	Arroz Extra COSTEÑO Bolsa 5Kg	15.99
	--74	Arroz Superior PAISANA Bolsa 5.25Kg		16.25
	
```

- Por temporada de invierno se elevan los precios de los Abarrotes a un 30%
```
    update Productos--Que tabla
		set UnitPrice=UnitPrice*1.3--Que nuevo dato a asignar
		where CodCat=7--Que condicion

--Mostrar 
		select*
		from Productos
		WHERE CodCat=7
```

- drop: eliminar una restriccion
- delete: eliminar una tabla


## ELIMINAR DATOS DE UNA TABLA
- Que tabla 
- OJO OJITO: Que condicion


- Eliminar el producto de codigo 78
```
			delete Productos--Que tabla 
			where CodPro= 78--OJO OJITO: Que condicion
---The DELETE statement conflicted with the REFERENCE constraint "FK_Order_Details_Productos". The conflict occurred in database "BDMegagis", table 

"dbo.VentasDetalle", column 'CodPro'.
			--Eliminar el producto de codigo 3///ERROR ERROR 
			delete Productos--Que tabla (delete = borrar)
			where CodPro= 3--OJO OJITO: Que condicion
```
- Mostrar la tabla donde esta siendo utilizado el producto de codigo 3
```
			select*
			from VentasDetalle
			where CodPro=3
```

- Eliminar con modo de proteccion //EN FORMA ERROR
```
			begin tran NomTra01
			delete VentasDetalle--Que tabla 
			--where CodPro= 3--OJO OJITO: Que condicion
```
- Eliminar con modo de proteccion // CORRECTO
```
			begin tran NomTra01
			delete VentasDetalle--Que tabla 
			where CodPro= 3--OJO OJITO: Que condicion
		--Mostrar
		select*
		from VentasDetalle

		--Control Z para SQL Server
		rollback tran NomTra01

		--Mostrar Nuevamente
		select*
		from VentasDetalle

```
- TAREA: CUANTAS VECES PUEDE ROLLBACK

En SQL Server, la cantidad de veces que se puede realizar un "rollback" 
no está limitada por un número máximo predeterminado. SQL Server utiliza 
un mecanismo de registro de transacciones para respaldar las operaciones 
de rollback y asegurar la integridad de los datos.

El número de "rollbacks" que se pueden realizar en SQL Server depende de
la capacidad del registro de transacciones y del espacio disponible en 
el disco para almacenar los registros. A medida que se realizan "rollbacks", 
los registros de transacciones correspondientes se marcan como inactivos y 
se liberan espacio para nuevas transacciones.


# KOTLIN

- "PROCEDIMIENTO ALMACENADOS"
- COMO VERLO : DataBase Diagrams/Programmability/Strored Procedures

# PA

- Crear PA para listar los Clientes
```
create proc PAListarCliente
as
begin --inicia
--debemos utilizar cualquier comando SQL
  select*
	from Clientes
	end--termina el PA
```

- Luego de crear para ejecutar
```
exec PAListarCliente
```

- Crear PA para listar los Clientes
```
  alter proc PAListarCliente
	as
	begin --inicia el PA
	--debemos utilizar cualquier comando SQL
	select*
	from Clientes
	where Region ='Moquegua'
	end--termina el PA

	--Ahora Ejecutamos
	exec PAListarCliente
```
- Para mostrar el contenido de un PA
```
sp_helptext PAListarCliente
```

- MODIFICAR EL PA ANTERIOR PARA HACER QUE LA REGION INGRESE COMO PARAMETRO EXTERNO
```	
  alter proc PAListarCliente
	@Reg varchar(15)--Ingresamos el parametro 
	as
	begin --inicia el PA
	--debemos utilizar cualquier comando SQL
	select*
	from Clientes
	where Region =@Reg
	end--termina el PA

```
- Ejecutamos el PA e ingreando la region desde "fuera"
```
	exec PAListarCliente Lima
```
- Para mostrar el contenido de un PA
```
	sp_helptext PAListarCliente 
```
- COMO ELIMINAR
```
		drop proc PAListarCliente
```

# XML -JSON
- A partir de una consulta crear una XML de la lista de Clientes
```
select*
from Clientes
for XML Auto
```
- Test Final
- PRESIONAR EL LINK Y DENTRO DEL LINK ----GUARDARLO CON FILE/ SAVE IS Y ABRIRLO CON TEXT

- Crear XML de los clientes en forma eriquecida y neutral para cualquier Aplicacion
```
select*
from Clientes 
for XML path('Cliente'),root('Clientes')---(1)Cada fila (2)CONTENIDO Total
```
- Como abrir xml a excel
- guardarlo control+s
- abrir excel: Datos/Obtener Datos/Desde un archivo/Desde un archivo XML
- Seleccionar el archivo que guardastey lo cargamos

# PARA CASO DE JSON
```
select*
from Clientes 
for JSON Auto---(1)Cada fila (2)CONTENIDO Total
```
