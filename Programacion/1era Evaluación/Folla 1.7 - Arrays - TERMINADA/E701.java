//Programa que pida 7 números enteiros por teclado e os mostre a continuación na orde na que se introduciron.

import java.util.Scanner;

public class E701 {

    public static void main(String[] args) {
        
        Scanner escaner = new Scanner(System.in);
        int[] numeros = new int[7];
        
        
        System.out.println("Dime 7 números");
       
        for (int i = 0; i < numeros.length; i++) {
            numeros[i] = escaner.nextInt();
        }

        for (int j : numeros) {

            System.out.println("Os números foron " + j);
            
        
        }

        escaner.close();

    }

}