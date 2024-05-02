use EMPRESA_BEA;

use SOCIEDADE_CULTURAL_BEA;

---TAREFAS CONSULTAS SIMPLES------------------------------------------------------------------------------------

--� Proposta 1. Nome e apelidos (cada un nunha columna) de todos os empregados.
SELECT e.nome, e.ape1, e.ape2
FROM EMPREGADO E;


--� Proposta 2. N�mero, nome e apelidos (cada un nunha columna) de todos 
--empregados.

SELECT e.numero, e.nome, e.ape1, e.ape2
FROM EMPREGADO E;

--� Proposta 3. N�mero, nome e apelidos (cada un nunha columna) de todos os 
--empregados por orde alfab�tica de apelidos e nome.

SELECT e.numero, e.nome , e.ape1, e.ape2
FROM EMPREGADO E
ORDER BY e.ape1, ape2, nome;

--� Proposta 4. N�mero, nome e apelidos (cada un nunha columna) de todos os 
--empregados por orde alfab�tica de apelidos e nome. Os nomes das columnas no 
--resultado ser�n: num_socio, nome_socio, apelido1, apelido2.

SELECT e.numero as num_socio, e.nome as nome_socio, e.ape1 as apelido1, e.ape2 as apelido2
FROM EMPREGADO E
ORDER BY e.ape1, ape2, nome;


--� Proposta 5. N�mero, nome completo (os 4 campos nunha �nica columna, de nome 
--socio, co formato numero - ape1 ape2, nome) e salario de todos os empregados. No 
--resultado deber�n aparecer primeiro os que m�is cobran.

SELECT cast(e.numero as varchar(7)) + ' - ' + e.ape1 + e.ape2 + ', ' + e.nome as socios,
salario_mes
FROM EMPREGADO E
ORDER BY salario_mes desc;

SELECT cast(numero as varchar(7))+' - '+ape1+' '+ape2+', '+ nome 
 as socio, 
 salario_mes
FROM EMPREGADO
ORDER BY salario_mes desc;


--� Proposta 6. N�mero, nome completo (os 4 campos nunha �nica columna, de nome 
--socio, co formato numero - ape1 ape2, nome) e salario de todo o profesorado. No 
--resultado deber�n aparecer primeiro os que m�is cobran. O campo cargo cont�n 
--PRF para o profesorado, e ADM se � un ou unha administrativo.

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


--� Proposta 7. N�mero identificador do profesorado que imparte clases. Como � 
--l�xico, se un profesor imparte m�is dunha actividade, o seu n�mero s� pode 
--aparecer unha vez.

SELECT DISTINCT num_profesorado_imparte
FROM ACTIVIDADE;


--� Proposta 8. N�mero identificador das actividades �s que asiste profesorado, � dicir, 
--cursadas por profesorado. 

select p.id_actividade
from PROFE_CURSA_ACTI p;

SELECT DISTINCT id_actividade
FROM PROFE_CURSA_ACTI;


--� Proposta 9. Nome, importe, e importe rebaixado un 20%, da actividade de nome 
--xadrez.


--Soluci�n1
SELECT nome, prezo, prezo-(prezo*0.20) as prezo_rebaixado
FROM ACTIVIDADE
WHERE nome='XADREZ';
--Soluci�n2
SELECT nome, prezo, prezo*0.80 as prezo_rebaixado
FROM ACTIVIDADE
WHERE nome='XADREZ';


--� Proposta 10. NIF, nome e apelidos dos socios dos que non temos tel�fono gardado.

SELECT NIF, nome, ape1, ape2
FROM SOCIO
WHERE telefono1 IS NULL AND
 telefono2 IS NULL;

--� Proposta 11. NIF, nome, apelidos e data de nacemento dos socios nados entre 1980 
--e 1990, ambos inclu�dos.

SELECT NIF, nome, ape1, ape2, data_nac
FROM SOCIO
WHERE data_nac BETWEEN '1/1/1980' AND '31/12/1990';


--� Proposta 12. Todos os datos das actividades cuxo nome cont�n a letra T.
SELECT *
FROM ACTIVIDADE
WHERE nome LIKE '%T%';


--� Proposta 13. Nome e importe das cotas cun custo de 30 ou 100 euros.
SELECT nome, importe
FROM COTA
WHERE importe IN (30,100);

