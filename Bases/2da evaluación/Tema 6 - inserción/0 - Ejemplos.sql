--EJEMPLOS INSERCCI�N DE DATOS

-- Consulta de exemplo 1: Crearase unha t�boa permanente de nome COTA_DE_BALDE 
--cos mesmos campos que COTA pero s� coas filas das cotas gratis. Os campos da nova 
--t�boa ter�n por nomes cod, descricion e importe. Ao rematar eliminarase a t�boa nova 
--coa cl�usula DROP TABLE para non modificar o dese�o orixinal da BD.


--TABLA FIJA, CUANDO CIERRAS ESTA SIGUE EXISTIENDO
--CON EL INTO CREA UNA NUEVA TABLA SOLO DE DATOS, UNA COPIA CON LA INFORMACI�N QUE LE INDICAMOS EN EL WHERE
select codigo as cod, nome as descripcion, importe into COTA_DE_BALDE
from COTA
where importe = 0;

select * from COTA_DE_BALDE;



--TABLA TEMPORAL Y LOCAL, YA NO EXISTEN EN LA SIGUIENTE INICIO DE SESI�N.
--Si es temporal local una #en el nombre. Si es temporal global ##



--Consulta de exemplo 2: Crearase unha t�boa temporal local de nome SOCIO_MOROSO 
--co nif e nome completo dos socios que deben algunha actividade. Ao rematar 
--eliminarase a t�boa nova coa cl�usula DROP TABLE para non modificar o dese�o 
--orixinal da BD.select * from SOCIO_REALIZA_ACTI;select distinct s.nif, s.nome, s.ape1, isnull(s.ape2,'') as ape2 into #SOCIO_MOROSOfrom SOCIO s inner join SOCIO_REALIZA_ACTI sra	on s.numero=sra.num_socio	where sra.pagada = 'N';select * from #SOCIO_MOROSO; -- ESTA NO PUEDE VER DESDE OTRA SESI�N


--Ejercicio tabla que sea temporal y global

select * into ##ACTIVIDADE2
from actividade;

SELECT * FROM ##ACTIVIDADE2; -- ESTA S� E PUEDE VER DESDE OTRA SESI�N




--INSERCCI�N EN TABLAS

--Consulta de exemplo 3: Engadiranse d�as novas cotas de balde, unha con c�digo 20 e 
--nome COTA GRATIS, e a outra con c�digo 30 e nome OUTRA GRATIS. Antes e despois 
--do INSERT faremos a consulta que nos amosa a informaci�n da t�boa en cada 
--momento.

select * from COTA;

INSERT INTO COTA ([codigo], [nome], [importe])
values (20, 'COTA GRATIS',0),
	   (30, 'OUTRA GRATIS',0);

select * from COTA; -- AHORA EXISTEN EN LA TABLA DOS CUOTAS NUEVAS



--Consulta de exemplo 4: Engadiranse na t�boa COTA unha nova de nome NOVA e 
--c�digo 80 co mesmo importe que a cota de nome HABITUAL. Antes e despois do 
--INSERT faremos a consulta que nos amosa a informaci�n da t�boa en cada momento.

select * from COTA;

INSERT INTO COTA ([codigo], [nome], [importe])
select 80, 'NOVA', importe -- inserta estos datos que le pongo y copia el importe que coincida con el where
from COTA 
where nome='HABITUAL';

select * from COTA;


--BORRADOS------------------------------------------------------------------------------------------------

delete from COTA
where codigo in (20,30,80);
--borramos las cuotas que creamos antes.
--Ojo, deja borrar porque no est� asociada a ning�n socio y no tiene BORRADO RESTRINGIDO.


-- Consulta de exemplo 6: Para facer esta consulta primeiro crearemos unha t�boa 
--temporal local SOCIO2 copia da t�boa SOCIO empregando a sentenza SELECT...INTO. 
--Despois teranse que eliminar os socios da t�boa SOCIO2 que deben algunha actividade.
--A eliminaci�n farase de dous xeitos, nunha primeira soluci�n empregando unha 
--consulta subordinada e, nunha segunda cunha combinaci�n interna.
--creo la tabla temporal socio 2
select * into #SOCIO2
from SOCIO;

