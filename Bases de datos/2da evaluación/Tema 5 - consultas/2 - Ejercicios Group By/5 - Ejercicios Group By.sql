-- TAREA 1: Resuelve las siguientes consultas en la BD EMPLEADOS usando T-SQL. Aunque en esta 
--práctica se trata de repasar sentencias con agrupamiento, deberás decidir si es necesario usarlo o no 
--en las consultas que se te plantean.

USE EMPLEADOS_BEA;

--1.1. Media de ventas de todas las oficinas.

select avg(o.VENTAS) as media_ventas
from OFICINA o;

--1.2. Gasto total realizado por el cliente ACME MFG. 

select sum(p.IMPORTE) as gasto_total
from PEDIDO p inner join CLIENTE c
	on p.CLIE = c.NUM_CLIE
where c.EMPRESA = 'ACME MFG.';


select * from PEDIDO;
select * from cliente;

--1.3. Gasto total realizado por cada cliente. En el resultado aparecerá el nombre de la empresa cliente y 
--en una segunda columna el importe del gasto en pedidos que lleva realizado el cliente hasta ahora.
--En el resultado deberán aparecer primero los clientes con mayor gasto.

select c.EMPRESA, 
		--isnull(sum(p.IMPORTE),0) as gasto_total_cada_cliente,
		sum(isnull(p.IMPORTE,0)) as gasto_total_cada_cliente_2 --otra solución
from PEDIDO p right join CLIENTE c --hago el right porque lo tenía así, pero como quiero que me den todos los clientes tengan pedido o no, sería left, pero como lo tenía así, ya solucioné con rigth
	on p.CLIE = c.NUM_CLIE
group by c.EMPRESA, c.NUM_CLIE
order by gasto_total_cada_cliente_2 desc;


--1.4. Realiza de nuevo la consulta anterior, pero ahora sólo deberán aparecer los clientes que hayan 
--realizado más de 10000 euros de gasto total.

select c.EMPRESA, sum(p.IMPORTE) as gasto_total_cada_cliente
from PEDIDO p inner join CLIENTE c --aquí hago el inner porque ya me habla de los clientes que sí han realizado pedidos superiores a...
	on p.CLIE = c.NUM_CLIE
group by c.EMPRESA, c.NUM_CLIE
having sum(p.IMPORTE) > 10000;


--1.5. Realiza de nuevo la consulta anterior, pero ahora sólo deberán aparecer los clientes que hayan 
--realizado más de 10000 euros de gasto total y además hayan hecho más de 2 pedidos.

select c.EMPRESA, sum(p.IMPORTE) as gasto_total_cada_cliente
from PEDIDO p Right join CLIENTE c
	on p.CLIE = c.NUM_CLIE
group by c.EMPRESA, c.NUM_CLIE
having sum(p.IMPORTE) > 10000 and count(p.NUM_PEDIDO) > 2;


--1.6. Nombre de aquellos clientes cuyo límite de crédito supera el límite de crédito medio.

select c.EMPRESA
from cliente c
where c.LIMITE_CREDITO > (select avg(cl.LIMITE_CREDITO)
							from CLIENTE cl);
					--mayor que

--1.7. Código y descripción del producto o productos con el precio menor.

select  p.ID_PRODUCTO, p.DESCRIPCION
from PRODUCTO p
where p.PRECIO in (select min(pr.PRECIO)
					from PRODUCTO pr);


--1.8. Número total de pedidos que se han realizado del producto con descripción ARTICULO TIPO 2.

select count(p.NUM_PEDIDO) as total_pedidos
from PEDIDO p inner join PRODUCTO pr
	on p.FAB = pr.ID_FAB and p.PRODUCTO = pr.ID_PRODUCTO
where pr.DESCRIPCION in ('ARTICULO TIPO 2');


--1.9. Número total de pedidos que se han realizado del producto con descripción ARTICULO TIPO 2 cuyo 
--importe supera los 800 euros.

select count(p.NUM_PEDIDO) AS 'Total pedidos'
from PEDIDO p inner join PRODUCTO pr
	on p.FAB = pr.ID_FAB and p.PRODUCTO = pr.ID_PRODUCTO
where pr.DESCRIPCION  = 'ARTICULO TIPO 2' AND P.IMPORTE > 800;

--1.10. Número total de pedidos de cada producto. En el resultado aparecerá la clave de cada producto, la 
--descripción y el número de pedidos que se han realizado de ese producto.

select pr.ID_PRODUCTO, 
		pr.DESCRIPCION,
		count(p.NUM_PEDIDO) as numero_total_pedidos
from PEDIDO p left join PRODUCTO pr
	on p.FAB = pr.ID_FAB and p.PRODUCTO = pr.ID_PRODUCTO
group by pr.ID_FAB+ pr.ID_FAB, pr.DESCRIPCION, pr.ID_PRODUCTO;


--1.11. Número de títulos diferentes que tienen los representantes de ventas.

select distinct count(r.TITULO)
from REPVENTAS r;

select * from REPVENTAS;

--1.12. Nombre de los empleados que son directores de más de una oficina.

select r.NOMBRE
from REPVENTAS r inner join OFICINA o
	on r.NUM_EMPL = o.DIR
group by o.DIR, r.NOMBRE
having count(o.DIR) > 1;



select * from OFICINA;

--1.13. Nombre de los vendedores que han realizado más de 3 pedidos.

select rep.NOMBRE
from REPVENTAS rep inner join PEDIDO p
	on rep.NUM_EMPL = p.REP
group by rep.NUM_EMPL, rep.NOMBRE
having count(p.NUM_PEDIDO) > 3;


--1.14. Número de oficinas que hay por región. Aparecerá el nombre de la región y en la misma columna 
--separada por un guión, la cantidad de oficinas situadas en esa región.

select * from OFICINA;

select concat(rtrim(o.region), '-', count(o.OFICINA)) as total_oficinas_por_region
from OFICINA o
group by o.REGION;


--1.15. Número total de empleados que hay en cada oficina. Aparecerá la ciudad de la oficina y en una 
--segunda columna la cantidad de empleados que trabajan en la misma.

select o.CIUDAD, count(rep.NUM_EMPL) as total_empleados
from OFICINA o left join REPVENTAS rep
	on o.OFICINA = rep.OFICINA_REP
group by o.OFICINA, o.CIUDAD;


