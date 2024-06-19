//1. Empregando a clase Integer fai un programa que pida unha cadea de texto en binario,
 //e mostres o seu correspondente número enteiro.

import java.util.Scanner;

public class Ejer1 {

    public static void main(String[] args) {
        
        Scanner teclado = new Scanner(System.in);
        String respuesta;
        int respuestaInt;

        System.out.println("Dime o número binario");
        respuesta = teclado.nextLine();

        respuestaInt = Integer.parseInt(respuesta, 2);

        System.out.println(respuestaInt);



        teclado.close();
    }
}