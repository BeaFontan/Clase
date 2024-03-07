-- SOLUCIONES Ejercicios GROUP BY
--TAREA 1: Resuelve las siguientes consultas en la BD EMPLEADOS usando T SQL. 
--Aunque en esta práctica se trata de repasar sentencias con agrupamiento, 
--deberás decidir si es necesario usarlo o no en las consultas que se te plantean.
use EMPLEADOS;
--1.1. Media de ventas de todas las oficinas.
select avg(ventas) as media_ventas
from oficina;

--1.2. Gasto total realizado por el cliente ACME MFG.
select sum(p.importe) as gasto_total
from CLIENTE c inner join PEDIDO p on c.NUM_CLIE=p.CLIE
where c.empresa='ACME MFG.'; -- Ojo con el punto final

-- Podemos hacer la prueba de qué pasaría con 'CARTER SONS' que no tiene pedidos

select sum(p.importe) as gasto_total
from CLIENTE c inner join PEDIDO p on c.NUM_CLIE=p.CLIE
where c.empresa='CARTER SONS';

--lo ideal sería hacer un isnull en el select
select isnull(sum(p.importe),0) as gasto_total
from CLIENTE c inner join PEDIDO p on c.NUM_CLIE=p.CLIE
where c.empresa='ACME MFG.'; 

--1.3. Gasto total realizado por cada cliente. En el resultado aparecerá el nombre 
--de la empresa cliente y en una segunda columna el importe del gasto en pedidos que 
--lleva realizado el cliente hasta ahora. En el resultado deberán aparecer primero los clientes con mayor gasto.
select c.empresa, isnull(sum(p.importe),0) as gasto_total
from CLIENTE c left join PEDIDO p on c.NUM_CLIE=p.CLIE
group by c.NUM_CLIE, c.EMPRESA
order by gasto_total DESC;

--1.4. Realiza de nuevo la consulta anterior, 
--pero ahora sólo deberán aparecer los clientes 
--que hayan realizado más de 10000 euros de gasto total.
select c.empresa, sum(p.importe) as gasto_total
from CLIENTE c inner join PEDIDO p on c.NUM_CLIE=p.CLIE--Usamos inner porque los clientes tienen gasto
group by c.NUM_CLIE, c.EMPRESA
having sum(p.importe)>10000 -- en este caso devolvería lo mismo si no ponemos isnull, pero si fuese < si no ponemos isnull no aparecerían los que no tienen pedidos
order by gasto_total DESC;

--1.5. Realiza de nuevo la consulta anterior, pero ahora 
--sólo deberán aparecer los clientes 
--que hayan realizado más de 10000 euros de gasto total y 
--además hayan hecho más de 2 pedidos.
select c.empresa, sum(p.importe) as gasto_total
from CLIENTE c inner join PEDIDO p on c.NUM_CLIE=p.CLIE
group by c.NUM_CLIE, c.EMPRESA
having sum(p.importe)>10000 and count(p.NUM_PEDIDO)>2
order by gasto_total DESC;

--1.6. Nombre de aquellos clientes cuyo límite de crédito 
--supera el límite de crédito medio.
select c.EMPRESA
from cliente c
where c.LIMITE_CREDITO > (select avg(cl.limite_credito)
                          from cliente cl);

--1.7. Código y descripción del producto o productos con el precio menor.
select pr.ID_FAB+pr.ID_PRODUCTO as codigo, pr.DESCRIPCION
from producto pr
where pr.PRECIO = (select min(precio) from PRODUCTO);

--1.8. Número total de pedidos que se han realizado del producto 
--con descripción ARTICULO TIPO 2.
select count(pe.NUM_PEDIDO) as total_pedidos
from PRODUCTO pr inner join pedido pe on pr.ID_FAB+pr.ID_PRODUCTO=pe.FAB+pe.PRODUCTO --otra manera de hacer el join
where pr.DESCRIPCION='ARTICULO TIPO 2';
--where pr.DESCRIPCION='CARTER SONS';

--1.9. Número total de pedidos que se han realizado del producto con descripción ARTICULO TIPO 2 
--cuyo importe supera los 800 euros.
select count(pe.NUM_PEDIDO) as total_pedidos
from PRODUCTO pr inner join pedido pe on pr.ID_FAB+pr.ID_PRODUCTO=pe.FAB+pe.PRODUCTO --otra manera de hacer el join
where pr.DESCRIPCION='ARTICULO TIPO 2' and pe.IMPORTE>800;

--1.10. Número total de pedidos de cada producto. 
--En el resultado aparecerá la clave de cada producto, 
--la descripción y el número de pedidos que se han realizado de ese producto.
select  pr.ID_FAB+pr.ID_PRODUCTO, pr.DESCRIPCION, count(pe.NUM_PEDIDO) as total_pedidos
from PRODUCTO pr left join pedido pe on pr.ID_FAB+pr.ID_PRODUCTO=pe.FAB+pe.PRODUCTO
group by  pr.ID_FAB+pr.ID_PRODUCTO, pr.DESCRIPCION;

--1.11. Número de títulos diferentes que tienen los representantes de ventas.

select count(distinct titulo) as titulos_distintos
from REPVENTAS;

--1.12. Nombre de los empleados que son directores de más de una oficina.
select r.NOMBRE
from REPVENTAS r inner join OFICINA o on r.NUM_EMPL=o.DIR
group by r.NUM_EMPL, r.nombre
having count(o.oficina) >1;

--1.13. Nombre de los vendedores que han realizado más de 3 pedidos.
select r.NOMBRE
from REPVENTAS r inner join PEDIDO pe on r.NUM_EMPL=pe.REP
group by r.NUM_EMPL, r.nombre
having count(pe.num_pedido) >3;

--1.14. Número de oficinas que hay por región. Aparecerá el nombre de la región y en la misma columna 
--separada por un guión, la cantidad de oficinas situadas en esa región.
select rtrim(o.region)+'-'+convert(varchar(3),count(o.oficina)) as oficinas_region
from OFICINA o
group by o.region;

--1.15. Número total de empleados que hay en cada oficina. Aparecerá la ciudad de la oficina y en 
--una segunda columna la cantidad de empleados que trabajan en la misma.
select o.CIUDAD, count(r.num_empl) as total_empleados
from OFICINA o left join REPVENTAS r on o.OFICINA=r.OFICINA_REP
group by o.OFICINA, o.CIUDAD;

