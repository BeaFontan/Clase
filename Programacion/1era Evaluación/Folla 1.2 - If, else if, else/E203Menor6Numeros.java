//Fai, empregando unha variable menor, o menor de 6 números enteiros. Só con 5 comparacións, gardando o valor do menor nunha variable chamada menor.

import java.util.Scanner;

public class E203Menor6Numeros
{

    public static void main(String[] args) {
        
    Scanner pedirTeclado = new Scanner(System.in);

    System.out.println("Dime el primer número");
    int numero1 = pedirTeclado.nextInt();

    System.out.println("Dime el segundo número");
    int numero2 = pedirTeclado.nextInt();

    System.out.println("Dime el tercer número");
    int numero3 = pedirTeclado.nextInt();

     System.out.println("Dime el cuarto número");
    int numero4 = pedirTeclado.nextInt();

    System.out.println("Dime el quinto número");
    int numero5 = pedirTeclado.nextInt();

     System.out.println("Dime el sexto número");
    int numero6 = pedirTeclado.nextInt();

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
    if (numero4 < menor) 
    {
        menor = numero4;
    }
     if (numero5 < menor) 
    {
        menor = numero5;
    }
     if (numero6 < menor) 
    {
        menor = numero6;
    }

    System.out.println("O número menor é " + menor);

    pedirTeclado.close();

    }
    }