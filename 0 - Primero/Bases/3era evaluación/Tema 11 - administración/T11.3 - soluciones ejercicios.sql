/*****************/
/*TAREA VISTAS.1*/
/*****************/
--1.	En la BD SOCIOS crea una vista 
--de nombre v_inf_profesor que contenga 
--todos los datos de los profesores de 
--la tabla EMPLEADO y también la especialidad de cada uno.
USE SOCIOS;
go
--drop view v_inf_profesor
create view v_inf_profesor
as
	select e.*, p.especialidad
	from EMPLEADO e, PROFESOR p
	where e.numero=p.num_prof;
--2.	Modifica la vista v_inf_profesor 
--para que almacene los datos de los 
--profesores que están en la tabla de 
--empleados, pero sin la especialidad.
USE SOCIOS;
go
alter view v_inf_profesor
as
	select e.*
	from EMPLEADO e
	where cargo='PRF';
	

--3.	Modifica la vista v_inf_profesor 
--para que ahora su código esté cifrado. 
--Comprueba con el procedimiento 
--almacenado del sistema sp_helptext 
--qué ocurre cuando quieres consultar 
--el texto de la vista.
USE SOCIOS;
go
alter view v_inf_profesor
with encryption
as
	select e.*
	from EMPLEADO e
	where cargo='PRF';
go
sp_helptext v_inf_profesor;

--select * from v_inf_profesor;

--4.	Elimina la vista v_inf_profesor 
--creada anteriormente.
USE SOCIOS;
go
drop view v_inf_profesor;

--5.	En la BD EMPLEADOS crea una vista 
--de nombre v_vendedores_oeste que muestre 
--los nombres de los vendedores de la 
--región OESTE. Realiza la instrucción 
--que muestra los datos de la vista.
USE EMPLEADOS;
go

--drop view v_vendedores_oeste
create view v_vendedores_oeste
as
	select r.NOMBRE
	from REPVENTAS r, oficina o
	where o.REGION='OESTE' AND
		  r.OFICINA_REP=o.oficina;
go		  
select * from v_vendedores_oeste;

--6.	En la BD EMPLEADOS crea la vista 
--v_pedidos_clientes_del_vend102 que contenga 
--solamente los pedidos remitidos por 
--clientes asignados al vendedor 102.
use EMPLEADOS;
go
create view v_pedidos_clientes_del_vend102
as
	select *
	from pedido p, cliente c
	where c.REPCLIE=102 AND
	      p.CLIE=c.NUM_CLIE;
	      
--7.	En la BD EMPLEADOS definir una 
--vista de nombre v_cliente_y_su_vendedor 
--sobre la tabla CLIENTE que incluya 
--únicamente los nombres de los clientes 
--y los vendedores a los que están asignados.
use EMPLEADOS;
go
drop view  v_cliente_y_su_vendedor;
create view v_cliente_y_su_vendedor 
as
	select c.empresa, r.nombre
	from cliente c, REPVENTAS r
	where c.REPCLIE=r.NUM_EMPL;

--8.	En la BD EMPLEADOS crea una vista 
--de nombre v_oficinas_ventas_altas que 
--devuelva todos los datos de las oficinas 
--con ventas superiores a 500.000.
use EMPLEADOS;
go
drop view v_oficinas_ventas_altas;
create view v_oficinas_ventas_altas
as
	select * 
	from oficina o
	where o.VENTAS>500000;
--9.	Utilizando transacciones para no 
--realizar los cambios en la bd, ejecuta 
--la consulta que inserte una nueva oficina 
--a través de la vista v_oficinas_ventas_altas 
--con los siguientes datos:
--OFICINA	CIUDAD	REGIÓN	DIR	OBJETIVO	VENTAS
--77	NEGREIRA	NOROESTE	105	300.000	100.000
--¿Te permite hacer la inserción? Si es así comprueba 
--si se ha añadido la fila y deshaz la transacción. 
--	Si no te lo permite ¿sabrías explicar por qué?
use EMPLEADOS;
go
begin tran
insert into v_oficinas_ventas_altas
   (OFICINA,CIUDAD,REGION,DIR,OBJETIVO,VENTAS)
values (77, 'NEGREIRA', 'NOROESTE', 105, 300000, 100000);

