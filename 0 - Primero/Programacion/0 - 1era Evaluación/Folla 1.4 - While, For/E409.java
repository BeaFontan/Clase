//O programa repetirá o exercicio anterior, pedindo outro(s) número(s). Rematará cando o número introducido sexa 0.

import java.util.Scanner;

public class E409 
{

    public static void main(String[] args) 
    {
        Scanner escaner = new Scanner(System.in);
        int numeroTeclado;
        int resultado;

        System.out.println("Dime un número");
        numeroTeclado = escaner.nextInt();
        
        if (numeroTeclado > 0 && numeroTeclado < 20) 
        {
           while (numeroTeclado != 0) 
           {
                for (int i = 0; i < 20; i++) 
                {
                    resultado = numeroTeclado * i;
                    
                    System.out.println(numeroTeclado + " x " + i + " = " + resultado);

                }

                System.out.println("Dime un número");
                numeroTeclado = escaner.nextInt();
           }

        }

        else
        {

        System.out.println("Introduce un número positivo e menor que 20");

        }

        escaner.close();
    }
}