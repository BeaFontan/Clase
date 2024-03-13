-- SOLUCIONES Consultas tipo examen

--1.1. BD EMPLEADOS. Consulta que devuelve en una primera columna la descripción y el precio de todos los
--productos, separados por una barra invertida (por ejemplo ARTICULO TIPO2 \ 76), y en una segunda
--columna el gasto total en pedidos de ese producto. Entre la descripción y la barra invertida sólo puede
--existir un espacio en blanco y entre la barra invertida y el precio otro espacio en blanco.
--En el resultado sólo podrán aparecer aquellos productos cuyo gasto medio es menor de 3000€.
--La primera columna se llamará Producto y la segunda Gasto total.
--Si de algún producto no se han realizado pedidos en la columna del Gasto total deberá aparecer la
--frase PRODUCTO QUE TODAVIA NO SE HA VENDIDO.
--La columna del gasto total deberá mostrar los importes con 6 dígitos como máximo en la parte entera
--y 2 decimales.
--Deberán aparecer primero en el resultado los productos con mayor gasto total.
use EMPLEADOS;
GO
select rtrim(pr.descripcion)+' \ '+CAST(pr.precio as varchar(18)) as Producto, 
      -- isnull(cast(cast(SUM(pe.importe) as numeric(8,2)) as varchar(37)),
      --'PRODUCTO QUE TODAVIA NO SE HA VENDIDO') as 'Gasto total'
	   isnull(convert(varchar(37),convert(numeric(8,2),SUM(pe.importe))),
	          'PRODUCTO QUE TODAVIA NO SE HA VENDIDO') as "Gasto total"
from PRODUCTO pr LEFT JOIN PEDIDO pe
on pr.ID_FAB=pe.fab and
   pr.ID_PRODUCTO=pe.PRODUCTO
group by pr.ID_FAB, pr.ID_PRODUCTO, pr.DESCRIPCION, pr.PRECIO
having isnull(AVG(pe.importe),0)<3000
--having AVG(pe.importe)<3000
order by SUM(pe.importe) desc;
--order by 'Gasto total' desc; Ordena alfábeticamente


--1.2. BD EMPLEADOS. Consulta que devuelva la lista de los pedidos que hace más de 24 años y menos de 28
--años que se han realizado.
--IMPORTANTE: Para hacer la comprobación de los años que hace que se ha realizado el pedido no puedes
--usar ni la cláusula IN, ni OR ni tampoco los operadores >=, >, <=, !=, = <>.
--En el resultado deberá aparecer el número del pedido, en una segunda columna la fecha del pedido
--con formato dd-mm-aaaa (Fíjate que se separan con guiones y llámale FechaPed) y en una tercera
--columna de nombre Unidades aparecerá lo siguiente en función del número de unidades solicitadas en el
--pedido:
--- Si la cantidad de unidades del pedido es menor que 7 aparecerá el texto POCAS.
--- Si la cantidad de unidades del pedido es mayor o igual que 7 y menor que 30 aparecerá el texto
--NORMAL.
--- Si la cantidad de unidades del pedido es mayor o igual que 30 aparecerá el texto MUCHAS.
--Deben aparecer los pedidos más recientes primero. Asegúrate que aparecen bien ordenados.
USE EMPLEADOS;
GO
select NUM_PEDIDO, convert(char(10),fecha_pedido,105) as FechaPed, 
	   CASE 
		when cant<7 then 'POCAS'
		when cant between 7 and 29 then 'NORMAL'
		when cant>=30 then 'MUCHAS'
	   END as Unidades
from PEDIDO
--where DATEDIFF(year, fecha_pedido, getdate()) between 25 and 27
where DATEDIFF(year, fecha_pedido, getdate()) between 30 and 34
--order by FechaPed desc;--Pq ordena caracteres e non datas
order by fecha_pedido desc;


