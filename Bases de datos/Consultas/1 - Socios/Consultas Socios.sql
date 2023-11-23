USE [SOCIOS]
GO
EXEC dbo.sp_changedbowner @loginame = N'sa', @map = false
GO

use SOCIOS;


--5.1. Todos los datos (todos los campos de la relación AULA) de las aulas cuyo estado sea ‘Bueno’ 
--(estado=’B’).

select * 
from AULA 
where estado = 'B';

--5.2. Todos los datos (todos los campos de la relación ACTIVIDAD) de las actividades con precio menor de 
--50 euros.

select * 
from ACTIVIDADE 
where prezo < 50;

--5.3. Nombre de las cuotas no gratuitas.

select c.nome
from cota c
where c.importe != 0;


--5.4. Identificador de las actividades realizadas por el socio con número 1004.

select s.id_actividade
from SOCIO_REALIZA_ACTI s
where s.num_socio = 1004; /*no existe este socio, para que devuelva algún valor probamos con el 1003*/ 


--5.5. NIF del profesor que imparte la actividad de nombre ‘TENIS’.

Select e.nif
from ACTIVIDADE a, EMPREGADO e
where a.nome='TENIS PARA PRINCIPIANTES' AND 
	a.num_profesorado_imparte = e.numero;

/*Otra forma*/
Select e.nif
from ACTIVIDADE a inner join EMPREGADO e
	on a.num_profesorado_imparte = e.numero
where a.nome='TENIS PARA PRINCIPIANTES';
	

--5.6. Nombre completo de los profesores que realizan (cursan) alguna actividad.

select e.nome, e.ape1, e.ape2
from PROFE_CURSA_ACTI p, EMPREGADO e
where e.numero=p.num_profesorado; /*muestro los que tienen el mismo valor en las dos columnas*/


--5.7. Importe de la cuota que debe pagar el socio número 1003.

select c.importe
from COTA c, SOCIO s
where s.numero=1003 and 
		s.cod_cuota=c.codigo;

--5.8. Horas extras realizadas por el empleado con NSS 1534567891012 (151515151515)

select a.horas_extras
from EMPREGADO e, ADMINISTRATIVO a
where e.nss='151515151515' and
		e.numero = a.num_adm;

--5.9. Nombre de las actividades en las que hay morosos apuntados.

select a.nome
from SOCIO_REALIZA_ACTI s, ACTIVIDADE a
where s.pagada = 'N' and
	s.id_actividade = a.identificador

--5.10. Nombre y fecha de inicio de las actividades que se imparten en aulas en mal estado (estado=’M’).

select ac.nome, ac.data_ini
from ACTIVIDADE ac, AULA a
where a.estado='M' and
		ac.num_aula = a.numero;  

--5.11. Nombre completo, dirección, profesión y tipo de aquellos socios que deben la cuota anual.

select s.nome, s.ape1, s.ape2, s.cod_provincia_enderezo, s.codpostal_enderezo, s.profesion, s.cod_cuota
from SOCIO s
where s.abonada = 'N';

--5.12. Salario del profesor que imparte la actividad de nombre ‘COCINA’.

select e.salario_mes
from ACTIVIDADE a, EMPREGADO e
where a.nome = 'COCINA' and
		a.num_profesorado_imparte = e.cargo;

--5.13. Plazas de las actividades que imparte el profesor con NIF ‘22222222B’.

select a.num_prazas
from ACTIVIDADE a, EMPREGADO e
where e.nif = '22222222B' and
		a.num_profesorado_imparte = e.numero;

--5.14. Nombre de las actividades que empiezan antes del 12 de diciembre de 2015, es decir con fecha de 
--inicio menor que esa.

select a.nome
from ACTIVIDADE a
where a.data_ini < '12-12-2015';

--5.15. Nombre completo de todas las personas que pueden cursar actividades.

select s.nome, s.ape1, s.ape2
from SOCIO s 
union all
select e.nome, e.ape1, e.ape2
from EMPREGADO e
where e.cargo = 'PRF';


--5.16. NIF, NSS y nombre completo de todos aquellos profesores que no cursan actividades. 

select e.nif, e.nss, e.nome, e.ape1, e.ape2
from EMPREGADO e
where e.numero not in 
				(select pa.num_profesorado from PROFE_CURSA_ACTI pa);


--5.17. Nombre de la actividad y nombre completo del profesor que la imparte, para aquellas actividades 
--cursadas por algún profesor.

