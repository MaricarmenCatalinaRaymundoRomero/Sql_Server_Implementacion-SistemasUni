create database BDFINALRAYMUNDO


create table CategoriaRaymundo
(--inicio de la tabla
CodCat int,--LISTOO
NomCat varchar(30),
DesCat varchar(50),
FotCat text--image
)--final de la tabla
----------------------------------------------
create table EmpleadoRaymundo
(--inicio de la tabla
CodEmp int,
NomEmp varchar(30),
ApaEmp varchar(40),
AmaEmp varchar(40),
DniEmp int,
Whatsapp varchar,--WhaEmp int
FotoEmpleado int,--FotEmp image
GenEmp bit,
FnaEmp int
)--final de la tabla


create table DistritoRaymundo
(--inicio de la tabla
CodDis int,
NombredelDistrito varchar(300),--NomDis varchar(30)
DesDis varchar(50)
)--final de la tabla

create table ClienteRaymundo
(--inicio de la tabla
CodCli int, 
NomCli int,--varchar(30) 
ApaCli varchar(40),
AmaCli varchar(40),
FnaCli date,
FotCli image,
WhaCli int,
DniCli int,
GenCli bit,
CodDis int---
)--final de la tabla


create table ProductoRaymundo 
(--inicio de la tabla
CodPro int,
Nombre varchar(30),--NomPro varchar(30)--LISTOO
DesPro varchar(40),
PrePro int,
CodCat int---
)--final de la tabla

-----------------------------------------------

--ELIMINAR "CodCat int"
   alter table CategoriaRaymundo--Que Objeto(Tabla)
   drop column CodCat--Que Accion (Eliminar)  
--AGREGAR " CodCat int primary key identity (20280001,1)"
   alter table CategoriaRaymundo--Que Objeto(Tabla)
   add CodCat int primary key identity (20280001,1)
---------------------------------------------------------

--ELIMINAR "FotCat text" 
   alter table CategoriaRaymundo--Que Objeto(Tabla)
   drop column FotCat--Que Accion (Eliminar) 

--AGREGAR "FotEmp image default'C:\Users\Administrator\Desktop\img\SinFoto.jpg"
  alter table CategoriaRaymundo--Que Objeto(Tabla)
  add FotCat image default'C:\Users\Administrator\Desktop\img\SinFoto.jpg'--Que Accion(Adicionar)
  -----------------------------------------------------

  
--VERIFICAMOS
sp_help CategoriaRaymundo

---------------------------------------------------------
----------CORREGIR LA TABLA ""EmpleadoRaymundo""----------      
---------------------------------------------------------
--ELIMINAR "CodEmp int"
    alter table EmpleadoRaymundo--Que Objeto(Tabla)
	drop column CodEmp--Que Accion (Eliminar)  
--AGREGAR " CodEmp int primary key identity (20260001,1)"
	alter table EmpleadoRaymundo--Que Objeto(Tabla)
	add  CodEmp int primary key identity (20260001,1)
---------------------------------------------------------
--AGREGAR "DniEmp" UNA RESTRICCION
	alter table EmpleadoRaymundo--Que Objeto(Tabla)
	add check(DniEmp>=900000000 and DniEmp<=999999999)
---------------------------------------------------------
--ELIMINAR "WhaEmp varchar" 
    alter table EmpleadoRaymundo--Que Objeto(Tabla)
	drop column Whatsapp--Que Accion (Eliminar) 
--AGREGAR "CodCli int primary key identity key indentity (20230001,1)"
	alter table EmpleadoRaymundo--Que Objeto(Tabla)
	add WhaEmp int
--AGREGAR "DniEmp" UNA RESTRICCION
	alter table EmpleadoRaymundo--Que Objeto(Tabla)
	add check(WhaEmp>=900000000 and WhaEmp<=999999999)
---------------------------------------------------------
--ELIMINAR "FotoEmpleado int" 
    alter table EmpleadoRaymundo--Que Objeto(Tabla)
	drop column FotoEmpleado--Que Accion (Eliminar) 
--AGREGAR "FotEmp image default'C:\Users\Administrator\Desktop\img\SinFoto.jpg"
	alter table EmpleadoRaymundo--Que Objeto(Tabla)
	add FotEmp image default'C:\Users\Administrator\Desktop\img\SinFoto.jpg'--Que Accion(Adicionar)
