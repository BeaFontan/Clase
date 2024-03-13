/* 2. Programa que vaia pedindo números repetidamente e mostra o máximo dos seus divisores
distintos del mesmo, e indique tamén se o número inicial é primo. Remata cando o número
introducido é o 0, ou cando o máximo dos divisores foi o 5 do anterior número.*/

import java.util.Scanner;

public class E902 {

    public static void main(String[] args) {
    
    Scanner teclado = new Scanner(System.in);
    int respuesta;

    System.out.println("Dime un número");
    respuesta = teclado.nextInt();

        while (respuesta != 0) {

            // sus divisores



            //máximo de divisores
            int divisores;

            for (int i = 0; i < respuesta; i++) {
                divisores = i /2;
            }

            //si el número inicial es primo
            




    
            System.out.println("Dime otro número");
            respuesta = teclado.nextInt();
        }


        teclado.close();
    }
}