select * from v_oficinas_ventas_altas;
select * from oficina;
rollback;


--10.	Modifica la vista v_oficinas_ventas_altas 
--añadiéndole la cláusula WITH CHECK OPTION. 
--A continuación intenta, usando transacciones, 
--insertar la misma fila de antes en la tabla 
--OFICINA pero a través de la vista.
--¿Te permite hacer la inserción? Si es así comprueba 
--si se ha añadido la fila y deshaz la transacción.  
--Si no te lo permite ¿sabrías explicar por qué?
--Quítale la cláusula WITH CHECK OPTION a la vista.
use EMPLEADOS;
go
alter view v_oficinas_ventas_altas
as
	select * 
	from oficina o
	where o.VENTAS>500000
with check option;
go
begin tran
insert into v_oficinas_ventas_altas
   (OFICINA,CIUDAD,REGION,DIR,OBJETIVO,VENTAS)
values (77, 'NEGREIRA', 'NOROESTE', 105, 300000, 100000);

select * from oficina;
rollback;
--No permite hacer la modificación porque vulnera
--la condición del where, ya que las ventas son menores
--a 500.000
alter view v_oficinas_ventas_altas
as
	select * 
	from oficina o
	where o.VENTAS>500000;
	
--11.	Crea una tabla de nombre OFI_PRUEBA que contenga 
--los mismos datos que la tabla OFICINA. Ahora crea una 
--vista de nombre v_oficinas_este que contengan todos 
--los datos de las oficinas de la región este de la 
--tabla OFI_PRUEBA, pero los campos en la vista se 
--llamarán:
--CODIGO	NOMBRE	ZONA	DIRECTOR	VENTAS_ESPERADAS	VENTAS_ACTUALES
--	Una vez creada la vista y comprobado su contenido, 
--	intenta borrar la tabla OFI_PRUEBA. ¿Te lo 	
--	permite el servidor? 
--	En caso de que te lo haya permitido, crea 
--	la tabla OFI_PRUEBA de nuevo y modifica la 
--	definición de 	la vista de tal manera que 
--	cuando se intente borrar la tabla sobre la 
--	que se ha definido la vista no 	nos lo permita.
--	Intenta ahora borrar la tabla OFI_PRUEBA de 
--	nuevo y comprueba qué ocurre ¿tiene sentido?
use EMPLEADOS;
go

--drop table dbo.ofi_prueba;
select * into dbo.ofi_prueba
from dbo.oficina;
go

--drop view dbo.v_oficinas_este
create view dbo.v_oficinas_este 
(CODIGO,NOMBRE,ZONA,DIRECTOR,VENTAS_ESPERADAS,VENTAS_ACTUALES)
as
	select *
	from dbo.ofi_prueba
	where region='ESTE';
go

drop table ofi_prueba;
select * from dbo.ofi_prueba;
--Sí la ha borrado

--Volvemos a crearla
select * into dbo.ofi_prueba
from dbo.oficina;
go
--IMPORTANTE: Indicar nombres de esquema si usamos 
--with schemabinding
alter view dbo.v_oficinas_este 
(CODIGO,NOMBRE,ZONA,DIRECTOR,VENTAS_ESPERADAS,VENTAS_ACTUALES)
WITH SCHEMABINDING
as
	select o.oficina, o.CIUDAD, o.region, o.dir, o.objetivo,o.ventas
	from dbo.ofi_prueba o
	where region='ESTE';
go

drop table ofi_prueba;
--No permite borrar y devuelve el mensaje 3729
--No se puede DROP TABLE 'ofi_prueba' porque se le hace referencia en el objeto 'v_oficinas_este'.
/****************FIN TAREA VISTAS.1 *******************************************************************/

/******************************************************/
/*TAREA Usuarios.1: Trabajando con usuarios y esquemas*/
/******************************************************/

--1.	Conéctate al servidor de tu máquina virtual como sa.
Debes conectarte con un login de Windows que sea administrador en Windows. 
Al ser administrador en Windows pertenecerá al rol de servidor sysadmin de SQL Server.
También puedes conectarte con el usuario sa (system administrator).
Recuerda que para usar el usuario sa debe estar activo el modo de 
Autenticación mixta en el servidor de SQL Server,
y además el usuario sa debe estar habilitado (Carpeta seguridad->Inicios de sesión)

