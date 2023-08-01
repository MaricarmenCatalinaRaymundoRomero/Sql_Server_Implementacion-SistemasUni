

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
--SUGERENCIA:Antes de Eliminar columnas realice un Backup(Copia de Seguridad)
    --Que Objeto
	--Que Accion

--Eliminar la columna CodPro de la Tabla Especialidad
    alter table Especialidad--Que Objeto(Tabla)
	drop column CodPro--Que Accion (Eliminar)  

--Eliminar la columna TsaPac de la Tabla Medico
    alter table Medico--Que Objeto
	drop column TsaPac--Que Accion



---------------------------------------------------------------------------------------------
--PARA EL CASO DE ADICIONAR COLUMNAS
	--Que Objeto(Tabla)
	--Que Accion(Adicionar)


--Aqui añadimos la columna Imagen de Especialidad(CodIma)
	alter table Especialidad--Que Objeto(Tabla)
	add CodIma image--Que Accion(Adicionar)

--Adicionar la columna EmaMed de la tabla Medico
	alter table Medico--Que Objeto(Tabla)
	add EmaMed varchar(50)--Que Accion(Adicionar)



-------------------------------------------------------------

--PAR EL CASO DE LAS RESTRICCIONES
--Añadir la restriccion de Numeros de Whatsapp de la tabla Medico
--VER LAS RESTRICCIONES
sp_help Medico

alter Table Medico--Que Objeto(Tabla)
add check(WhaMed>=900000000 and WhaMed<=999999999)--Que accion (Adicionar)


-------------------------------------------------------------------

--PARA RELACIONAR DOS TABLAS
	--OJITO OJITO: Primero las dos tablas deben tener PK
	--Vamos a adicionar el PK a Especialidad a la columna CodEsp
     alter table Especialidad --Que Objeto(Tabla)
	 add primary key(CodEsp)--Que Accion(Adicionar)


--Relacionado Medico con Especialidad

		alter table Medico--Que Objeto(Tabla)ORIGEN
		add foreign key(CodEsp) references Especialidad--Que Accion(Relacionar y/o Referenciar)DESTINO

--Finalmente
 --Crear la tabla Cita Relacionado inmediatamente con Medico y Paciente
 create table Cita
 (--inicio de tabla
 CodCit int primary key,
 FecCit date,
 CodMed int references Medico,
 CodPac int references PacienteFinal,
 TurCit varchar(15)
 )--fin de la tabla

