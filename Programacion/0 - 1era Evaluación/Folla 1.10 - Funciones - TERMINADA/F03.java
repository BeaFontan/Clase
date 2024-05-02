/*Crea un programa que sume tres números double introducidos por teclado (a introducción dos
valores no main), chamando a unha función suma3Double que devolva o valor da suma. */

import java.util.Scanner;

public class F03 {

    public static void main(String[] args) {
        
        Scanner teclado = new Scanner(System.in);
        double numero1;
        double numero2;
        double numero3;
        double resultado;
        
        System.out.println("Dime un número");
        numero1 = teclado.nextDouble();

        System.out.println("Dime outro número");
        numero2 = teclado.nextDouble();

        System.out.println("Dime o último número número");
        numero3 = teclado.nextDouble();


        resultado = suma3Numeros(numero1, numero2, numero3);

        System.out.println("A suma de " + numero1 + " + " + numero2 + " + " + numero3 + " = " + resultado);

        teclado.close();
    }


    public static double suma3Numeros(double a, double b, double c){

        return a+b+c;
    }
}