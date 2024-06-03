/*** UD6. Consultas Modelo examen */

--1.1. BD EMPRESA. Usando instrucciones TPL realiza la siguiente consulta:
--  Instrucci�n que a�ade un nuevo producto de nombre PRODUTO_EXAME, con:
--- c�digo de fabricante KIN,
--- identificador de producto ABABA, e,
--- precio el mismo del producto con descripci�n Cable USB a micro USB, y,
--- existencias 20 menos de las del producto con descripci�n Cable USB a micro USB.
	USE EMPRESA;
	GO
	BEGIN TRAN
	--Consultamos PRODUTO
	SELECT  * FROM PRODUTO;
	--Inserci�n
	INSERT INTO PRODUTO (cod_fabricante, identificador, descricion, prezo, existencias)
	SELECT 'KIN', 'ABABA', 'PRODUTO_EXAME', prezo, existencias-20
	FROM PRODUTO
	WHERE descricion='Cable USB a micro USB';
	--Consultamos PRODUTO
	SELECT  * FROM PRODUTO;
	ROLLBACK;


--1.2. BD EMPRESA. Usando instrucciones TPL realiza a siguiente consulta:
--Instrucci�n que a�ade una nueva sucursal con:
--- identificador 77,
--- ciudad PONTEVEDRA,
--- regi�n la misma que la de la oficina de VIGO,
--- director el que tiene por nombre completo CARLOS GRIMM, y,
--- objetivo 1000� m�s del m�ximo objetivo de las sucursales actuales. 
--Por ejemplo, si antes de a�adir la nueva sucursal el objetivo m�s 
--alto de todas las sucursales es 805.000, el objetivo de la nueva sucursal ser� 806.000
	USE EMPRESA;
	GO
	BEGIN TRAN
	--Consultamos SUCURSAL
	select * from SUCURSAL;
	--Inserci�n
	insert into SUCURSAL (identificador, cidade, rexion, num_empregado_director, obxectivo)
	SELECT 77, 'PONTEVEDRA', rexion, 
	      (select numero from EMPREGADO 
		  where nome='CARLOS' and ape1='GRIMM' and ape2 is null), 
	      (select max(obxectivo)+1000 from sucursal)
	FROM SUCURSAL
	WHERE cidade='VIGO'
	--Consultamos SUCURSAL
	select * from SUCURSAL;
	ROLLBACK;

--1.3. BD SOCIEDADE_CULTURAL. Usando instrucciones TPL realiza la siguiente 
--consulta:
--Instrucci�n que a�ade tres aulas nuevas:
--numero descricion estado superficie
--	10 AULA_10 M 25
--	20 AULA_20 B 45
--	30 AULA_30 B 60
--Para a�adir las aulas solo se podr� usar una instrucci�n 
--(sin tener en cuenta las instrucciones TPL).
	USE SOCIEDADE_CULTURAL;
	GO
	BEGIN TRAN
	--Consultamos AULA
	SELECT * FROM AULA;
	--Inserci�n
	insert into AULA (numero, descricion, estado, superficie)
	values (10, 'AULA_10', 'M', 25),
	       (20, 'AULA_20', 'B', 45),
		   (30, 'AULA_30', 'B', 60);
	--Consultamos AULA
	SELECT * FROM AULA;
	ROLLBACK;

--1.4. BD SOCIEDADE_CULTURAL. Usando instrucciones TPL realiza la siguiente 
--consulta:
--Instrucci�n que a todas las actividades que ya acabaron a d�a de hoy 
--y su precio es inferior a 300�, 
--les haga los siguientes cambios:
--- Adelante en un mes su fecha de fin, es decir, que terminen un mes antes,
--- triplique su n�mero de plazas, y,
--- rebaje el precio en un 7%.
	USE SOCIEDADE_CULTURAL;
	GO
	BEGIN TRAN
	--Consultamos ACTIVIDADE
	SELECT * FROM ACTIVIDADE;
	--Saltar� la restricci�n CHK_control_fechas por lo que vamos a 
	--deshabilitarla para poder realizar la instrucci�n.
	--Despu�s la volveremos a habilitar
	ALTER TABLE ACTIVIDADE
	NOCHECK CONSTRAINT CHK_control_fechas;
	--Modificaci�n
	UPDATE ACTIVIDADE
	SET data_fin=dateadd(month, -1, data_fin),
	    num_prazas=num_prazas*3,
		prezo=prezo*0.93
	WHERE data_fin<getdate() AND
	      prezo<300;

	-- En caso de no deshabilitar el check, la instrucci�n DBCC CHECKCONSTRAINTS (ACTIVIDADE)
	-- nos indica qu� constraint se est� vulnerando
	
	--Habilitamos la restricci�n de control de fechas
	ALTER TABLE ACTIVIDADE
	CHECK CONSTRAINT CHK_control_fechas;
		
	--Consultamos ACTIVIDADE
	SELECT * FROM ACTIVIDADE;
	ROLLBACK;

----------------------------------------------------------------------------------------
--VISTAS DEL SISTEMA A CONSULTAR 
	select * from [INFORMATION_SCHEMA].[TABLE_CONSTRAINTS] 
	where table_name='ACTIVIDADE';

	select name, is_disabled from sys.check_constraints;
----------------------------------------------------------------------------------------


--1.5. BD EMPRESA. Usando instrucciones TPL realiza la siguiente consulta:
--Instrucci�n que cambie la cuota de ventas de cada empleado 
--para que coincida con
--el objetivo de la sucursal en la que trabaja.
	USE EMPRESA;
	GO
	BEGIN TRAN
	--Consultamos EMPREGADO
	select e.*
	FROM EMPREGADO e inner join SUCURSAL s 
	     on e.id_sucursal_traballa=s.identificador;
	--Modificaci�n
	UPDATE  EMPREGADO
	SET cota_de_vendas= s.obxectivo
	FROM EMPREGADO e inner join SUCURSAL s 
	     on e.id_sucursal_traballa=s.identificador;
