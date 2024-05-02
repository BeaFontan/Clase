<#1-Amosa a data.#>

$fecha = Get-Date
Write-Host $fecha



<#2-Lista os directorios ou arquivos que hai en Windows/System32 e que o seu nome comece por w. #>

Get-ChildItem C:/Windows/System32 w* -Recurse


<#3-Fai a seguinte estrutura de directorios e arquivos:
C:
SISTEMAS
DOS
MANUAL
manual.txt
EXERCICIOS
folla1.txt
folla2.txt #>


mkdir L:\SistemasInformaticos/SISTEMAS/DOS/MANUAL/

New-Item -Path "L:\SistemasInformaticos/SISTEMAS/DOS/MANUAL/" -Name "manual.txt" -ItemType "file"

New-Item -Path "L:\SistemasInformaticos/SISTEMAS/DOS/MANUAL/" -Name "EXERCICIOS" -ItemType "directory"

New-Item -ItemType "file" -Path "L:\SistemasInformaticos/SISTEMAS/DOS/MANUAL/EXERCICIOS/folla1.txt", "L:\SistemasInformaticos/SISTEMAS/DOS/MANUAL/EXERCICIOS/folla2.txt"


<#4-Copia todos os ficheiros do directorio ejercicios a C cunha soa orde.#>
Copy-Item -Path "L:\SistemasInformaticos/SISTEMAS/DOS/MANUAL/EXERCICIOS/*" -Destination "L:\SistemasInformaticos\SISTEMAS" -Recurse


<#5.Crea un directorio en C que se chame PRACTICA2 e copia o ficheiro LABEL.EXE do subdirectorio SYSTEM32 de WINDOWS en PRACTICA2 pero co nome ETIQUETA.EXE. Podes utilizar 2 comandos.#>

New-Item -Path "L:\SistemasInformaticos/SISTEMAS/" -Name "PRACTICA2" -ItemType "directory"

Copy-Item -Path "C:\Windows\SysWOW64\label.exe" -Destination "L:\SistemasInformaticos\SISTEMAS\PRACTICA2\etiqueta.exe" -Recurse



<#6.Copia todos os ficheiros do directorio EXERCICIOS a PRACTICA2 cunha soa orde.#>

Copy-Item -Path "L:\SistemasInformaticos\SISTEMAS\DOS\MANUAL\EXERCICIOS\*" -Destination "L:\SistemasInformaticos\SISTEMAS\PRACTICA2" -Recurse


<#7.Copia todos os ficheiros do directorio PRACTICA2 que teñen extensión txt no directorio DOS pero coa extensión sol, cunha soa orde.#>


Get-ChildItem -Path "L:\SistemasInformaticos\SISTEMAS\PRACTICA2\" -Filter *.txt | Copy-Item -Destination "L:\SistemasInformaticos\SISTEMAS\DOS\" -PassThru | Rename-Item -NewName { $_.Name -replace '\.txt$', '.sol' }


<#8.Con ruta absoluta renomea o ficheiro folla1.sol que se atopa en DOS como folla.dat#>


 Rename-Item -Path "L:\SistemasInformaticos\SISTEMAS\DOS\folla1.sol" -NewName "folla.dat"


<#9.Copia todo o directorio Sistemas noutro directorio chamado CopySist cunha soa orde.#>

New-Item -Path "L:\SistemasInformaticos/" -Name "CopySist" -ItemType "directory" ; Copy-Item -Path "L:\SistemasInformaticos\SISTEMAS" -Destination "L:\SistemasInformaticos\CopySist" -Recurse


<#10.Ubícate na túa carpeta de usuario con ruta absoluta.#>

Set-Location C:\Users\A23BeatrizFP


<#11.Utilizando ruta relativa borra o directorio CopySist. No lo puedo hacer con rutas relativas porque estoy en distintas unidades#>

Remove-Item L:\SistemasInformaticos\CopySist -Recurse



<#12.Pon atributo oculto ao arquivo folla.dat que hai no directorio DOS. Tes que facer algo especial para listar dito arquivo oculto?#>

$file = Get-Item folla.dat
$file.Attributes = 'Hidden'


<#13.Cambia ao directorio DOS e, utilizando direccionamiento (>), crea un arquivo novo chamado folla.txt#>




<#14.Amosa por pantalla o contido de folla.dat e folla.txt (2 comandos).#>

Get-Content L:\SistemasInformaticos\SISTEMAS\DOS\folla.dat

Write-Host L:\SistemasInformaticos\SISTEMAS\DOS\folla.txt

<#15.Engade o contido de folla.txt a folla.dat sen borrar o que hai en folla.dat.#>

>> 