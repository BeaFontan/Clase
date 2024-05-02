/*************************************************************/
/**** UD06. Modificar informaci�n da base de datos (DML). ****/
/***********    TAREFA1. CONSULTAS PROPOSTAS     *************/
/*************************************************************/
	
	--Seleccionamos a BD SOCIEDADE_CULTURAL
	USE SOCIEDADE_CULTURAL;

	/*** CONSULTA PROPOSTA 1 ***/
	--Aumentar o n�mero de prazas das actividades nun 15%.
	BEGIN TRAN
	--Consultamos ACTIVIDADE
	SELECT * FROM ACTIVIDADE;
	--Consulta de modificaci�n
	UPDATE ACTIVIDADE
	SET num_prazas=num_prazas*1.15;
	--Consultamos ACTIVIDADE
	SELECT * FROM ACTIVIDADE;
	ROLLBACK;

	/*** CONSULTA PROPOSTA 2 ***/
	--Cambiar o estado da aula de nome AULA SUR a regular (R).
	BEGIN TRAN
	--Consultamos AULA
	SELECT * FROM AULA;
	--Consulta de modificaci�n
	UPDATE AULA
	SET estado='R'
	WHERE descricion='AULA SUR';
	--Consultamos AULA
	SELECT * FROM AULA;
	ROLLBACK;

	/*** CONSULTA PROPOSTA 3 ***/
	--Engadir unha aula nova de n�mero 9, nome AULA NOVA 
	--e con superficie e estado os mesmos que os da aula COCI�A.
	BEGIN TRAN
	--Consultamos AULA
	SELECT * FROM AULA;
	--Consulta para engadir filas
	INSERT INTO AULA (numero, descricion, superficie, estado)
	SELECT 9, 'AULA NOVA', superficie, estado
	FROM AULA
	WHERE descricion='COCI�A';
	--Consultamos AULA
	SELECT * FROM AULA;
	ROLLBACK;

	/*** CONSULTA PROPOSTA 4 ***/
	--Engadir d�as novas cotas, unha cos datos 21, 
	--COTA1, 75 e outra coas da-tos 22, COTA2 e 74.3.
	BEGIN TRAN
	--Consultamos COTA
	SELECT * FROM COTA;
	--Consulta para engadir filas
	INSERT INTO COTA (codigo, nome, importe)
	VALUES (21, 'COTA1', 75),
	       (22, 'COTA2', 74.3);
	--Consultamos COTA
	SELECT * FROM COTA;
	ROLLBACK;
	
	/*** CONSULTA PROPOSTA 5 ***/
	--Crear unha t�boa temporal global PROFE_ASISTENTE_ACTI 
	--co nif, nome e primeiro apelido do profesorado que 
	--asiste a actividades.
	BEGIN TRAN
	--Creaci�n da t�boa nova
	SELECT e.nif, e.nome, e.ape1 INTO ##PROFE_ASISTENTE_ACTI 
	FROM EMPREGADO e, PROFE_CURSA_ACTI pca
	WHERE e.numero=pca.num_profesorado;
	SELECT * FROM ##PROFE_ASISTENTE_ACTI;
	ROLLBACK;
	
	
	/*** CONSULTA PROPOSTA 6 ***/
	--Crear unha t�boa permanente de nome AULA_MALA 
	--coas aulas en mal estado (Estado=M) e coas mesmas 
	--columnas da t�boa AULA. Os nomes dos campos de AULA_MALA 
	--ser�n codigo, nome, m2 e estado.
	BEGIN TRAN
	--Consultamos AULA
	SELECT * FROM AULA;
	--Creaci�n da t�boa nova
	SELECT numero as codigo, descricion as nome, superficie as m2, estado 
	       INTO AULA_MALA
	FROM AULA
	WHERE estado='M';
	--Consultamos AULA_MALA
	SELECT * FROM AULA_MALA;
	ROLLBACK;

	/*** CONSULTA PROPOSTA 7 ***/
	--Crear unha t�boa temporal local que sexa unha copia 
	--en canto a contido e columnas da t�boa ACTIVIDADE e 
	--que se chame ACTI2. Antes de pechar a transacci�n, 
	--farase unha consulta que elimine todas as actividades 
	--da t�boa nova que non te�an observaci�ns.
	BEGIN TRAN
	--Creaci�n da t�boa nova
	SELECT * INTO #ACTI2
	FROM ACTIVIDADE;
	--Consultamos #ACTI2
	SELECT * FROM #ACTI2;
	--Consulta de eliminaci�n
	DELETE FROM #ACTI2
	WHERE observacions IS NULL;
	--Consultamos #ACTI2
	SELECT * FROM #ACTI2;
	ROLLBACK;

	/*** CONSULTA PROPOSTA 8 ***/
	--Crear unha t�boa temporal local de nome SOCIO2 
	--copia de SOCIO. A continuaci�n faremos a consulta 
	--que elimine de SOCIO2 aqueles socios que non 
	--te�en tel�fono alg�n. 
	BEGIN TRAN
	--Creaci�n da t�boa nova
	SELECT * INTO #SOCIO2
	FROM SOCIO;
	--Consultamos #SOCIO2
	SELECT * FROM #SOCIO2;
	--Consulta de eliminaci�n
	DELETE FROM #SOCIO2
	WHERE telefono1 IS NULL AND 
	      telefono2 IS NULL;
	--Consultamos #SOCIO2
	SELECT * FROM #SOCIO2;
	ROLLBACK;

	/*** CONSULTA PROPOSTA 9 ***/
	--Substitu�r os espazos en branco das observaci�ns das 
	--actividades, as que asisten docentes, por gui�ns baixos(_).
	BEGIN TRAN
	--Consultamos as actividades cursadas por docentes
	SELECT a.* 
	FROM ACTIVIDADE a, PROFE_CURSA_ACTI pc
	WHERE a.identificador=pc.id_actividade;
	--Consulta de modificaci�n
	UPDATE ACTIVIDADE
	SET observacions=replace(observacions,' ','_')
	FROM ACTIVIDADE a, PROFE_CURSA_ACTI pc
	WHERE a.identificador=pc.id_actividade;
	--Consultamos as actividades cursadas por docentes
	SELECT a.* 
	FROM ACTIVIDADE a, PROFE_CURSA_ACTI pc
	WHERE a.identificador=pc.id_actividade;
	ROLLBACK;


	/*** CONSULTA PROPOSTA 10 ***/
	--Retrasar nun d�a a data de inicio de t�dalas actividades 
	--que a�nda non comezaron a d�a de hoxe.
	BEGIN TRAN
	--Consultamos ACTIVIDADE
	SELECT * FROM ACTIVIDADE;
	--Consulta de modificaci�n
	UPDATE ACTIVIDADE
	SET data_ini=dateadd(day, 1, data_ini)
	WHERE data_ini>getdate();
	--Consultamos ACTIVIDADE
	SELECT * FROM ACTIVIDADE;
	ROLLBACK;
	

	--Seleccionamos a BD EMPRESA
	USE EMPRESA;

	
	/*** CONSULTA PROPOSTA 11 ***/
	--Eliminar os fabricantes dos que non hai produtos na BD
	BEGIN TRAN
	--Consultamos os fabricantes sen produto
	SELECT f.*
	FROM FABRICANTE f LEFT JOIN PRODUTO pr
		 ON f.codigo=pr.cod_fabricante
	WHERE pr.descricion IS NULL;
	--Consulta de eliminaci�n
	DELETE FROM FABRICANTE
	FROM FABRICANTE f LEFT JOIN PRODUTO pr
		 ON f.codigo=pr.cod_fabricante
	WHERE pr.descricion IS NULL;
	
	--Consultamos os fabricantes
	SELECT *
	FROM FABRICANTE;
	ROLLBACK;
	
	/*** CONSULTA PROPOSTA 12 ***/
	--Incrementar o obxectivo das sucursais da rexi�n OESTE nun 6% 
	--e modificar o nome da rexi�n por WEST.
	BEGIN TRAN
	--Consultamos SUCURSAL
	SELECT * FROM SUCURSAL;
	--Consulta de modificaci�n
	UPDATE SUCURSAL
	SET obxectivo=obxectivo*1.06, rexion='WEST'
	WHERE rexion='OESTE';
	--Consultamos SUCURSAL
	SELECT * FROM SUCURSAL;
	ROLLBACK;

	/*** CONSULTA PROPOSTA 13 ***/
	--Crear unha t�boa de nome FABRICANTE2 que sexa unha copia de 
	--FABRICANTE en n�mero e nome de columnas e en contido. 
	--Elimina todas as filas da nova t�boa do xeito m�is r�pido e 
	--menos custoso posible.
	BEGIN TRAN
	--Creaci�n da t�boa nova
	SELECT * INTO FABRICANTE2
	FROM FABRICANTE;
	--Consultamos FABRICANTE2
	SELECT * FROM FABRICANTE2;
	--Consulta de eliminaci�n 
	TRUNCATE TABLE FABRICANTE2;
	--Consultamos FABRICANTE2
	SELECT * FROM FABRICANTE2;
	ROLLBACK;

	/*** CONSULTA PROPOSTA 14 ***/
	--Transferir todos os empregados que traballan na sucursal 
	--de BARCELONA � sucursal de VIGO, e cambiar a s�a cota de 
	--vendas pola media das cotas de vendas de t�dolos empregados.
	BEGIN TRAN
	--Consultamos EMPREGADO
	SELECT * FROM EMPREGADO;
	--Consulta de modificaci�n
	UPDATE EMPREGADO
	SET id_sucursal_traballa=(SELECT identificador
	                          FROM SUCURSAL
							  WHERE cidade='VIGO'),
		cota_de_vendas=(SELECT avg(cota_de_vendas) 
		                FROM EMPREGADO)
	FROM EMPREGADO e INNER JOIN SUCURSAL s
		 ON e.id_sucursal_traballa=s.identificador
	WHERE s.cidade='BARCELONA';
	--Consultamos EMPREGADO
	SELECT * FROM EMPREGADO;
	ROLLBACK;

	/*** CONSULTA PROPOSTA 15 ***/
	--Elimina os pedidos de empregados contratados antes do ano 2001.
	BEGIN TRAN
	--Consultamos os pedidos a eliminar
	SELECT p.*
	FROM EMPREGADO e, PEDIDO p
	WHERE year(e.data_contrato)<2001 AND
	      e.numero=p.num_empregad
	--Consulta de eliminaci�n
	DELETE FROM PEDIDO
	FROM EMPREGADO e, PEDIDO p
	WHERE year(e.data_contrato)<2001 AND
	      e.numero=p.num_empregado;
	--Consultamos os pedidos a eliminar
	SELECT p.*
	FROM EMPREGADO e, PEDIDO p
	WHERE year(e.data_contrato)<2001 AND
	      e.numero=p.num_empregado; 
	ROLLBACK;