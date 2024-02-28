--1. Realiza lo que se te pide en los siguientes apartados sobre la BD que se te indica al principio del 
--apartado. Si no se indica ninguna escoge la más conveniente para la realización correcta del apartado.
--IMPORTANTE: 
-- Todas las columnas de los resultados deben tener un NOMBRE.
-- En cada consulta deberá incluirse la instrucción que selecciona la BD adecuada para ejecutarla.


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





--1.3. BD EMPLEADOS. Consulta que devuelva la ciudad de cada una de las oficinas de la BD, su región en 
--minúsculas y en otra tercera columna el importe del pedido más barato de la oficina. Ten en cuenta que 
--un pedido es de una oficina si ha sido realizado por un representante de ventas que trabaja en esa oficina.
--Sólo se mostrarán las oficinas con objetivo de ventas superior a 500000, y que además el pedido con 
--mayor importe (pedido de importe máximo) no supera los 30000€.
--Si existiese alguna oficina que no ha vendido nada, no aparecerá en el resultado.



