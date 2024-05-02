-- TAREA 1: BD EMPLEADOS (no EMPRESA).
--CONSULTAS de actualización de información (usa DML):

--1.1. Añadir como nuevo vendedor en la tabla REPVENTAS a Henry Jacobsen de 36 años, con 
--número de empleado 120, con título Dir Ventas, con director el 108, contrato fechado el 25 
--de julio de 1990 y trabajando en la oficina número 13.
USE EMPLEADOS_BEA;
GO
BEGIN TRAN

select * from REPVENTAS;

--LOS CORCHETES HAY QUE QUITARLOS????????????????????????????????????????????

insert into REPVENTAS([NUM_EMPL], [NOMBRE], [EDAD], [OFICINA_REP], [TITULO], [CONTRATO], [DIRECTOR], [CUOTA], [VENTAS])
				values(120, 'Henry Jacobsen', 36, 13, 'Dir Ventas', '25/07/1990', 108, null, 0);

select * from REPVENTAS;

GO
ROLLBACK;


--1.2. Inserta como nuevo cliente del Sr. Jacobsen a la empresa INTERCORP con número de cliente 
--2127 y límite de crédito 15000.
USE EMPLEADOS_BEA;
GO
BEGIN TRAN

select * from CLIENTE;

insert into CLIENTE(NUM_CLIE, EMPRESA, REPCLIE, LIMITE_CREDITO)
			values(2127, 'INTERCORP', 120, 15000);

select * from CLIENTE;

GO
ROLLBACK;


--1.3. Inserta un nuevo pedido para el Sr. Jacobsen por importe de 2340, del fabricante ACI, con 
--número de producto 41004, compuesto por 20 unidades, pedido en la fecha actual y con 
--número de pedido 113070.

USE EMPLEADOS_BEA;
GO

insert into PEDIDO (NUM_PEDIDO,FECHA_PEDIDO, CLIE, REP, FAB, PRODUCTO, CANT, IMPORTE)
			values(113070, GETDATE(), 2127, 120, 'ACI', '41004', 20, 2340);

--ME SALTA UNA RESTRICCIÓN DE FOREINGN KEY 'FK_PEDIDO_CLIENTE'-------------------------------------------

select * from PEDIDO;

GO
ROLLBACK;

--1.4. Crea una tabla de nombre ANTPEDIDO con el número de pedido, la fecha y el importe de 
--todos los pedidos remitidos con anterioridad al 1 de enero de 1990. (Crea la tabla con la 
--instrucción CREATE TABLE –campos: num_pedido(PK), fecha_pedido, importe- y después 
--agrégale las filas de la tabla PEDIDO que cumplan la condición especificada).
USE EMPLEADOS_BEA;
GO
BEGIN TRAN

CREATE TABLE ANTPEDIDO(
num_pedido numeric(18,0) not null, --porqué 18?
fecha_pedido datetime not null,
importe numeric(18,0) not null, --porqué numeric

constraint PK_num_pedido_ANTPEDIDO primary key(num_pedido)
);

insert into ANTPEDIDO
select NUM_PEDIDO, FECHA_PEDIDO, IMPORTE from PEDIDO where FECHA_PEDIDO < '01-01-1990';

select * from ANTPEDIDO;

GO
ROLLBACK;



--1.5. Elimina de la tabla REPVENTAS toda la información relativa a Henry Jacobsen. Elimina también 
--de la tabla PEDIDO todos aquellos realizados por el cliente 2127. Además suprime de la tabla 
--de los pedidos aquellos remitidos antes del 15 de noviembre de 1989.
USE EMPLEADOS_BEA;
GO
BEGIN TRAN

delete from PEDIDO
where CLIE = 2127 or FECHA_PEDIDO < '15/11/1989';

delete from REPVENTAS
where NOMBRE = 'Henry Jacobsen';

GO
ROLLBACK;



--1.6. Suprime todos aquellos vendedores contratados antes de julio de 1988 a los que aún no se les 
--ha asignado una cuota. Si el servidor te da un error relativo a la integridad referencial, elimina 
--las filas que no te permiten hacer el borrado o deshabilita las restricciones necesarias.
USE EMPLEADOS_BEA;
GO
BEGIN TRAN

--Previamente hay que eliminar las filas de pedidos 
--de los vendedores que queremos eliminar
DELETE FROM pedido
FROM PEDIDO p, REPVENTAS r
WHERE r.CONTRATO<'01-07-1988' AND
      r.CUOTA IS NULL  AND
      p.REP=r.NUM_EMPL;

select * from REPVENTAS;

delete from REPVENTAS
where CONTRATO < '01/07/1988' and CUOTA is null;

select * from REPVENTAS;

GO
ROLLBACK;



--1.7. Vacía la tabla ANTPEDIDO de la manera más rápida posible y de tal manera que no se guarde 
--registro en el servidor de las eliminaciones de cada fila individual.
USE EMPLEADOS_BEA;
GO
BEGIN TRAN

truncate table ANTPEDIDO;

GO
ROLLBACK;


--1.8. Aumenta el límite de crédito de la empresa Acme Mfg. a 60000 y reasigna esa empresa al 
--representante de ventas número 109.
USE EMPLEADOS_BEA;
GO
BEGIN TRAN

select * from CLIENTE;

update CLIENTE
set LIMITE_CREDITO=60000, REPCLIE=109
where EMPRESA = 'Acme Mfg.';

select * from CLIENTE;


GO
ROLLBACK;


--1.9. Transfiere todos los vendedores de la oficina 12 de Chicago a la oficina número 11 de Nueva 
--York y rebaja sus cuotas un 10%.
USE EMPLEADOS_BEA;
GO
BEGIN TRAN

select * from REPVENTAS;

update REPVENTAS
set OFICINA_REP = 11, CUOTA=CUOTA*0.90
where OFICINA_REP = 12;

GO
ROLLBACK;


--1.10. Elimina de la bd la tabla ANTPEDIDO que creaste en el apartado 1.4. Una vez eliminada debes 
--volver a crearla con la misma información que se te pidió en el apartado 1.4, pero ahora no 
--puedes usar la instrucción CREATE TABLE. Los nombres de los campos de la tabla ANTPEDIDO 
--serán: numero, fecha y total.
USE EMPLEADOS_BEA;
GO
BEGIN TRAN

DROP TABLE ANTPEDIDO;--OJO, drop, truncate solo borra filas pero no la tabla.

SELECT num_pedido as numero, fecha_pedido as fecha, importe as total INTO ANTPEDIDO
FROM PEDIDO
WHERE FECHA_PEDIDO<'1-1-1990';

select * from ANTPEDIDO;

GO
ROLLBACK;


