--1. VISTAS-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- TAREA Vistas.1: Trabajando con vistas.

--1. En la BD SOCIOS crea una vista de nombre v_inf_profesor que contenga todos los datos de los 
--profesores de la tabla EMPLEADO y también la especialidad de cada uno.

use SOCIOS;
go

create view v_inf_profesor
as
select [numero], [nif], [nss], [nome], [ape1], [ape2], [tipo_via_enderezo], [rua_enderezo], [num_casa_enderezo], [piso_enderezo], [localidade_enderezo], [codpostal_enderezo], [cod_provincia_enderezo], [tel_fixo], [tel_mobil], [salario_mes], [cargo], p.especialidade
from PROFESORADO p inner join EMPREGADO e on p.num_prof = e.numero;


select * from v_inf_profesor;


--2. Modifica la vista v_inf_profesor para que almacene los datos de los profesores que están en la tabla 
--de empleados, pero sin la especialidad.

use SOCIOS;
go

alter view v_inf_profesor
as
select [numero], [nif], [nss], [nome], [ape1], [ape2], [tipo_via_enderezo], [rua_enderezo], [num_casa_enderezo], [piso_enderezo], [localidade_enderezo], [codpostal_enderezo], [cod_provincia_enderezo], [tel_fixo], [tel_mobil], [salario_mes], [cargo]
from PROFESORADO p inner join EMPREGADO e on p.num_prof = e.numero;

select * from v_inf_profesor;


--3. Modifica la vista v_inf_profesor para que ahora su código esté cifrado. Comprueba con el 
--procedimiento almacenado del sistema sp_helptext qué ocurre cuando quieres consultar el texto de 
--la vista.

use SOCIOS;
go

alter view v_inf_profesor
WITH ENCRYPTION
AS
select [numero], [nif], [nss], [nome], [ape1], [ape2], [tipo_via_enderezo], [rua_enderezo], [num_casa_enderezo], [piso_enderezo], [localidade_enderezo], [codpostal_enderezo], [cod_provincia_enderezo], [tel_fixo], [tel_mobil], [salario_mes], [cargo]
from PROFESORADO p inner join EMPREGADO e on p.num_prof = e.numero;

EXEC sp_helptext 'v_inf_profesor';

select * from v_inf_profesor;


--4. Elimina la vista v_inf_profesor creada anteriormente.

drop view v_inf_profesor;

--5. En la BD EMPLEADOS crea una vista de nombre v_vendedores_oeste que muestre los nombres de 
--los vendedores de la región OESTE. Realiza la instrucción que muestra los datos de la vista.

use EMPLEADOS_BEA;
go

create view v_vendedores_oeste
as
select r.NOMBRE
from REPVENTAS r inner join OFICINA o on r.OFICINA_REP = o.OFICINA
where REGION = 'OESTE';

select * from v_vendedores_oeste;



--6. En la BD EMPLEADOS crea la vista v_pedidos_clientes_del_vend102 que contenga solamente los 
--pedidos remitidos por clientes asignados al vendedor 102.
use EMPLEADOS_BEA;
go

create view v_pedidos_clientes_del_vend102
as
select [NUM_PEDIDO], [FECHA_PEDIDO], [CLIE], [REP], [FAB], [PRODUCTO], [CANT], [IMPORTE]
from PEDIDO p inner join CLIENTE c on p.CLIE = c.NUM_CLIE
where p.REP = 102;

select * from v_pedidos_clientes_del_vend102;


--7. En la BD EMPLEADOS definir una vista de nombre v_cliente_y_su_vendedor sobre la tabla CLIENTE 
--que incluya únicamente los nombres de los clientes y los vendedores a los que están asignados.

use EMPLEADOS_BEA;
go

create view v_cliente_y_su_vendedor
as
select c.EMPRESA, r.NOMBRE
from CLIENTE c inner join REPVENTAS r on c.REPCLIE = r.NUM_EMPL;

select * from v_cliente_y_su_vendedor;



--8. En la BD EMPLEADOS crea una vista de nombre v_oficinas_ventas_altas que devuelva todos los 
--datos de las oficinas con ventas superiores a 500.000.

use EMPLEADOS_BEA;
go

create view v_oficinas_ventas_altas
as
select OFICINA, CIUDAD, REGION, DIR, OBJETIVO, VENTAS
from OFICINA
where VENTAS > 500000;

select * from v_oficinas_ventas_altas;


select * from OFICINA;


