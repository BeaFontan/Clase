--1.	Realiza lo que se te pide en los siguientes apartados sobre la BD que se te indica
--al principio del apartado. Si no se indica ninguna escoge la más conveniente para la 
--realización correcta del apartado.
--IMPORTANTE: Todas las columnas de los resultados deben tener un NOMBRE.

--1.1.	BD EMPRESA.
--Consulta con 4 columnas: el número identificador, el nombre completo (apellido 1 apellido2, nombre), 
--los días que lleva contratado en la empresa y la cuota de ventas, de cada uno de los empleados que 
--están asignados a algún cliente. Si algún vendedor no tiene cuota asignada deberá aparecer un 0 en su lugar.
--En el resultado deben aparecer primero los empleados que lleven menos días contratados.
--IMPORTANTE: No puedes usar ningún tipo de join ni tampoco una consulta compuesta.
USE EMPRESA;
GO
SELECT e.numero, 
       rtrim(e.ape1+' '+isnull(ape2,''))+', '+nome as nombre_completo, 
       e.ape1+isnull(' '+ape2,'')+', '+nome as nombre_completov2, -- otra solución sin rtrim para el nombre completo
       concat(e.ape1,isnull(' '+e.ape2,''), ', ', e.nome) as nome_completov3, -- otra solución con concat para el nombre completo
       datediff(day,e.data_contrato, getdate()) as dias_contratado, isnull(e.cota_de_vendas,0) as ventas_a_alcanzar 
FROM EMPREGADO e
WHERE e.numero in (SELECT num_empregado_asignado FROM CLIENTE)
ORDER BY dias_contratado;

--1.2.	BD EMPRESA.
--Consulta que devuelva la lista de los pedidos que hace más de 50 meses 
--y menos de 60 meses que se han realizado.
--IMPORTANTE: Para hacer la comprobación de los meses que hace que se ha 
--realizado el pedido no puedes usar ni la cláusula IN, ni OR ni tampoco  
--los operadores >=, >, <,  <=, !=, = <>.
--En el resultado deberá aparecer el número del pedido y en una segunda 
--columna la fecha del pedido con formato dd-mm-aaaa 
--(Fíjate que se separan con guiones y llámale FechaPed).
--Deben aparecer los pedidos más recientes primero. Asegúrate que aparecen bien ordenados.
USE EMPRESA;
GO
SELECT numero, convert(char(10),data_pedido, 105) as FechaPed
FROM PEDIDO
WHERE datediff(month, data_pedido, getdate()) between 105 AND 115 --Para probar que devuelva algo cambiad los valores (105-115, a marzo del 2024 devuelve 8 pedidos)
ORDER BY data_pedido DESC;

--1.3.	BD EMPRESA. 
--Utiliza una consulta compuesta para obtener el código de los productos de los que no se han hecho pedidos. 
--En el resultado deben aparecer el identificador del fabricante y el del producto en una única columna de 
--nombre PRODUCTOS SIN PEDIDO, por ejemplo aparecerá ASUAK47A. El resultado deberá aparecer ordenado alfabéticamente.
--IMPORTANTE: El nombre de la columna debe ser exactamente el que se indica, incluidos los espacios en blanco.
USE EMPRESA;
GO
SELECT cod_fabricante+identificador as "PRODUCTOS SIN PEDIDO" -- El nombre de la columna resultante se indica siempre en la primera SELECT, 
FROM PRODUTO												  -- no es necesario poner el nombre es las demás consultas
EXCEPT
SELECT cod_fabricante+id_produto
FROM PEDIDO
ORDER BY "PRODUCTOS SIN PEDIDO";


--1.4.	BD EMPRESA.
--Consulta que devuelva el nombre de cada uno de los empleados de la BD, su fecha de contrato 
--con formato dd/mm/aaaa y en otra tercera columna el importe medio de los pedidos del 
--empleado (o llamado también vendedor).  
--Si existiese algún vendedor (empleado) que no ha vendido nada, en la columna del importe medio deberá 
--aparecer la frase ‘ESTE EMPLEADO NO TIENE PEDIDOS’. 
--Sólo se mostrarán los vendedores(empleados)  cuyo pedido más caro no supere los 20000€ de importe y
--que además, hayan sido contratados un día 1, 6 ó 26 de cualquier mes y de cualquier año. 
--En la columna del importe medio se deberán mostrar los importes con 8 dígitos como máximo 
--en la parte entera y 2 decimales.
--Deberán aparecer primero en el resultado los empleados con mayor importe medio. 
--En caso de que hubiese varios vendedores con el mismo importe medio, deberán aparecer primero 
--los que tienen mayor antigüedad en la empresa. Asegúrate que aparecen bien ordenados.
USE EMPRESA;
GO
SELECT e.nome, convert(char(10),e.data_contrato,103) as FechaContrato, 
       isnull(convert(varchar(30),convert(numeric(10,2),avg(p.cantidade*pr.prezo))), 'ESTE EMPLEADO NO TIENE PEDIDOS') as MediaPedidos
FROM (EMPREGADO e LEFT JOIN PEDIDO p ON e.numero=p.num_empregado) LEFT JOIN PRODUTO pr on pr.cod_fabricante=p.cod_fabricante AND pr.identificador=p.id_produto
WHERE day(e.data_contrato) IN (1,6,26)
GROUP BY e.numero,e.nome, e.data_contrato
HAVING isnull(max(p.cantidade*pr.prezo),0)<=20000
ORDER BY avg(p.cantidade*pr.prezo) DESC, data_contrato; -- Ojo con las ordenaciones si las columnas se han convertido a varchar no ordenará bien las cantidades
                                                        -- porque lo considera caracteres. Por eso no ordenamos por MediaPedidos sino por avg(p.cantidade*pr.prezo)


--1.5.	BD SOCIEDAD CULTURAL. 
--Consulta que devuelva el 50% de los socios cuyo nombre de pila tiene por segunda letra una A y 
--que pagan cuotas cuyo importe sea mayor o igual que 29 y menor o igual que 100. La consulta 
--mostrará en 5 columnas el número de socio, el nombre de pila, el primer apellido, el número de 
--caracteres del primer apellido, el nombre del mes en que nació 
--y el importe de la cuota que paga. 
--El nombre del mes en que nació y el importe de la cuota aparecerán en una única columna separados 
--por un guión (-). Esta columna se llamará MesNac-Cuota (con un guión medio).
--	El resultado deberá aparecer ordenado por mes de nacimiento, es decir, los de enero 
--	aparecerán antes que los de febrero, los de febrero antes 
--que los de marzo, y así sucesivamente.
--IMPORTANTE: 
--•	Para resolver la búsqueda de la letra A en la segunda posición del nombre, deberás emplear 
--una función integrada en el gestor. No puedes usar el predicado LIKE. 
--•	Para hacer la comprobación del importe de las cuotas que paga cada socio no puedes usar ni
--la cláusula IN, ni OR ni tampoco  los operadores >=, >, <=, !=, = <>.
USE SOCIEDADE_CULTURAL;
GO
SELECT top 50 PERCENT s.numero, 
       s.nome, s.ape1, len(s.ape1) as long_ape1, 
       datename(month, s.data_nac)+'-'+convert(varchar(19),c.importe) as "MesNac-Cuota"
FROM SOCIO s INNER JOIN COTA c ON s.cod_cuota=c.codigo
WHERE substring(s.nome, 2,1)='A' AND
      c.importe BETWEEN 29 AND 100
--ORDER BY month(s.data_nac)
order by datepart(month,s.data_nac);-- tb se podría hacer con month(s.data_nac)






