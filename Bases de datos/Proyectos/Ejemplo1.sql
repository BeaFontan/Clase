--Creación de una BD (DDL)

create database bea;

use bea;

--DDL
create table tabla1
(codigo int, nombre varchar(30));

--DML:
select*
from tabla1;

--DML:
insert into tabla1 (codigo, nombre)
values (1, 'Marcos');

--DDL:
alter table tabla1 
add observaciones varchar(100);

--DML:
insert into tabla1 (codigo, nombre, observaciones)
values (2, 'María', 'kjdfklsd'),
	   (3, 'Pedro', 'kjdfklsd');

--DML: borrado de filas
delete from tabla1;

--DML:
update tabla1 -- DML
set nombre='nombre_modif'
where codigo=1


--DDL:
drop table tabla1;

