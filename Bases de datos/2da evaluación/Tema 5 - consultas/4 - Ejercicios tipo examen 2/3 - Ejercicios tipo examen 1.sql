
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

select * from PRODUCTO;
select * from pedido;

SELECT 
    CONCAT_WS('\', p.DESCRIPCION, ROUND(p.PRECIO, 2)) AS Producto,
    COALESCE(ROUND(SUM(pe.CANT * pe.IMPORTE), 2), 'PRODUCTO QUE TODAVÍA NO SE HA VENDIDO') AS "Gasto total"
FROM 
    PRODUCTO p
LEFT JOIN 
    PEDIDO pe ON p.ID_PRODUCTO = pe.PRODUCTO
GROUP BY 
    p.ID_PRODUCTO, p.DESCRIPCION, p.PRECIO
HAVING 
    COALESCE(SUM(pe.CANT * pe.IMPORTE), 0) / NULLIF(COUNT(pe.NUM_PEDIDO), 0) < 3000
ORDER BY 
    COALESCE(SUM(pe.CANT * pe.IMPORTE), 0) DESC;




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

use EMPLEADOS_BEA;

select p.NUM_PEDIDO as 'numero pedido',
	   convert(varchar(10),p.FECHA_PEDIDO,105) as FechaPed,
	   case 
			when p.CANT < 7 then 'POCAS'
			when p.CANT >= 7 AND p.CANT < 30 then 'NORMAL'
			else 'MUCHAS'
		end as CANT
from PEDIDO p
where datediff(year,p.FECHA_PEDIDO,getdate()) between 30 and 34 --aumento los años para que me de resultados
order by FECHA_PEDIDO desc;


select * from PEDIDO;



--1.3. BD EMPLEADOS. Consulta que devuelva la ciudad de cada una de las oficinas de la BD, su región en 
--minúsculas y en otra tercera columna el importe del pedido más barato de la oficina.
--Ten en cuenta que un pedido es de una oficina si ha sido realizado por un representante de ventas que trabaja en esa oficina.
--Sólo se mostrarán las oficinas con objetivo de ventas superior a 500000, y que además el pedido con 
--mayor importe (pedido de importe máximo) no supera los 30000€.
--Si existiese alguna oficina que no ha vendido nada, no aparecerá en el resultado.

use EMPLEADOS;

select * from OFICINA;
select * from REPVENTAS;


SELECT 
    o.ciudad AS Ciudad,
    LOWER(o.region) AS Region,
    (
        SELECT MIN(p.importe)
        FROM PEDIDO p
        WHERE p.rep IN (
            SELECT r.NUM_EMPL
            FROM REPVENTAS r
            WHERE r.OFICINA_REP = o.OFICINA
        )
    ) AS Importe_Pedido_Mas_Bajo
FROM 
    OFICINA o
WHERE 
    o.oficina IN (
        SELECT r.OFICINA_REP
        FROM REPVENTAS r
    )
    AND o.oficina IN (
        SELECT DISTINCT r.OFICINA_REP
        FROM REPVENTAS r
        JOIN PEDIDO p ON r.NUM_EMPL = p.rep
        GROUP BY r.OFICINA_REP
        HAVING SUM(p.importe) > 500000
        AND MAX(p.importe) <= 30000
    );



--1.4. BD EMPRESA. Consulta que devuelva el nombre de cada cliente y al lado la media de unidades 
--compradas en sus pedidos, sólo para aquellos clientes cuyo empleado asignado/vendedor trabaje 
--en una oficina de la región oeste. Si el cliente no ha comprado nada como media de unidades 
--deberá aparecer 0.
--La columna de las unidades medias tendrá 4 dígitos como máximo en la parte entera y 1 decimal.
--En el resultado deberán aparecen primero los clientes que tengan mayor número de unidades 
--medias.

use EMPRESA_BEA;

select c.nome, isnull(convert(numeric(8,1),avg(p.cantidade)),0) as 'media ud. compradas'
from CLIENTE c 
			   left join PEDIDO p on c.numero = p.num_cliente
			   join EMPREGADO e on c.num_empregado_asignado = e.numero
			   join SUCURSAL s on e.id_sucursal_traballa = s.identificador
where S.rexion IN ('OESTE')		
group by p.numero, c.nome
order by avg(p.cantidade) desc;


--1.5. BD EMPRESA. Consulta que devuelva el total de productos de cada fabricante. En el resultado 
--aparecerán dos columnas: el nombre del fabricante y el total de productos del fabricante.
--Deberá mostrarse en primer lugar aquellos fabricantes que tienen más productos. Si varios 
--fabricantes tienen el mismo número de productos deberán aparecer ordenados alfabéticamente 
--por nombre, por ejemplo:
--ASUS 10
--LOGITECH 5
--TOSHIBA 5

use EMPRESA_BEA;

select f.nome, count(p.cod_fabricante) as 'total productos de cada fabricante'
from PRODUTO p inner join FABRICANTE f
		on p.cod_fabricante = f.codigo
group by p.cod_fabricante, f.nome
order by count(p.cod_fabricante) desc, f.nome;


select * from PRODUTO;

--1.6. BD EMPRESA. Sin usar joins ni subconsultas realiza la consulta que muestre la descripción y el 
--precio de los productos de los que todavía no se han hecho pedidos. En el resultado aparecerán 
--primero los productos más caros.

use EMPRESA_BEA;

select p.descricion, p.prezo
from PRODUTO p
except
select pr.descricion, pr.prezo
from PEDIDO pe join PRODUTO pr
	on pe.cod_fabricante = pr.cod_fabricante and pe.id_produto = pr.identificador
order by p.prezo desc;

select * from pedido;


--1.7. BD EMPRESA. Realiza la consulta anterior usando join.

use EMPRESA_BEA;

select pr.descricion, pr.prezo
from PRODUTO pr left join PEDIDO pe
	on pr.cod_fabricante = pe.cod_fabricante and pr.identificador = pe.id_produto
where pe.cod_fabricante is null
order by pr.prezo desc;

select * from PEDIDO;


--1.8. BD EMPRESA. Listado de las sucursales cuyo objetivo es mayor que 300.000 y en ellas trabajan 
--empleados cuyo primer apellido acaba por Z o su segundo apellido tiene más de 5 letras. En el 
--resultado aparecerá el identificador de la oficina separado de la ciudad por un guión medio, por 
--ejemplo 11-BARCELONA.

use EMPRESA_BEA;

select distinct convert(varchar(15), s.identificador)+'-'+ s.cidade as 'id_oficina id_ciudad'
from SUCURSAL s inner join EMPREGADO e
	on s.identificador = e.id_sucursal_traballa
where s.obxectivo > 300000 and
	 (e.ape1 like '%Z' or len(e.ape2) > 5) ;


--1.9. BD EMPRESA. Consulta que devuelva el nombre y apellidos de cada empleado (con formato 
--nombre ape1 ape2) y en una segunda columna el número identificador del director de la oficina en 
--la que trabaja el empleado. Ordena el resultado alfabéticamente por apellidos y nombre del 
--empleado.

use EMPRESA_BEA;

select e.nome + ' ' + e.ape1 + ' ' + isnull(e.ape2,'') as empregado, 
su.num_empregado_director as director
from EMPREGADO e inner join SUCURSAL su
	 on e.id_sucursal_traballa = su.identificador
order by e.ape1, e.ape2, e.nome;


select * from EMPREGADO;
select * from SUCURSAL;

--1.10. BD EMPRESA. Repite la consulta anterior pero en la segunda columna en lugar de aparecer el 
--número identificador del director de la oficina deberá aparecer el nombre del director con formato 
--nombre ape1 ape2.

use EMPRESA_BEA;

select e.nome + ' ' + e.ape1 + ' ' + e.ape2 as empregado, 
dir.numero, dir.nome + ' ' + dir.ape1 + ' ' + dir.ape2 as director
from EMPREGADO e inner join SUCURSAL su on e.id_sucursal_traballa = su.identificador
				 left join EMPREGADO dir on su.num_empregado_director = dir.numero
order by e.ape1, e.ape2, e.nome;


select s.identificador, e.nome+' '+e.ape1+' '+isnull(e.ape2,'') as nombre_emple, 
      isnull(dir.nome+' '+dir.ape1+' '+isnull(dir.ape2,''),'SIN DIRECTOR') as  director_ofi
from empregado e inner join sucursal s on e.id_sucursal_traballa=s.identificador
				left join empregado dir on s.num_empregado_director=dir.numero
order by e.ape1, e.ape2, e.nome;

--1.11. BD EMPRESA. Listado del nombre de todos los clientes siempre que haya alguno cuyo límite de 
--crédito supere los 65.000€

use EMPRESA_BEA;

select c.nome
from CLIENTE c
where exists (select cl.numero
							from CLIENTE cl
							where cl.limite_de_credito > 65000);


--1.12. BD EMPRESA. En una única columna deberán aparecer todas las ciudades de las sucursales y todas 
--las regiones ordenadas alfabéticamente. La columna se llamará SUCURSALES Y REGIONES (respeta 
--los espacios en blanco del nombre de la columna).

use EMPRESA_BEA;

select s.cidade + ' ' +s.rexion as 'SUCURSALES Y REGIONES'
from SUCURSAL s
order by s.cidade, s.rexion;


select cidade as "SUCURSALES Y REGIONES"
from SUCURSAL
union
select rexion
from SUCURSAL
order by "SUCURSALES Y REGIONES";


--1.13. BD EMPRESA. Usando una consulta compuesta devuelve el nombre de los clientes que hicieron 
--pedidos
select c.nome
from CLIENTE c
intersect
select cl.nome
from PEDIDO p inner join CLIENTE cl
	on p.num_cliente = cl.numero

