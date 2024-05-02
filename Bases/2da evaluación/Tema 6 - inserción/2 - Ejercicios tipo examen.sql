--1.1. BD EMPRESA. Usando instrucciones TPL realiza la siguiente consulta:
--Instrucción que añade un nuevo producto de nombre PRODUTO_EXAME, con:
-- código de fabricante KIN, 
-- identificador de producto ABABA, e,
-- precio el mismo del producto con descripción Cable USB a micro USB, y,
-- existencias 20 menos de las del producto con descripción Cable USB a micro USB.

use EMPRESA_BEA;
go
BEGIN TRAN

insert into PRODUTO (cod_fabricante, identificador, descricion, prezo,existencias)
select 'KIN', 'ABABA', 'PRODUTO_EXAME', prezo, existencias-20
from PRODUTO 
where descricion = 'Cable USB a micro USB';

select * from PRODUTO;

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

use EMPRESA_BEA;
go
BEGIN TRAN

insert into SUCURSAL (identificador, cidade, rexion, num_empregado_director, obxectivo)
select 77, 'PONTEVEDRA', rexion, num_empregado_director = (select e.numero from EMPREGADO e where e.nome='CARLOS' and e.ape1='GRIMM' and e.ape2 is null), obxectivo = (select max(obxectivo) from SUCURSAL)+1000
FROM SUCURSAL                                                                                                                            --ojo con ape2, tienes que ponerlo y is null
WHERE cidade = 'VIGO';

select * from SUCURSAL;

ROLLBACK;

select * from EMPREGADO;



--1.3. BD SOCIEDADE_CULTURAL. Usando instrucciones TPL realiza la siguiente consulta:
--Instrucción que añade tres aulas nuevas:
--numero descricion estado superficie
--10 AULA_10 M 25
--20 AULA_20 B 45
--30 AULA_30 B 60
--Para añadir las aulas solo se podrá usar una instrucción (sin tener en cuenta las 
--instrucciones TPL).

use SOCIEDADE_CULTURAL_BEA;
go
BEGIN TRAN

select * from AULA;

insert into AULA ([numero], [descricion], [superficie], [estado])
values (10, 'AULA_10', 25, 'M'),
	   (20, 'AULA_20', 45, 'B'),
	   (30, 'AULA_30', 60, 'B');

select * from AULA;

ROLLBACK;


--1.4. BD SOCIEDADE_CULTURAL. Usando instrucciones TPL realiza la siguiente consulta:
--Instrucción que a todas las actividades que ya acabaron a día de hoy y su precio es inferior 
--a 300€, les haga los siguientes cambios: 
-- Adelante en un mes su fecha de fin, es decir, que terminen un mes antes,
-- triplique su número de plazas, y,
-- rebaje el precio en un 7%.


--COMENTAR A MÓNICA QUE A MI ME DEJÓ HACERLO SIN DESACTIVAR EL CHEC DE LA FECHA.
use SOCIEDADE_CULTURAL_BEA;
go
BEGIN TRAN

select * from ACTIVIDADE;

update ACTIVIDADE
set data_fin = dateadd(month, -1, data_fin),
	num_prazas = num_prazas*3,
	prezo = prezo*0.93
from ACTIVIDADE a
where a.data_fin < GETDATE() and a.prezo < 300;

select * from ACTIVIDADE;

ROLLBACK;


--1.5. BD EMPRESA. Usando instrucciones TPL realiza la siguiente consulta:
--Instrucción que cambie la cuota de ventas de cada empleado para que coincida con el 
--objetivo de la sucursal en la que trabaja. 

use EMPRESA_BEA;
go
BEGIN TRAN

select * from EMPREGADO;

update EMPREGADO
set cota_de_vendas = s.obxectivo
from EMPREGADO e inner join SUCURSAL s
	 on e.id_sucursal_traballa = s.identificador;

select * from EMPREGADO;

ROLLBACK;

