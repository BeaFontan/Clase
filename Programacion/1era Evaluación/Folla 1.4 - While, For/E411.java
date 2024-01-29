//Programa que pida números e mostre se rematan en 0 ou en 5. Ao final deberá indicar o número de números introducidos. 
//O programa rematará se o número introducido é negativo.

import java.util.Scanner;

public class E411
{
    public static void main(String[] args) 
    {
        Scanner escaner = new Scanner(System.in);
        int numero;
        int acumuladorCifraNumeros = 0;

        System.out.println("Dime un número");
        numero = escaner.nextInt();

        while (numero >= 0) 
        {
            acumuladorCifraNumeros += 1;//para saber el total de números introducidos


            if (numero % 10 == 0 || numero % 5 == 0) 
            {
                System.out.println("O número remata en 0 ou en 5");
            }


            System.out.println("Dime un número");
            numero = escaner.nextInt();

        } 

         System.out.println("O total de números introducidos son: " + acumuladorCifraNumeros);

        escaner.close();
    }
}