--Soluci�n2
SELECT nome, importe
FROM COTA
WHERE importe=30 OR
 importe=100;


--� Proposta 14. Nome e n�mero de prazas das actividades que non te�en nin 15 nin 20 
--prazas.
SELECT nome, num_prazas
FROM ACTIVIDADE
WHERE num_prazas NOT IN (15,20);

--Soluci�n2
SELECT nome, num_prazas
FROM ACTIVIDADE
WHERE num_prazas!=15 AND
 num_prazas!=20;


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






-----TAREFAS CONSULTAS RESUMO-------------------------------------------------------------------------------------------

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
having count(p.numero) > 2 AND avg(p.cantidade) < 10;

--� Proposta 7. Cantidade total de sucursais que hai por rexi�n. Aparecer� o nome da 
--rexi�n e na mesma columna separado por un gui�n, a cantidade de sucursais 
--situadas nesa rexi�n.

SELECT rexion+' - '+ cast(count(*) as varchar(5)) as total_sucursais
FROM SUCURSAL
GROUP BY rexion;


--------TAREFAS DE CONSULTAS DE COMBINACI�NS JOINS-------------------------------------------------------------------

--� Proposta 1. Nome de todos os fabricantes dos que se fixeron pedidos. Debes 
--propo�er d�as soluci�ns, unha coa sintaxe coa condici�n de combinaci�n no 
--WHERE, e outra coa sintaxe coa condici�n de combinaci�n no FROM.

--uso distinct para que elimine los resultados repetidos.
select distinct f.nome
from FABRICANTE f JOIN PEDIDO p
on f.codigo = p.cod_fabricante;


--Soluci�n1
SELECT DISTINCT f.nome
FROM FABRICANTE f, PEDIDO p
WHERE f.codigo=p.cod_fabricante;
--aqu� le indicamos donde coincidan los c�digos en el where

--Soluci�n2
SELECT DISTINCT f.nome
FROM FABRICANTE f INNER JOIN PEDIDO p
 ON f.codigo=p.cod_fabricante;
 --aqu� hacemos un join o inner join, que arroja el mismo resultado.

--� Proposta 2. Nome de todos os fabricantes, fix�ranse ou non pedidos. Se tiveron 
--pedidos aparecer� o nome e nunha segunda columna o n�mero de pedido. Se dun 
--fabricante se fixeron m�is dun pedido, aparecer� tantas veces como pedidos se lle 
--fixeron. No caso de non ter pedido, como n�mero de pedido deber� aparecer o 
--valor 99.

select f.nome, ISNULL(p.numero, 99) as num_pedido
from FABRICANTE f left JOIN PEDIDO p
on f.codigo = p.cod_fabricante;


--� Proposta 3. Nome de todos os fabricantes, fix�ranse ou non pedidos. Se tiveron 
--pedidos aparecer� o nome e nunha segunda columna o n�mero de pedido. Se dun 
--fabricante se fixeron m�is dun pedido, aparecer� tantas veces como pedidos se lle 
--fixeron. No caso de non ter pedido, como n�mero de pedido deber� aparecer a 
--frase 'Sen pedidos.'.

select f.nome, ISNULL(cast(p.numero as varchar(12)), 'Sen pedidos.') as num_pedido
from FABRICANTE f left JOIN PEDIDO p
on f.codigo = p.cod_fabricante;


--� Proposta 4. C�digo dos produtos (co formato cod_fabricante-id_produto) e 
--descrici�n, dos produtos que non foron pedidos nunca.
select p.identificador, p.descricion
from PRODUTO p left join PEDIDO pe
on p.identificador = pe.id_produto
where pe.id_produto is null;

--soluci�n m�nica
SELECT pr.cod_fabricante+'-'+pr.identificador as id_produto,
 pr.descricion
FROM PRODUTO pr LEFT JOIN PEDIDO pe
 ON pr.cod_fabricante= pe.cod_fabricante AND
 pr.identificador =pe. id_produto
WHERE pe.numero is NULL;


--� Proposta 5. Produto cartesiano entre a t�boa de sucursais e a de empregados. 
--Nunha primeira columna aparecer� a cidade da sucursal e na segunda o nome 
--completo do empregado (co formato nome ape1 ape2). D�bense propo�er d�as 
--soluci�ns, segundo a sintaxe empregada para o produto cartesiano.