--9. Utilizando transacciones para no realizar los cambios en la bd, ejecuta la consulta que inserte una 
--nueva oficina a través de la vista v_oficinas_ventas_altas con los siguientes datos:
--OFICINA CIUDAD REGIÓN DIR OBJETIVO VENTAS
--77 NEGREIRA NOROESTE 105 300.000 100.000
--¿Te permite hacer la inserción? Si es así comprueba si se ha añadido la fila y deshaz la transacción. 
--Si no te lo permite ¿sabrías explicar por qué?
--SÍ SE HACE LA INSERCCIÓN EN LA TABLA OFICINA, PERO NO APARECE EN LA VIEW, PORQUE NO SE CUMPLE LA CONDICIÓN DE >500000 EN VENTAS.

use EMPLEADOS_BEA;
go

begin tran
insert into v_oficinas_ventas_altas (OFICINA, CIUDAD, REGION, DIR, OBJETIVO, VENTAS)
	values(77, 'NEGREIRA',' NOROESTE', 105, 300000, 100000);

select * from v_oficinas_ventas_altas;


select * from OFICINA;


rollback;


--10. Modifica la vista v_oficinas_ventas_altas añadiéndole la cláusula WITH CHECK OPTION. A 
--continuación intenta, usando transacciones, insertar la misma fila de antes en la tabla OFICINA pero 
--a través de la vista.
--¿Te permite hacer la inserción? Si es así comprueba si se ha añadido la fila y deshaz la transacción. 
--Si no te lo permite ¿sabrías explicar por qué? 

--NO ME LO PERMITE PORQUE SALTA EL CHECK, es decir, hace la comprobación que le hemos puesto a la vista y si no la cumple, 
--no deja insertar ni en la vista ni en la tabla.

--Quítale la cláusula WITH CHECK OPTION a la vista.

use EMPLEADOS_BEA;
go


ALTER VIEW v_oficinas_ventas_altas AS
SELECT 
    OFICINA,
    CIUDAD,
    REGION,
    DIR,
    OBJETIVO,
    VENTAS
FROM OFICINA
WHERE VENTAS > 500000
WITH CHECK OPTION; 



begin tran

insert into v_oficinas_ventas_altas (OFICINA, CIUDAD, REGION, DIR, OBJETIVO, VENTAS)
	   values(77, 'NEGREIRA',' NOROESTE', 105, 300000, 100000);

select * from v_oficinas_ventas_altas;


select * from OFICINA;


rollback;


ALTER VIEW v_oficinas_ventas_altas AS
SELECT 
    OFICINA,
    CIUDAD,
    REGION,
    DIR,
    OBJETIVO,
    VENTAS
FROM OFICINA
WHERE VENTAS > 500000; 



--11. Crea una tabla de nombre OFI_PRUEBA que contenga los mismos datos que la tabla OFICINA. Ahora 
--crea una vista de nombre v_oficinas_este que contengan todos los datos de las oficinas de la región 
--este de la tabla OFI_PRUEBA, pero los campos en la vista se llamarán:
--CODIGO NOMBRE ZONA DIRECTOR VENTAS_ESPERADAS VENTAS_ACTUALES

--Una vez creada la vista y comprobado su contenido, intenta borrar la tabla OFI_PRUEBA. ¿Te lo 
--permite el servidor? --Si.

--En caso de que te lo haya permitido, crea la tabla OFI_PRUEBA de nuevo y modifica la definición de 
--la vista de tal manera que cuando se intente borrar la tabla sobre la que se ha definido la vista no 
--nos lo permita.
--Intenta ahora borrar la tabla OFI_PRUEBA de nuevo y comprueba qué ocurre ¿tiene sentido?


select * into OFI_PRUEBA from OFICINA;

select * from OFI_PRUEBA;

CREATE view v_oficinas_este
as
select [OFICINA] as CODIGO, [CIUDAD] as NOMBRE, [REGION] as ZONA, [DIR] as DIRECTOR, [OBJETIVO] as VENTAS_ESPERADAS, [VENTAS] AS VENTAS_ACTUALES
from OFI_PRUEBA
where REGION = 'ESTE';

select * from v_oficinas_este;

drop table OFI_PRUEBA;


--AHORA CON :








--2. GESTIÓN DE USUARIOS EN SQL Server -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- TAREA Usuarios.1: Trabajando con usuarios y esquemas.

--1. Conéctate al servidor de tu máquina virtual.


--2. En la BD EMPLEADOS crea tres usuarios de nombres tarea2_usu1, tarea2_usu2 y tarea2_usu3. 
--Recuerda que cada usuario debe tener un inicio de sesión asociado (créalos con el mismo nombre 
--que el usuario, contraseña la misma que el nombre del login y bd por defecto EMPLEADOS). No 
--indiques esquema por defecto a los usuarios.




