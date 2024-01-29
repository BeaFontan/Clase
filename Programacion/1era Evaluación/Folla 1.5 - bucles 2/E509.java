//Programa que pida repetidamente un ano, e mostre se é bisesto ou non. Rematará cando introduza o 3000. Tenta tilizar un único if, con varias condicións.

import java.util.Scanner;

public class E509 {

    public static void main(String[] args) {
        
        Scanner teclado = new Scanner(System.in);
        int anho;

        System.out.println("Dime un año");
        anho = teclado.nextInt();

        while (anho != 3000) {

        if (anho % 4 == 0 && anho % 100 != 0 || anho % 400 == 0) {
            
             System.out.println("Es un año bisiesto");
        }

        else{
             System.out.println("No es un año bisiesto");
        }

            System.out.println("Dime un año");
            anho = teclado.nextInt();
        }

        teclado.close();

    }

}