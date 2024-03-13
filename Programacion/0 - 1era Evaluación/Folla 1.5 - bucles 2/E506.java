//Imprime os múltiplos de 7 que hai entre n e m, dous números introducidos por teclado.

import java.util.Scanner;

public class E506 {

    public static void main(String[] args) {
        
        Scanner teclado = new Scanner(System.in);
        int numero1;
        int numero2;

        System.out.println("Dime un número");
        numero1 = teclado.nextInt();

        System.out.println("Dime otro número mayor");
        numero2 = teclado.nextInt();

        for (int i = numero1; i < numero2; i++) {

            if (i % 7 == 0) {

                System.out.println("Os múltiplos de 7 son: " + i);
  
            }
        }

        teclado.close();
    }
}