--3. Crea en la BD EMPLEADOS el esquema Pruebas_tu_nombre (en mi caso sería Pruebas_Monica) con 
--propietario tarea2_usu1. En la misma instrucción crea una tabla de nombre Fabricante con 2 campos:
--- Identificador char(3) clave primaria
--- Nombre char(20) clave candidata




--4. Establece 3 conexiones nuevas, una por cada inicio de sesión que has creado.





--5. Realiza la consulta que devuelva toda la información de la tabla Fabricante en cada una de las 
--diferentes sesiones. ¿Qué resultado obtienes? ¿Entiendes por qué con el usuario tarea2_usu1 puedes 
--consultar la tabla y con los demás no?




--6. Cambia el usuario propietario del esquema Pruebas_tu_nombre por tarea2_usu3. Realiza la consulta 
--que devuelva toda la información de la tabla Fabricante para los usuarios tarea2_usu1 y tarea2_usu3. 
--¿Qué usuario/s pueden consultar ahora la tabla Fabricante?



--7. Crea en la BD EMPLEADOS el esquema Pruebas_tu_nombre2 (en mi caso sería Pruebas_Monica2) 
--con propietario tarea2_usu2.



--8. Dentro del esquema Pruebas_tu_nombre2 crea una tabla cliente2 con la misma estructura y 
--contenido que la tabla cliente de la BD EMPLEADOS.



--9. Realiza la consulta que devuelva toda la información de la tabla cliente2 desde las conexiones de los 3 
--usuarios que has creado. ¿Qué usuario/s pueden consultar la tabla cliente2?



--10. Mueve la tabla cliente2 al primer esquema creado Pruebas_tu_nombre. Realiza la consulta que 
--devuelva toda la información de la tabla cliente2 desde las conexiones de los 3 usuarios que has 
--creado. Realiza la consulta adecuada para obtener el contenido de cliente2. ¿Qué usuario/s pueden 
--consultar la tabla cliente2? 



--11. Intenta eliminar el esquema Pruebas_tu_nombre. ¿Te lo permite? ¿Entiendes por qué?




--12. Intenta eliminar el esquema Pruebas_tu_nombre2. ¿Te lo permite? ¿Entiendes por qué?




-- TAREA Usuarios.2: Gestión de usuarios, permisos y roles (ejercicio de tipo examen).----------------------------

--1. Necesitamos que con nuestra bd puedan trabajar, por el momento, 3 usuarios con los siguientes 
--datos:
--- Jefe_proyecto, bd por defecto EMPLEADOS y contraseña abc
--- Programador, bd por defecto EMPLEADOS y contraseña abc
--- Usu_ingenuo, bd por defecto EMPLEADOS y contraseña abc



--2. El jefe de proyecto deberá poder trabajar con la bd con los mismos permisos que si hubiese sido él 
--quién creó la bd.



--3. El programador deberá poder leer y también escribir en cualquier objeto que existe en la bd, pero 
--también en cualquiera de los que se vaya a crear, sin necesidad de darle los permisos sobre cada 
--objeto.


--4. El usuario ingenuo sólo podrá consultar alguna información, pero nunca directamente sobre las 
--tablas. Debemos crear las estructuras que permitirán al usuario consultar la información sin acceder 
--directamente a las tablas. Además estas estructuras deberán crearse organizadas todas juntas en una 
--nueva estructura que a partir de aquí llamaré estructura_usu_ingenuo. 
--DATOS QUE PODRÁ CONSULTAR EL USUARIO INGENUO:
--- Nombre y edad del vendedor y el nombre de la oficina de aquellos vendedores que 
--trabajan en oficinas de la región este. Las columnas resultantes se llamarán VENDEDOR, 
--AÑOS, OFICINA. Para darle el nombre a las columnas no podrás hacerlo usando alias en 
--el SELECT. 
--- Todos los datos de las oficinas de la región ESTE. Crea esta estructura de tal manera que 
--a través de ella no se puedan realizar operaciones que vulneren las condiciones del 
--where.




--5. El usuario ingenuo deberá poder consultar cualquiera de las estructuras que has creado en la 
--estructura_usu_ingenuo y todas las que vayas a crear dentro de ella en un futuro, sin que tengamos 
--que darle el permiso correspondiente sobre cada objeto.



--6. Crea en el esquema dbo una copia de las tablas PEDIDO y PRODUCTO de nombres PEDIDO2 y 
--PRODUCTO2 (no uses la instrucción CREATE TABLE).



