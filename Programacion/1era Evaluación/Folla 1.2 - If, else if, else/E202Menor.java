//Fai o exercicio anterior empregando unha variable chamada menor onde se vaia gardando o menor número en cada comparación. Emprega só 2 comparacións .

import java.util.Scanner;

public class E202Menor
{

    public static void main(String[] args) {
        
    Scanner pedirTeclado = new Scanner(System.in);

    System.out.println("Dime el primer número");
    int numero1 = pedirTeclado.nextInt();

    System.out.println("Dime el segundo número");
    int numero2 = pedirTeclado.nextInt();

    System.out.println("Dime el tercer número");
    int numero3 = pedirTeclado.nextInt();

    //Resultado
 
    int menor = numero1; // designo una variable para ir guardando el menor

    if (numero2 < menor) 
    {
        menor = numero2;
    }
    if (numero3 < menor) 
    {
        menor = numero3;
    }

    System.out.println("O número menor é " + menor);

    pedirTeclado.close();

    }
    }