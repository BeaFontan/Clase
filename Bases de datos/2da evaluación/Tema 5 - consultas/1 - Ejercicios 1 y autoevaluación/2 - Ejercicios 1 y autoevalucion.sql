use EMPRESA_BEA;

use SOCIEDADE_CULTURAL_BEA;

---TAREFAS CONSULTAS SIMPLES------------------------------------------------------------------------------------

--– Proposta 1. Nome e apelidos (cada un nunha columna) de todos os empregados.
SELECT e.nome, e.ape1, e.ape2
FROM EMPREGADO E;


--– Proposta 2. Número, nome e apelidos (cada un nunha columna) de todos 
--empregados.

SELECT e.numero, e.nome, e.ape1, e.ape2
FROM EMPREGADO E;

--– Proposta 3. Número, nome e apelidos (cada un nunha columna) de todos os 
--empregados por orde alfabética de apelidos e nome.

SELECT e.numero, e.nome , e.ape1, e.ape2
FROM EMPREGADO E
ORDER BY e.ape1, ape2, nome;

--– Proposta 4. Número, nome e apelidos (cada un nunha columna) de todos os 
--empregados por orde alfabética de apelidos e nome. Os nomes das columnas no 
--resultado serán: num_socio, nome_socio, apelido1, apelido2.

SELECT e.numero as num_socio, e.nome as nome_socio, e.ape1 as apelido1, e.ape2 as apelido2
FROM EMPREGADO E
ORDER BY e.ape1, ape2, nome;


--– Proposta 5. Número, nome completo (os 4 campos nunha única columna, de nome 
--socio, co formato numero - ape1 ape2, nome) e salario de todos os empregados. No 
--resultado deberán aparecer primeiro os que máis cobran.

SELECT cast(e.numero as varchar(7)) + ' - ' + e.ape1 + e.ape2 + ', ' + e.nome as socios,
salario_mes
FROM EMPREGADO E
ORDER BY salario_mes desc;

SELECT cast(numero as varchar(7))+' - '+ape1+' '+ape2+', '+ nome 
 as socio, 
 salario_mes
FROM EMPREGADO
ORDER BY salario_mes desc;


--– Proposta 6. Número, nome completo (os 4 campos nunha única columna, de nome 
--socio, co formato numero - ape1 ape2, nome) e salario de todo o profesorado. No 
--resultado deberán aparecer primeiro os que máis cobran. O campo cargo contén 
--PRF para o profesorado, e ADM se é un ou unha administrativo.

select cast(e.numero as varchar (7))+ ' - ' + e.ape1 + ' ' + e.ape2 + ', ' + e.nome as socio, e.salario_mes
from EMPREGADO e 
where e.cargo = 'PRF'
order by salario_mes desc;

SELECT cast(numero as varchar(7))+' - '+ape1+' '+ape2+', '+ nome 
 as socio, 
 salario_mes
FROM EMPREGADO
WHERE cargo='PRF'
ORDER BY salario_mes desc;


--– Proposta 7. Número identificador do profesorado que imparte clases. Como é 
--lóxico, se un profesor imparte máis dunha actividade, o seu número só pode 
--aparecer unha vez.

SELECT DISTINCT num_profesorado_imparte
FROM ACTIVIDADE;


--– Proposta 8. Número identificador das actividades ás que asiste profesorado, é dicir, 
--cursadas por profesorado. 

select p.id_actividade
from PROFE_CURSA_ACTI p;

SELECT DISTINCT id_actividade
FROM PROFE_CURSA_ACTI;


--– Proposta 9. Nome, importe, e importe rebaixado un 20%, da actividade de nome 
--xadrez.


--Solución1
SELECT nome, prezo, prezo-(prezo*0.20) as prezo_rebaixado
FROM ACTIVIDADE
WHERE nome='XADREZ';
--Solución2
SELECT nome, prezo, prezo*0.80 as prezo_rebaixado
FROM ACTIVIDADE
WHERE nome='XADREZ';


--– Proposta 10. NIF, nome e apelidos dos socios dos que non temos teléfono gardado.

SELECT NIF, nome, ape1, ape2
FROM SOCIO
WHERE telefono1 IS NULL AND
 telefono2 IS NULL;

--– Proposta 11. NIF, nome, apelidos e data de nacemento dos socios nados entre 1980 
--e 1990, ambos incluídos.

SELECT NIF, nome, ape1, ape2, data_nac
FROM SOCIO
WHERE data_nac BETWEEN '1/1/1980' AND '31/12/1990';


--– Proposta 12. Todos os datos das actividades cuxo nome contén a letra T.
SELECT *
FROM ACTIVIDADE
WHERE nome LIKE '%T%';


--– Proposta 13. Nome e importe das cotas cun custo de 30 ou 100 euros.
SELECT nome, importe
FROM COTA
WHERE importe IN (30,100);

--Solución2
SELECT nome, importe
FROM COTA
WHERE importe=30 OR
 importe=100;


--– Proposta 14. Nome e número de prazas das actividades que non teñen nin 15 nin 20 
--prazas.
SELECT nome, num_prazas
FROM ACTIVIDADE
WHERE num_prazas NOT IN (15,20);

--Solución2
SELECT nome, num_prazas
FROM ACTIVIDADE
WHERE num_prazas!=15 AND
 num_prazas!=20;


--– Proposta 15. Nome de todos os clientes por orde alfabética. 

select c.nome
from CLIENTE c
order by nome ASC;

--– Proposta 16. Nome das rexións nas que ten sucursais a empresa.

select s.rexion
from SUCURSAL s;


--– Proposta 17. Identificador dos produtos que nos pediron nalgún momento. 
--No resultado debe aparecer nunha soa columna o código do fabricante e o identificador 
--do produto separados por un guión. A columna do resultado deberá chamarse produtos.

select p.cod_fabricante + '-' + p.id_produto as productos
from PEDIDO p
where p.id_produto is not null;


--– Proposta 18. Información completa das sucursais non dirixidas polo empregado 
--número 108.

select s.identificador, s.cidade, s.rexion, s.obxectivo, s.num_empregado_director
from SUCURSAL s
where s.num_empregado_director != 108;

--– Proposta 19. Nome e límite de crédito do cliente número 1107.

select c.nome, c.limite_de_credito
from CLIENTE c
where c.numero = 1107;

--– Proposta 20. Número e data dos pedidos feitos entre o 1 de agosto e o 31 de 
--decembro de 2014. Só debe aparecer a data de cada pedido, sen a hora, co formato 
--dd-mm-aaaa. Deben aparecer primeiro no resultado os pedidos máis recentes. Para 
--resolver esta consulta non se poden utilizar operadores de comparación (>, <, >=, 
--<=, < >, !=).

select p.numero, p.data_pedido
from PEDIDO p
where p.data_pedido BETWEEN '01-08-2014' AND '31-12-2014';

SELECT * from PEDIDO;

--– Proposta 21. Código e nome dos fabricantes cuxo nome ten por segunda letra O.

