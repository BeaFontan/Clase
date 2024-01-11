use EMPRESA_BEA;

--HOJA 27------------------------------------------------------------------------------

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



--HOJA 35---------------------------------------------------------------------------

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
having count(p.numero) > 2 & avg(p.cantidade) < 10;


--– Proposta 7. Cantidade total de sucursais que hai por rexión. Aparecerá o nome da 
--rexión e na mesma columna separado por un guión, a cantidade de sucursais 
--situadas nesa rexión.



--HOJA 51---------------------------------------------------------------------------

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








--4. Tarefa de consultas con subconsultas --? Consultas propostas na BD EMPRESA.

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
--obxectivo da sucursal. Non se permite usar combinacións nesta consulta.




--– Proposta 8. Nome dos produtos para os que existe polo menos un pedido que ten unha 
--cantidade de polo menos 20 unidades. Hai que lembrar que a identificación dun produto 
--faise pola combinación do código do fabricante e o do produto. A solución deberá facerse 
--empregando o predicado EXISTS cunha subconsulta correlacionada. Non se permite usar 
--combinacións.



--– Proposta 9. Cidades das sucursais onde exista algún empregado cuxa cota de vendas 
--represente máis do 80% do obxectivo da oficina onde traballa. Para resolver esta consulta 
--deberase empregar unha subconsulta correlacionada precedida de ANY.



--– Proposta 10. Nome dos clientes cuxos empregados asignados traballan en sucursais da 
--rexión OESTE. Non se poden usar joins, só subconsultas encadeadas.
