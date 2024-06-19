//Programa que pida 10 frases con espazos e as repita. Podes empregar o método contains da clase
//String, que devolve verdadeiro se a palabra contén un carácter dado.

import java.util.Scanner;

public class E504 {

    public static void main(String[] args) {
        
        Scanner escaner = new Scanner(System.in);
        String frase = "";

        for (int i = 0; i < 10; i++) {

            System.out.println("Dime unha frase");
             frase = escaner.nextLine();

            System.out.println("A frase introducida foi " + frase);
            
             if (frase.contains("a"))
             {
                System.out.println("A frase introducida conten a letra a ");
            }

        }


        
        escaner.close();



    }

}
