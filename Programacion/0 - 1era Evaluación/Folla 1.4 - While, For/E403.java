//Fai un programa que pida repetidamente dous números e faga a división sempre que o divisor non sexa 0. Rematará cando un dos dous números sexa 100.

import java.util.Scanner;

public class E403 {

    public static void main(String[] args) {

        Scanner escaner = new Scanner(System.in);
        int numero1;
        int numero2;
        double resultado;

        System.out.println("Dime un número");
        numero1 = escaner.nextInt();

        System.out.println("Dime outro número");
        numero2 = escaner.nextInt();


       while (numero1 != 100 && numero2 != 100 && numero2 != 0)
       {
        
        resultado = numero1 / numero2;
        System.out.println("El resultado de la división es " + resultado);

        System.out.println("Dime un número");
        numero1 = escaner.nextInt();

        System.out.println("Dime outro número");
        numero2 = escaner.nextInt();
    
       }

       escaner.close();
    }

}