//Fai un programa que pida un número e o mostre. Debe repetir isto varias veces ata que se pulse o 100.

import java.util.Scanner;
public class E401while {
    public static void main(String[] args) {
        
        Scanner escaner = new Scanner(System.in);
        int numero=1;

        System.out.println("Adivina el número");
        numero = escaner.nextInt();

       while (numero != 100) {

       System.out.println(numero);
       System.out.println("Dime outro número");
       numero = escaner.nextInt();
    
       }

       escaner.close();
    }
}



    