select f.codigo, f.nome
from FABRICANTE f
where f.nome LIKE '_o%';

		--Le pongo el guión bajo para decirle que hay un caracter delante, luego una o y luego el % para decirle que va a seguir

--– Proposta 22. Descrición e prezo dos produtos dos que non temos existencias.

select p.descricion, p.prezo
from PRODUTO p
where p.existencias = 0;


--– Proposta 23. Número identificador e nome completo dos empregados que non 
--teñen xefe.

select e.numero, e.nome, e.ape1, e.ape2
from EMPREGADO e
where e.num_empregado_xefe IS NULL;

--– Proposta 24. Descrición e unidades existentes, dos produtos con existencias maiores 
--de 10 unidades e menores de 100. Para resolver esta consulta non se poden utilizar 
--operadores de comparación (>, <, >=, <=, < >, !=)

select p.descricion, p.existencias
from PRODUTO p
where p.existencias BETWEEN 11 AND 99;

		--Le pongo 11 y 99 porque pone mayores que, no igual o mayor.






-----TAREFAS CONSULTAS RESUMO-------------------------------------------------------------------------------------------

--– Proposta 1. Media de unidades vendidas de cada vendedor. O resultado terá dúas 
--columnas, na primeira o número identificador do empregado (vendedor) e nunha 
--segunda columna a media de unidades vendidas (campo cantidade) nos seus 
--pedidos.

select p.num_empregado, avg(p.cantidade) as mediaCantiadad
from PEDIDO p
group by p.num_empregado;


--– Proposta 2. Prezo máis barato de produto, prezo máis caro, prezo medio, suma total 
--dos prezos de produto, e número de produtos distintos existentes.

select min(p.prezo) as mais_barato,
	   max(p.prezo) as mais_caro,
	   avg(p.prezo) as prezo_medio,
	   sum(p.prezo) as suma_total,
	   count(p.prezo) as conta_total
from PRODUTO p;

--– Proposta 3. Número de pedidos realizados polo cliente 1103.

select count(p.numero)
from PEDIDO p
where p.num_cliente = 1103;

select * from PEDIDO;

--– Proposta 4. Número de pedidos realizados por cada cliente. No resultado aparecerá 
--o identificador do cliente e na segunda columna o número de pedidos que leva 
--feitos cada cliente ata o de agora. 

select p.num_cliente, count(p.numero) as total_pedidos_realizados
from PEDIDO p
group by p.num_cliente;


--– Proposta 5. Repite a consulta anterior, pero agora no resultado só poderán aparecer 
--os clientes que fixeron máis de 2 pedidos. 

select p.num_cliente, count(p.numero) as total_pedidos_realizados
from PEDIDO p
group by p.num_cliente
having count(p.numero)>2;


--– Proposta 6. Repite a consulta anterior, pero agora no resultado só poderán aparecer 
--os clientes que fixeron máis de 2 pedidos e que ademais teñen unha media de 
--unidades mercadas (cantidade) inferior a 10.

select p.num_cliente, count(p.numero) as total_pedidos_realizados
from PEDIDO p
group by p.num_cliente
having count(p.numero) > 2 AND avg(p.cantidade) < 10;

--– Proposta 7. Cantidade total de sucursais que hai por rexión. Aparecerá o nome da 
--rexión e na mesma columna separado por un guión, a cantidade de sucursais 
--situadas nesa rexión.

SELECT rexion+' - '+ cast(count(*) as varchar(5)) as total_sucursais
FROM SUCURSAL
GROUP BY rexion;


--------TAREFAS DE CONSULTAS DE COMBINACIÓNS JOINS-------------------------------------------------------------------

--– Proposta 1. Nome de todos os fabricantes dos que se fixeron pedidos. Debes 
--propoñer dúas solucións, unha coa sintaxe coa condición de combinación no 
--WHERE, e outra coa sintaxe coa condición de combinación no FROM.

--uso distinct para que elimine los resultados repetidos.
select distinct f.nome
from FABRICANTE f JOIN PEDIDO p
on f.codigo = p.cod_fabricante;


--Solución1
SELECT DISTINCT f.nome
FROM FABRICANTE f, PEDIDO p
WHERE f.codigo=p.cod_fabricante;
--aquí le indicamos donde coincidan los códigos en el where

--Solución2
SELECT DISTINCT f.nome
FROM FABRICANTE f INNER JOIN PEDIDO p
 ON f.codigo=p.cod_fabricante;
 --aquí hacemos un join o inner join, que arroja el mismo resultado.

--– Proposta 2. Nome de todos os fabricantes, fixéranse ou non pedidos. Se tiveron 
--pedidos aparecerá o nome e nunha segunda columna o número de pedido. Se dun 
--fabricante se fixeron máis dun pedido, aparecerá tantas veces como pedidos se lle 
--fixeron. No caso de non ter pedido, como número de pedido deberá aparecer o 
--valor 99.

select f.nome, ISNULL(p.numero, 99) as num_pedido
from FABRICANTE f left JOIN PEDIDO p
on f.codigo = p.cod_fabricante;


--– Proposta 3. Nome de todos os fabricantes, fixéranse ou non pedidos. Se tiveron 
--pedidos aparecerá o nome e nunha segunda columna o número de pedido. Se dun 
--fabricante se fixeron máis dun pedido, aparecerá tantas veces como pedidos se lle 
--fixeron. No caso de non ter pedido, como número de pedido deberá aparecer a 
--frase 'Sen pedidos.'.

select f.nome, ISNULL(cast(p.numero as varchar(12)), 'Sen pedidos.') as num_pedido
from FABRICANTE f left JOIN PEDIDO p
on f.codigo = p.cod_fabricante;


--– Proposta 4. Código dos produtos (co formato cod_fabricante-id_produto) e 
--descrición, dos produtos que non foron pedidos nunca.
select p.identificador, p.descricion
from PRODUTO p left join PEDIDO pe
on p.identificador = pe.id_produto
where pe.id_produto is null;

--solución mónica
SELECT pr.cod_fabricante+'-'+pr.identificador as id_produto,
 pr.descricion
FROM PRODUTO pr LEFT JOIN PEDIDO pe
 ON pr.cod_fabricante= pe.cod_fabricante AND
 pr.identificador =pe. id_produto
WHERE pe.numero is NULL;


--– Proposta 5. Produto cartesiano entre a táboa de sucursais e a de empregados. 
--Nunha primeira columna aparecerá a cidade da sucursal e na segunda o nome 
--completo do empregado (co formato nome ape1 ape2). Débense propoñer dúas 
--solucións, segundo a sintaxe empregada para o produto cartesiano.

--cross join para producto cartesiano
select s.cidade, e.nome + ' ' + e.ape1 + ' ' + isnull(e.ape2, ' ')
from SUCURSAL s cross join EMPREGADO e;

select s.cidade, e.nome + ' ' + e.ape1 + ' ' + isnull(e.ape2, ' ')
from SUCURSAL s, EMPREGADO e;