--cross join para producto cartesiano
select s.cidade, e.nome + ' ' + e.ape1 + ' ' + isnull(e.ape2, ' ')
from SUCURSAL s cross join EMPREGADO e;

select s.cidade, e.nome + ' ' + e.ape1 + ' ' + isnull(e.ape2, ' ')
from SUCURSAL s, EMPREGADO e;


--Soluci�n1
SELECT s.cidade, 
 e.nome+' '+e.ape1+' '+isnull(e.ape2,'') as empregado
FROM SUCURSAL s, EMPREGADO e;

--Soluci�n2
SELECT s.cidade, 
 e.nome+' '+e.ape1+' '+isnull(e.ape2,'') as empregado
FROM SUCURSAL s CROSS JOIN EMPREGADO e;


--� Proposta 6. N�mero e nome completo (co formato nome ape1 ape2) de todos os 
--empregados, as� como a cidade da sucursal que dirixen, se � que dirixen algunha. Na 
--terceira columna, de nome sucursal_que_dirixe, nas filas dos empregados que non 
--son directores de sucursais, deber� aparecer a frase 'Non � director.'.

select e.numero, e.nome + ' ' + e.ape1 + ' '+ isnull(e.ape2, '') as datos, isnull(cast(s.identificador as varchar (14)), 'Non e director') as sucursal
from EMPREGADO e full join SUCURSAL s
on e.numero = s.num_empregado_director;

--� Proposta 7. N�mero e nome completo dos empregados que te�en xefe, co n�mero 
--e o nome completo do seu xefe nunha segunda columna. (Revisa o concepto 
--� Autocombinaci�n ou self join). Nas columnas aparecer�n o n�mero separado do 
--nome completo por un gui�n.
select e.numero, e.nome, e.ape1, e.ape2, em.nome, em.ape1, em.ape2
from EMPREGADO e inner join empregado em
on e.num_empregado_xefe = em.numero;

select * from EMPREGADO;

--� Proposta 8. N�mero e nome completo de todos os empregados, co n�mero e o 
--nome completo do seu xefe nunha segunda columna. Nas columnas aparecer�n o 
--n�mero separado do nome completo por un gui�n. Se alg�n empregado non tivese 
--xefe, na segunda columna debe aparecer a frase 'Xefe por designar.'. 

select cast(e.numero as varchar(3))+ '-' + e.nome + ' ' + e.ape1 as empregado, 
      isnull((cast(x.numero as varchar(3))+ '-' + x.nome + ' ' + x.ape1), 'Xefe por designar') as xefe 
from EMPREGADO e left join empregado x
on e.num_empregado_xefe = x.numero;


--� Proposta 9. Nome completo de todos os empregados co nome do cliente que te�en 
--asignado. No caso de que non tivesen ning�n cliente aparecer� no nome do cliente a 
--frase 'Sen cliente.'. Do mesmo xeito se un cliente non ten empregado asignado, na 
--columna do empregado aparecer� 'Sen vendedor.'. � importante que aparezan 
--todos os empregados, te�an ou non clientes e todos os clientes te�an ou non 
--empregados.

select isnull(e.nome + ' ' + e.ape1 + ' ' + isnull(e.ape2,''), 'Sin vendedor') as ape2, isnull(c.nome,'Sen cliente') as cliente
from EMPREGADO e full join cliente c
on e.numero = c.num_empregado_asignado;


--� Proposta 10. Escolle unha das t�as soluci�ns das consultas propostas nas que 
--empregaches un LEFT JOIN, e modif�caa usando RIGHT JOIN.

SELECT pr.cod_fabricante+'-'+pr.identificador as id_produto,
 pr.descricion
FROM  PEDIDO pe right join PRODUTO pr
 ON pr.cod_fabricante= pe.cod_fabricante AND
 pr.identificador =pe. id_produto
WHERE pe.numero is NULL;






----- TAREFAS DE SUBCONSULTAS------------------------------------------------------------------------------------------------

--� Proposta 1. Nome de todos os fabricantes dos que hai produtos na BD. Non se permite 
--usar combinaci�ns nesta consulta.

