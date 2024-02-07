<#1-Amosa a data.#>

$fecha = Get-Date
Write-Host $fecha



<#2-Lista os directorios ou arquivos que hai en Windows/System32 e que o seu nome comece por w. #>

Get-ChildItem C:/Windows/System32 w*


<#3-Fai a seguinte estrutura de directorios e arquivos:
C:
SISTEMAS
DOS
MANUAL
manual.txt
EXERCICIOS
folla1.txt
folla2.txt #>


mkdir C:/SISTEMAS/DOS/MANUAL/
type manual.txt C:/SISTEMAS/DOS/MANUAL/


<#4-Copia todos os ficheiros do directorio ejercicios a C cunha soa orde.#>




<#5.Crea un directorio en C que se chame PRACTICA2 e copia o ficheiro LABEL.EXE do subdirectorio SYSTEM32 de WINDOWS en PRACTICA2 pero co nome ETIQUETA.EXE. Podes utilizar 2 comandos.#>


<#6.Copia todos os ficheiros do directorio EXERCICIOS a PRACTICA2 cunha soa orde.#>


<#7.Copia todos os ficheiros do directorio PRACTICA2 que teñen extensión txt no directorio DOS pero coa extensión sol, cunha soa orde.#>


<#8.Con ruta absoluta renomea o ficheiro folla1.sol que se atopa en DOS como folla.dat#>


<#9.Copia todo o directorio Sistemas noutro directorio chamado CopySist cunha soa orde.#>


<#10.Ubícate na túa carpeta de usuario con ruta absoluta.#>


<#11.Utilizando ruta relativa borra o directorio CopySist#>


<#12.Pon atributo oculto ao arquivo folla.dat que hai no directorio DOS. Tes que facer algo especial para listar dito arquivo oculto?#>


<#13.Cambia ao directorio DOS e, utilizando direccionamiento (>), crea un arquivo novo chamado folla.txt#>


<#14.Amosa por pantalla o contido de folla.dat e folla.txt (2 comandos).#>


<#15.Engade o contido de folla.txt a folla.dat sen borrar o que hai en folla.dat.#>