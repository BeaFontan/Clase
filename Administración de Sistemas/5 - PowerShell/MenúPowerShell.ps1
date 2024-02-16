#!/bin/bash

$limpiarPantalla = Clear-Host

$menu = "
  Pulsa 1 Para operar con dous números
  pulsa 2 para crear un novo ficheiro de texto
  pulsa 3 para averiguar o maior de duas persoas
  pulsa 4 adiviñar un número do 1 o 10
  pulsa 5 para comprobar os alumnos matriculados
  pulsa 6 para Sair: "

function operacions(){
    operacion = Read-Host "Pulsa 1 para suma, 2 para restar, 3 para multiplicar, 4 para dividir: "

    if ($operacion -eq 1){

        $resultado = $primerNumero + $segundoNumero
        Write-Host "$primerNumero + $segundoNumero = $resultado"

    }elseif ( $operacion -eq 2 ){
       
        $resultado=$primerNumero - $segundoNumero
        Write-Host "$primerNumero - $segundoNumero = $resultado"

    }elseif( $operacion -eq 3 ){
        
        $resultado= $primerNumero * $segundoNumero
        Write-Host "$primerNumero * $segundoNumero = $resultado"

    }
    elseif ($operacion -eq 4 ){

        $resultado= $primerNumero / $segundoNumero
        Write-Host "$primerNumero / $segundoNumero = $resultado"

    }else{
        Write-Host "O número introducido non corresponde a ninguna operación."
    }
}

function ficheiro(){

    $nomeFicheiro = Read-Host ("Dime o nome que lle queres poñer: ")

    New-Item -Name "$nomeFicheiro.txt" -ItemType "file"

    Write-Host "ficheiro creado".

    $respuesta = Read-Host( "Pulsa 1 si queres eliminalo, senon, 0: ")

    if ( $respuesta -eq 1 ){
    
        Remove-Item $nomeFicheiro.txt

    }else{

        Write-Host "Ficheiro non eliminado"
    }
}

function maior(){
    $nome1 = Read-Host ("Dime o nome da primeira persoa: " )
    $idade1 = Read-Host ( "Dime a súa idade: " )
    $nome2 = Read-Host( "Dime o nome da segunda persoa: " )
    $idade2 = Read-Host( "Dime a súa idade: " )

    if ( $idade1 -gt $idade2 ){

        Write-Host "$nome1 é maior que $nome2."

     }elseif ( $idade1 -lt $idade2 ){
   
        Write-Host "$nome2 é maior que $nome1."

     }else{

        Write-Host "$nome1 e $nome2 teñen a mesma idade."
    }
  }

  function adivina(){
    $numeroGanador=4
    $contador=0

    $numeroEntrada = Read-Host( "Dime un número do 1 o 10: ")

    while (( numeroEntrada > 10 || numeroEntrada < 1 ))
    do
         read -p "O número ten que ser maior que 1 e menor que 10, dime un correcto: " numeroEntrada
    done

    while (( $numeroEntrada != $numeroGanador ));
     do
        ((contador++))
         read -p "Fallaches, dime outro número: " numeroEntrada
         
            while (( numeroEntrada > 10 || numeroEntrada < 1 ))
            do
                read -p "O número ten que ser maior que 1 e menor que 10, dime un correcto: " numeroEntrada
            done
    done

    echo "Noraboa, acertaches. O número de intentos foron $contador.";
  }


  function lista(){
    $arrayNomes = ("Vanessa", "Carolina", "Elena")

    $nomeAlumno = Read-Host ("Dime o nome do alumno que queres comprobar si está matriculado: ")

    $matriculado= $false

    foreach( $alumno in $arrayNomes){
        do{
            if ( $nomeAlumno -eq $alumno ){
        
                $matriculado=$true
                break
            }
        }
    }

    if ( $matriculado -eq $true ){
    
        echo "O alumno está matriculado"}

    else{
        echo "O alumno non está matriculado"
    }
  }
  

$respuesta = Read-Host("$menu");
Write-Host $limpiarPantalla;


 while ($respuesta -ne 6){
    
        switch ($respuesta) {
            1{
                $primerNumero = Read-Host("Dime o primero numero: ")
                $segundoNumero = Read-Host ("Dime o segundo numero: ")

                operacions{
                param{$primerNumero, $segundoNumero}}
             }

            2{
                ficheiro
            }

            3{
                maior
            }

            4{
                adivina
            }

            5{ 
                lista
            }
            default{
                Write-Host "Opción non válida. Por favor, escolle unha opción entre 1 e 6."
            } 
        }

        $respuesta = Read-Host("$menu");
        Write-Host $limpiarPantalla;

    }
