--Usuario de sql server

use [master]
go
CREATE LOGIN usuario_server
WITH PASSWORD='sancle1234..'
go

use EMPLEADOS --usuamos la base de datos a la que quermos dar acceso 
create user usu1
for login usuario_server

--ahora tenemos que darle permisos o asignar un rol. OJO! desde sa o usuario administrador. Hacer login.

--Le damos permisos a la tabla oficina a ese usuario
use EMPLEADOS
grant select on oficina to usu1;


--ahora le estamos dando permiso al rol public hacer el select, y lo podrá hacer porque pertenece al rol public de forma predeterminada.
grant select to public;

--