--Solución1
SELECT s.cidade, 
 e.nome+' '+e.ape1+' '+isnull(e.ape2,'') as empregado
FROM SUCURSAL s, EMPREGADO e;

--Solución2
SELECT s.cidade, 
 e.nome+' '+e.ape1+' '+isnull(e.ape2,'') as empregado
FROM SUCURSAL s CROSS JOIN EMPREGADO e;


--– Proposta 6. Número e nome completo (co formato nome ape1 ape2) de todos os 
--empregados, así como a cidade da sucursal que dirixen, se é que dirixen algunha. Na 
--terceira columna, de nome sucursal_que_dirixe, nas filas dos empregados que non 
--son directores de sucursais, deberá aparecer a frase 'Non é director.'.

select e.numero, e.nome + ' ' + e.ape1 + ' '+ isnull(e.ape2, '') as datos, isnull(cast(s.identificador as varchar (14)), 'Non e director') as sucursal
from EMPREGADO e full join SUCURSAL s
on e.numero = s.num_empregado_director;

--– Proposta 7. Número e nome completo dos empregados que teñen xefe, co número 
--e o nome completo do seu xefe nunha segunda columna. (Revisa o concepto 
--– Autocombinación ou self join). Nas columnas aparecerán o número separado do 
--nome completo por un guión.
select e.numero, e.nome, e.ape1, e.ape2, em.nome, em.ape1, em.ape2
from EMPREGADO e inner join empregado em
on e.num_empregado_xefe = em.numero;

select * from EMPREGADO;

--– Proposta 8. Número e nome completo de todos os empregados, co número e o 
--nome completo do seu xefe nunha segunda columna. Nas columnas aparecerán o 
--número separado do nome completo por un guión. Se algún empregado non tivese 
--xefe, na segunda columna debe aparecer a frase 'Xefe por designar.'. 

select cast(e.numero as varchar(3))+ '-' + e.nome + ' ' + e.ape1 as empregado, 
      isnull((cast(x.numero as varchar(3))+ '-' + x.nome + ' ' + x.ape1), 'Xefe por designar') as xefe 
from EMPREGADO e left join empregado x
on e.num_empregado_xefe = x.numero;


--– Proposta 9. Nome completo de todos os empregados co nome do cliente que teñen 
--asignado. No caso de que non tivesen ningún cliente aparecerá no nome do cliente a 
--frase 'Sen cliente.'. Do mesmo xeito se un cliente non ten empregado asignado, na 
--columna do empregado aparecerá 'Sen vendedor.'. É importante que aparezan 
--todos os empregados, teñan ou non clientes e todos os clientes teñan ou non 
--empregados.

select isnull(e.nome + ' ' + e.ape1 + ' ' + isnull(e.ape2,''), 'Sin vendedor') as ape2, isnull(c.nome,'Sen cliente') as cliente
from EMPREGADO e full join cliente c
on e.numero = c.num_empregado_asignado;


--– Proposta 10. Escolle unha das túas solucións das consultas propostas nas que 
--empregaches un LEFT JOIN, e modifícaa usando RIGHT JOIN.

SELECT pr.cod_fabricante+'-'+pr.identificador as id_produto,
 pr.descricion
FROM  PEDIDO pe right join PRODUTO pr
 ON pr.cod_fabricante= pe.cod_fabricante AND
 pr.identificador =pe. id_produto
WHERE pe.numero is NULL;






----- TAREFAS DE SUBCONSULTAS------------------------------------------------------------------------------------------------

--– Proposta 1. Nome de todos os fabricantes dos que hai produtos na BD. Non se permite 
--usar combinacións nesta consulta.

SELECT nome
FROM FABRICANTE 
WHERE codigo IN (SELECT cod_fabricante
				FROM PRODUTO);


--– Proposta 2. Nome de todos os fabricantes dos que non hai produtos na BD. Non se 
--permite usar combinacións nesta consulta.

SELECT nome
FROM FABRICANTE 
WHERE codigo not IN (SELECT cod_fabricante
				FROM PRODUTO);


--– Proposta 3. Número de pedido, cantidade e data de pedido para aqueles pedidos recibidos 
--nos días en que un novo empregado foi contratado. Non se permite usar combinacións 
--nesta consulta.

select p.numero, p.cantidade, p.data_pedido
from PEDIDO p
where p.data_pedido in (select e.data_contrato
						from EMPREGADO e);

--– Proposta 4. Cidade e obxectivo das sucursais cuxo obxectivo supera a media das cotas de 
--todos os vendedores da BD. Non se permite usar combinacións nesta consulta.

select s.cidade, s.obxectivo
from SUCURSAL s
where s. > (select avg(e.cota_de_vendas)
					from EMPREGADO e);
				

--– Proposta 5. Número de empregado e cantidade media dos pedidos daqueles empregados 
--cuxa cantidade media de pedido é superior á cantidade media global (de todos os 
--pedidos). 

select p. num_empregado, avg(p.cantidade)
from PEDIDO p
group by p.num_empregado
having avg(p.cantidade)>(select avg(cantidade)
						from PEDIDO);

select * from PEDIDO;


--– Proposta 6. Nome dos clientes que aínda non fixeron pedidos. Non se permite usar 
--combinacións nesta consulta.

SELECT c.nome
FROM  CLIENTE c 
WHERE c.numero not IN (SELECT p.num_cliente
						FROM PEDIDO p);

--– Proposta 7. Nome completo dos empregados cuxas cotas son iguais ou superiores ao 
--obxectivo da sucursal da cidade de Vigo. Ten en conta que se a cota dun vendedor 
--(empregado) é nula debemos considerala como un 0, e do mesmo xeito actuaremos co 
--obxectivo da sucursal. 

select e.nome, e.ape1, e.ape2
from EMPREGADO e
where isnull(e.cota_de_vendas,0) >=(select s.obxectivo
						from SUCURSAL s
						where s.cidade = 'vigo');

						select * from SUCURSAL;

						
SELECT nome, ape1, ape2
FROM EMPREGADO
WHERE isnull(cota_de_vendas,0)>=(SELECT isnull(obxectivo,0)
								FROM SUCURSAL
								WHERE cidade='Vigo');

--– Proposta 8. Nome dos produtos para os que existe polo menos un pedido que ten unha 
--cantidade de polo menos 20 unidades. Hai que lembrar que a identificación dun produto 
--faise pola combinación do código do fabricante e o do produto. A solución deberá facerse 
--empregando o predicado EXISTS cunha subconsulta correlacionada. 

select pr.descricion
from PRODUTO pr
where exists (select  p.numero
			from PEDIDO p
			where p.cantidade >= 20 and
			p.cod_fabricante = pr.cod_fabricante and
			p.id_produto = pr.identificador);

--Aquí nos pide nombre de ls productos para los que existe un pedido que por lo menor tiene 20 unidades,
--es decir, tengo que comprobar uno a uno y como tiene una clave primaria formada por dos atributos, necesito hacer una es
--pecie de join, para que relacion la tabla correctamente.

			select * from PRODUTO;
			select * from PEDIDO;