---------------------------------------------------------
--ELIMINAR "FnaEmp int"
    alter table EmpleadoRaymundo--Que Objeto(Tabla)
	drop column FnaEmp--Que Accion (Eliminar)  
--AGREGAR " FnaEmp date"
	alter table EmpleadoRaymundo--Que Objeto(Tabla)
	add  FnaEmp date
---------------------------------------------------------
--AGREGAMOS EN "FnaEmp" UNA RESTRICCION
	alter Table EmpleadoRaymundo--Que Objeto(Tabla)
	add check(FnaEmp<=getdate())--Que accion (Adicionar)

--VERIFICAMOS
sp_help EmpleadoRaymundo

---------------------------------------------------------
----------CORREGIR LA TABLA ""DistritoRaymundo""----------      
---------------------------------------------------------
--ELIMINAR "CodDis int"
    alter table DistritoRaymundo--Que Objeto(Tabla)
	drop column CodDis--Que Accion (Eliminar)  
--AGREGAR " CodDis int primary key identity"
	alter table DistritoRaymundo--Que Objeto(Tabla)
	add  CodDis int primary key identity (20240001,1)
---------------------------------------------------------
--ELIMINAR "NombredelDistrito varchar(300)"
    alter table DistritoRaymundo--Que Objeto(Tabla)
	drop column NombredelDistrito--Que Accion (Eliminar)  
--AGREGAR "NomDis varchar(30)"
	alter table DistritoRaymundo--Que Objeto(Tabla)
	add  NomDis varchar(30) 



--VERIFICAMOS
sp_help DistritoRaymundo
------------------------------------------------------------------------------------------

---------------------------------------------------------
----------CORREGIR LA TABLA ""ClienteRaymundo""----------               
---------------------------------------------------------
--ELIMINAR "CodCli int primary key" 
    alter table ClienteRaymundo--Que Objeto(Tabla)
	drop column CodCli--Que Accion (Eliminar) 
--AGREGAR "CodCli int primary key identity key indentity (20230001,1)"
	alter table ClienteRaymundo--Que Objeto(Tabla)
	add CodCli int primary key identity (20230001,1)--Que Accion(Adicionar)
---------------------------------------------------------
--ELIMINAR "NomCli int"
    alter table ClienteRaymundo--Que Objeto(Tabla)
	drop column NomCli--Que Accion (Eliminar)  
--AGREGAR "NomCli varchar(30)"
	alter table ClienteRaymundo--Que Objeto(Tabla)
	add  NomCli varchar(30)
---------------------------------------------------------
--AGREGAMOS EN "FnaCli" UNA RESTRICCION
	alter Table ClienteRaymundo--Que Objeto(Tabla)
	add check(FnaCli<=getdate())--Que accion (Adicionar)
---------------------------------------------------------
--ELIMINAR "FotCli int" 
    alter table ClienteRaymundo--Que Objeto(Tabla)
	drop column FotCli--Que Accion (Eliminar) 
--AGREGAR "image default'C:\Users\Administrator\Desktop\img\SinFoto.jpg'"
	alter table ClienteRaymundo--Que Objeto(Tabla)
	add FotCli image default'C:\Users\Administrator\Desktop\img\SinFoto.jpg'--Que Accion(Adicionar)
---------------------------------------------------------
--AGREGAMOS EN "WhaCli" UNA RESTRICCION
	alter table ClienteRaymundo--Que Objeto(Tabla)
	add check(WhaCli>=900000000 and WhaCli<=999999999)
---------------------------------------------------------
--AGREGAR "DniCli int primary key identity key indentity (20230001,1)"
	alter table ClienteRaymundo--Que Objeto(Tabla)
	add check(DniCli>=900000000 and DniCli<=999999999)

--VERIFICAMOS
sp_help ClienteRaymundo

---------------------------------------------------------
----------CORREGIR LA TABLA ""ProductoRaymundo""----------      
---------------------------------------------------------
--ELIMINAR "CodPro int"
    alter table ProductoRaymundo--Que Objeto(Tabla)
	drop column CodPro--Que Accion (Eliminar)  
--AGREGAR " CodEmp int primary key identity (20260001,1)"
	alter table ProductoRaymundo--Que Objeto(Tabla)
	add  CodPro int primary key identity (20270001,1)