SELECT nome
FROM FABRICANTE 
WHERE codigo IN (SELECT cod_fabricante
				FROM PRODUTO);


--� Proposta 2. Nome de todos os fabricantes dos que non hai produtos na BD. Non se 
--permite usar combinaci�ns nesta consulta.

SELECT nome
FROM FABRICANTE 
WHERE codigo not IN (SELECT cod_fabricante
				FROM PRODUTO);


--� Proposta 3. N�mero de pedido, cantidade e data de pedido para aqueles pedidos recibidos 
--nos d�as en que un novo empregado foi contratado. Non se permite usar combinaci�ns 
--nesta consulta.

select p.numero, p.cantidade, p.data_pedido
from PEDIDO p
where p.data_pedido in (select e.data_contrato
						from EMPREGADO e);

--� Proposta 4. Cidade e obxectivo das sucursais cuxo obxectivo supera a media das cotas de 
--todos os vendedores da BD. Non se permite usar combinaci�ns nesta consulta.

select s.cidade, s.obxectivo
from SUCURSAL s
where s. > (select avg(e.cota_de_vendas)
					from EMPREGADO e);
				

--� Proposta 5. N�mero de empregado e cantidade media dos pedidos daqueles empregados 
--cuxa cantidade media de pedido � superior � cantidade media global (de todos os 
--pedidos). 

select p. num_empregado, avg(p.cantidade)
from PEDIDO p
group by p.num_empregado
having avg(p.cantidade)>(select avg(cantidade)
						from PEDIDO);

select * from PEDIDO;


--� Proposta 6. Nome dos clientes que a�nda non fixeron pedidos. Non se permite usar 
--combinaci�ns nesta consulta.

SELECT c.nome
FROM  CLIENTE c 
WHERE c.numero not IN (SELECT p.num_cliente
						FROM PEDIDO p);

--� Proposta 7. Nome completo dos empregados cuxas cotas son iguais ou superiores ao 
--obxectivo da sucursal da cidade de Vigo. Ten en conta que se a cota dun vendedor 
--(empregado) � nula debemos considerala como un 0, e do mesmo xeito actuaremos co 
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

--� Proposta 8. Nome dos produtos para os que existe polo menos un pedido que ten unha 
--cantidade de polo menos 20 unidades. Hai que lembrar que a identificaci�n dun produto 
--faise pola combinaci�n do c�digo do fabricante e o do produto. A soluci�n deber� facerse 
--empregando o predicado EXISTS cunha subconsulta correlacionada. 

select pr.descricion
from PRODUTO pr
where exists (select  p.numero
			from PEDIDO p
			where p.cantidade >= 20 and
			p.cod_fabricante = pr.cod_fabricante and
			p.id_produto = pr.identificador);

--Aqu� nos pide nombre de ls productos para los que existe un pedido que por lo menor tiene 20 unidades,
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



--� Proposta 9. Cidades das sucursais onde exista alg�n empregado cuxa cota de vendas 
--represente m�is do 80% do obxectivo da oficina onde traballa. Para resolver esta consulta 
--deberase empregar unha subconsulta correlacionada precedida de ANY.

select s.cidade
from SUCURSAL s
where s.obxectivo *0.8 < any (select e.cota_de_vendas
						      from EMPREGADO e
						      where e.id_sucursal_traballa = s.identificador);


			select *, obxectivo *0.8 from SUCURSAL;
			select * from EMPREGADO;


--� Proposta 10. Nome dos clientes cuxos empregados asignados traballan en sucursais da 
--rexi�n OESTE. Non se poden usar joins, s� subconsultas encadeadas.

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


---------CONSULTAS CON FUNCI�NS INTEGRADAS NO XESTOR paxina 62----------------------------------------------------------

use EMPRESA_BEA;

--� Proposta 1. Desexamos co�ecer o c�digo ASCII da vogal E. Na consulta deber�s 
--devolver nunha columna a vogal en mai�scula, e nunha segunda o c�digo ASCII que 
--lle corresponde.

select ascii('E') as codigo_ascii_de_E,
	char(69) as caracterASCII_do_codigo69;


--� Proposta 2. Consulta que devolve o car�cter que lle corresponde aos seguintes 
--c�digos ASCII: 70, 80, 90.