/*2.	En la BD EMPLEADOS crea tres usuarios de nombres 
tarea2_usu1, tarea2_usu2 y tarea3_usu3. 
Recuerda que cada usuario debe tener un inicio
 de sesión asociado (créalos con el mismo 
 nombre que el usuario, contraseña la misma 
 que el nombre del login y bd por defecto EMPLEADOS). 
 No indiques esquema por defecto a los usuarios.*/
USE EMPLEADOS; 
CREATE LOGIN tarea2_usu1
WITH PASSWORD='tarea2_usu1',
DEFAULT_DATABASE=EMPLEADOS;
GO
CREATE USER tarea2_usu1
FOR LOGIN tarea2_usu1;
GO
CREATE LOGIN tarea2_usu2
WITH PASSWORD='tarea2_usu2',
DEFAULT_DATABASE=EMPLEADOS;
GO
CREATE USER tarea2_usu2
FOR LOGIN tarea2_usu2;
GO
CREATE LOGIN tarea2_usu3
WITH PASSWORD='tarea2_usu3',
DEFAULT_DATABASE=EMPLEADOS;
GO
CREATE USER tarea2_usu3
FOR LOGIN tarea2_usu3;
GO 
/*3.	Crea en la BD EMPLEADOS el esquema 
Pruebas_tu_nombre (en mi caso sería Pruebas_Monica) 
con propietario tarea2_usu1. 
En la misma instrucción crea una tabla de nombre Fabricante con 2 campos:
-	Identificador char(3) clave primaria
-	Nombre char(20) clave candidata
*/
USE EMPLEADOS;
GO
-- Para hacerlo en la misma instrucción creamos el esquema y no ponemos ; al final
-- Justo después creamos el objeto, la tabla, vista o lo que nos pidan y acabamos con GO
-- En caso de que no nos digan que lo hagamos en la misma ionstrucción, primero
-- creamos el esquema y después para crear un objeto en el esquema debemos acordarnos de poner su nombre 
-- delante del del objeto, en este caso sería CREATE TABLE FABRICANTE Pruebas_Monica.FABRICANTE
CREATE SCHEMA Pruebas_Monica AUTHORIZATION tarea2_usu1
CREATE TABLE FABRICANTE
(identificador char(3) not null,
 nombre char(20) not null,
 CONSTRAINT PK_FABRICANTE Primary Key(identificador),
 CONSTRAINT UQ_FABRICANTE_nombre UNIQUE(nombre));
 GO


--4.	Establece 3 conexiones nuevas, 
--una por cada inicio de sesión que has creado.

--5.	Realiza la consulta 
--SELECT * 
--FROM Fabricante en 
--cada una de las diferentes sesiones.
--¿Qué resultado obtienes? 
--¿Entiendes por qué con el login tarea2_usu1 
--puedes consultar 
--la tabla y con los demás no?
SELECT * 
FROM Fabricante

RESPUESTA:
Si directamente hacemos el select SIN indicar el esquema no podemos acceder
desde ninguna de las sesiones, ni siquiera desde la de sa, porque cuando creamos
los logins no pusimos esquema por defecto y si no se indica
por defecto tienen como esquema dbo.
SI cambiamos el SELECT anterior por
SELECT * 
FROM Pruebas_Monica.Fabricante

Sólo sa y tarea2_usu1 pueden consultar la tabla:
sa porque es sysadmin y
tarea2_usu1 porque es el propietario del esquema.

--6.	Cambia el usuario propietario del 
--esquema a tarea2_usu3. 
--Realiza la consulta SELECT * FROM Fabricante de nuevo con 
--los usuarios tarea2_usu1 y tarea2_usu3. 
ALTER AUTHORIZATION
ON SCHEMA::Pruebas_Monica
TO tarea2_usu3;

Ahora tarea2_usu3 puede consultar la tabla y en cambio
tarea2_usu1 NO.

