//Programa que tire unha moeda ao aire tantas veces como queira o xogador, indicando se acerta ou non. Ao final deberá mostrar cantos acertos houbo e 
// o número de veces xogadas.

import java.util.Scanner;

public class E415 {
    public static void main(String[] args) {

        Scanner escaner = new Scanner(System.in);
        String palabra;

        System.out.println("Cara o cruz");
        palabra = escaner.nextLine();


        while (palabra.equals("cara") && palabra.equals("cruz")) 
        {

            


        System.out.println("Cara o cruz");
        palabra = escaner.nextLine();
            
        }

        escaner.close();

    }
    
}