select char(70) as caracter70, char(80) as caracter80, char(90) as caracter90;


--� Proposta 3. Queremos obter unha listaxe que en cada li�a te�a o seguinte texto: O 
--empregado con nome e apelidos X ten que acadar unha cota de vendas anual de Y. 
--Sendo X o nome e os apelidos do empregado, e Y a cota de vendas. � importante 
--fixarse no segundo apelido. A listaxe ter� por t�tulo Empregados e cotas.

select 'O empregado con nome e apelidos: ' + e.nome + ' ' + e.ape1 + ' ' + isnull(ape2, ' ') + ' ten que acadar unha cota de ventas anual de ' + isnull(convert(char(20),e.cota_de_vendas), 0) as Empregados_e_cotas
from EMPREGADO e;

select * from EMPREGADO;

--� Proposta 4. Consulta que devolva as datas nas que se contrataron empregados. O 
--formato das diferentes datas ser� dd-mm-aaaa e o nome da columna Datas de 
--contrataci�n.

select distinct convert(char(10), e.data_contrato, 105) as "Datas de contratacion"
from EMPREGADO e;


--� Proposta 5. Queremos obter un nome abreviado das sucursais. Ese nome 
--comporase polos tres primeiros caracteres da cidade, os dous �ltimos da rexi�n e 
--separado por un gui�n baixo, o n�mero de caracteres do nome da cidade.

select left(s.cidade, 3) + ' ' + right(s.rexion, 2) + '_' + convert(char(3), len(s.cidade))
from SUCURSAL s;


--� Proposta 6. Queremos obter un nome abreviado dos produtos. Ese nome 
--comporase polo segundo car�cter do c�digo do fabricante en min�scula, m�is o 
--terceiro, cuarto, quinto e sexto da descrici�n do produto. Nunha primeira columna o 
--c�digo aparecer� en min�sculas, e nunha segunda en mai�sculas.

select lower(upper(substring(p.cod_fabricante, 2,1)) + substring(p.descricion,3,4)) as nombre_abrev, upper(upper(substring(p.cod_fabricante, 2,1)) + substring(p.descricion,3,4)) as nombre_mayus
from PRODUTO p;

select * from PRODUTO;

--� Proposta 7. Listaxe cos nomes dos empregados co formato ape1 ape2, nome. Se 
--alg�n empregado non ten segundo apelido, por exemplo Susanne Smith, no 
--resultado aparecer� Smith, Sussane, sen espazos antes da coma.

--le hago el rtrim a nombre y apellido, para que los nulos del ape2, se borre el 
select rtrim(e.ape1 + ' ' +  isnull(e.ape2, ' ')) + ', ' + e.nome as nome_apelidos
from EMPREGADO e;


--� Proposta 8. Queremos amosar os distintos t�tulos dos nosos empregados en 
--castel�n, e para iso deberemos substitu�r a palabra VENDAS por VENTAS.

select replace(e.titulo, 'VENDAS', 'VENTAS') as titulos
from EMPREGADO e;

select titulo from EMPREGADO;

--� Proposta 9. Consulta que devolva a seguinte informaci�n de tempo en distintas 
--columnas co nome adecuado cada unha:
--� data e hora actuais sen axuste de zona horaria,
--� data e hora actuais con axuste de zona horaria,
--� mes actual en n�mero,
--� mes actual en n�mero (emprega unha funci�n diferente � da anterior 
--columna),
--� ano actual,
--� mes actual en nome,
--� hora actual,
--� nanosegundos actuais.

select
sysdatetime() as hora_sen_axuste,
sysdatetimeoffset() as hora_con_axuste_zona_horaria,
datepart(month, getdate()) as mes,
datepart(month, getutcdate()) as mes_otra_funcion,
datepart(year, getdate()) as anho_actual,
datename(month, getdate()) as mes_nome,
datepart(hour, getdate()) as hora_actual,
datepart(ns, getdate()) as nanosegundos;


--� Proposta 10. Listaxe que devolva o nome de todos os empregados (nome, ape1, 
--ape2), a data de contrato, e nunha �ltima columna a data de contrato adiantada un 
--ano. O formato das d�as datas ser� dd/mm/aaaa (con barras).

