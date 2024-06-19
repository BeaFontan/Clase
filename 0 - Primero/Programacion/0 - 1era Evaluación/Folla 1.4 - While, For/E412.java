//Programa que pida 10 números double e mostre o mínimo e o máximo.

import java.util.Scanner;

public class E412
{
    public static void main(String[] args) 
    {
        Scanner escaner = new Scanner(System.in);

        System.out.println("Dime un número");
        double numero = escaner.nextDouble();

        double menor = numero;
        double maior = numero;


        //Bucle para pedir 10 números
        for (int i = 0; i < 10; i++) 
        {
        System.out.println("Dime otro número");
        numero = escaner.nextDouble();

        if (numero < menor) 
        {
            menor = numero;
        }
    
        if (numero > maior) 
        {
            maior = numero;
        }
        }

        System.out.println("O número menor foi " + menor + " e o número maior foi " + maior);

        escaner.close();
    }
}