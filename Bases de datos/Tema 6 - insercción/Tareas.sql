-- Consultas propostas na BD SOCIEDADE_CULTURAL.
use SOCIEDADE_CULTURAL_BEA;

--– Proposta 1. Aumentar o número de prazas das actividades nun 15%.

BEGIN TRAN

select * from ACTIVIDADE;

update ACTIVIDADE
set prezo=prezo*1.15;

select * from ACTIVIDADE;

ROLLBACK;


--– Proposta 2. Cambiar o estado da aula de nome AULA SUR a regular (R).

BEGIN TRAN

select * from AULA;

update AULA
set estado = 'R'
where descricion  = 'AULA SUR';

select * from AULA;

ROLLBACK;

--– Proposta 3. Engadir unha aula nova de número 9, nome AULA NOVA e con 
--superficie e estado os mesmos que os da aula COCIÑA.

BEGIN TRAN

select * from AULA;

insert into AULA (numero, descricion, superficie, estado)
select 9, 'AULA NOVA', superficie, estado from AULA where descricion = 'COCIÑA';

select * from AULA;

ROLLBACK;

--– Proposta 4. Engadir dúas novas cotas, unha cos datos 21, COTA1, 75 e outra cos 
--datos 22, COTA2 e 74.3.

BEGIN TRAN

select * from COTA;

insert into COTA (codigo, nome, importe)
values(21, 'COTA1', 75),
	  (22, 'COTA2', 74.3);

select * from COTA;

ROLLBACK;

--– Proposta 5. Crear unha táboa temporal global PROFE_ASISTENTE_ACTI co nif, nome 
--e primeiro apelido do profesorado que asiste a actividades.

BEGIN TRAN

select e.nif, e.nome, e.ape1 into #PROFE_ASISTENTE_ACTI
from PROFE_CURSA_ACTI pca inner join EMPREGADO e
		on pca.num_profesorado = e.numero;

	select * from #PROFE_ASISTENTE_ACTI;

ROLLBACK;


--– Proposta 6. Crear unha táboa permanente de nome AULA_MALA coas aulas en mal 
--estado (Estado=M) e coas mesmas columnas da táboa AULA. Os nomes dos campos 
--de AULA_MALA serán codigo, nome, m2 e estado.

BEGIN TRAN
select * from AULA;

select a.numero as codigo, a.descricion as nombre, a.superficie as m2, a.estado into ##AULA_MALA
from AULA a
where a.estado = 'M';

select * from ##AULA_MALA;

ROLLBACK;

--– Proposta 7. Crear unha táboa temporal local que sexa unha copia en canto a contido 
--e columnas da táboa ACTIVIDADE e que se chame ACTI2. Antes de pechar a 
--transacción, farase unha consulta que elimine todas as actividades da táboa nova 
--que non teñan observacións.

BEGIN TRAN

select * from ACTIVIDADE;

select * into #ACTI2
FROM ACTIVIDADE;

select * from #ACTI2;

delete from #ACTI2
where observacions is null;

select * from #ACTI2;

ROLLBACK;

--– Proposta 8. Crear unha táboa temporal local de nome SOCIO2 copia de SOCIO. A 
--continuación faremos a consulta que elimine de SOCIO2 aqueles socios que non 
--teñen teléfono algún. 

BEGIN TRAN


ROLLBACK;

--– Proposta 9. Substituír os espazos en branco das observacións das actividades, as que 
--asisten docentes, por guións baixos(_).

BEGIN TRAN


ROLLBACK;

--– Proposta 10. Retrasar nun día a data de inicio de tódalas actividades que aínda non 
--comezaron a día de hoxe.

BEGIN TRAN


ROLLBACK;

--– Proposta 11. Eliminar os fabricantes dos que non hai produtos na BD.

BEGIN TRAN


ROLLBACK;

--– Proposta 12. Incrementar o obxectivo das sucursais da rexión OESTE nun 6% e 
--modificar o nome da rexión por WEST.

BEGIN TRAN


ROLLBACK;

--– Proposta 13. Crear unha táboa de nome FABRICANTE2 que sexa unha copia de 
--FABRICANTE en número e nome de columnas e en contido. Elimina todas as filas da 
--nova táboa do xeito máis rápido e menos custoso posible.

BEGIN TRAN


ROLLBACK;

--– Proposta 14. Transferir todos os empregados que traballan na sucursal de 
--BARCELONA á sucursal de VIGO, e cambiar a súa cota de vendas pola media das 
--cotas de vendas de tódolos empregados.
BEGIN TRAN


ROLLBACK;

--– Proposta 15. Elimina os pedidos de empregados contratados antes do ano 2001.



BEGIN TRAN


ROLLBACK;