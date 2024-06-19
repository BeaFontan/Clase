//Programa que pida números e indique se son primos. O programa rematará se o número introducido é negativo.

import java.util.Scanner;

public class E410
{

    public static void main(String[] args) 
    {
        Scanner escaner = new Scanner(System.in);
        int numero;
        double resultado =0;

        System.out.println("Dime un número");
        numero = escaner.nextInt();

        while (numero >= 0) 
        {
            for (int i = 2; i < numero/2; i++) 
            {

            resultado = numero % i;

            }
               
            if (resultado == 0 ) 
            {
                System.out.println("Es un número primo");
            
            }
            else
            {
                System.out.println("No es un número primo");
            }

            System.out.println("Dime un número");
            numero = escaner.nextInt();

        } 

        escaner.close();
    }
}