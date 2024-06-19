//Programa que pregunte primeiro: ¿cantos números queres introducir?, pida eses números e calcule a súa suma e o máximo deles.

import java.util.Scanner;

public class E511 {

    public static void main(String[] args) {
        
        Scanner escaner = new Scanner(System.in);
        int totalNumeros;
        int acumuladorNumeros[];
        int sumaNumeros = 0;


        System.out.println("¿Cantos números queres introducir");
        totalNumeros = escaner.nextInt();

        for (int i = 0; i < totalNumeros; i++) {

            System.out.println("Dime esos números");
            acumuladorNumeros = new int[escaner.nextInt()];
            
        }

       for (int i : acumuladorNumeros) {
        
       }

        System.out.println("O suma dos números é " + sumaNumeros + " e o maior deles é " );

        escaner.close();
    }
    
}