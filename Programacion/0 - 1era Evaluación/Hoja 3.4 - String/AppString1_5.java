//5.Programa que pida dúas palabras, e diga cal é a que iría primeiro no dicionario.

import java.util.Scanner;

public class AppString1_5 {

    public static void main(String[] args) {
    
    Scanner teclado = new Scanner(System.in);
    String palabra1;
    String palabra2;
    String primera = "";

        
    System.out.println("Dime a primeria palabra");
    palabra1 = teclado.nextLine();

    System.out.println("Dime a segunda palabra");
    palabra2 = teclado.nextLine();

    if (palabra1.compareTo(palabra2) < 0) {
        primera = palabra1;
        System.out.println(primera);
        
    }
    else{
        primera = palabra2;
        System.out.println(primera);
    }

    teclado.close();

    }
}