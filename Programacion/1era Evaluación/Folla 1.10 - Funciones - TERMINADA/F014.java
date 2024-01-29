/*. Fai un programa que mostre o seguinte menú. Vai simular unha calculadora.
a) Introducir 2 valores float. No main( ).
b) Elixe a operación a realizar, premendo a tecla * , / , + ou -, e chama a distintas funcións (unha
para suma, outra para a resta, a división e multiplicación), que fan o cálculo. O resultado
imprímese desde o main( ). */

import java.util.Scanner;

public class F014 {

    public static void main(String[] args) {
        Scanner teclado = new Scanner(System.in);
        float num1;
        float num2;
        String respuesta;


        System.out.println("1º número");
        num1 = teclado.nextFloat();
        
        System.out.println("2º número");
        num2 = teclado.nextFloat();

        System.out.println("Pulsa * para multiplicar, / para dividir, + para suma o - para restar");
        respuesta = teclado.next();

        switch (respuesta) {
            case "*":
                System.out.println("O resultado é " + multiplicar(num1, num2));
                break;
        
            case "/":
                System.out.println("O resultado é " + dividir(num1, num2));
            break;

            case "+":
                System.out.println("O resultado é " + sumar(num1, num2));
            break;

            case "-":
                System.out.println("O resultado é " + resta(num1, num2));
            break;
        }


        teclado.close();

    }

    public static double sumar (double a, double b){
        double suma;
        suma = a + b;
        return suma;
    }

    public static double resta (double a, double b){
        double resta;
        resta = a - b;
        return resta;
    }

    public static double multiplicar (double a, double b){
        double producto;
        producto = a * b;
        return producto;
    }

    public static double dividir (double a, double b){
        double division;
        division = a / b;
        return division;
    }



}