SELECT pr.descricion
FROM PRODUTO pr
WHERE EXISTS (SELECT p.numero
			 FROM PEDIDO p
			 WHERE p.cantidade >=20 AND
			 p.cod_fabricante=pr.cod_fabricante AND
			p.id_produto=pr.identificador);



--– Proposta 9. Cidades das sucursais onde exista algún empregado cuxa cota de vendas 
--represente máis do 80% do obxectivo da oficina onde traballa. Para resolver esta consulta 
--deberase empregar unha subconsulta correlacionada precedida de ANY.

select s.cidade
from SUCURSAL s
where s.obxectivo *0.8 < any (select e.cota_de_vendas
						      from EMPREGADO e
						      where e.id_sucursal_traballa = s.identificador);


			select *, obxectivo *0.8 from SUCURSAL;
			select * from EMPREGADO;


--– Proposta 10. Nome dos clientes cuxos empregados asignados traballan en sucursais da 
--rexión OESTE. Non se poden usar joins, só subconsultas encadeadas.

select c.nome
from CLIENTE c
where c.num_empregado_asignado in (select e.numero
								   from EMPREGADO e
								   where e.id_sucursal_traballa in (select s.identificador
																	from SUCURSAL s
																	where s.rexion = 'OESTE'));

select * from SUCURSAL;			

SELECT nome
FROM CLIENTE
WHERE num_empregado_asignado IN (SELECT numero
								 FROM EMPREGADO
								WHERE id_sucursal_traballa IN (SELECT identificador
															 FROM SUCURSAL
															 WHERE rexion='OESTE'));


---------CONSULTAS CON FUNCIÓNS INTEGRADAS NO XESTOR paxina 62----------------------------------------------------------

use EMPRESA_BEA;

--– Proposta 1. Desexamos coñecer o código ASCII da vogal E. Na consulta deberás 
--devolver nunha columna a vogal en maiúscula, e nunha segunda o código ASCII que 
--lle corresponde.

select ascii('E') as codigo_ascii_de_E,
	char(69) as caracterASCII_do_codigo69;


--– Proposta 2. Consulta que devolve o carácter que lle corresponde aos seguintes 
--códigos ASCII: 70, 80, 90.

select char(70) as caracter70, char(80) as caracter80, char(90) as caracter90;


--– Proposta 3. Queremos obter unha listaxe que en cada liña teña o seguinte texto: O 
--empregado con nome e apelidos X ten que acadar unha cota de vendas anual de Y. 
--Sendo X o nome e os apelidos do empregado, e Y a cota de vendas. É importante 
--fixarse no segundo apelido. A listaxe terá por título Empregados e cotas.

select 'O empregado con nome e apelidos: ' + e.nome + ' ' + e.ape1 + ' ' + isnull(ape2, ' ') + ' ten que acadar unha cota de ventas anual de ' + isnull(convert(char(20),e.cota_de_vendas), 0) as Empregados_e_cotas
from EMPREGADO e;

select * from EMPREGADO;

--– Proposta 4. Consulta que devolva as datas nas que se contrataron empregados. O 
--formato das diferentes datas será dd-mm-aaaa e o nome da columna Datas de 
--contratación.

select distinct convert(char(10), e.data_contrato, 105) as "Datas de contratacion"
from EMPREGADO e;


--– Proposta 5. Queremos obter un nome abreviado das sucursais. Ese nome 
--comporase polos tres primeiros caracteres da cidade, os dous últimos da rexión e 
--separado por un guión baixo, o número de caracteres do nome da cidade.

select left(s.cidade, 3) + ' ' + right(s.rexion, 2) + '_' + convert(char(3), len(s.cidade))
from SUCURSAL s;


--– Proposta 6. Queremos obter un nome abreviado dos produtos. Ese nome 
--comporase polo segundo carácter do código do fabricante en minúscula, máis o 
--terceiro, cuarto, quinto e sexto da descrición do produto. Nunha primeira columna o 
--código aparecerá en minúsculas, e nunha segunda en maiúsculas.

select lower(upper(substring(p.cod_fabricante, 2,1)) + substring(p.descricion,3,4)) as nombre_abrev, upper(upper(substring(p.cod_fabricante, 2,1)) + substring(p.descricion,3,4)) as nombre_mayus
from PRODUTO p;

select * from PRODUTO;

--– Proposta 7. Listaxe cos nomes dos empregados co formato ape1 ape2, nome. Se 
--algún empregado non ten segundo apelido, por exemplo Susanne Smith, no 
--resultado aparecerá Smith, Sussane, sen espazos antes da coma.

--le hago el rtrim a nombre y apellido, para que los nulos del ape2, se borre el 
select rtrim(e.ape1 + ' ' +  isnull(e.ape2, ' ')) + ', ' + e.nome as nome_apelidos
from EMPREGADO e;


--– Proposta 8. Queremos amosar os distintos títulos dos nosos empregados en 
--castelán, e para iso deberemos substituír a palabra VENDAS por VENTAS.

select replace(e.titulo, 'VENDAS', 'VENTAS') as titulos
from EMPREGADO e;

select titulo from EMPREGADO;

--– Proposta 9. Consulta que devolva a seguinte información de tempo en distintas 
--columnas co nome adecuado cada unha:
--– data e hora actuais sen axuste de zona horaria,
--– data e hora actuais con axuste de zona horaria,
--– mes actual en número,
--– mes actual en número (emprega unha función diferente á da anterior 
--columna),
--– ano actual,
--– mes actual en nome,
--– hora actual,
--– nanosegundos actuais.

select
sysdatetime() as hora_sen_axuste,
sysdatetimeoffset() as hora_con_axuste_zona_horaria,
datepart(month, getdate()) as mes,
datepart(month, getutcdate()) as mes_otra_funcion,
datepart(year, getdate()) as anho_actual,
datename(month, getdate()) as mes_nome,
datepart(hour, getdate()) as hora_actual,
datepart(ns, getdate()) as nanosegundos;


--– Proposta 10. Listaxe que devolva o nome de todos os empregados (nome, ape1, 
--ape2), a data de contrato, e nunha última columna a data de contrato adiantada un 
--ano. O formato das dúas datas será dd/mm/aaaa (con barras).

select e.nome, e.ape1, isnull(e.ape2, ' ') as ape2, convert(char(10), e.data_contrato,103) as fecha_original, convert(varchar(10), dateadd(year, 1, e.data_contrato),103) as ano_adiantado
from EMPREGADO e;


--– Proposta 11. Listaxe que devolva o número de cada pedido coa data de pedido. 
--Nunha terceira columna deberá aparecer a mesma data de pedido pero retrasada 
--dous meses. O formato das dúas datas será dd-mm-aaaa (con guións).

select p.numero, p.data_pedido, convert(char(10), dateadd(month, -2, p.data_pedido), 105) as dos_meses_menos
from PEDIDO p;