Select a.nome, e.nome, e.ape1, e.ape2
from ACTIVIDADE a
join PROFE_CURSA_ACTI pa
on a.identificador = pa.id_actividade
join EMPREGADO e
on a.num_profesorado_imparte = e.numero;

--5.18. Nombre de cada actividad, nombre completo del profesor que la imparte y descripción del aula que 
--tiene asignada.

select a.nome, au.descricion, e.nome, e.ape1, e.ape2
from ACTIVIDADE a
join AULA au
on a.num_aula = au.numero
join EMPREGADO e
on a.num_profesorado_imparte = e.numero;


--5.19. Número y nombre completo de todos los socios que están apuntados a actividades que comenzaron 
--antes del mes de julio de 2005.

select s.numero, s.nome, s.ape1, s.ape2
from SOCIO s
join SOCIO_REALIZA_ACTI sa
on s.numero = sa.num_socio
join ACTIVIDADE a
on sa.id_actividade = a.identificador
where a.data_ini < '01-07-2015';


--5.20. Nombre completo de aquellos socios que cursan actividades impartidas en aulas con superficie 
--superior a 50 metros cuadrados.

select s.nome, s.ape1, s.ape2
from SOCIO s
join SOCIO_REALIZA_ACTI sa
on s.numero = sa.num_socio
join ACTIVIDADE a
on sa.id_actividade = a.identificador
join AULA au
on a.num_aula = au.numero
where au.superficie > 50;


--5.21. NSS de los profesores que imparten clase en aulas en mal estado(estado=’M’).

select e.nss
from EMPREGADO e
join ACTIVIDADE a
on e.numero = a.num_profesorado_imparte
join AULA au
on a.num_aula = au.numero
where au.estado = 'M';


--5.22. NSS de los socios que tienen asignadas cuotas gratuitas.

select s.nss
from SOCIO s
join COTA c
on s.cod_cuota = c.codigo
where c.importe = 0;

--5.23. Nombre completo de TODAS las personas de la sociedad cultural y deportiva que viven en 
--Bertamiráns.

select s.nome, s.ape1, s.ape2
from SOCIO s
where s.localidade_enderezo = 'Ferrol'
union all
Select e.nome, e.ape1, e.ape2
from EMPREGADO e
where e.localidade_enderezo = 'Ferrol';

--5.24. Número identificativo de los profesores que cursan actividades. 

Select e.numero
from EMPREGADO e
join PROFE_CURSA_ACTI pa
on e.numero = pa.num_profesorado;


--5.25. Número identificativo de aquellos profesores que no cursan actividades.

select p.num_prof
from PROFESORADO p
where p.num_prof not in 
				(select pa.num_profesorado from PROFE_CURSA_ACTI pa);
				/*uso not in, para decirle que me coja los profresores que no estén en la tabla profe cursa act*/

--5.26. Nombre completo y localidad de los socios que asisten a la actividad ‘COCINA’.

select s.nome, s.ape1, s.ape2, s.localidade_enderezo
from SOCIO s
join SOCIO_REALIZA_ACTI sra
on s.numero = sra.num_socio
join ACTIVIDADE a
on a.identificador = sra.id_actividade
where a.nome = 'XADREZ';

--5.27. Nombre completo y localidad de los profesores que asisten a la actividad ‘COCINA’.

select e.nome, e.ape1, e.ape2, e.localidade_enderezo
from EMPREGADO e
join PROFE_CURSA_ACTI pa
on e.numero = pa.num_profesorado
join ACTIVIDADE a
on pa.id_actividade = a.identificador
where a.nome = 'XADREZ';


--5.28. Nombre completo y localidad de las personas de la sociedad cultural y deportiva que asisten a la 
--actividad ‘COCINA’.

select s.nome, s.ape1, s.ape2
from SOCIO s
join SOCIO_REALIZA_ACTI sra
on s.numero = sra.num_socio
join ACTIVIDADE a
on sra.id_actividade = a.identificador
where a.nome = 'XADREZ'
UNION ALL
select e.nome, e.ape1, e.ape2
from EMPREGADO e
join PROFE_CURSA_ACTI pca
on e.numero = pca.num_profesorado
join ACTIVIDADE ac
on pca.id_actividade = ac.identificador
where ac.nome = 'XADREZ';


--5.29. NIF y nombre de los administrativos que no han hecho horas extras.

select e.nif, e.nome
from EMPREGADO e
join ADMINISTRATIVO a
on e.numero = a.num_adm
where a.horas_extras = 50;


