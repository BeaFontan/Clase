//11. Pide unha cadea por teclado. O programa deberá mostrar por pantalla só as 2 primeiras palabras.

import java.util.Scanner;

public class AppString1_11 {

    public static void main(String[] args) {
        Scanner teclado = new Scanner(System.in);
        String frase;
        int indiceEspacio;
        int guardadoFrase;

        System.out.println("Dime a frase");
        frase = teclado.nextLine();

        guardadoFrase = frase.indexOf(" "); // guardo el indice hasta el primer espacio.

        ///Seguir me falta ver como muestro las dos palabras con el espacio.


        
        frase = frase.replaceFirst(" ", "");

        indiceEspacio = frase.indexOf(" ");

        frase = frase.substring(0,indiceEspacio);

        System.out.println(frase);

    }
}