//Menor de 3 números introducidos por teclado.

import java.util.Scanner;

public class E201Menor3Numeros{

    public static void main(String[] args) {
        
    Scanner pedirTeclado = new Scanner(System.in);

    System.out.println("Dime el primer número");
    int numero1 = pedirTeclado.nextInt();

    System.out.println("Dime el segundo número");
    int numero2 = pedirTeclado.nextInt();

    System.out.println("Dime el segundo número");
    int numero3 = pedirTeclado.nextInt();

    //Resultado
 
    int menor; // designo una variable para ir guardando el menor

    if (numero1 < numero2 && numero1 < numero3) 
    {
        menor = numero1;
        System.out.println("O número menor é " + menor );
    }
    else if (numero2 < numero1 && numero2 < numero3) 
    {
        menor = numero2;
        System.out.println("O número menor é " + menor);
    }
    else
    {
        System.out.println("O número menor é " + numero3);
    }
    
    pedirTeclado.close();

    }
    }