--5.30. Nombre completo de los profesores de la especialidad de ‘IDIOMAS’.

select e.nome, e.ape1, e.ape2
from EMPREGADO e
join PROFESORADO p
on e.numero = p.num_prof
where p.especialidade = 'DEPORTES';


--5.31. Nombre completo de los administrativos que han hecho horas extras.

select e.nif, e.nome
from EMPREGADO e
join ADMINISTRATIVO a
on e.numero = a.num_adm
where a.horas_extras != 0;


--5.32. Nombre completo de los profesores de la especialidad ‘IDIOMAS’ y administrativos que han hecho 
--horas extras.

select e.nome, e.ape1, e.ape2
from EMPREGADO e
join PROFESORADO p
on e.numero = p.num_prof
where p.especialidade = 'IDIOMAS'

union all

select e.nome, e.ape1, e.ape2
from EMPREGADO e
join ADMINISTRATIVO a
on e.numero = a.num_adm
where a.horas_extras != 0;


--5.33. Nombre y NIF de los administrativos que viven en Santiago de Compostela y que han hecho horas 
--extras.

select E.nome, e.nif
from EMPREGADO e
join ADMINISTRATIVO a
on e.numero = a.num_adm
where e.localidade_enderezo = 'SANTIAGO' 
and A.horas_extras != 0;


--5.34. Nombre y NIF de los administrativos que viven en Santiago de Compostela y que NO han hecho horas 
--extras.

select E.nome, e.nif
from EMPREGADO e
join ADMINISTRATIVO a
on e.numero = a.num_adm
where e.localidade_enderezo = 'SANTIAGO' 
and A.horas_extras = 0;


--5.35. Nombre y teléfonos de los profesores con sueldo superior a 1.200€.

select E.nome, e.nif
from EMPREGADO e
join PROFESORADO p
on e.numero = P.num_prof
where e.salario_mes > 1200; 


--5.36. Nombre de las actividades de las que se desconoce quién las va a impartir.

select a.nome
from ACTIVIDADE a
where num_profesorado_imparte = 0;


--5.37. Nombre de las actividades que tienen profesor asignado. Hazlo de 2 maneras, en la primera usando el 
--operador de selección y en la segunda usando el operador diferencia.

					select a.nome
					from ACTIVIDADE a
					where a.num_profesorado_imparte is not null;


                  --Opción haciendo la excepción, es decir, selecciona todos a excepción de el número de profesorado no sea nulo.
					select a.nome
					from ACTIVIDADE a
					except 
					select a.nome
					from ACTIVIDADE a
					where a.num_profesorado_imparte is null;

--5.38. Nombre y teléfono de los socios que asisten a clase de actividades con más de 10 plazas.



--5.39. Importe de las cuotas anuales asignadas a socios nacidos antes del año 2000.



--5.40. Nombre e importe de la/s cuota/s asignada/s a los socios de tipo COMÚN. 



--5.41. Nombre de las actividades a las que asisten socios que tienen asignadas cuotas anuales gratuitas.



--5.42. NIF y NSS de los profesores que imparten actividades en las que están matriculados socios que deben 
--la cuota anual.



--5.43. Nombre completo de los socios de los que se desconoce su profesión.

select s.nome
from SOCIO s
where s.profesion is null;

--5.44. Nombre completo y fecha de nacimiento de los socios que no participan en actividades.

--revisar esta_______________
select s.nome, s.ape1, s.ape2, s.data_nac
from SOCIO s
join SOCIO_REALIZA_ACTI sra
on s.numero = sra.id_actividade
where sra.num_socio = 0;

select * from SOCIO_REALIZA_ACTI;


--5.45. Nombre completo y fecha de nacimiento de los socios que participan en actividades de precio 
--superior a 100€.



--5.46. Actividades sin observaciones a resaltar.

select a.nome
from ACTIVIDADE a
where a.observacions is null;


--5.47. Nombre de la actividad que se imparte en el AULA número 6.

select a.nome
from ACTIVIDADE a
join AULA au
on au.numero = a.num_aula
where au.numero = 3;

--5.48. Nombre e importe de la/s cuota/s asignada/s a los socios que deben alguna actividad.




--5.49. Nombre y teléfonos de los profesores con sueldo inferior a 1.200€ y que asisten a actividades.




--5.50. Información completa de los administrativos que trabajan en la sociedad.

select *
from EMPREGADO e
join ADMINISTRATIVO a
on e.numero = a.num_adm;