---------------------------------------------------------
--ELIMINAR "Nombre varchar(30)"
    alter table ProductoRaymundo--Que Objeto(Tabla)
	drop column Nombre--Que Accion (Eliminar)  
--AGREGAR "NomPro varchar(30)"
	alter table ProductoRaymundo--Que Objeto(Tabla)
	add  NomPro varchar(30) 
--VERIFICAMOS
sp_help ProductoRaymundo

------------------------------------
--RELACION---

	alter table ProductoRaymundo--Que Objeto(Tabla)ORIGEN
	add foreign key(CodCat) references CategoriaRaymundo--Que Accion(Relacionar y/o Referenciar)DESTINO


	alter table ClienteRaymundo--Que Objeto(Tabla)ORIGEN
	add foreign key(CodDis) references DistritoRaymundo--Que Accion(Relacionar y/o Referenciar)DESTINO


drop table CategoriaRaymundo
------------------------------------

create table VentaRaymundo 
(--inicio de la tabla
CodVen int primary key identity (20290001,1),
ProVen varchar(30),
CnoVen varchar(30),
CapVen varchar(40),
CamVen varchar(30),
CodEmp int,
CodCli int references ClienteRaymundo,
CodPro int references ProductoRaymundo
)--final de la tabla



--- RELACION DE LA TABLA DE VENTARAYMUNDO A EMPLEADORAYMUNDO

	alter table VentaRaymundo--Que Objeto(Tabla)ORIGEN
	add foreign key(CodEmp) references EmpleadoRaymundo--Que Accion(Relacionar y/o Referenciar)DESTINO




------------------------------------------------------------------------------------------------
------AHORA VAMOS A CREAR DATOS PARA CADA TABLA------------------------------------------



---TABLA CATEGORIARAYMUNDO---

insert CategoriaRaymundo(NomCat,DesCat)
values('Embutidos/Quesos', 'Jamonadas, Pates y Quesos'),('Juguetes', 'Muñecas, Coches, Lego y Carros'),('Libros', 'Romance, Terror, Comedia, Misterio y Cocina'),('Ropa', 'Polo, Pantalon, Falda, Vestido y Camisa'),('Bebidas', 'Gaseosa, Agua, Alcohol, Energizantes y Cervezas')

insert CategoriaRaymundo(NomCat,DesCat)
values('Electrodoméstico', 'Televisores, Refrigeradoras y Equipos de Sonido'),('Frutas', 'Frutas de Estacion')

insert CategoriaRaymundo(NomCat,DesCat)
values('Abarrotes', 'Viveres y/o alimentos envasados'),('Informatica', 'Impresoras, Laptops, Suministros y Partes')

--Mostrar los datos de la tabla CategoriaRaymundo
select*
from CategoriaRaymundo


--TABLA EMPLEADORAYMUNDO---

INSERT EmpleadoRaymundo (NomEmp, ApaEmp, AmaEmp, DniEmp, WhaEmp, GenEmp, FnaEmp)
VALUES('Juan', 'García', 'Pérez', 912345678, 912345678, 0, '1990-01-15'),('María', 'López', 'Gómez', 923456789, 923456789, 1, '1992-05-20'),('Pedro', 'Martínez', 'Rodríguez', 934567890, 934567890, 0, '1995-08-10')
    
INSERT EmpleadoRaymundo (NomEmp, ApaEmp, AmaEmp, DniEmp, WhaEmp, GenEmp, FnaEmp)
VALUES('Laura', 'Hernández', 'Sánchez', 945678901, 945678901, 1, '1998-02-28'),('Carlos', 'González', 'Lara', 956789012, 956789012, 0, '1994-11-12'),('Ana', 'Torres', 'Vargas', 967890123, 967890123, 1, '1991-07-05'),('Luis', 'Ramírez', 'Morales', 978901234, 978901234, 0, '1997-03-25')

INSERT EmpleadoRaymundo (NomEmp, ApaEmp, AmaEmp, DniEmp, WhaEmp, GenEmp, FnaEmp)
VALUES('Sofía', 'Soto', 'Flores', 989012345, 989012345, 1, '1993-09-17'),('Diego', 'Ortega', 'Guerrero', 990123456, 990123456, 0, '1996-06-08')

--Mostrar los datos de la tabla EmpleadoRaymundo
select*
from EmpleadoRaymundo

