/*Fai un programa que multiplique 4 valores double introducidos por teclado chamando a unha
función multiplica4Double. */

import java.util.Scanner;

public class F04 {
    
    public static void main(String[] args) {
        

        Scanner teclado = new Scanner(System.in);
        double numero1;
        double numero2;
        double numero3;
        double numero4;
        double resultado;
        
        System.out.println("Dime un número");
        numero1 = teclado.nextDouble();

        System.out.println("Dime outro número");
        numero2 = teclado.nextDouble();

        System.out.println("Dime outro número número");
        numero3 = teclado.nextDouble();

        System.out.println("Dime o último número número");
        numero4 = teclado.nextDouble();


        resultado = multiplica4Double(numero1, numero2, numero3, numero4);

        System.out.println("A multiplicaicón de " + numero1 + " + " + numero2 + " + " + numero3 + " + " + numero4 + " = " + resultado);

        teclado.close();
    }


    public static double multiplica4Double(double a, double b, double c, double d){

        return a*b*c*d;
    }


    }
