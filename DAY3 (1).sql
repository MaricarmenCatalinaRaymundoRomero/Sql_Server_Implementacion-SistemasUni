--REPORTE
--Consulta I
--Consulta Generales o globales:

--1.Crear un reporte donde se muestre que categorias de productos realiza la empresa Megagis

select*--- (* = todas las columnas)
from Categorias-- Desde la tabla categoria


--2.Mostrar un reporte que muestre todos los productos que la empresa Mega vende
select*
from Productos

--3.Mostrar un reporte de las ventas que produce la empresa Mega
select*
from Venta

--4.Cuantos clientes tiene la empresa mega?
select count(*)---count(*)=sintaxis de cuantos clientes hay en la empresa
from Clientes

--5 Mostrar los productos en orden de precio unitario
select*
from Productos
order  by 6 --(Aqui mandamos que la columna 6 pueda tener sus atributos en orden de menor a mayor)


--ORDER BY:realiza un ordenamiento por defecto en forma ascendente de la columna "elegida"

--6.Crear un reporte de los clientes que ordene por la ciudad	DESCendentemente
select*
from Clientes
order by City desc

--CONSULTAS PARCIALES

--7.Mostrar un reporte de los 5 productos mas "caros" o de precio mayor
select top 5* --top= muestra la cantidad que quieres mostrar
from Productos
order by 6 desc 

--8.Mostrar un reporte de los 5 productos  "menos" 
select top 5* --top= muestra la cantidad que quieres mostrar
from Productos
order by 6  --Quitamos "desc" para que no se descendese

--9. Crear un reporte de los productos donde elo precio unitario sea menor que 100
select*
from Productos
where UnitPrice <500--Condiciones
order by 6 --Para que ordene de menor a mayor
--10. Crear un reporte de los productos donde el precio unitario sea mayor que 500
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

--11.Mostrar los productos en los siguientes rangos de precio:
--de 100 a 200
--de 500 a 1000
--mayor que 3000

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

--12.Mostrar los productos cuyo nombre inicien con la letra c
select*
from Productos
where ProductName like 'c%' -- like'c%'=Muestra los productos que comience con C



--13.Crear un reporte de losproductos cuyo nombre sea  la antepenultima letra sea "r"
select*
from Productos
where ProductName like '%r__'

--14.Ayuda tener la consulta solo con el nombre roja
select*
from Productos
where ProductName like '%roja'

--15.Mostrar todos los productos cuyo nombre sea mayor que g
select*
from Productos
where ProductName>'g'
order by 2

--16.Mostrar los productos cuya categoria se 2,4 y 7                
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

--17.Mostrar y exportar a un reporte los productos con las siguientes caracterisitcas:
--Precio mayor que 800
--Stock menor que 10
--y en su contenido de nombre tenga la letra "a"

select*
from Productos
where UnitPrice>800 and UnitsInStock<10 and ProductName like '%a%'

select*
from Productos
where UnitPrice>800 or UnitsInStock<10 or ProductName like '%a%'

--18.Cuantos años de datos en venta tiene?
select distinct
year(OrderDate)
from Venta


select year(OrderDate)---Solo extrae el año
from Venta

select month(OrderDate)--Solo extrae los meses
from Venta


--19.Mostrar el numero de dia del año que nos encontramos
--select dayofyear('2023-07-08') as FechaHoy

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


--HERRAMIENTA INSCRIPTACION SHA256/100L5
--PK?
--FK?

--DOS O MAS TABLAS

--1.Mostrar un reporte con los siguientes datos:Nombre del Producto, precio y 
--nombre de la categoria a la pertenece

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


--MOSTRAR UN REPORTE DE LA VENTA U ORDEN NRO 12666 LOS SIGUIENTES DATOS:
--Fecha  

--El nombre y apellido del Empleado 

--Nombre de la empresa Cliente

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
--



---CREAR UN REPORTE DEL AÑO 2013 CON LAS SIGUIENTES DATOS:
--El numero de la orden de venta, fecha, los productos y el nombre del proveedor de cada producto
--CantidadCC=CT-1
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
