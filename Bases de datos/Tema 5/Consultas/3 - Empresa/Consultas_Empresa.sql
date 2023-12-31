use EMPRESA_BEA;

--HOJA 27------------------------------------------------------------------------------

--� Proposta 15. Nome de todos os clientes por orde alfab�tica. 

select c.nome
from CLIENTE c
order by nome ASC;

--� Proposta 16. Nome das rexi�ns nas que ten sucursais a empresa.

select s.rexion
from SUCURSAL s;


--� Proposta 17. Identificador dos produtos que nos pediron nalg�n momento. 
--No resultado debe aparecer nunha soa columna o c�digo do fabricante e o identificador 
--do produto separados por un gui�n. A columna do resultado deber� chamarse produtos.

select p.cod_fabricante + '-' + p.id_produto as productos
from PEDIDO p
where p.id_produto is not null;


--� Proposta 18. Informaci�n completa das sucursais non dirixidas polo empregado 
--n�mero 108.

select s.identificador, s.cidade, s.rexion, s.obxectivo, s.num_empregado_director
from SUCURSAL s
where s.num_empregado_director != 108;

--� Proposta 19. Nome e l�mite de cr�dito do cliente n�mero 1107.

select c.nome, c.limite_de_credito
from CLIENTE c
where c.numero = 1107;

--� Proposta 20. N�mero e data dos pedidos feitos entre o 1 de agosto e o 31 de 
--decembro de 2014. S� debe aparecer a data de cada pedido, sen a hora, co formato 
--dd-mm-aaaa. Deben aparecer primeiro no resultado os pedidos m�is recentes. Para 
--resolver esta consulta non se poden utilizar operadores de comparaci�n (>, <, >=, 
--<=, < >, !=).

select p.numero, p.data_pedido
from PEDIDO p
where p.data_pedido BETWEEN '01-08-2014' AND '31-12-2014';

SELECT * from PEDIDO;

--� Proposta 21. C�digo e nome dos fabricantes cuxo nome ten por segunda letra O.

select f.codigo, f.nome
from FABRICANTE f
where f.nome LIKE '_o%';

		--Le pongo el gui�n bajo para decirle que hay un caracter delante, luego una o y luego el % para decirle que va a seguir

--� Proposta 22. Descrici�n e prezo dos produtos dos que non temos existencias.

select p.descricion, p.prezo
from PRODUTO p
where p.existencias = 0;


--� Proposta 23. N�mero identificador e nome completo dos empregados que non 
--te�en xefe.

select e.numero, e.nome, e.ape1, e.ape2
from EMPREGADO e
where e.num_empregado_xefe IS NULL;

--� Proposta 24. Descrici�n e unidades existentes, dos produtos con existencias maiores 
--de 10 unidades e menores de 100. Para resolver esta consulta non se poden utilizar 
--operadores de comparaci�n (>, <, >=, <=, < >, !=)

select p.descricion, p.existencias
from PRODUTO p
where p.existencias BETWEEN 11 AND 99;

		--Le pongo 11 y 99 porque pone mayores que, no igual o mayor.



--HOJA 35---------------------------------------------------------------------------

--� Proposta 1. Media de unidades vendidas de cada vendedor. O resultado ter� d�as 
--columnas, na primeira o n�mero identificador do empregado (vendedor) e nunha 
--segunda columna a media de unidades vendidas (campo cantidade) nos seus 
--pedidos.

select p.num_empregado, avg(p.cantidade) as mediaCantiadad
from PEDIDO p
group by p.num_empregado;


--� Proposta 2. Prezo m�is barato de produto, prezo m�is caro, prezo medio, suma total 
--dos prezos de produto, e n�mero de produtos distintos existentes.

select min(p.prezo) as mais_barato,
	   max(p.prezo) as mais_caro,
	   avg(p.prezo) as prezo_medio,
	   sum(p.prezo) as suma_total,
	   count(p.prezo) as conta_total
from PRODUTO p;

--� Proposta 3. N�mero de pedidos realizados polo cliente 1103.

select count(p.numero)
from PEDIDO p
where p.num_cliente = 1103;

select * from PEDIDO;

--� Proposta 4. N�mero de pedidos realizados por cada cliente. No resultado aparecer� 
--o identificador do cliente e na segunda columna o n�mero de pedidos que leva 
--feitos cada cliente ata o de agora. 

select p.num_cliente, count(p.numero) as total_pedidos_realizados
from PEDIDO p
group by p.num_cliente;


--� Proposta 5. Repite a consulta anterior, pero agora no resultado s� poder�n aparecer 
--os clientes que fixeron m�is de 2 pedidos. 

select p.num_cliente, count(p.numero) as total_pedidos_realizados
from PEDIDO p
group by p.num_cliente
having count(p.numero)>2;


--� Proposta 6. Repite a consulta anterior, pero agora no resultado s� poder�n aparecer 
--os clientes que fixeron m�is de 2 pedidos e que ademais te�en unha media de 
--unidades mercadas (cantidade) inferior a 10.

select p.num_cliente, count(p.numero) as total_pedidos_realizados
from PEDIDO p
group by p.num_cliente
having count(p.numero) > 2 & avg(p.cantidade) < 10;


--� Proposta 7. Cantidade total de sucursais que hai por rexi�n. Aparecer� o nome da 
--rexi�n e na mesma columna separado por un gui�n, a cantidade de sucursais 
--situadas nesa rexi�n.