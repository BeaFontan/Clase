USE SOCIEDADE_CULTURAL_BEA;

--HOJA 27-------------------------------------------------------------------------


--� Proposta 1. Nome e apelidos (cada un nunha columna) de todos os empregados.

select e.nome, e.ape1, e.ape2 
from EMPREGADO e;


--� Proposta 2. N�mero, nome e apelidos (cada un nunha columna) de todos 
--empregados.




--� Proposta 3. N�mero, nome e apelidos (cada un nunha columna) de todos os 
--empregados por orde alfab�tica de apelidos e nome.

--� Proposta 4. N�mero, nome e apelidos (cada un nunha columna) de todos os 
--empregados por orde alfab�tica de apelidos e nome. Os nomes das columnas no 
--resultado ser�n: num_socio, nome_socio, apelido1, apelido2.

--� Proposta 5. N�mero, nome completo (os 4 campos nunha �nica columna, de nome 
--socio, co formato numero - ape1 ape2, nome) e salario de todos os empregados. No 
--resultado deber�n aparecer primeiro os que m�is cobran.

--� Proposta 6. N�mero, nome completo (os 4 campos nunha �nica columna, de nome 
--socio, co formato numero - ape1 ape2, nome) e salario de todo o profesorado. No 
--resultado deber�n aparecer primeiro os que m�is cobran. O campo cargo cont�n 
--PRF para o profesorado, e ADM se � un ou unha administrativo.


--� Proposta 7. N�mero identificador do profesorado que imparte clases. Como � 
--l�xico, se un profesor imparte m�is dunha actividade, o seu n�mero s� pode 
--aparecer unha vez.


--� Proposta 8. N�mero identificador das actividades �s que asiste profesorado, � dicir, 
--cursadas por profesorado. 


--� Proposta 9. Nome, importe, e importe rebaixado un 20%, da actividade de nome 
--xadrez.


--� Proposta 10. NIF, nome e apelidos dos socios dos que non temos tel�fono gardado.


--� Proposta 11. NIF, nome, apelidos e data de nacemento dos socios nados entre 1980 
--e 1990, ambos inclu�dos.


--� Proposta 12. Todos os datos das actividades cuxo nome cont�n a letra T.
--� Proposta 13. Nome e importe das cotas cun custo de 30 ou 100 euros.
--� Proposta 14. Nome e n�mero de prazas das actividades que non te�en nin 15 nin 20 
--prazas.