--7.	Crea en la BD EMPLEADOS el esquema 
--Pruebas_tu_nombre2 (en mi caso sería Pruebas_Monica2) 
--con propietario tarea2_usu2.
CREATE SCHEMA Pruebas_Monica2 AUTHORIZATION tarea2_usu2;
--8.	Dentro del esquema Pruebas_tu_nombre2 crea 
--una tabla cliente2 con la misma estructura y 
--contenido que la tabla cliente de la BD EMPLEADOS.

SELECT * INTO Pruebas_Monica2.cliente2
FROM CLIENTE;

--9.	Realiza la consulta que devuelva toda
-- la información de la tabla cliente2 desde 
--las conexiones de los 3 usuarios que has creado. 
--¿Qué usuario/s pueden consultar la tabla cliente2?
select * from Pruebas_Monica2.cliente2
Los usuarios que pueden consultar la tabla son:
los pertencecientes al rol sysadmin
y
tarea2_usu2 por ser el propietario del esquema donde se creó.
--10.	Mueve la tabla cliente2 al esquema 
--Pruebas_tu_nombre. Realiza la consulta 
--que devuelva toda la información de la 
--tabla cliente2 desde las conexiones de los 
--3 usuarios que has creado. 
ALTER SCHEMA Pruebas_Monica
TRANSFER Pruebas_Monica2.cliente2;
--Realiza la consulta adecuada para obtener el contenido de cliente2.
select * from Pruebas_Monica.cliente2;
--¿Qué usuario/s pueden consultar la tabla cliente2?
RESPUESTA: tarea2_usu3 por ser el propietario del esquema
y los pertencecientes al rol sysadmin
--11.	Intenta eliminar el esquema 
--Pruebas_tu_nombre. ¿Te lo permite? 
--¿Entiendes por qué?
DROP SCHEMA Pruebas_Monica;

RESPUESTA:No lo permite porque tiene objetos asociados (CLIENTE2)

--12.	Intenta eliminar el esquema 
--Pruebas_tu_nombre2. 
--¿Te lo permite? ¿Entiendes por qué?
DROP SCHEMA Pruebas_Monica2;
SÍ Permite  eliminar este esquema porque no tiene ningún objeto asociado.
/****************TAREA Usuarios.1: Trabajando con usuarios y esquemas *********************/

/*****************************************************/
/* TAREA Usuarios.2:                                 */
/* Gestión de usuarios, permisos y roles             */
/* (ejercicio de tipo examen).                       */
/*****************************************************/
--1.Necesitamos que con nuestra bd puedan trabajar, por el momento, 3 usuarios con los siguientes datos:
---	Jefe_proyecto, bd por defecto EMPLEADOS y contraseña abc
---	Programador, bd por defecto EMPLEADOS y contraseña abc
---	Usu_ingenuo, bd por defecto EMPLEADOS y contraseña abc
USE EMPLEADOS;
GO
CREATE LOGIN jefe_proyecto
WITH password='abc',
DEFAULT_DATABASE=EMPLEADOS;
GO
CREATE USER jefe_proyecto
FOR LOGIN jefe_proyecto
GO
CREATE LOGIN programador
WITH password='abc',
DEFAULT_DATABASE=EMPLEADOS;
GO
CREATE USER programador
FOR LOGIN programador
GO
CREATE LOGIN usu_ingenuo
WITH password='abc',
DEFAULT_DATABASE=EMPLEADOS;
GO
CREATE USER usu_ingenuo
FOR LOGIN usu_ingenuo
GO

--2.	El jefe de proyecto deberá poder trabajar con la bd con los mismos permisos 
--que si hubiese sido él quién creó la bd.
USE EMPLEADOS;
GO 
EXECUTE sp_addrolemember db_owner, jefe_proyecto;
--3.	El programador deberá poder leer y también escribir en cualquier 
--objeto que existe en la bd, pero también en 
--cualquiera de los que se vaya a crear, sin necesidad de darle los 
--permisos sobre cada objeto.
USE EMPLEADOS;
GO 
EXECUTE sp_addrolemember db_datareader, programador;
GO
EXECUTE sp_addrolemember db_datawriter, programador;
GO
--4.	El usuario ingenuo sólo podrá consultar alguna información, 
--pero nunca directamente sobre las tablas. 
--Debemos crear las estructuras que permitirán al usuario consultar 
--la información sin acceder directamente a las tablas. 
--Además estas estructuras deberán crearse organizadas todas juntas en 
--una nueva estructura que a partir 
--de aquí llamaré estructura_usu_ingenuo. 
--DATOS QUE PODRÁ CONSULTAR EL USUARIO INGENUO:
-	Nombre y edad del vendedor y el nombre de la oficina de aquellos 
vendedores que trabajan en oficinas de la región este. 
Las columnas resultantes se llamarán VENDEDOR, AÑOS, OFICINA. 
Para darle el nombre a las columnas no podrás hacerlo usando 
alias en el SELECT. 