--------------------------------------------------------------

--TABLA DISTRITORAYMUNDO

insert  DistritoRaymundo (NomDis, DesDis)
values('Miraflores', 'Distrito turístico')

insert  DistritoRaymundo (NomDis, DesDis)
values('San Isidro', 'Distrito financiero'),('Barranco', 'Distrito bohemio y artístico ubicado en Lima')

insert  DistritoRaymundo (NomDis, DesDis)
values('San Borja', 'Distrito residencial'),('Surco', 'Distrito comercial ubicado en Lima.'),('Callao', 'Ubicado en la costa central de Perú.')
    
insert  DistritoRaymundo (NomDis, DesDis)
values('Chorrillos', 'Distrito costero ubicado en Lima.'),('La Molina', 'Distrito residencial y universitario.'),('Lince', 'Distrito céntrico y residencial.')

--Mostrar
select*
from DistritoRaymundo


-------------------------------------------------------------------

---TABLA CLIENTERAYMUNDO

insert ClienteRaymundo (NomCli, ApaCli, AmaCli, FnaCli, WhaCli, DniCli, GenCli, CodDis)
values('Martha', 'Zuñiga', 'Pérez', '1990-01-15', 912345678, 902349988, 0, 20240003),('Stiven', 'López', 'Entrada', '1992-05-20', 923456789, 922455599, 1, 20240005),('Larry', 'Rios', 'Farias', '1995-08-10', 934567890, 938867890, 0, 20240011)
    
insert ClienteRaymundo (NomCli, ApaCli, AmaCli, FnaCli, WhaCli, DniCli, GenCli, CodDis)
values('Helen', 'Chau', 'Romero', '1998-02-28', 945678901, 999678801, 1, 20240012),('Carlos', 'González', 'Lara', '1994-11-12', 956789012, 957777012, 0, 20240014),('Abigail', 'Torres', 'Vargas', '1991-07-05', 967890123, 967890123, 1, 20240015),('Leonardo', 'Caja', 'Morales', '1997-03-25', 978901234, 975551234, 0, 20240006),('Julieta', 'Leon', 'Acosta', '1993-09-17', 989012345, 900012225, 1, 20240006),('Mathias', 'Baldeon', 'Campos', '1996-06-08', 990123456, 955663226, 0, 20240010)


--MOSTRAR

select*
from ClienteRaymundo



-------------------------------------------------------------------

---TABLA PRODUCTORAYMUNDO

create table ProductoRaymundo 
(--inicio de la tabla
CodPro int primary key identity (20270001,1),
NomPro varchar(30),
DesPro varchar(40),
PrePro int,
CodCat int---
)--final de la tabla

insert ProductoRaymundo (NomPro, DesPro, PrePro, CodCat)
values('Agua San Mateo de 1.5L', 'La más ecológica', 12.99, 20280005),('Lavadora LG 16KG', 'Dura mas tiempo que los demas', 225.99, 20280006)
    
	
insert ProductoRaymundo (NomPro, DesPro, PrePro, CodCat)
values('Polo Adiddas', 'Buena calidad para los demas.', 55.99, 20280004),('Muñeca Sirenita', 'Tiene unas aletas de colores', 29.99, 20280002),('Manzana Roja', 'Tiempo de comer saludable.', 4.99, 20280007),('Mandarina', 'Delicioso y sin pepas.', 3.99, 20280007)
    
insert ProductoRaymundo (NomPro, DesPro, PrePro, CodCat)
values('Energizante RED BULL 250ml', 'Buena para el deporte.', 8.99, 20280005),('Aceite CAPRI  1L', 'Calidad vegetal.', 7.99, 20280008),('Chirimoya Cumbe', 'Tiempo de comer dulce.', 2.99, 20280007)

select*
from CategoriaRaymundo



-----------------------------------------------------

----TABLA VENTARAYMUNDO

insert VentaRaymundo (ProVen, CnoVen, CapVen, CamVen, CodEmp, CodCli, CodPro)
values('Mandarina', 'Leonardo', 'Caja', 'Morales', 20260006, 20230004, 20270007),('Manzana Roja', 'Martha', 'Zuñiga', 'Pérez', 20260008, 20230001, 20270006),('Aceite CAPRI  1L', 'Abigail', 'Torres', 'Vargas', 20260009, 20230006, 20270012)