--1.3. BD EMPLEADOS. Consulta que devuelva la ciudad de cada una de las oficinas de la BD, su región en
--minúsculas y en otra tercera columna el importe del pedido más barato de la oficina. Ten en cuenta que
--un pedido es de una oficina si ha sido realizado por un representante de ventas que trabaja en esa oficina.
--Sólo se mostrarán las oficinas con objetivo de ventas superior a 500000, y que además el pedido con
--mayor importe (pedido de importe máximo) no supera los 30000€.
--Si existiese alguna oficina que no ha vendido nada, no aparecerá en el resultado.
USE EMPLEADOS;

select o.ciudad, lower(o.region) as region, min(pe.importe) as pedido_minimo
from oficina o inner join repventas r on o.OFICINA=r.OFICINA_REP 
               inner join PEDIDO pe on r.NUM_EMPL=pe.REP
where o.OBJETIVO>500000
group by o.OFICINA, o.CIUDAD, o.region
having max(pe.importe) <= 30000;


--1.4. BD EMPRESA. Consulta que devuelva el nombre de cada cliente y al lado la 
--media de unidades compradas en sus pedidos, sólo para aquellos clientes cuyo 
--empleado asignado/vendedor trabaje en una oficina de la región oeste. 
--Si el cliente no ha comprado nada como media de unidades deberá aparecer 0.
--La columna de las unidades medias tendrá 4 dígitos como máximo en la parte entera y 1 decimal.
--En el resultado deberán aparecen primero los clientes que tengan mayor número de unidades medias.
use empresa;
--NOTA: Si convertimos a numeric(5,1) nos da un error de desbordamiento aritmético porque
--hay medias que son superiores al mayor número que se puede representar con un numeric(5,1)
--que sería 9999,9
select c.nome, convert(numeric(7,1),isnull(avg(p.cantidade),0)) as unidades_medias 
from cliente c left join pedido p on c.numero=p.num_cliente
     inner join empregado e on c.num_empregado_asignado=e.numero 
	 inner join sucursal s on e.id_sucursal_traballa=s.identificador
where s.rexion='LESTE'
group by c.numero, c.nome
order by unidades_medias desc; -- En este caso podemos ordenar por el alias 
-- Si cambiamos a región LESTE aparecerán clientes que no tienen pedidos
-- El cliente INFOR REPARACIONS no aparece porque no tiene empleado asignado


--1.5. BD EMPRESA. Consulta que devuelva el total de productos de cada fabricante. 
--En el resultado aparecerán dos columnas: el nombre del fabricante y el total de 
--productos del fabricante.
--Deberá mostrarse en primer lugar aquellos fabricantes que tienen más productos. 
--Si varios fabricantes tienen el mismo número de productos deberán aparecer ordenados 
--alfabéticamente por nombre, por ejemplo:
--ASUS
--10
--LOGITECH
--5
--TOSHIBA
--5
use empresa;
select f.nome, count(pr.cod_fabricante) as total_productos
from fabricante f left join produto pr on f.codigo=pr.cod_fabricante
group by f.codigo,  f.nome
order by total_productos desc, f.nome;

--1.6. BD EMPRESA. Sin usar joins ni subconsultas realiza la consulta que muestre la descripción y 
--el precio de los productos de los que todavía no se han hecho pedidos. En el resultado aparecerán 
--primero los productos más caros.
use empresa;
--NOTA: Usaremos una consulta compuesta. Podéis usar join en las consultas de la consulta compuesta
select pr.descricion, pr.prezo
from produto pr
except
select pr.descricion, pr.prezo
from produto pr inner join pedido pe on pr.cod_fabricante+pr.identificador=pe.cod_fabricante+pe.id_produto
order by pr.prezo desc;

--1.7. BD EMPRESA. Realiza la consulta anterior usando join.
use empresa;
GO
select pr.descricion, pr.prezo
from produto pr left join pedido pe on pr.cod_fabricante+pr.identificador=pe.cod_fabricante+pe.id_produto
where pe.cod_fabricante is null --Hacemos un left join y buscamos aquellos que en una columna PK de pedido esté tomando valores nulos
order by pr.prezo desc;