--– Proposta 12. Listaxe que devolva o nome e apelidos (nome, ape1, ape2) de cada 
--empregado, a data de contrato e o número de anos que hai que leva traballando na 
--empresa cada un deles. 

select e.nome, e.ape1, isnull(e.ape2, ' ') as ape2, e.data_contrato, datediff(year, e.data_contrato, getdate()) as anhos_empresa
from EMPREGADO e;

--– Proposta 13. Consulta que devolva a descrición de cada produto co seu prezo nunha 
--segunda columna, e ademais deberán amosarse en columnas diferentes: 
--– o prezo como un enteiro aproximado por defecto, 
--– o prezo como un enteiro aproximado por exceso, 
--– a raíz cadrada do prezo,
--– o cadrado do prezo, e, 
--– o cubo do prezo.

select p.descricion, p.prezo, ceiling(p.prezo) as aproximado_defecto, 
floor(p.prezo) as aproximado_exceso, sqrt(p.prezo) as raiz_cadrada_prezo, square(p.prezo) as cuadrodo_prezo,
power(p.prezo,3) as cubo
from PRODUTO p;



--– Proposta 14. Repite a consulta anterior pero agora só amosaremos a descrición, o 
--prezo e a raíz cadrada, pero a raíz cadrada deberá amosarse con como moito 4 cifras 
--na parte enteira e 3 na decimal.

select p.descricion, p.prezo,
convert(numeric(7,3),sqrt(p.prezo)) as raiz_cadrada_prezo
from PRODUTO p;

--– Proposta 15. Consulta que devolva a seguinte información do servidor no que está a 
--nosa instancia de SQL Server: idioma, número máximo de conexións permitidas, 
--nome do servidor e da instancia e versión do xestor.

select
@@language as idioma, @@MAX_CONNECTIONS as conexiones_maximas_permitidas, @@SERVERNAME as nombre_servidor, @@version as version_servidor;


--– Proposta 16. Consulta que amose a descrición do produto e as súas existencias. 
--Nunha terceira columna de nome estado_existencias amosarase o seguinte:
--– Se o número de existencias é superior a 20 aparecerá a palabra Suficientes.
--– Se o número de existencias é menor ou igual a 20 aparecerá Insuficientes.
--Esta consulta deberás resolvela de dous xeitos posibles, en dúas consultas 
--diferentes, empregando dúas funcións lóxicas distintas


select p.descricion, p.existencias,
	case
		when p.existencias > 20 then 'Suficientes'
		else 'Insuficientes'
	end as existencias
from PRODUTO p;


select p.descricion, p.existencias, iif(p.existencias > 20, 'Suficientes', 'Insuficientes') as existencias
from PRODUTO p;

---------CONSULTAS COMPUESTAS paxina 94----------------------------------------------------------

use EMPRESA_BEA;

--– Proposta 1. Empregando unha consulta composta realizar unha listaxe do código do 
--fabricante e identificador daqueles produtos con prezo superior a 60€ ou que teñan 
--pedidos de cantidade inferior a 5 unidades. O resultado aparecerá ordenado por 
--fabricante e para o mesmo fabricante por produto.

SELECT cod_fabricante, identificador
FROM PRODUTO
WHERE prezo>60
UNION 
SELECT cod_fabricante, id_produto
FROM PEDIDO
WHERE cantidade<5
ORDER BY cod_fabricante, identificador;



--– Proposta 2. Empregando unha consulta composta amosar os código dos 
--empregados que non fixeron pedidos. Deberán aparecer primeiro os empregados 
--con código maior.


--– Proposta 3. Empregando unha consulta composta amosar o código dos clientes que 
--fixeron pedidos e con límite de crédito maior ou igual a 40000. Usa unha diferenza 
--para resolver esta consulta.


--– Proposta 4. Empregando unha consulta composta amosar os código dos clientes que 
--fixeron pedidos e con límite de crédito maior ou igual a 40000. Usa unha 
--intersección para resolver esta consulta. Ordena o resultado por código de cliente 
--en orde ascendente.


--– Proposta 5. Empregando unha consulta composta amosar o código dos empregados 
--que son directores dalgunha sucursal ou que teñen unha cota de vendas superior a 
--250000€. 


--– Debes propoñer dúas solucións: 
--– na primeira só pode aparecer unha vez cada empregado no resultado, e,
--– na segunda se un empregado é director dunha sucursal e ademais ten unha 
--cota superior a 250000€, aparecerá no resultado máis dunha vez.



---------CONSULTAS COMPLEXAS paxina 101----------------------------------------------------------

use EMPRESA_BEA;
use SOCIEDADE_CULTURAL_BEA;

--– Proposta 1. DB SOCIEDADE_CULTURAL. Nif e nome completo nunha columna (ape1 
--ape2, nome) de cada socio, só para os socios que deben algunha actividade. Nunha 
--segunda columna aparecerá o importe total que debe en actividades. A columna do 
--nome chamarase nome_completo e a do importe debido cantidade_debe. O 
--resultado aparecerá por orde alfabética de apelidos e nome dos socios.




--– Proposta 2. BD EMPRESA. Número de pedido, descrición e prezo do produto, 
--unidades vendidas e importe de todos os pedidos da BD ordenados de maior a 
--menor importe. No caso de coincidir os importes deberá ordenarse alfabeticamente 
--pola descrición do produto.



--– Proposta 3. BD EMPRESA. Número de pedido, descrición e prezo do produto, 
--unidades vendidas e importe dos pedidos da BD con importe superior a 1000€, 
--ordenados de maior a menor importe. No caso de coincidir os importes deberá 
--ordenarse alfabeticamente pola descrición do produto.



--– Proposta 4. BD EMPRESA. Número de pedido, nome do cliente e data de pedido dos 
--pedidos recibidos nos días en que se contrataron empregados. No resultado deben 
--aparecer primeiro os pedidos máis recentes.



--– Proposta 5. DB EMPRESA. Nome completo dos empregados co nome do empregado 
--que teñen por xefe. Na primeira columna de nome empregado aparecerá o nome 
--completo de cada empregado co formato ape1 ape2, nome, teña ou non teña xefe. 
--Na segunda columna de nome xefe aparecerá o nome completo do xefe dese 
--empregado co mesmo formato que o campo empregado. No caso de non ter xefe na 
--segunda columna aparecerá a frase 'XEFE POR DETERMINAR'.
--Non se amosan os empregados que dirixen a sucursal onde traballa cada un 
--deles, senón o xefe directo. (Ver campo EMPREGADO.num_empregado_xefe).




--– Proposta 6. DB SOCIEDADE_CULTURAL. Gasto en actividades por socio. Na primeira 
--columna aparecerá o nif do socio e na segunda o gasto, pagado ou non, que leva 
--feito en actividades. Os socios que non participaron en actividades non aparecerán 
--no resultado.