--y borro donde se cumpla la condici�n
delete from #SOCIO2
	where numero in(select num_socio
				from SOCIO_REALIZA_ACTI sra
				where sra.pagada = 'N');

select * from #SOCIO2;


--Ahora con un join

drop table #SOCIO2; -- borro la tabla para volver a tner las 4 filas

select * into #SOCIO2 --la vuelvo a crear
from SOCIO;

--borro con el join
delete from #SOCIO2
	from #SOCIO2 s inner join SOCIO_REALIZA_ACTI sra
	on s.numero = sra.num_socio
	where sra.pagada = 'N';

select * from #SOCIO2;


--TRUNCATE -- VACIA LA TABLE ENTERA---------------------------------------------------------

TRUNCATE TABLE COTA_DE_BALDE; --VACIA LA TABLA POR COMPLETO QUE CREAMOS AL PRINCIPIO

select * from COTA_DE_BALDE;



--TRUNCATE CON IDENTITY---------------------------------------------------

create table prueba1 -- 
(id int identity(5,1) not null, -- identity (valor de inicio, valor de incremento)
saludo varchar(30) not null);


select * from prueba1;

insert into prueba1 (saludo)
values ('hola'),
		('buenos dias');


delete from prueba1;


--a�ado de nuevo
insert into prueba1 (saludo)
values ('buenas tardes');

--con delete mantine el �ltimo valor del identity, empieza en 7


truncate table prueba1; --con truncate reinicia el valor del identity empieza en 5


DROP TABLE prueba1;

------------------------------UPDATE--------------------------------------------------------


--Consulta de exemplo 8: Nesta consulta incrementarase o prezo das actividades en 4 
--euros. Para deixar os datos orixinais da BD, faremos unha segunda modificaci�n de 
--reduci�n do prezo en 4 euros. Faremos unha consulta antes e despois do incremento 
--do prezo.


select * from actividade;

update actividade --ojo, todos los precios y todas las actividades
set prezo += 4; -- aumenta 4 en el precio

select * from actividade;

update actividade --para dejar la tabla como antes, le resto 4
set prezo -= 4; 



--Consulta de exemplo 10: Modificarase o prezo das cotas gratis co valor do prezo m�is 
--alto das actividades. Para deixar os datos orixinais da BD, faremos unha segunda 
--modificaci�n e a t�boa quedar� como estaba antes da modificaci�n. Faremos unha 
--consulta antes e despois da modificaci�n para comprobar os cambios

select * from cota;

update cota
set importe=(select max(prezo) from actividade)
where importe = 0;


----deshacer el cambio

--update cota
--set importe
--where codigo=99;



--Consulta de exemplo 11: Por�nselle como pagadas todas as actividades aos socios que 
--te�an abonada a cota anual. Para deixar os datos orixinais da BD, faremos unha 
--segunda modificaci�n e a t�boa quedar� como estaba antes da modificaci�n. Faremos 
--unha consulta antes e despois da modificaci�n para comprobar os cambios.


select * from socio;
select * from SOCIO_REALIZA_ACTI;

update SOCIO_REALIZA_ACTI
set pagada='S'
from socio s inner join SOCIO_REALIZA_ACTI sra
	on s.numero = sra.num_socio
	where s.abonada = 'S';
	--dice que modifica tres filas pero realmente solo lo hace en una porque los otros ya ten�an la condicion, se podr�a 
	--evitar poniendo otra condicion en el where con un and, y donde se cumple que haya la condici�n contraria.




--TRANSACCIONES------------------------------------------------------------------------------

--para desacer:

begin tran --abro transacci�n
select * from actividade;

update actividade 
set prezo += 4;
select * from actividade;
rollback; -- ejecuci�n de vuelta atr�s desp�s de as modificaciones 


--ahora con commit
begin tran
select * from actividade;

update actividade 
set prezo += 4;
select * from actividade;
commit; -- se commitean los cambios, se guardan, no hay vuelta atr�s.







