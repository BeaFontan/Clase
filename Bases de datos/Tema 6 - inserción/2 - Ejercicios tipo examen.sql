--1. Realiza lo que se te pide en los siguientes apartados sobre la BD que se te indica al 
--principio del apartado. Si no se indica ninguna escoge la más conveniente para la 
--realización correcta del apartado.

--1.1. BD EMPRESA. Usando instrucciones TPL realiza la siguiente consulta:
--Instrucción que añade un nuevo producto de nombre PRODUTO_EXAME, con:
-- código de fabricante KIN, 
-- identificador de producto ABABA, e,
-- precio el mismo del producto con descripción Cable USB a micro USB, y,
-- existencias 20 menos de las del producto con descripción Cable USB a micro USB.

BEGIN TRAN



ROLLBACK;


--1.2. BD EMPRESA. Usando instrucciones TPL realiza a siguiente consulta:
--Instrucción que añade una nueva sucursal con:
-- identificador 77, 
-- ciudad PONTEVEDRA, 
-- región la misma que la de la oficina de VIGO, 
-- director el que tiene por nombre completo CARLOS GRIMM, y,
-- objetivo 1000€ más del máximo objetivo de las sucursales actuales. Por ejemplo, si
--antes de añadir la nueva sucursal el objetivo más alto de todas las sucursales es
--805.000, el objetivo de la nueva sucursal será 806.000

BEGIN TRAN



ROLLBACK;



--1.3. BD SOCIEDADE_CULTURAL. Usando instrucciones TPL realiza la siguiente consulta:
--Instrucción que añade tres aulas nuevas:
--numero descricion estado superficie
--10 AULA_10 M 25
--20 AULA_20 B 45
--30 AULA_30 B 60
--Para añadir las aulas solo se podrá usar una instrucción (sin tener en cuenta las 
--instrucciones TPL).

BEGIN TRAN



ROLLBACK;




--1.4. BD SOCIEDADE_CULTURAL. Usando instrucciones TPL realiza la siguiente consulta:
--Instrucción que a todas las actividades que ya acabaron a día de hoy y su precio es inferior 
--a 300€, les haga los siguientes cambios: 
-- Adelante en un mes su fecha de fin, es decir, que terminen un mes antes,
-- triplique su número de plazas, y,
-- rebaje el precio en un 7%.

BEGIN TRAN



ROLLBACK;


--1.5. BD EMPRESA. Usando instrucciones TPL realiza la siguiente consulta:
--Instrucción que cambie la cuota de ventas de cada empleado para que coincida con el 
--objetivo de la sucursal en la que trabaja. 

BEGIN TRAN



ROLLBACK;

--1.6. BD SOCIEDADE_CULTURAL. 
--IMPORTANTE: NO USES instrucciones TPL para realizar la siguiente consulta:
--Instrucción que crea una tabla temporal EMPLEADO_NO_ASISTE_ACTI, solo accesible en 
--la sesión actual, con nif, nombre, primer apellido y salario mensual de los empleados que 
--no asisten a actividades.
--Los nombres de las columnas de la tabla nueva serán DocId, nombre de pila, ape1 y
--salario. (Si el nombre del campo tiene espacios en blanco respétalos).

BEGIN TRAN



ROLLBACK;


--1.7. BD EMPRESA.
--IMPORTANTE: NO USES instrucciones TPL para realizar la siguiente consulta:
--Instrucción que crea una tabla permanente de nombre SUCURSAL_OESTE que tenga las
--mismas columnas que SUCURSAL, pero que contenga solamente la información de las 
--sucursales de la región Oeste.
--Los nombres de las columnas de la tabla nueva serán Id, localidade, zona, director y obj.

BEGIN TRAN



ROLLBACK;


--1.8. BD SOCIEDADE_CULTURAL. Usando instrucciones TPL realiza a siguiente consulta:
--Instrucción que elimine del modo más rápido y menos costoso posible, los empleados de
--la tabla EMPLEADO_NO_ASISTE_ACTI que tengan un salario mensual superior a 600€.

BEGIN TRAN



ROLLBACK;


--1.9. BD EMPRESA. Usando instrucciones TPL realiza a siguiente consulta:
--Instrucción que elimine del modo más rápido y menos costoso posible todas las filas de la 
--tabla SUCURSAL_OESTE.

BEGIN TRAN



ROLLBACK;



--1.10. BD EMPRESA. Usando instrucciones TPL realiza a siguiente consulta:
--IMPORTANTE: No se permite usar subconsultas para hacer el borrado.
--Instrucción que elimine los pedidos de los empleados que trabajan en sucursales de la 
--región OESTE.



BEGIN TRAN



ROLLBACK;