--– Proposta 7. DB SOCIEDADE_CULTURAL. Nome e apelidos, (en tres columnas de 
--nomes apelido1, apelido2 e nome_propio) das persoas que forman parte da nosa 
--sociedade cultural independentemente da súa labor na sociedade. Nunha cuarta 
--columna cargo se a persoa é empregado aparecerá a frase 'É EMPREGADO' e noutro 
--caso 'NON É EMPREGADO'. O resultado aparecerá ordenado alfabeticamente por 
--apelidos e nome.



--– Proposta 8. BD EMPRESA. Empregando unha consulta composta amosa o 
--identificador das sucursais que non teñen empregados traballando nelas.



--– Proposta 9. BD EMPRESA. Nunha columna nome_abreviado amosa os tres primeiros 
--caracteres en minúsculas do primeiro apelido de cada empregado.



--– Proposta 10. DB SOCIEDADE_CULTURAL. Nome e apelidos, (en tres columnas de 
--nomes apelido1, apelido2 e nome_propio) dos socios que cumpren anos no mes 
--actual.



----------TAREFAS DE AUTOAVALIACIÓN ---------------------------------------------------------------------------------------------------------------------------------------------------------

--1. Tarefa de consultas simples------------------------------------------------------------


-- Consulta 1.1. BD EMPRESA. Consulta que devolva o código e nome dos fabricantes cuxo 
--nome non ten por segunda letra O.


-- Consulta 1.2. BD EMPRESA. Número identificador, nome completo e data de nacemento dos 
--empregados que traballan na sucursal con identificador 12, e naceron no ano 1985. No 
--resultado aparecerán primeiro os empregados máis novos.


-- Consulta 1.3. BD EMPRESA. Número de pedido daqueles nos que se pediron 6 ou 10 
--unidades. Para resolver esta consulta non se poden utilizar operadores de comparación (>, <, 
-->=, <=, < >, !=).


-- Consulta 1.4. BD EMPRESA. Número e nome propio (nunha única columna separados por un 
--guión, número - nome_propio) dos empregados que non teñen segundo apelido. A columna 
--do resultado deberá chamarse datos_empregados.



--2. Tarefa de consultas resumo---------------------------------------------------------



-- Consulta 2.1. BD EMPRESA. Cantidade total de empregados que hai por sucursal. Aparecerá 
--o identificador da sucursal e nunha segunda columna a cantidade de empregados que 
--traballan na mesma.


-- Consulta 2.2. BD EMPRESA. Prezo medio dos produtos por fabricante. Nunha primeira 
--columna aparecerá o código de tres caracteres do fabricante, e na segunda o prezo medio 
--dos produtos dese fabricante. No resultado deberán aparecer os fabricante teñan produtos 
--con maior prezo medio.


-- Consulta 2.3. BD EMPRESA. Repite a consulta anterior, pero agora só poden aparecer os 
--fabricantes con número de produtos a venda superior a 3. 


-- Consulta 2.4. BD EMPRESA. Cantidade de empregados que son directores dalgunha sucursal. 
--Ten en conta que distintas sucursais poden ter o mesmo director.


--3. Tarefa de consultas con combinacións---------------------------------------------------

-- Consulta 3.1. BD SOCIEDADE_CULTURAL. Nome das actividades co nome completo do 
--profesor/a que as imparten, só para as actividades que custan máis de 70€. Na primeira 
--columna Actividade aparecerá o nome da actividade e na segunda de nome Docente, 
--aparecerá o nome completo do docente co formato apelido1 apelido2, nome. Deberanse 
--propoñer dúas solucións, unha primeira coa condición de combinación na cláusula FROM, e 
--unha segunda coa condición de combinación na cláusula WHERE.


-- Consulta 3.2. BD EMPRESA. Listaxe dos produtos da BD ordenados alfabeticamente por 
--descrición. No resultado aparecerán dúas columnas, na primeira o nome do fabricante e na 
--segunda a descrición do produto. As columnas chamaranse Fabricante e Produto. Deberanse 
--propoñer dúas solucións, unha primeira coa condición de combinación na cláusula FROM, e 
--unha segunda coa condición de combinación na cláusula WHERE.


-- Consulta 3.3. BD SOCIEDADE_CULTURAL. Deséxase saber quen paga cada cota, e tamén se 
--hai cotas que non están asignadas a ningún socio ou socios que non teñen cota asignada. A 
--consulta deberá devolver dúas columnas Socio/a e Cota. En Socio aparecerán os números de 
--cada socio e en Cota os nomes de cada cota. Se un socio non tivese cota asignada, na 
--columna Cota aparecerá a frase -SEN DESIGNAR-. Se unha cota non está asociada a ningún 
--socio, na columna Socio/a aparecerá a frase -SEN SOCIO/A-. Para que a consulta teña sentido 
--débese supoñer que a columna cod_cota de SOCIO puidese admitir nulos.


-- Consulta 3.4. BD EMPRESA. Consulta que devolva cada empregado co cliente ou clientes que 
--ten asignados. Se un empregado ten máis dun cliente aparecerá en tantas filas como clientes 
--teña. Na primeira columna Empregado aparecerá o número e o primeiro apelido do 
--empregado separados por un guión. Na segunda columna Cliente aparecerá o nome do 
--mesmo. Se un empregado non ten clientes especificarase -SEN CLIENTES- e se un cliente non 
--ten empregado indicarase deixando en branco o empregado. Na solución na cláusula FROM 
--a primeira táboa que se debe poñer será a de EMPREGADO.


-- Consulta 3.5. BD SOCIEDADE_CULTURAL. Empregados coas actividades que imparten. No 
--resultado aparecerá na primeira columna Empregado o número da seguridade social (NSS) 
--do empregado, e na segunda columna Actividades o nome da actividade. Se un empregado 
--non imparte actividades aparecerá a frase -SEN ACTIVIDADES- e se imparte varias aparecerá 
--en varias filas, cada unha cunha das actividades. Na solución na cláusula FROM a primeira 
--táboa que se debe poñer será a de ACTIVIDADE.


-- Consulta 3.6. BD SOCIEDADE_CULTURAL. Produto cartesiano entre a táboa de aulas e a de 
--actividades. Nunha primeira columna aparecerá o nome da aula e na segunda o nome da 
--actividade. Débense propoñer dúas solucións, segundo as sintaxes estudadas para o produto 
--cartesiano.


-- Consulta 3.7. BD SOCIEDADE_CULTURAL. Consulta que devolva o NIF de cada socio 
--combinado con cada un dos nomes das cotas da BD. O resultado terá unha columna co 
--formato NIF socio - Nome cota. Débense propoñer dúas solucións, segundo cómo se 
--dispoñan as táboas no FROM.


--4. Tarefa de consultas con subconsultas-------------------------------------------------------

-- Consulta 4.1. BD EMPRESA. Número e data dos pedidos realizados por empregados sen cota 
--de vendas. Deberase resolver sen usar combinacións de táboas.


-- Consulta 4.2. BD SOCIEDADE_CULTURAL. Nome e prezo das actividades con prezo superior 
--ao prezo medio das cotas. Deberase resolver sen usar combinacións de táboas.


