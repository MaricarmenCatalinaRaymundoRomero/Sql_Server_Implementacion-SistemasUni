--Modificar y/o Actualizar datos
select*
from Productos

--REQUERIMIENTOS
--Que tabla
--Que nuevo dato a asignar
--Que condicion

--En la tabla Productos asignar un nuevo precio al producto de codigo 14 siendo 13.99 soles
		update Productos--Que tabla
	    set UnitPrice = 13.99--Que nuevo dato a asignar(set= asignar, get =   )
		where CodPro = 14--Que condicion

--Eliminar datos-->> con Transacction
select*
from Productos

--En la Tabla productos modificar asignado los siguiente nuevos datos al producto de codigo 7:
--Nombre:Arroz Caserita Superior
--Categoria: Abarrotes 7
--Adicionar la stock 100 unidades
	update Productos--Que tabla
	set ProductName='Arroz Caserita Superior',CodCat=7,UnitsInStock=UnitsInStock+100--Que nuevo dato a asignar
	where CodPro= 7--Que condicion

	--Mostrar 
	select*
	from Productos
	WHERE CodCat=7

	--7	    Arroz Caserita Superior		2.79
	--14	Aceite Vegetal CAPRI Botella 1L		13.99
	--28	Aceite de Oliva Extra Virgen Botella 1L		14.99
	--51	Arroz Extra COSTEÑO Bolsa 5Kg	15.99
	--74	Arroz Superior PAISANA Bolsa 5.25Kg		16.25
	

	--Por temporada de invierno se elevan los precios de los Abarrotes a un 30%
		update Productos--Que tabla
		set UnitPrice=UnitPrice*1.3--Que nuevo dato a asignar
		where CodCat=7--Que condicion
	--Mostrar 
		select*
		from Productos
		WHERE CodCat=7

		--drop: eliminar una restriccion
		--delete: eliminar una tabla


		--ELIMINAR DATOS DE UNA TABLA
			--Que tabla 
			--OJO OJITO: Que condicion


			--Eliminar el producto de codigo 78
			delete Productos--Que tabla 
			where CodPro= 78--OJO OJITO: Que condicion

			--The DELETE statement conflicted with the REFERENCE constraint "FK_Order_Details_Productos". The conflict occurred in database "BDMegagis", table "dbo.VentasDetalle", column 'CodPro'.
			--Eliminar el producto de codigo 3///ERROR ERROR 
			delete Productos--Que tabla (delete = borrar)
			where CodPro= 3--OJO OJITO: Que condicion

			--Mostrar la tabla donde esta siendo utilizado el producto de codigo 3
			select*
			from VentasDetalle
			where CodPro=3
--------------------------------------------------------------------------------------------
			--Eliminar con modo de proteccion //EN FORMA ERROR
			begin tran NomTra01
			delete VentasDetalle--Que tabla 
			--where CodPro= 3--OJO OJITO: Que condicion

			--Eliminar con modo de proteccion // CORRECTO
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


		--TAREA: CUANTAS VECES PUEDE ROLLBACK
		/*
		En SQL Server, la cantidad de veces que se puede realizar un "rollback" 
		no está limitada por un número máximo predeterminado. SQL Server utiliza 
		un mecanismo de registro de transacciones para respaldar las operaciones 
		de rollback y asegurar la integridad de los datos.

		El número de "rollbacks" que se pueden realizar en SQL Server depende de
		la capacidad del registro de transacciones y del espacio disponible en 
		el disco para almacenar los registros. A medida que se realizan "rollbacks", 
		los registros de transacciones correspondientes se marcan como inactivos y 
		se liberan espacio para nuevas transacciones.
		*/

		--KOTLIN


--"PROCEDIMIENTO ALMACENADOS"
--COMO VERLO : DataBase Diagrams/Programmability/Strored Procedures
--PA
	--Crear PA para listar los Clientes
    create proc PAListarCliente
	as
	begin --inicia
	--debemos utilizar cualquier comando SQL
	select*
	from Clientes

	end--termina el PA


	--Luego de crear para ejecutar
	exec PAListarCliente


	--Crear PA para listar los Clientes
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

	--Para mostrar el contenido de un PA
	sp_helptext PAListarCliente


	--MODIFICAR EL PA ANTERIOR PARA HACER QUE LA REGION INGRESE COMO PARAMETRO EXTERNO
	
    alter proc PAListarCliente
	@Reg varchar(15)--Ingresamos el parametro 
	as
	begin --inicia el PA
	--debemos utilizar cualquier comando SQL
	select*
	from Clientes
	where Region =@Reg
	end--termina el PA


	--Ejecutamos el PA e ingreando la region desde "fuera"
	exec PAListarCliente Lima

	--Para mostrar el contenido de un PA
	sp_helptext PAListarCliente 

	--COMO ELIMINAR
		drop proc PAListarCliente

--XML -JSON
-- A partir de una consulta crear una XML de la lista de Clientes
select*
from Clientes
for XML Auto
--Test Final
--PRESIONAR EL LINK Y DENTRO DEL LINK ----GUARDARLO CON FILE/ SAVE IS Y ABRIRLO CON TEXT

--Crear XML de los clientes en forma eriquecida y neutral para cualquier Aplicacion
select*
from Clientes 
for XML path('Cliente'),root('Clientes')---(1)Cada fila (2)CONTENIDO Total

--Como abrir xml a excel
--guardarlo control+s
--abrir excel: Datos/Obtener Datos/Desde un archivo/Desde un archivo XML
--Seleccionar el archivo que guardastey lo cargamos

--PARA CASO DE JSON
select*
from Clientes 
for JSON Auto---(1)Cada fila (2)CONTENIDO Total