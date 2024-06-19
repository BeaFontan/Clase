//Programa que pida un número e mostre todos os seus divisores.

import java.util.Scanner;

public class E507 {

    public static void main(String[] args) {
        
        Scanner teclado = new Scanner(System.in);
        int numero;

        System.out.println("Dime un número");
        numero = teclado.nextInt();


                // de numero introducido a mayor que 0 contanto hacia atrás
        for (int i = numero; i > 0; i--) 
        {
            if (numero % i == 0) {
                
            System.out.println(i);
            
            }

        }

        teclado.close();

    }
    
}