insert VentaRaymundo (ProVen, CnoVen, CapVen, CamVen, CodEmp, CodCli, CodPro)
values('Chirimoya Cumbe', 'Leonardo', 'Caja', 'Morales', 20260006, 20230004, 20270013),('Mandarina', 'Martha', 'Zuñiga', 'Pérez', 20260006, 20230001, 20270007),('Lavadora LG 16KG', 'Martha', 'Zuñiga', 'Pérez', 20260009, 20230001, 20270003),('Agua San Mateo de 1.5L', 'Leonardo', 'Caja', 'Morales', 20260008, 20230004, 20270002),('Agua San Mateo de 1.5L', 'Abigail', 'Torres', 'Vargas', 20260009, 20230006, 20270002)
    
insert VentaRaymundo (ProVen, CnoVen, CapVen, CamVen, CodEmp, CodCli, CodPro)
values('Energizante RED BULL 250ml', 'Julieta', 'Leon', 'Acosta', 20260001, 20230008, 20270011),('Polo Adiddas', 'Julieta', 'Leon', 'Acosta', 20260001, 20230008, 20270004),('Agua San Mateo de 1.5L', 'Larry', 'Rios', 'Farias', 20260002, 20230003, 20270002),('Muñeca Sirenita', 'Larry', 'Rios', 'Farias', 20260002, 20230003, 20270005),('Muñeca Sirenita', 'Mathias', 'Baldeon', 'Campos', 20260006, 20230009, 20270005),('Energizante RED BULL 250ml', 'Mathias', 'Baldeon', 'Campos', 20260006, 20230009, 20270011)
    
insert VentaRaymundo (ProVen, CnoVen, CapVen, CamVen, CodEmp, CodCli, CodPro)
values('Aceite CAPRI  1L', 'Carlos', 'González', 'Lara', 20260006, 20230005, 20270012),('Agua San Mateo de 1.5L', 'Carlos', 'González', 'Lara', 20260009, 20230005, 20270002),('Lavadora LG 16KG', 'Stiven', 'López', 'Entrada', 20260001, 20230002, 20270003),('Manzana Roja', 'Stiven', 'López', 'Entrada', 20260001, 20230002, 20270006),('Polo Adiddas', 'Stiven', 'López', 'Entrada', 20260009, 20230002, 20270004),('Muñeca Sirenita', 'Stiven', 'López', 'Entrada', 20260002, 20230002, 20270005)



--Mostrar

select*
from VentaRaymundo

-----------------------------------------------------------------------
--LISTA DE CONSULTAS
--1. Una consulta de los nombres de los clientes, codigo del producto, precio del producto y el nombre del empleado

--Que tablas son?
ClienteRaymundo, VentaRaymundo, ProductoRaymundo, EmpleadoRaymundo
--Están relacionadas?
si
--Cuáles son las columnas en común?
CodPro, CodCli
--Unir y Habilitar la columna en común?

select ClienteRaymundo.NomCli as Nombre, ProductoRaymundo.PrePro as Precio, ProductoRaymundo.CodCat as CodigoProducto, EmpleadoRaymundo.NomEmp as Empleado
from ClienteRaymundo
JOIN VentaRaymundo 
on ClienteRaymundo.CodCli = VentaRaymundo.CodCli
JOIN ProductoRaymundo
on VentaRaymundo.CodPro = ProductoRaymundo.CodPro
JOIN EmpleadoRaymundo
on VentaRaymundo.CodEmp = EmpleadoRaymundo.CodEmp




----------------------------------------------------------------------------
--PA
	--Crear PA para listar los Clientes
    create proc PAListarClienteNombre
	as
	begin --inicia
	--debemos utilizar cualquier comando SQL
	select*
	from ClienteRaymundo

	end--termina el PA


	--Luego de crear para ejecutar
	exec PAListarClienteNombre





	alter proc PAListarClienteNombre
	@Nom varchar(20)--Ingresamos el parametro 
	as
	begin --inicia el PA
	--debemos utilizar cualquier comando SQL
	select*
	from ClienteRaymundo
	where NomCli =@Nom
	end--termina el PA

	--Ejecutamos el PA e ingreando el WhaCli
	exec PAListarClienteNombre

	--Para mostrar el contenido de un PA
	sp_helptext PAListarClienteNombre 


