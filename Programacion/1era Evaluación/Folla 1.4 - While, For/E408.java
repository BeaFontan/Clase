//Fai un programa que mostre a táboa de multiplicar dun número enteiro positivo menor que 20 introducido por teclado. 
//Deberá comprobar que o número é positivo e menor que 20. A saída do programa deberá ser (se se teclea o 2):

import java.util.Scanner;

public class E408 
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
           
            for (int i = 0; i < 20; i++) 
            {

                resultado = numeroTeclado * i;
                
                System.out.println(numeroTeclado + " x " + i + " = " + resultado);
            }

        }

        else
        {

        System.out.println("Introduce un número positivo e menor que 20");

        }

        escaner.close();
    }
}