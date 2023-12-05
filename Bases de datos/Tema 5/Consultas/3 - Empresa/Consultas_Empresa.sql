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