- Todos los datos de las oficinas de la región ESTE. 

--Crea esta estructura de tal manera que a través de ella no se puedan 
--insertar, modificar ni borrar oficinas de regiones distintas de la región ESTE.
USE EMPLEADOS;
GO
CREATE SCHEMA estructura_usu_ingenuo;
GO
CREATE VIEW estructura_usu_ingenuo.vista1_apartado1_4 (VENDEDOR, ANHOS, OFICINA)
AS
	SELECT nombre, EDAD, ciudad
	FROM REPVENTAS r, OFICINA o
	WHERE o.REGION='ESTE' and 
	      r.OFICINA_REP=o.OFICINA;
GO
CREATE VIEW estructura_usu_ingenuo.vista2_apartado1_4 
AS
	SELECT *
	FROM OFICINA
	WHERE REGION='ESTE' 
WITH CHECK OPTION;



--5.	El usuario ingenuo deberá poder consultar cualquiera de las estructuras 
--que has creado en la estructura_usu_ingenuo 
--y todas las que vayas a crear dentro de ella en un futuro, sin que tengamos 
--que darle el permiso correspondiente sobre cada objeto.
USE EMPLEADOS;
GO
GRANT SELECT 
ON SCHEMA::estructura_usu_ingenuo
TO usu_ingenuo;
--6.	Crea en el esquema dbo una copia de las tablas PEDIDO y PRODUCTO  de 
--nombres PEDIDO2 y PRODUCTO2 (no uses la instrucción CREATE TABLE).
USE EMPLEADOS;
GO
SELECT * INTO dbo.PEDIDO2
FROM dbo.PEDIDO;
GO
SELECT * INTO dbo.PRODUCTO2
FROM dbo.PRODUCTO;
--7.	Crea un esquema de nombre esquema_pedidos y mueve las 2 tablas nuevas  
--PEDIDO2 y PRODUCTO2 a este esquema.
USE EMPLEADOS;
GO
CREATE SCHEMA esquema_pedidos;
GO

ALTER SCHEMA esquema_pedidos
TRANSFER dbo.PEDIDO2;
GO
ALTER SCHEMA esquema_pedidos
TRANSFER dbo.PRODUCTO2;

--8.	Realiza la instrucción que permite que cualquier usuario 
--existente en la bd EMPLEADOS o cualquiera que se cree en 
--un futuro, pueda consultar y eliminar filas de la tabla PEDIDO2.
USE EMPLEADOS;
GO
GRANT SELECT, DELETE
ON esquema_pedidos.PEDIDO2
TO public;

--9.	Crea el inicio de sesión (sólo el inicio de sesión) inicio_sesion_01 con contraseña abc y bd por defecto EMPLEADOS. 
--La primera vez que se conecte el inicio de sesión inicio_sesion_01 al servidor deberá cambiar la contraseña.
--¿Puede conectarse inicio_sesion_01 al servidor? ¿Por qué?
USE master;
GO
CREATE LOGIN inicio_sesion_01
WITH password='abc' MUST_CHANGE, CHECK_EXPIRATION=ON,
DEFAULT_DATABASE=EMPLEADOS;
GO

--10.	Usando T-SQL consigue que el inicio de sesión inicio_sesion_01 
--pueda conectarse a EMPLEADOS sin crearle usuario en la bd EMPLEADOS.
USE EMPLEADOS;
GO
GRANT CONNECT 
TO guest;

--11.	¿Puede el inicio de sesión inicio_sesion_01 consultar 
--la tabla PEDIDO2? ¿Por qué?
Como inicio_sesion_01 lanzamos la consulta 
select *
from esquema_pedidos.PEDIDO2;

Permite hacerla porque se le concedió el permiso de SELECT a public, por lo tanto
guest tb lo tiene