select e.nome, e.ape1, isnull(e.ape2, ' ') as ape2, convert(char(10), e.data_contrato,103) as fecha_original, convert(varchar(10), dateadd(year, 1, e.data_contrato),103) as ano_adiantado
from EMPREGADO e;


--� Proposta 11. Listaxe que devolva o n�mero de cada pedido coa data de pedido. 
--Nunha terceira columna deber� aparecer a mesma data de pedido pero retrasada 
--dous meses. O formato das d�as datas ser� dd-mm-aaaa (con gui�ns).

select p.numero, p.data_pedido, convert(char(10), dateadd(month, -2, p.data_pedido), 105) as dos_meses_menos
from PEDIDO p;

--� Proposta 12. Listaxe que devolva o nome e apelidos (nome, ape1, ape2) de cada 
--empregado, a data de contrato e o n�mero de anos que hai que leva traballando na 
--empresa cada un deles. 

select e.nome, e.ape1, isnull(e.ape2, ' ') as ape2, e.data_contrato, datediff(year, e.data_contrato, getdate()) as anhos_empresa
from EMPREGADO e;

--� Proposta 13. Consulta que devolva a descrici�n de cada produto co seu prezo nunha 
--segunda columna, e ademais deber�n amosarse en columnas diferentes: 
--� o prezo como un enteiro aproximado por defecto, 
--� o prezo como un enteiro aproximado por exceso, 
--� a ra�z cadrada do prezo,
--� o cadrado do prezo, e, 
--� o cubo do prezo.

select p.descricion, p.prezo, ceiling(p.prezo) as aproximado_defecto, 
floor(p.prezo) as aproximado_exceso, sqrt(p.prezo) as raiz_cadrada_prezo, square(p.prezo) as cuadrodo_prezo,
power(p.prezo,3) as cubo
from PRODUTO p;



--� Proposta 14. Repite a consulta anterior pero agora s� amosaremos a descrici�n, o 
--prezo e a ra�z cadrada, pero a ra�z cadrada deber� amosarse con como moito 4 cifras 
--na parte enteira e 3 na decimal.

select p.descricion, p.prezo,
convert(numeric(7,3),sqrt(p.prezo)) as raiz_cadrada_prezo
from PRODUTO p;

--� Proposta 15. Consulta que devolva a seguinte informaci�n do servidor no que est� a 
--nosa instancia de SQL Server: idioma, n�mero m�ximo de conexi�ns permitidas, 
--nome do servidor e da instancia e versi�n do xestor.

select
@@language as idioma, @@MAX_CONNECTIONS as conexiones_maximas_permitidas, @@SERVERNAME as nombre_servidor, @@version as version_servidor;


--� Proposta 16. Consulta que amose a descrici�n do produto e as s�as existencias. 
--Nunha terceira columna de nome estado_existencias amosarase o seguinte:
--� Se o n�mero de existencias � superior a 20 aparecer� a palabra Suficientes.
--� Se o n�mero de existencias � menor ou igual a 20 aparecer� Insuficientes.
--Esta consulta deber�s resolvela de dous xeitos posibles, en d�as consultas 
--diferentes, empregando d�as funci�ns l�xicas distintas


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

--� Proposta 1. Empregando unha consulta composta realizar unha listaxe do c�digo do 
--fabricante e identificador daqueles produtos con prezo superior a 60� ou que te�an 
--pedidos de cantidade inferior a 5 unidades. O resultado aparecer� ordenado por 
--fabricante e para o mesmo fabricante por produto.

SELECT cod_fabricante, identificador
FROM PRODUTO
WHERE prezo>60
UNION 
SELECT cod_fabricante, id_produto
FROM PEDIDO
WHERE cantidade<5
ORDER BY cod_fabricante, identificador;



--� Proposta 2. Empregando unha consulta composta amosar os c�digo dos 
--empregados que non fixeron pedidos. Deber�n aparecer primeiro os empregados 
--con c�digo maior.


--� Proposta 3. Empregando unha consulta composta amosar o c�digo dos clientes que 
--fixeron pedidos e con l�mite de cr�dito maior ou igual a 40000. Usa unha diferenza 
--para resolver esta consulta.


