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
															 WHERE rexion='OESTE'));---------CONSULTAS CON FUNCIÓNS INTEGRADAS NO XESTOR----------------------------------------------------------
--– Proposta 1. Desexamos coñecer o código ASCII da vogal E. Na consulta deberás 
--devolver nunha columna a vogal en maiúscula, e nunha segunda o código ASCII que 
--lle corresponde.


--– Proposta 2. Consulta que devolve o carácter que lle corresponde aos seguintes 
--códigos ASCII: 70, 80, 90.


--– Proposta 3. Queremos obter unha listaxe que en cada liña teña o seguinte texto: O 
--empregado con nome e apelidos X ten que acadar unha cota de vendas anual de Y. 
--Sendo X o nome e os apelidos do empregado, e Y a cota de vendas. É importante 
--fixarse no segundo apelido. A listaxe terá por título Empregados e cotas.



--– Proposta 4. Consulta que devolva as datas nas que se contrataron empregados. O 
--formato das diferentes datas será dd-mm-aaaa e o nome da columna Datas de 
--contratación.


--– Proposta 5. Queremos obter un nome abreviado das sucursais. Ese nome 
--comporase polos tres primeiros caracteres da cidade, os dous últimos da rexión e 
--separado por un guión baixo, o número de caracteres do nome da cidade.


--– Proposta 6. Queremos obter un nome abreviado dos produtos. Ese nome 
--comporase polo segundo carácter do código do fabricante en minúscula, máis o 
--terceiro, cuarto, quinto e sexto da descrición do produto. Nunha primeira columna o 
--código aparecerá en minúsculas, e nunha segunda en maiúsculas.



--– Proposta 7. Listaxe cos nomes dos empregados co formato ape1 ape2, nome. Se 
--algún empregado non ten segundo apelido, por exemplo Susanne Smith, no 
--resultado aparecerá Smith, Sussane, sen espazos antes da coma.



--– Proposta 8. Queremos amosar os distintos títulos dos nosos empregados en 
--castelán, e para iso deberemos substituír a palabra VENDAS por VENTAS.



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






--– Proposta 10. Listaxe que devolva o nome de todos os empregados (nome, ape1, 
--ape2), a data de contrato, e nunha última columna a data de contrato adiantada un 
--ano. O formato das dúas datas será dd/mm/aaaa (con barras).



--– Proposta 11. Listaxe que devolva o número de cada pedido coa data de pedido. 
--Nunha terceira columna deberá aparecer a mesma data de pedido pero retrasada 
--dous meses. O formato das dúas datas será dd-mm-aaaa (con guións).



--– Proposta 12. Listaxe que devolva o nome e apelidos (nome, ape1, ape2) de cada 
--empregado, a data de contrato e o número de anos que hai que leva traballando na 
--empresa cada un deles. 



--– Proposta 13. Consulta que devolva a descrición de cada produto co seu prezo nunha 
--segunda columna, e ademais deberán amosarse en columnas diferentes: 
--– o prezo como un enteiro aproximado por defecto, 
--– o prezo como un enteiro aproximado por exceso, 
--– a raíz cadrada do prezo,
--– o cadrado do prezo, e, 
--– o cubo do prezo.



--– Proposta 14. Repite a consulta anterior pero agora só amosaremos a descrición, o 
--prezo e a raíz cadrada, pero a raíz cadrada deberá amosarse con como moito 4 cifras 
--na parte enteira e 3 na decimal.



--– Proposta 15. Consulta que devolva a seguinte información do servidor no que está a 
--nosa instancia de SQL Server: idioma, número máximo de conexións permitidas, 
--nome do servidor e da instancia e versión do xestor.


--– Proposta 16. Consulta que amose a descrición do produto e as súas existencias. 
--Nunha terceira columna de nome estado_existencias amosarase o seguinte:
--– Se o número de existencias é superior a 20 aparecerá a palabra Suficientes.
--– Se o número de existencias é menor ou igual a 20 aparecerá Insuficientes.
--Esta consulta deberás resolvela de dous xeitos posibles, en dúas consultas 
--diferentes, empregando dúas funcións lóxicas distintas