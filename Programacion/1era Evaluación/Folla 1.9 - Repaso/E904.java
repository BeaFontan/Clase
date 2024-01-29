/* Exercicio que pida a nota obtida nun traballo de 0 a 10, e mostre en función dos seus valores
“Suspenso”, “Aprobado”, “Notable” ou “Sobresaliente”.*/

import java.util.Scanner;

public class E904 {

    public static void main(String[] args) {
        
    Scanner introducir = new Scanner(System.in);
    double nota;

    System.out.println("Dime a nota que sacaches de 0 a 10");
    nota = introducir.nextDouble();

    if (nota < 5) {

        System.out.println("Suspenso");
        
    }
    if (nota >= 5 && nota <7 ) {

        System.out.println("Aprobado");
        
    }

    if (nota >=7 && nota <9 ) {

        System.out.println("Notable");
        
    }

    if (nota >=9 && nota <=10 ) {

        System.out.println("Sobresaliente");
        
    }

    introducir.close();

    }
}