--� Proposta 4. Empregando unha consulta composta amosar os c�digo dos clientes que 
--fixeron pedidos e con l�mite de cr�dito maior ou igual a 40000. Usa unha 
--intersecci�n para resolver esta consulta. Ordena o resultado por c�digo de cliente 
--en orde ascendente.


--� Proposta 5. Empregando unha consulta composta amosar o c�digo dos empregados 
--que son directores dalgunha sucursal ou que te�en unha cota de vendas superior a 
--250000�. 


--� Debes propo�er d�as soluci�ns: 
--� na primeira s� pode aparecer unha vez cada empregado no resultado, e,
--� na segunda se un empregado � director dunha sucursal e ademais ten unha 
--cota superior a 250000�, aparecer� no resultado m�is dunha vez.



---------CONSULTAS COMPLEXAS paxina 101----------------------------------------------------------

use EMPRESA_BEA;
use SOCIEDADE_CULTURAL_BEA;

--� Proposta 1. DB SOCIEDADE_CULTURAL. Nif e nome completo nunha columna (ape1 
--ape2, nome) de cada socio, s� para os socios que deben algunha actividade. Nunha 
--segunda columna aparecer� o importe total que debe en actividades. A columna do 
--nome chamarase nome_completo e a do importe debido cantidade_debe. O 
--resultado aparecer� por orde alfab�tica de apelidos e nome dos socios.




--� Proposta 2. BD EMPRESA. N�mero de pedido, descrici�n e prezo do produto, 
--unidades vendidas e importe de todos os pedidos da BD ordenados de maior a 
--menor importe. No caso de coincidir os importes deber� ordenarse alfabeticamente 
--pola descrici�n do produto.



--� Proposta 3. BD EMPRESA. N�mero de pedido, descrici�n e prezo do produto, 
--unidades vendidas e importe dos pedidos da BD con importe superior a 1000�, 
--ordenados de maior a menor importe. No caso de coincidir os importes deber� 
--ordenarse alfabeticamente pola descrici�n do produto.



--� Proposta 4. BD EMPRESA. N�mero de pedido, nome do cliente e data de pedido dos 
--pedidos recibidos nos d�as en que se contrataron empregados. No resultado deben 
--aparecer primeiro os pedidos m�is recentes.



--� Proposta 5. DB EMPRESA. Nome completo dos empregados co nome do empregado 
--que te�en por xefe. Na primeira columna de nome empregado aparecer� o nome 
--completo de cada empregado co formato ape1 ape2, nome, te�a ou non te�a xefe. 
--Na segunda columna de nome xefe aparecer� o nome completo do xefe dese 
--empregado co mesmo formato que o campo empregado. No caso de non ter xefe na 
--segunda columna aparecer� a frase 'XEFE POR DETERMINAR'.
--Non se amosan os empregados que dirixen a sucursal onde traballa cada un 
--deles, sen�n o xefe directo. (Ver campo EMPREGADO.num_empregado_xefe).




--� Proposta 6. DB SOCIEDADE_CULTURAL. Gasto en actividades por socio. Na primeira 
--columna aparecer� o nif do socio e na segunda o gasto, pagado ou non, que leva 
--feito en actividades. Os socios que non participaron en actividades non aparecer�n 
--no resultado.



--� Proposta 7. DB SOCIEDADE_CULTURAL. Nome e apelidos, (en tres columnas de 
--nomes apelido1, apelido2 e nome_propio) das persoas que forman parte da nosa 
--sociedade cultural independentemente da s�a labor na sociedade. Nunha cuarta 
--columna cargo se a persoa � empregado aparecer� a frase '� EMPREGADO' e noutro 
--caso 'NON � EMPREGADO'. O resultado aparecer� ordenado alfabeticamente por 
--apelidos e nome.



--� Proposta 8. BD EMPRESA. Empregando unha consulta composta amosa o 
--identificador das sucursais que non te�en empregados traballando nelas.



--� Proposta 9. BD EMPRESA. Nunha columna nome_abreviado amosa os tres primeiros 
--caracteres en min�sculas do primeiro apelido de cada empregado.



--� Proposta 10. DB SOCIEDADE_CULTURAL. Nome e apelidos, (en tres columnas de 
--nomes apelido1, apelido2 e nome_propio) dos socios que cumpren anos no mes 
--actual.