--7. Crea un esquema de nombre esquema_pedidos y mueve las 2 tablas nuevas PEDIDO2 y PRODUCTO2 
--a este esquema.




--8. Realiza la instrucción que permite que cualquier usuario existente en la bd EMPLEADOS o cualquiera 
--que se cree en un futuro, pueda consultar y eliminar filas de la tabla PEDIDO2.



--9. Crea el inicio de sesión (sólo el inicio de sesión) inicio_sesion_01 con contraseña abc y bd por defecto 
--EMPLEADOS. La primera vez que se conecte el inicio de sesión inicio_sesion_01 al servidor deberá 
--cambiar la contraseña.
--¿Puede conectarse inicio_sesion_01 al servidor? ¿Por qué?





--10. Usando T-SQL consigue que el inicio de sesión inicio_sesion_01 pueda conectarse a EMPLEADOS sin 
--crearle usuario en la bd EMPLEADOS.




--11. ¿Puede el inicio de sesión inicio_sesion_01 consultar la tabla PEDIDO2? ¿Por qué?



--12. ¿Puede el inicio de sesión inicio_sesion_01 consultar la tabla PRODUCTO2? ¿Por qué?



--13. Crea una vista en el esquema esquema_pedidos que se llame v_productos_mas100stock y que 
--devuelva la descripción, el precio y las existencias de los productos de PRODUCTO2 que superan las 
--100 unidades en stock. Los campos de la vista se llamarán PRODUCTO, IMPORTE y
--UNIDADES_EXISTENTES y no le puedes dar el nombre a los campos en el SELECT de la vista.




--14. Modifica la vista v_productos_mas100stock para que su código esté cifrado.




--15. Modifica la vista v_productos_mas100stock para que no se puedan insertar, modificar ni borrar 
--productos a través de ella con stock menor o igual a 100 existencias.




--16. Modifica la v_productos_mas100stock para que no se pueda ni eliminar, ni ejecutar instrucciones 
--ALTER sobre la tabla PRODUCTO2 del esquema esquema_pedidos. Es decir, debes vincular la vista al 
--esquema esquema_pedidos.




--17. Intenta eliminar la tabla PRODUCTO2 del esquema esquema_pedidos. ¿Te lo permite? ¿por qué?



--18. Usando el procedimiento almacenado adecuado consulta el texto de la vista 
--v_productos_mas100stock. ¿Te muestra el texto? ¿Por qué?



--19. Escribe la instrucción que cambia el propietario del esquema esquema_pedidos al usuario 
--programador.



--20. Suponiendo que en tu equipo existe un usuario de Windows de nombre LoginSQL qué instrucción o 
--instrucciones realizarías para que se pueda conectar al servidor SQL Server.



--21. Crea un usuario en la BD EMPLEADOS de nombre inicio_sesion_02 y asociado a un inicio de sesión 
--con el mismo nombre y con contraseña abc



--22. Crea un usuario en la BD EMPLEADOS de nombre inicio_sesion_03 y asociado a un inicio de sesión 
--con el mismo nombre y con contraseña abc



--23. Como sa dale el permiso de SELECT sobre REPVENTAS a inicio_sesion_02 de tal manera que pueda 
--conceder ese permiso a otros.



--24. Quítale a inicio_sesion_02 el permiso de concederlo a otros. Ejecuta una instrucción de consulta 
--sobre REPVENTAS siendo inicio_sesion_02. ¿Puedes hacerlo? ¿Por qué?


--25. Como inicio_sesion_02 concédele el permiso de SELECT sobre REPVENTAS a inicio_sesion_03. 
--¿Puedes hacerlo? ¿Por qué?


--26. Quítale a inicio_sesion_02 el permiso de consulta sobre REPVENTAS. Ejecuta una instrucción de 
--consulta sobre REPVENTAS siendo inicio_sesion_02. ¿Puedes hacerlo? ¿Por qué?



--27. Como sa dale al usuario inicio_sesion_03 el permiso de borrar cualquier fila de cualquier objeto de la 
--bd.


--28. Quítale el permiso anterior y comprueba que ahora no puedes lanzar una instrucción de borrado 
--sobre la tabla OFICINA. (Usa transacciones en el borrado por si te equivocas).



--29. El director de la empresa quiere poder realizar las mismas funciones en nuestra instancia de bd que 
--sa. Realiza las instrucciones de T-SQL necesarias para que se pueda conectar (se conectará con 
--nombre director y contraseña director) y para que realice cualquier función en cualquier bd como 
--haría el sa. 


--30. Conectado como director y desde la bd master y sin usar la instrucción USE, realiza una consulta a la 
--tabla ACTIVIDAD de la bd SOCIOS