-- SOLUCIONES Ejercicios GROUP BY
--TAREA 1: Resuelve las siguientes consultas en la BD EMPLEADOS usando T SQL. 
--Aunque en esta pr�ctica se trata de repasar sentencias con agrupamiento, 
--deber�s decidir si es necesario usarlo o no en las consultas que se te plantean.
use EMPLEADOS;
--1.1. Media de ventas de todas las oficinas.
select avg(ventas) as media_ventas
from oficina;

--1.2. Gasto total realizado por el cliente ACME MFG.
select sum(p.importe) as gasto_total
from CLIENTE c inner join PEDIDO p on c.NUM_CLIE=p.CLIE
where c.empresa='ACME MFG.'; -- Ojo con el punto final

-- Podemos hacer la prueba de qu� pasar�a con 'CARTER SONS' que no tiene pedidos

select sum(p.importe) as gasto_total
from CLIENTE c inner join PEDIDO p on c.NUM_CLIE=p.CLIE
where c.empresa='CARTER SONS';

--lo ideal ser�a hacer un isnull en el select
select isnull(sum(p.importe),0) as gasto_total
from CLIENTE c inner join PEDIDO p on c.NUM_CLIE=p.CLIE
where c.empresa='ACME MFG.'; 

--1.3. Gasto total realizado por cada cliente. En el resultado aparecer� el nombre 
--de la empresa cliente y en una segunda columna el importe del gasto en pedidos que 
--lleva realizado el cliente hasta ahora. En el resultado deber�n aparecer primero los clientes con mayor gasto.
select c.empresa, isnull(sum(p.importe),0) as gasto_total
from CLIENTE c left join PEDIDO p on c.NUM_CLIE=p.CLIE
group by c.NUM_CLIE, c.EMPRESA
order by gasto_total DESC;

--1.4. Realiza de nuevo la consulta anterior, 
--pero ahora s�lo deber�n aparecer los clientes 
--que hayan realizado m�s de 10000 euros de gasto total.
select c.empresa, sum(p.importe) as gasto_total
from CLIENTE c inner join PEDIDO p on c.NUM_CLIE=p.CLIE--Usamos inner porque los clientes tienen gasto
group by c.NUM_CLIE, c.EMPRESA
having sum(p.importe)>10000 -- en este caso devolver�a lo mismo si no ponemos isnull, pero si fuese < si no ponemos isnull no aparecer�an los que no tienen pedidos
order by gasto_total DESC;

--1.5. Realiza de nuevo la consulta anterior, pero ahora 
--s�lo deber�n aparecer los clientes 
--que hayan realizado m�s de 10000 euros de gasto total y 
--adem�s hayan hecho m�s de 2 pedidos.
select c.empresa, sum(p.importe) as gasto_total
from CLIENTE c inner join PEDIDO p on c.NUM_CLIE=p.CLIE
group by c.NUM_CLIE, c.EMPRESA
having sum(p.importe)>10000 and count(p.NUM_PEDIDO)>2
order by gasto_total DESC;

--1.6. Nombre de aquellos clientes cuyo l�mite de cr�dito 
--supera el l�mite de cr�dito medio.
select c.EMPRESA
from cliente c
where c.LIMITE_CREDITO > (select avg(cl.limite_credito)
                          from cliente cl);

--1.7. C�digo y descripci�n del producto o productos con el precio menor.
select pr.ID_FAB+pr.ID_PRODUCTO as codigo, pr.DESCRIPCION
from producto pr
where pr.PRECIO = (select min(precio) from PRODUCTO);

--1.8. N�mero total de pedidos que se han realizado del producto 
--con descripci�n ARTICULO TIPO 2.
select count(pe.NUM_PEDIDO) as total_pedidos
from PRODUCTO pr inner join pedido pe on pr.ID_FAB+pr.ID_PRODUCTO=pe.FAB+pe.PRODUCTO --otra manera de hacer el join
where pr.DESCRIPCION='ARTICULO TIPO 2';
--where pr.DESCRIPCION='CARTER SONS';

--1.9. N�mero total de pedidos que se han realizado del producto con descripci�n ARTICULO TIPO 2 
--cuyo importe supera los 800 euros.
select count(pe.NUM_PEDIDO) as total_pedidos
from PRODUCTO pr inner join pedido pe on pr.ID_FAB+pr.ID_PRODUCTO=pe.FAB+pe.PRODUCTO --otra manera de hacer el join
where pr.DESCRIPCION='ARTICULO TIPO 2' and pe.IMPORTE>800;

--1.10. N�mero total de pedidos de cada producto. 
--En el resultado aparecer� la clave de cada producto, 
--la descripci�n y el n�mero de pedidos que se han realizado de ese producto.
select  pr.ID_FAB+pr.ID_PRODUCTO, pr.DESCRIPCION, count(pe.NUM_PEDIDO) as total_pedidos
from PRODUCTO pr left join pedido pe on pr.ID_FAB+pr.ID_PRODUCTO=pe.FAB+pe.PRODUCTO
group by  pr.ID_FAB+pr.ID_PRODUCTO, pr.DESCRIPCION;

--1.11. N�mero de t�tulos diferentes que tienen los representantes de ventas.

select count(distinct titulo) as titulos_distintos
from REPVENTAS;

--1.12. Nombre de los empleados que son directores de m�s de una oficina.
select r.NOMBRE
from REPVENTAS r inner join OFICINA o on r.NUM_EMPL=o.DIR
group by r.NUM_EMPL, r.nombre
having count(o.oficina) >1;

--1.13. Nombre de los vendedores que han realizado m�s de 3 pedidos.
select r.NOMBRE
from REPVENTAS r inner join PEDIDO pe on r.NUM_EMPL=pe.REP
group by r.NUM_EMPL, r.nombre
having count(pe.num_pedido) >3;

--1.14. N�mero de oficinas que hay por regi�n. Aparecer� el nombre de la regi�n y en la misma columna 
--separada por un gui�n, la cantidad de oficinas situadas en esa regi�n.
select rtrim(o.region)+'-'+convert(varchar(3),count(o.oficina)) as oficinas_region
from OFICINA o
group by o.region;

--1.15. N�mero total de empleados que hay en cada oficina. Aparecer� la ciudad de la oficina y en 
--una segunda columna la cantidad de empleados que trabajan en la misma.
select o.CIUDAD, count(r.num_empl) as total_empleados
from OFICINA o left join REPVENTAS r on o.OFICINA=r.OFICINA_REP
group by o.OFICINA, o.CIUDAD;

