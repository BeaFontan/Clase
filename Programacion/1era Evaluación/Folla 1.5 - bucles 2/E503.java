//Programa que pida 10 palabras e as repita.

import java.util.Scanner;

public class E503 {

    public static void main(String[] args) {
        Scanner escaner = new Scanner(System.in);
        String palabra;

        for (int i = 0; i < 10; i++) {

            System.out.println("Dime unha palabra");
             palabra = escaner.next();

            System.out.println("A palabra introducida foi " + palabra);

        }
        
        escaner.close();

    }
    
}