-- Consulta 4.3. BD SOCIEDADE_CULTURAL. Listaxe do nif de todos os socios sempre que non 
--exista ningún vivindo na provincia de Madrid. Deberase resolver sen usar combinacións de 
--táboas.


-- Consulta 4.4. BD SOCIEDADE_CULTURAL. Nome e prezo das actividades con prezo superior 
--ao da cota máis cara. Deberase resolver sen usar combinacións de táboas nin a función 
--colectiva max. 



--5. Tarefa de consultas con funcións integradas no xestor-------------------------------------
-- Consulta 5.1. BD EMPRESA. Consulta que devolva información dos empregados nas 
--seguintes columnas:
--– número identificador e nome propio separados polo símbolo # (cancelo).
--– Tres primeiras letras do primeiro apelido.
--– Tres últimas letras do primeiro apelido.
--– Terceiro e cuarto caracteres do primeiro apelido.
--– Nome propio en minúsculas.
--– Nome propio en maiúsculas.
--– Título eliminándolle os posibles espazos en branco á esquerda.
--– Título eliminándolle os posibles espazos en branco á dereita.
--– Título eliminándolle todos os espazos.
--– Nome propio substituíndo E por O.



-- Consulta 5.2. BD EMPRESA. Consulta que devolva información dos empregados nas 
--seguintes columnas:
--– Nome completo dos empregados co formato apelido1 apelido2, nome.
--– Cota de vendas. 
--– Cota de vendas aproximada por exceso. 
--– Cota de vendas aproximada por defecto.
--– Cota de vendas elevada ao cadrado.
--– Cota de vendas elevada ao cubo.
--– Raíz cadrada da cota de vendas.
--Todos os valores nulos do resultado deberán aparecer substituídos polo valor 0.



-- Consulta 5.3. BD EMPRESA. Consulta que devolva información dos pedidos nas seguintes 
--columnas:
--– Número do pedido.
--– Data actual con axuste de zona horaria.
--– Data do pedido co formato dd-mm-aaaa.
--– Día no que se fixo o pedido.
--– Nome do mes no que se fixo o pedido.
--– Ano no que se fixo o pedido.
--– Meses que pasaron desde que se fixo o pedido.
--– Data de pedido adiantada 4 anos.
--– Data de pedido retrasada 1 mes.




-- Consulta 5.4. BD SOCIEDADE_CULTURAL. Consulta que devolve unha columna 
--Linguaxe_usada na que dependendo da linguaxe en uso na sesión, aparecerá unha frase ou 
--outra:
--– se a linguaxe é Español deberá aparecer a frase SU IDIOMA ES ESPAÑOL.
--– se a linguaxe é us_english deberá aparecer a frase YOUR LANGUAGE IS ENGLISH.
--– se a linguaxe é outra deberá aparecer a frase VOSTEDE NON ESTÁ USANDO NIN 
--ESPAÑOL NIN INGLÉS.




--6. Tarefa de consultas compostas--------------------------------------------------------------

-- Consulta 6.1. BD SOCIEDADE_CULTURAL. Empregando unha consulta composta pídese a 
--listaxe dos identificadores das actividades con prezo superior a 15€ ou que se impartan en 
--aulas con superficie inferior a 100 metros cadrados. O resultado aparecerá ordenado de 
--maior a menor identificador.



-- Consulta 6.2. BD SOCIEDADE_CULTURAL. Empregando unha consulta composta amosar o nif 
--dos socios que asisten a actividades e que pagaron a cota anual. 


-- Consulta 6.3. BD EMPRESA. Empregando unha consulta composta amosar o número 
--identificador dos clientes que aínda non fixeron pedidos. Ordena o resultado polo número de 
--cliente en orde ascendente.


use EMPRESA_BEA;

--7. Tarefa de consultas complexas optimizadas-------------------------------------------------

-- Consulta 7.1. Consulta que devolve na primeira columna a descrición dos produtos, e nunha 
--segunda columna o gasto total en pedidos dese produto. No resultado só poderán aparecer 
--aqueles produtos cuxo gasto medio é menor de 1000€.
--A primeira columna chamarase Produto e a segunda Gasto total.
--Se de algún produto non se realizaron pedidos na columna do Gasto total deberá aparecer o 
--número cero.
--Deberán aparecer primeiro no resultado os produtos con maior gasto total. 

use EMPRESA_BEA;

select p.descricion as 'Producto',
	 isnull(SUM(pe.cantidade*p.prezo), 0) as Gasto_total
from PRODUTO p left join PEDIDO pe
		on p.cod_fabricante = pe.cod_fabricante and p.identificador = pe.id_produto
group by pe.id_produto, p.descricion, pe.cantidade, p.prezo
having isnull(SUM(pe.cantidade*p.prezo), 0) < 1000
order by Gasto_total desc;



-- Consulta 7.2. Consulta que devolva a lista dos pedidos que hai máis de 12 meses e menos de 
--25 meses que se realizaron.
--Para facer a comprobación dos anos que hai que se realizou o pedido non está permitido 
--usar nin o predicado IN, nin OR nin tampouco os operadores de comparación >=, >, <=, !=, = 
--<>.
--No resultado deberá aparecer o número do pedido, nunha segunda columna FechaPed 
--aparecerá a data do pedido con formato dd-mm-aaaa (separación empregando guións), 
--nunha terceira columna de nome Unidades aparecerá o seguinte en función do número de 
--unidades solicitadas no pedido:
--– Se a cantidade de unidades do pedido é inferior a 15 aparecerá o texto POUCAS.
--– Se a cantidade de unidades do pedido é superior ou igual a 15 e menor que 20 
--aparecerá o texto NORMAL.
--– Se a cantidade de unidades do pedido é superior ou igual a 20 aparecerá o texto 
--MOITAS.
--Deben aparecer os pedidos máis recentes primeiro. 

use EMPRESA_BEA
go

select p.numero,
	   convert(char(10),p.data_pedido, 105) as FechaPed,
	   case
			when p.cantidade < 15 then 'POUCAS'
			when p.cantidade between 15 and 19 then 'NORMAL'
			else 'MOITAS'
			end as Unidades
from PEDIDO p
where datediff(month, p.data_pedido, getdate()) between 12 and 25
order by FechaPed desc;


-- Consulta 7.3. Consulta que devolva a cidade en maiúsculas de cada unha das sucursais da 
--BD, a súa rexión en minúsculas 


--e noutra terceira columna de nome pedido_minimo as 
--unidades do pedido con menor número de unidades da sucursal. Ten en conta que un pedido 
--pertence a unha sucursal se foi realizado por un empregado que traballa nesa sucursal. 
--Se existise algunha sucursal que non teña vendido nada, non aparecerá no resultado.


select upper(s.cidade) as 'CIDADE MAYUSCULA',
	   lower(s.rexion) as 'rexión minúscula',
	   min(p.cantidade) as 'pedido minimo'
from SUCURSAL s inner join EMPREGADO e on s.identificador = e.id_sucursal_traballa
				join PEDIDO p on e.numero = p.num_empregado