--1.6. BD SOCIEDADE_CULTURAL. 
--IMPORTANTE: NO USES instrucciones TPL para realizar la siguiente consulta:
--Instrucción que crea una tabla temporal EMPLEADO_NO_ASISTE_ACTI, solo accesible en 
--la sesión actual, con nif, nombre, primer apellido y salario mensual de los empleados que 
--no asisten a actividades.
--Los nombres de las columnas de la tabla nueva serán DocId, nombre de pila, ape1 y
--salario. (Si el nombre del campo tiene espacios en blanco respétalos).

use SOCIEDADE_CULTURAL_BEA;
go

SELECT nif as DocId, nome as "nombre de pila", ape1, salario_mes INTO #EMPLEADO_NO_ASISTE_ACTI
FROM EMPREGADO
WHERE numero NOT IN (SELECT num_profesorado
						FROM PROFE_CURSA_ACTI);
	
-- OTRA SOLUCI�N CON LEFT JOIN 
SELECT nif as DocId, nome as "nombre de pila", ape1, salario_mes INTO #EMPLEADO_NO_ASISTE_ACTI2
FROM EMPREGADO e LEFT JOIN PROFE_CURSA_ACTI p on e.numero=p.num_profesorado
WHERE p.id_actividade IS NULL;

--Comprobamos si la tabla est� creada
select * from #EMPLEADO_NO_ASISTE_ACTI;
select * from #EMPLEADO_NO_ASISTE_ACTI2;

select * from EMPREGADO;

--1.7. BD EMPRESA.
--IMPORTANTE: NO USES instrucciones TPL para realizar la siguiente consulta:
--Instrucción que crea una tabla permanente de nombre SUCURSAL_OESTE que tenga las
--mismas columnas que SUCURSAL, pero que contenga solamente la información de las 
--sucursales de la región Oeste.
--Los nombres de las columnas de la tabla nueva serán Id, localidade, zona, director y obj.

use EMPRESA_BEA;
go

select * from SUCURSAL;

select [identificador] as Id, [cidade] as localidade, [rexion] as zona, [num_empregado_director] as director, [obxectivo] as obj INTO SUCURSAL_OESTE
from SUCURSAL
where rexion = 'OESTE';

select * from SUCURSAL_OESTE;


--1.8. BD SOCIEDADE_CULTURAL. Usando instrucciones TPL realiza a siguiente consulta:
--Instrucción que elimine del modo más rápido y menos costoso posible, los empleados de
--la tabla EMPLEADO_NO_ASISTE_ACTI que tengan un salario mensual superior a 600€.

use SOCIEDADE_CULTURAL_BEA;
go
BEGIN TRAN

select * from #EMPLEADO_NO_ASISTE_ACTI;

delete 
from #EMPLEADO_NO_ASISTE_ACTI
where salario_mes > 600;

select * from #EMPLEADO_NO_ASISTE_ACTI;

ROLLBACK;


--1.9. BD EMPRESA. Usando instrucciones TPL realiza a siguiente consulta:
--Instrucción que elimine del modo más rápido y menos costoso posible todas las filas de la 
--tabla SUCURSAL_OESTE.

use EMPRESA_BEA;
go
BEGIN TRAN

select * from SUCURSAL_OESTE;
truncate table SUCURSAL_OESTE;
select * from SUCURSAL_OESTE;


ROLLBACK;



--1.10. BD EMPRESA. Usando instrucciones TPL realiza a siguiente consulta:
--IMPORTANTE: No se permite usar subconsultas para hacer el borrado.
--Instrucción que elimine los pedidos de los empleados que trabajan en sucursales de la 
--región OESTE.

use EMPRESA_BEA;
go
BEGIN TRAN

select * from PEDIDO;

DELETE FROM PEDIDO
from PEDIDO pe inner join EMPREGADO e on pe.num_empregado = e.numero
			   inner join SUCURSAL s on e.id_sucursal_traballa = s.identificador
where s.rexion = 'OESTE';


select * from PEDIDO;

ROLLBACK;