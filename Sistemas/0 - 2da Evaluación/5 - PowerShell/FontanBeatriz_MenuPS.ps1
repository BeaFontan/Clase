Clear-Host

$menu = @"
  Pulsa 1 Para operar con dos números
  pulsa 2 para crear un nuevo archivo de texto
  pulsa 3 para averiguar el mayor de dos personas
  pulsa 4 adivinar un número del 1 al 10
  pulsa 5 para comprobar los alumnos matriculados
  pulsa 6 para Salir
"@

function operaciones {
    param($primerNumero, $segundoNumero)
    $operacion = [int](Read-Host "Pulsa 1 para suma, 2 para restar, 3 para multiplicar, 4 para dividir")

    if ($operacion -eq 1) {
        $resultado = $primerNumero + $segundoNumero
        Write-Host "$primerNumero + $segundoNumero = $resultado"
    }
    elseif ($operacion -eq 2) {
        $resultado = $primerNumero - $segundoNumero
        Write-Host "$primerNumero - $segundoNumero = $resultado"
    }
    elseif ($operacion -eq 3) {
        $resultado = $primerNumero * $segundoNumero
        Write-Host "$primerNumero * $segundoNumero = $resultado"
    }
    elseif ($operacion -eq 4) {
        $resultado = $primerNumero / $segundoNumero
        Write-Host "$primerNumero / $segundoNumero = $resultado"
    }
    else {
        Write-Host "El número introducido no corresponde a ninguna operación."
    }
}


function crearArchivo {
    $nombreArchivo = Read-Host "Dime el nombre que le quieres poner"

    $rutaEscritorio = [Environment]::GetFolderPath("Desktop")

    $rutaCompleta = Join-Path -Path $rutaEscritorio -ChildPath "$nombreArchivo.txt"

    New-Item -Path $rutaCompleta -ItemType "file"

    Write-Host "Archivo creado en Escritorio: $rutaCompleta"

    $respuesta = Read-Host "Pulsa 1 si quieres eliminarlo, sino, cualquier otra tecla"

    if ($respuesta -eq "1") {
        Remove-Item -Path $rutaCompleta
        Write-Host "Archivo eliminado."
    }
    else {
        Write-Host "Archivo no eliminado."
    }
}


function mayor {
    $nombre1 = Read-Host "Dime el nombre de la primera persona"
    $edad1 = [int](Read-Host "Dime su edad")
    $nombre2 = Read-Host "Dime el nombre de la segunda persona"
    $edad2 = [int](Read-Host "Dime su edad")

    if ($edad1 -gt $edad2) {
        Write-Host "$nombre1 es mayor que $nombre2."
    }
    elseif ($edad1 -lt $edad2) {
        Write-Host "$nombre2 es mayor que $nombre1."
    }
    else {
        Write-Host "$nombre1 y $nombre2 tienen la misma edad."
    }
}

function adivina {
    $numeroGanador = 4
    $contador = 0

    $numeroEntrada = [int](Read-Host "Dime un número del 1 al 10")

    while (($numeroEntrada -gt 10) -or ($numeroEntrada -lt 1)) {
        $numeroEntrada = [int](Read-Host "El número tiene que ser mayor que 1 y menor que 10, dime uno correcto")
    }

    while ($numeroEntrada -ne $numeroGanador) {
        $contador++
        $numeroEntrada = [int](Read-Host "Fallaste, dime otro número")

        while (($numeroEntrada -gt 10) -or ($numeroEntrada -lt 1)) {
            $numeroEntrada = [int](Read-Host "El número tiene que ser mayor que 1 y menor que 10, dime uno correcto")
        }
    }

    Write-Host "¡Enhorabuena, acertaste! El número de intentos fueron $contador."
}

function lista {
    $arrayNombres = @("Vanessa", "Carolina", "Elena")

    $nombreAlumno = Read-Host "Dime el nombre del alumno que quieres comprobar si está matriculado"

    $matriculado = $false

    foreach ($alumno in $arrayNombres) {
        if ($nombreAlumno -eq $alumno) {
            $matriculado = $true
            break
        }
    }

    if ($matriculado) {
        Write-Host "El alumno está matriculado."
    }
    else {
        Write-Host "El alumno no está matriculado."
    }
}

do {
    $respuesta = Read-Host $menu
    Clear-Host

    switch ($respuesta) {
        1 {
            $primerNumero = [int](Read-Host "Dime el primer número")
            $segundoNumero = [int](Read-Host "Dime el segundo número")

            operaciones $primerNumero $segundoNumero
        }
        2 {
            crearArchivo
        }
        3 {
            mayor
        }
        4 {
            adivina
        }
        5 {
            lista
        }
        default {
            Write-Host "Opción no válida. Por favor, elige una opción entre 1 y 6."
        }
    }
}
until ($respuesta -eq 6)
