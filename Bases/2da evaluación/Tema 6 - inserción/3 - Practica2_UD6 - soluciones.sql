--UD6. ACTUALIZACIÓN DE LA INFORMACIÓN DE LA BASE DE DATOS (DML). TAREAS
--TAREA 1:  BD EMPLEADOS (no EMPRESA)
--	CONSULTAS de actualización de información (usa DML):
USE EMPLEADOS;
--1.1.	Añadir como nuevo vendedor en la tabla REPVENTAS a Henry Jacobsen de 36 años, con número de empleado 120, 
--con título Dir Ventas, con  director el 108, contrato fechado el 25 de julio de 1990 y trabajando en la oficina número 13.

INSERT INTO REPVENTAS (NUM_EMPL, NOMBRE, EDAD, OFICINA_REP, TITULO, CONTRATO, DIRECTOR, CUOTA, VENTAS)
VALUES (120, 'HENRY JACOBSEN', 36, 13, 'DIR VENTAS', '25/7/1990', 108, NULL, 0);	

--1.2.	Inserta como nuevo cliente del Sr. Jacobsen a la empresa INTERCORP 
--con número de cliente 2127 y límite de crédito 15000.
INSERT INTO CLIENTE (NUM_CLIE,EMPRESA,REPCLIE,LIMITE_CREDITO)
VALUES (2127, 'INTERCORP', 120, 15000);

--1.3.	Inserta un nuevo pedido para el Sr. Jacobsen por importe de 2340, del fabricante ACI, 
--con número de producto 41004, compuesto por 20 unidades, pedido en la fecha actual y con número de pedido 113070.
INSERT INTO PEDIDO (NUM_PEDIDO, FECHA_PEDIDO, CLIE, REP, FAB, PRODUCTO, CANT, IMPORTE)
VALUES (113070, GETDATE(), 2127, 120, 'ACI', '41004', 20, 2340);

--1.4.	Crea una tabla de nombre ANTPEDIDO con el número de pedido, la fecha y el importe de todos 
--los pedidos remitidos con anterioridad al 1 de enero de 1990. (Crea la tabla con la instrucción
--CREATE TABLE –campos: num_pedido(PK), fecha_pedido, importe- y después agrégale las filas de la 
--tabla PEDIDO que cumplan la condición especificada).
CREATE TABLE ANTPEDIDO
(num_pedido numeric(18,0) not null,
 fecha_pedido datetime not null,
 importe numeric(18,0) not null,
 CONSTRAINT PK_ANTPEDIDO_num_pedido PRIMARY KEY (num_pedido)
);

INSERT INTO ANTPEDIDO
SELECT num_pedido, fecha_pedido, importe
FROM PEDIDO
WHERE FECHA_PEDIDO<'1-1-1990';

--1.5.	Elimina de la tabla REPVENTAS toda la información relativa a Henry Jacobsen. 
--Elimina también de la tabla PEDIDO todos aquellos realizados por el cliente 2127. 
--Además suprime de la tabla de los pedidos aquellos remitidos antes del  15 de noviembre de 1989.
begin tran

DELETE FROM PEDIDO
WHERE CLIE= 2127 OR
      FECHA_PEDIDO<'15-11-1989';

DELETE FROM REPVENTAS 
WHERE nombre='Henry Jacobsen';

rollback;

--1.6.	Suprime todos aquellos vendedores contratados antes de julio de 1988 a los que aún 
--no se les ha asignado una cuota. Si el servidor te da un error relativo a la integridad referencial, 
--elimina las filas  que no te permiten hacer el borrado o deshabilita las restricciones necesarias.

begin tran
--Previamente hay que eliminar las filas de pedidos 
--de los vendedores que queremos eliminar
DELETE FROM pedido
FROM PEDIDO p, REPVENTAS r
WHERE r.CONTRATO<'01-07-1988' AND
      r.CUOTA IS NULL  AND
      p.REP=r.NUM_EMPL;

--Ahora borramos los vendedores
--que cumplen las condiciones dadas.
DELETE FROM REPVENTAS
WHERE CONTRATO<'01-07-1988' AND 
      CUOTA IS NULL;

rollback;

--1.7.	Vacía la tabla ANTPEDIDO de la manera más rápida posible y de tal manera que no se 
--guarde registro en el servidor de las eliminaciones de cada fila individual.

TRUNCATE TABLE antpedido;

--1.8.	Aumenta el límite de crédito de la empresa Acme Mfg. a 60000 y reasigna esa empresa 
--al representante de ventas número 109.


begin tran

UPDATE CLIENTE
SET LIMITE_CREDITO=60000, REPCLIE=109
WHERE EMPRESA='Acme Mfg.';

rollback;

--1.9.	Transfiere todos los vendedores de la oficina 12 de Chicago a la oficina 
--número 11 de Nueva York y rebaja sus cuotas un 10%.

begin tran

UPDATE REPVENTAS
SET OFICINA_REP=11, CUOTA=CUOTA*0.9
WHERE OFICINA_REP=12

rollback;

--1.10.	Elimina de la bd la tabla ANTPEDIDO que creaste en el apartado 1.4. 
--Una vez eliminada debes volver a crearla con la misma información que se te pidió en el apartado 1.4, 
--pero ahora no puedes usar la instrucción CREATE TABLE. Los nombres de los campos de la tabla
--ANTPEDIDO serán:  numero, fecha y total.

begin tran

DROP TABLE ANTPEDIDO;
SELECT num_pedido as numero, fecha_pedido as fecha, importe as total INTO ANTPEDIDO
FROM PEDIDO
WHERE FECHA_PEDIDO<'1-1-1990';

rollback;