--12.	¿Puede el inicio de sesión inicio_sesion_01 consultar la 
--tabla PRODUCTO2? ¿Por qué?
select *
from esquema_pedidos.PRODUCTO2;
No permite hacer la consulta, porque guest no tiene ese permiso

--13.	Crea una vista en el esquema esquema_pedidos que se llame 
--v_productos_mas100stock y que devuelva la descripción, 
--el precio y las existencias de los productos de PRODUCTO2 que superan 
--las 100 unidades en stock. Los campos de la vista 
--se llamarán PRODUCTO, IMPORTE y UNIDADES_EXISTENTES y no le puedes 
--dar el nombre a los campos en el SELECT de la vista.
USE EMPLEADOS;
GO
CREATE VIEW esquema_pedidos.v_productos_mas100stock (PRODUCTO, IMPORTE, UNIDADES_EXISTENTES)
AS
	select descripcion, precio, existencias
	from esquema_pedidos.PRODUCTO2
	where existencias>100;
--14.	Modifica la vista v_productos_mas100stock para que su 
--código esté cifrado.
USE EMPLEADOS;
GO
ALTER VIEW esquema_pedidos.v_productos_mas100stock (PRODUCTO, IMPORTE, UNIDADES_EXISTENTES)
WITH ENCRYPTION
AS
	select descripcion, precio, existencias
	from esquema_pedidos.PRODUCTO2
	where existencias>100;
--15.	Modifica la vista v_productos_mas100stock para que no 
--se puedan insertar, modificar ni borrar productos a 
--través de ella con stock menor o igual a 100 existencias.
USE EMPLEADOS;
GO
ALTER VIEW esquema_pedidos.v_productos_mas100stock (PRODUCTO, IMPORTE, UNIDADES_EXISTENTES)
WITH ENCRYPTION
AS
	select descripcion, precio, existencias
	from esquema_pedidos.PRODUCTO2
	where existencias>100
WITH CHECK OPTION;

--16.	Modifica la v_productos_mas100stock para que no se pueda ni 
--eliminar, ni ejecutar instrucciones ALTER sobre la 
--tabla PRODUCTO2 del esquema esquema_pedidos. Es decir, debes vincular 
--la vista al esquema esquema_pedidos.
USE EMPLEADOS;
GO
ALTER VIEW esquema_pedidos.v_productos_mas100stock (PRODUCTO, IMPORTE, UNIDADES_EXISTENTES)
WITH SCHEMABINDING, ENCRYPTION
AS
	select descripcion, precio, existencias
	from esquema_pedidos.PRODUCTO2
	where existencias>100
WITH CHECK OPTION;

--17.	Intenta eliminar la tabla PRODUCTO2 del esquema esquema_pedidos. ¿Te lo permite? ¿por qué?
USE EMPLEADOS;
GO
DROP TABLE esquema_pedidos.PRODUCTO2;

NO LO PERMITE porque
No se puede DROP TABLE 'esquema_pedidos.PRODUCTO2' 
porque se le hace referencia en el objeto 'v_productos_mas100stock'.

--18.	Usando el procedimiento almacenado adecuado consulta el texto de la vista v_productos_mas100stock. 
--¿Te muestra el texto? ¿Por qué?
USE EMPLEADOS;
GO
EXECUTE sp_helptext v_productos_mas100stock;

No lo permite por el WITH ENCRYPTION

--19.	Escribe la instrucción que cambia el propietario del 
--esquema esquema_pedidos al usuario programador.
USE EMPLEADOS;
GO
ALTER AUTHORIZATION 
ON SCHEMA::esquema_pedidos
TO programador;

--20.	Suponiendo que en tu equipo existe un usuario de Windows de 
--nombre LoginSQL qué instrucción o instrucciones 
--realizarías para que se pueda conectar al servidor SQL Server.
CREATE LOGIN "MiEquipo\LoginSQL"
FROM WINDOWS;

