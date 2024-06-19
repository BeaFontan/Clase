//Programa que dada unha data de nacemento (pedir día, mes e ano), indique cantos anos ten esa persoa. Hai que comprobar se xa estivo de aniversario ou non.

import java.util.Scanner;

public class E206CalcularEdad
{

    public static void main(String[] args) {
        
    Scanner pedirTeclado = new Scanner(System.in);
    int anoNacemento;
    int mesNacemento;
    int diaNacemento;
    int anoActual = 2023;
    int mesActual = 9;
    int diaActual = 15;
    int edad;


    System.out.println("Dime o teu ano de nacemento");
    anoNacemento = pedirTeclado.nextInt();

    System.out.println("Dime o teu mes de nacemento");
    mesNacemento = pedirTeclado.nextInt();

    System.out.println("Dime o día de nacemento");
    diaNacemento = pedirTeclado.nextInt();

    //Resultado
 
    edad = anoActual - anoNacemento;


    if (mesActual >= mesNacemento)
    {
      edad -=1;
        
    }
    

    /*if (diaNacemento <= diaActual) 
    {
        edad+=1;
    }*/



    System.out.println("Tes " + edad + " anos");

    pedirTeclado.close();

    }
    }