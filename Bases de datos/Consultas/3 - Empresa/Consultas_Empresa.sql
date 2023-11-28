use EMPRESA_BEA;

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