group by s.identificador, s.cidade, s.rexion;


SELECT upper(s.cidade) as cidade, lower(s.rexion) as rexion, 
 min(p.cantidade) as pedido_minimo
FROM SUCURSAL s, EMPREGADO e, PEDIDO p
WHERE s.identificador=e.id_sucursal_traballa AND
 e.numero=p.num_empregado
GROUP BY s.identificador, s.cidade, s.rexion;


-- Consulta 7.4. Nome completo nunha columna (co formato ape1 ape2, nome) e noutra a data 
--de contratación (co formato dd/mm/aaaa), dos empregados que foron contratados un día 
--12, 19 ou 20 de calquera mes e de calquera ano. Importante: Non se pode usar o operador 
--OR nin a función day para resolver a consulta.

select  rtrim(e.ape1+ ' ' +isnull(e.ape2, '')) + ', ' + e.nome as 'nome completo',
		convert(varchar(10),e.data_contrato,103)
from EMPREGADO e
where datepart(day,e.data_contrato) in (12,19,20);



-- Consulta 7.5. Executa no servidor a seguinte instrución e comproba que foi agregado un 
--produto novo coa descrición PROBA_AVALIACION.
--INSERT INTO PRODUTO (cod_fabricante, identificador, descricion, prezo, existencias)
--VALUES ('ASU', '41777', 'PROBA_AVALIACION', 300, 40);
--Unha vez comprobado que a nova fila está na táboa, realiza a consulta que devolve o número 
--total de produtos cuxa descrición contén algún dos seguintes tres caracteres: / (barra 
--diagonal ou slash), _ (guión baixo), - (guión medio). Para facelo non está permitido o uso dos 
--corchetes ([ ]).
--/ (barra diagonal ou slash) _ (guión baixo) - (guión medio)
--Unha vez rematada a consulta é necesario eliminar o produto engadido coa seguinte 
--instrución:
--DELETE FROM PRODUTO WHERE descricion='PROBA_AVALIACION';

select count(p.identificador) 
from PRODUTO p
WHERE p.descricion LIKE '%\/%' ESCAPE '\' OR
 p.descricion LIKE '%\_%' ESCAPE '\' OR
 p.descricion LIKE '%-%';
 


-- Consulta 7.6. Número, data e cantidade, dos pedidos con maior número de unidades. No 
--resultado aparecerán primeiro os pedidos máis antigos.

use EMPRESA_BEA
go
select p.numero, p.data_pedido, p.cantidade as pedido_mas_cantidad
from PEDIDO p
where p.cantidade = (select max(cantidade) from PEDIDO)
order by p.data_pedido;


select * from PEDIDO;



-- Consulta 7.7. Consulta que devolva o 25% dos empregados cuxo primeiro apelido ten por 
--segunda letra un A. A consulta amosará en diferentes columnas o número, nome propio, o 
--primeiro apelido dos empregados, o número de caracteres do primeiro apelido e o nome do 
--mes en que foi contratado. Para resolver a busca da letra A na segunda posición do primeiro 
--apelido, deberase empregar unha función integrada no xestor.

select top 25 percent e.numero, e.nome, e.ape1, len(e.ape1) as carc_ape1, datename(month, data_contrato) as mes_contradado
from EMPREGADO e
where substring(e.ape1, 2,1) in ('A')


-- Consulta 7.8. Descrición dos produtos dos que non se fixeron pedidos. Para obter o 
--resultado non se pode empregar ningunha combinación externa, nin a palabra reservada 
--DISTINCT, nin subconsultas.
use EMPRESA_BEA
go

--solución mala porque no dija usar joins
select pr.descricion
from PRODUTO pr left join PEDIDO pe
	 on pr.cod_fabricante = pe.cod_fabricante and pr.identificador = pe.id_produto
where pe.numero is null;

--solución más o menos buena
select pr.descricion
from PRODUTO pr
except
select pro.descricion
from PEDIDO p inner join PRODUTO pro
	on p.cod_fabricante = pro.cod_fabricante and p.id_produto = pro.identificador;

--solución de mónica
SELECT descricion
FROM PRODUTO
EXCEPT
SELECT pr.descricion
FROM PRODUTO pr, PEDIDO p
WHERE pr.cod_fabricante=p.cod_fabricante AND
pr.identificador=p.id_produto;

--borré la 7.9 sino me daba problemas el programa

-- Consulta 7.10. Nome de cada cliente e ao lado do mesmo as unidades vendidas de media 
--(columna cantidade) nos seus pedidos, só para aqueles clientes cuxo representante de 
--vendas (empregado que ten asociado) ten por título RP VENDAS. Se non mercaron nada 
--deberá aparecer como media de unidades 0.
--A columna das unidades medias deberá ter 3 díxitos como máximo na parte enteira e 2 
--decimais.
--Deberán aparecer primeiro no resultado os clientes con maior número de unidades medias.
use EMPRESA_BEA
go

select c.nome, 
convert(numeric(5,2) , isnull(avg(p.cantidade), 0)) as 'media_unidades'
from (CLIENTE c left join PEDIDO p on c.numero = p.num_cliente)
			   inner join EMPREGADO e on c.num_empregado_asignado = e.numero
where e.titulo in ('RP VENDAS')
group by c.numero, c.nome
order by media_unidades desc;

--solución de mónica
SELECT c.nome, 
 convert(numeric(5,2),isnull(avg(p.cantidade),0)) as media_unidades
FROM (CLIENTE c LEFT JOIN PEDIDO p ON c.numero=p.num_cliente) 
				INNER JOIN EMPREGADO e ON c.num_empregado_asignado=e.numero
WHERE e.titulo='RP VENDAS'
GROUP BY c.numero, c.nome
ORDER BY media_unidades DESC;


--borré la 11 y 12 porque no funcionaba


-- Consulta 7.13. Nome dos fabricantes dos que non hai produtos na BD.

use EMPRESA_BEA
go

select f.nome
from FABRICANTE f
except
select fr.nome
from FABRICANTE fr inner join PRODUTO
	on cod_fabricante = fr.codigo

SELECT f.nome
FROM FABRICANTE f LEFT JOIN PRODUTO p
 ON f.codigo=p.cod_fabricante
WHERE p.identificador IS NULL;

-- Consulta 7.14. Número identificador e data dos pedidos que teñan 9,7,10 ou 8 unidades e 
--que foron comprados polo cliente 1108 ou vendidos polo empregado 101.

use EMPRESA_BEA
go

select pe.numero, pe.data_pedido
from PEDIDO pe
where (pe.num_cliente=1108 or pe.num_empregado = 101) and pe.cantidade between 7 and 10;

-- Consulta 7.15. Nomes de tódolos clientes e de tódolos fabricantes da BD nunha única 
--columna. A columna que se chamará empresas, deberá aparecer ordenada alfabeticamente
use EMPRESA_BEA;
go

SELECT nome as empresas FROM CLIENTE
UNION ALL
SELECT nome FROM FABRICANTE
ORDER BY nome