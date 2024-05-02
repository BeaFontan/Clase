/*Modifica o anterior programa para facer a suma de dous números enteiros (introducidos por teclado
no main( ) ), chamando a unha función que devolve o valor da suma. */

import java.util.Scanner;

public class F02 {

    public static void main(String[] args) {
        
        Scanner teclado = new Scanner(System.in);
        int numero1;
        int numero2 = 3;
        int resultado;

        System.out.println("Dime o primeiro número");
        numero1 = teclado.nextInt();

        System.out.println("Dime o segundo número");
        numero2 = teclado.nextInt();



        resultado = sumar(numero1, numero2);

        System.out.println("A suma de " + numero1 + " mais " + numero2 + " é igual a: " + resultado);


        teclado.close();
    }


    public static int sumar(int a, int b){
        
        return a + b;

    }


}