--Otra soluci�n
	UPDATE  EMPREGADO
	SET cota_de_vendas= s.obxectivo
	FROM SUCURSAL s 
	WHERE id_sucursal_traballa=s.identificador;
	--Consultamos EMPREGADO
	select * from EMPREGADO;
	ROLLBACK;

--1.6. BD SOCIEDADE_CULTURAL. IMPORTANTE: NO USES instrucciones TPL para realizar 
--la siguiente consulta:
--Instrucci�n que crea una tabla temporal EMPLEADO_NO_ASISTE_ACTI, 
--solo accesible en 
--la sesi�n actual, con nif, nombre, primer apellido y salario mensual 
--de los empleados que no asisten a actividades.
--Los nombres de las columnas de la tabla nueva ser�n DocId, nombre de pila, 
--ape1 y salario. (Si el nombre del campo tiene espacios en blanco resp�talos).
	USE  SOCIEDADE_CULTURAL;
	GO
	SELECT nif as DocId, nome as "nombre de pila", ape1, salario_mes 
	       INTO #EMPLEADO_NO_ASISTE_ACTI
	FROM EMPREGADO
	WHERE numero NOT IN (SELECT num_profesorado
						 FROM PROFE_CURSA_ACTI);
	
	-- OTRA SOLUCI�N CON LEFT JOIN
	SELECT nif as DocId, nome as "nombre de pila", ape1, salario_mes 
	       INTO #EMPLEADO_NO_ASISTE_ACTI
	FROM EMPREGADO e LEFT JOIN PROFE_CURSA_ACTI p 
	     on e.numero=p.num_profesorado
	WHERE p.id_actividade IS NULL;

	--Comprobamos si la tabla est� creada
	select * from #EMPLEADO_NO_ASISTE_ACTI;
	
--1.7. BD EMPRESA. IMPORTANTE: NO USES instrucciones TPL para realizar la siguiente consulta:
--Instrucci�n que crea una tabla permanente de nombre SUCURSAL_OESTE que tenga 
--las mismas columnas que SUCURSAL, pero que contenga solamente la 
--informaci�n de las sucursales de la regi�n Oeste.
--Los nombres de las columnas de la tabla nueva ser�n Id, 
--localidade, zona, director y obj.
	USE EMPRESA;
	GO
	SELECT identificador as Id, cidade as localidade, rexion, 
	       num_empregado_director as director, obxectivo as obj 
		   INTO SUCURSAL_OESTE
	FROM SUCURSAL
	WHERE rexion='OESTE';

--drop table SUCURSAL_OESTE

--1.8. BD SOCIEDADE_CULTURAL. Usando instrucciones TPL realiza a 
--siguiente consulta:
--Instrucci�n que elimine del modo m�s r�pido y menos costoso posible, 
--los empleados 
--de la tabla EMPLEADO_NO_ASISTE_ACTI que tengan un salario mensual 
--superior a 600�.
	USE  SOCIEDADE_CULTURAL;
	GO
	BEGIN TRAN
	--Consultamos #EMPLEADO_NO_ASISTE_ACTI
	SELECT * FROM #EMPLEADO_NO_ASISTE_ACTI;
	--OJO: Esto es lo que no se debe hacer NUNCAAAAAA
	--porque eliminar�a todas las filas
	TRUNCATE TABLE #EMPLEADO_NO_ASISTE_ACTI;
	DELETE FROM #EMPLEADO_NO_ASISTE_ACTI
	WHERE salario_mes>600;
	--Consultamos #EMPLEADO_NO_ASISTE_ACTI
	SELECT * FROM #EMPLEADO_NO_ASISTE_ACTI;

	GO
	ROLLBACK;

--1.9. BD EMPRESA. Usando instrucciones TPL realiza a siguiente consulta:
--Instrucci�n que elimine del modo m�s r�pido y menos costoso posible todas 
--las filas de la tabla SUCURSAL_OESTE.
	USE EMPRESA;
	GO
	BEGIN TRAN
	--Consultamos SUCURSAL_OESTE
	SELECT * FROM SUCURSAL_OESTE;
	TRUNCATE TABLE SUCURSAL_OESTE;
	--Consultamos SUCURSAL_OESTE
	SELECT * FROM SUCURSAL_OESTE;
	GO
	ROLLBACK;

--1.10. BD EMPRESA. Usando instrucciones TPL realiza a siguiente consulta: 
--IMPORTANTE: No se permite usar subconsultas para hacer el borrado.
--Instrucci�n que elimine los pedidos de los empleados que trabajan en 
--sucursales de la regi�n OESTE.
	USE EMPRESA;
	GO	
	BEGIN TRAN
	--Consultamos PEDIDO
	SELECT * 
	FROM PEDIDO p INNER JOIN EMPREGADO e on p.num_empregado=e.numero 
	     INNER JOIN SUCURSAL s on s.identificador=e.id_sucursal_traballa
	WHERE s.rexion='OESTE';


	--Borrado
	DELETE FROM PEDIDO
	FROM PEDIDO p INNER JOIN EMPREGADO e on p.num_empregado=e.numero INNER JOIN SUCURSAL s on s.identificador=e.id_sucursal_traballa
	WHERE s.rexion='OESTE';


	
	--Consultamos PEDIDO
	SELECT * 
	FROM PEDIDO p INNER JOIN EMPREGADO e on p.num_empregado=e.numero 
	     INNER JOIN SUCURSAL s on s.identificador=e.id_sucursal_traballa
	WHERE s.rexion='OESTE';
	ROLLBACK;




	