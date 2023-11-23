USE SOCIEDADE_CULTURAL_BEA;

--– Proposta 1. Nome e apelidos (cada un nunha columna) de todos os empregados.

select e.nome, e.ape1, e.ape2 
from EMPREGADO e;


--– Proposta 2. Número, nome e apelidos (cada un nunha columna) de todos 
--empregados.




--– Proposta 3. Número, nome e apelidos (cada un nunha columna) de todos os 
--empregados por orde alfabética de apelidos e nome.

--– Proposta 4. Número, nome e apelidos (cada un nunha columna) de todos os 
--empregados por orde alfabética de apelidos e nome. Os nomes das columnas no 
--resultado serán: num_socio, nome_socio, apelido1, apelido2.

--– Proposta 5. Número, nome completo (os 4 campos nunha única columna, de nome 
--socio, co formato numero - ape1 ape2, nome) e salario de todos os empregados. No 
--resultado deberán aparecer primeiro os que máis cobran.

--– Proposta 6. Número, nome completo (os 4 campos nunha única columna, de nome 
--socio, co formato numero - ape1 ape2, nome) e salario de todo o profesorado. No 
--resultado deberán aparecer primeiro os que máis cobran. O campo cargo contén 
--PRF para o profesorado, e ADM se é un ou unha administrativo.


--– Proposta 7. Número identificador do profesorado que imparte clases. Como é 
--lóxico, se un profesor imparte máis dunha actividade, o seu número só pode 
--aparecer unha vez.


--– Proposta 8. Número identificador das actividades ás que asiste profesorado, é dicir, 
--cursadas por profesorado. 


--– Proposta 9. Nome, importe, e importe rebaixado un 20%, da actividade de nome 
--xadrez.


--– Proposta 10. NIF, nome e apelidos dos socios dos que non temos teléfono gardado.


--– Proposta 11. NIF, nome, apelidos e data de nacemento dos socios nados entre 1980 
--e 1990, ambos incluídos.


--– Proposta 12. Todos os datos das actividades cuxo nome contén a letra T.
--– Proposta 13. Nome e importe das cotas cun custo de 30 ou 100 euros.
--– Proposta 14. Nome e número de prazas das actividades que non teñen nin 15 nin 20 
--prazas.


