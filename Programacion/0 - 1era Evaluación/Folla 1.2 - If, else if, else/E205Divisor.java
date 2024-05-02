//Dados 2 números introducidos por teclado, decidir se algún é divisor do outro.

import java.util.Scanner;

public class E205Divisor 
{

    public static void main(String[] args) 
    {

    Scanner pedirTeclado = new Scanner(System.in);
    int numero1;
    int numero2;
    

    System.out.println("Dime un número");
    numero1 = pedirTeclado.nextInt();

    System.out.println("Dime otro número");
    numero2 = pedirTeclado.nextInt();

    /////////////

    if (numero1 % numero2 == 0) 
    {
        System.out.println( numero1 + " é divisor de " + numero2);
    }
    else if (numero2 % numero1 == 0)
    {
        System.out.println( numero2 + " é divisor de " + numero1);
    }


    


    pedirTeclado.close();

    }
}