--21.	Crea un usuario en la BD EMPLEADOS de nombre inicio_sesion_02 
--y asociado a un inicio de sesión con el 
--mismo nombre y con contraseña abc
USE EMPLEADOS;
GO
CREATE LOGIN inicio_sesion_02
WITH password='abc';
--DEFAULT_DATABASE=EMPLEADOS;
GO
CREATE USER inicio_sesion_02
FOR LOGIN inicio_sesion_02
GO
--22.	Crea un usuario en la BD EMPLEADOS de nombre inicio_sesion_03 y 
--asociado a un inicio de sesión con el 
--mismo nombre y con contraseña abc
USE EMPLEADOS;
GO
CREATE LOGIN inicio_sesion_03
WITH password='abc';
--DEFAULT_DATABASE=EMPLEADOS;
GO
CREATE USER inicio_sesion_03
FOR LOGIN inicio_sesion_03
GO

--23.	Como sa dale el permiso de SELECT sobre REPVENTAS a  
--inicio_sesion_02 de tal manera que pueda conceder 
--ese permiso a otros.
USE EMPLEADOS;
GO
GRANT SELECT 
ON REPVENTAS
TO inicio_sesion_02
WITH GRANT OPTION;

--24.	Quítale a inicio_sesion_02 el permiso de concederlo a otros. 
--Ejecuta una instrucción de consulta sobre 
--REPVENTAS siendo inicio_sesion_02. ¿Puedes hacerlo? ¿Por qué?
USE EMPLEADOS;
GO
REVOKE GRANT OPTION FOR SELECT
ON REPVENTAS
TO inicio_sesion_02
CASCADE;

Como inicio_sesion_02 lanzamos la consulta
use EMPLEADOS;
GO
select * from repventas;
Podemos realizarla porque el permiso lo tenemos, 
sólo le quitamos la posibilidad de concederlo

--25.	Como inicio_sesion_02 concédele el permiso de SELECT sobre 
--REPVENTAS a  inicio_sesion_03.  
--¿Puedes hacerlo? ¿Por qué?
use EMPLEADOS;
GO
GRANT SELECT
ON REPVENTAS 
TO inicio_sesion_03;

NO podemos porque no tenemos permiso para conceder ese permiso,
ya que s elo hemos quitado en el apartado 8.24

--26.	Quítale a inicio_sesion_02 el permiso de consulta sobre REPVENTAS. 
--Ejecuta una instrucción de consulta 
--sobre REPVENTAS siendo inicio_sesion_02. ¿Puedes hacerlo? ¿Por qué?
use EMPLEADOS;
GO
REVOKE SELECT
ON REPVENTAS
TO inicio_sesion_02;

Como inicio_sesion_02 ejecutamos
use EMPLEADOS;
GO
select * from repventas;
y vemos que no nos permite realizar la consulta pq le hemos quitado el permiso

--27.	Como sa dale al usuario inicio_sesion_03 el permiso de borrar 
--cualquier fila de cualquier objeto de la bd.
USE EMPLEADOS;
GO
GRANT DELETE 
TO inicio_sesion_03;

--28.	Quítale el permiso anterior y comprueba que ahora no puedes lanzar una 
--instrucción de borrado sobre la 
--tabla OFICINA. (Usa transacciones en el borrado por si te equivocas).
USE EMPLEADOS;
GO
DENY DELETE 
TO inicio_sesion_03;

Nos conectamos como inicio_sesion_03
y lanzamos las siguientes instrucciones
USE EMPLEADOS;
GO
begin tran 
DELETE FROM CLIENTE;
Nos da un error porque no tiene permiso DELETE sobre CLIENTE

--29.	El director de la empresa quiere poder realizar las mismas 
--funciones en nuestra instancia de bd que sa. 
--Realiza las instrucciones de T-SQL necesarias para que se pueda conectar 
--(se conectará con nombre director y 
--contraseña director) y para que  realice cualquier función en cualquier bd 
--como haría el sa. 
USE master;
GO
CREATE LOGIN director
WITH password='director';

EXECUTE sp_addsrvrolemember director, sysadmin;

--30.	Conectado como director y desde la bd master y sin usar la instrucción USE, realiza una consulta a la 
--tabla ACTIVIDAD de la bd SOCIOS.
El login se conecta por defecto a master y desde allí lanzamos la instrucción

SELECT *
FROM SOCIOS.dbo.ACTIVIDAD;

Nos devuelve toda la información de la tabla

/****************FIN  TAREA Usuarios.2    ********************************/