--1.8. BD EMPRESA. Listado de las sucursales cuyo objetivo es mayor que 300.000 y en ellas trabajan 
--empleados cuyo primer apellido acaba por Z o su segundo apellido tiene más de 5 letras. 
--En el resultado aparecerá el identificador de la oficina separado de la ciudad por un guión 
--medio, por ejemplo 11-BARCELONA.
use EMPRESA;

select distinct convert(varchar(15),s.identificador)+'-'+s.cidade as oficina
       --concat(s.identificador,'-',s.cidade) si usamos concat no es necesario convertir a varchar
from SUCURSAL s inner join empregado e on s.identificador=e.id_sucursal_traballa
where s.obxectivo>300000 and (e.ape1 like '%Z' or len(e.ape2)>5);  
      --Es muy importante el uso de  paréntesis en el or del where ya que si no ponemos paréntesis 
	  --ejecuta antes el and que el or

--1.9. BD EMPRESA. Consulta que devuelva el nombre y apellidos de cada empleado (con formato 
--nombre ape1 ape2) y en una segunda columna el número identificador del director de la oficina 
--en la que trabaja el empleado. Ordena el resultado alfabéticamente por apellidos y nombre del empleado.
use EMPRESA;

select e.nome+' '+e.ape1+' '+isnull(e.ape2,'') as nombre_emple, s.num_empregado_director
       -- sería mejor hacer un isnull porque el campo num_empregado director admite Nulos
	   --e.nome+' '+e.ape1+' '+isnull(ape2,'') as nombre_emple, isnull(convert(varchar(20),s.num_empregado_director),'oficina sin director') as director_ofi
from empregado e inner join sucursal s 
     on e.id_sucursal_traballa=s.identificador--Hacemos inner join porque id_sucursal_traballa es NOT NULL
order by e.ape1, e.ape2, e.nome;

--1.10. BD EMPRESA. Repite la consulta anterior pero en la segunda columna en lugar de aparecer 
--el número identificador del director de la oficina deberá aparecer el nombre del director con formato nombre ape1 ape2.
use EMPRESA;

select s.identificador, e.nome+' '+e.ape1+' '+isnull(e.ape2,'') as nombre_emple, 
      isnull(dir.nome+' '+dir.ape1+' '+isnull(dir.ape2,''),'SIN DIRECTOR') as  director_ofi
       -- sería mejor hacer un isnull porque hay oficinas que puede que no tengan director
	   -- puedes probar la consulta añadiendo una sucursal sin director y después un empleado que trabaje en esa sucursal
from empregado e inner join sucursal s 
     on e.id_sucursal_traballa=s.identificador--Hacemos inner join porque id_sucursal_traballa es NOT NULL
	 left join empregado dir on s.num_empregado_director=dir.numero
order by e.ape1, e.ape2, e.nome;


--1.11. BD EMPRESA. Listado del nombre de todos los clientes siempre que haya alguno cuyo límite 
--de crédito supere los 65.000€
use empresa;
select c.nome
from cliente c
where exists (select cl.numero
              from CLIENTE cl
			  where cl.limite_de_credito > 65000); -- Tiene que devolver los 21 clientes, ya que sí que 
			                                       -- existen clientes con límite de crédito superior a 65000

--1.12. BD EMPRESA. En una única columna deberán aparecer todas las ciudades de las sucursales y 
--todas las regiones ordenadas alfabéticamente. La columna se llamará SUCURSALES Y REGIONES 
--(respeta los espacios en blanco del nombre de la columna).
use empresa;

select cidade as "SUCURSALES Y REGIONES"
from SUCURSAL
union
select rexion
from SUCURSAL
order by "SUCURSALES Y REGIONES";

--1.13. BD EMPRESA. Usando una consulta compuesta devuelve el nombre de los clientes que hicieron pedidos.
use empresa;

select c.nome
from cliente c
intersect
select cl.nome
from pedido p inner join cliente cl on p.num_cliente=cl.numero;

