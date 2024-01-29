//Resto entero de 2 números * 2 * 3

import java.util.Scanner;

public class E106RestoEntre2y3 {

    public static void main(String[] args) {
        
    Scanner Scan = new Scanner(System.in);

    System.out.println("Dime un número");
    int numero1 = Scan.nextInt();

    System.out.println("Dime otro número");
    int numero2 = Scan.nextInt();


    //Resultado

    int resto = numero1 % numero2;

    int entreDos = resto / 2;

    int entreTres = resto / 3;

    System.out.println("El resultado del módulo entre 2 es " + entreDos + " y entre 3 es " + entreTres);
    
    Scan.close();

    }
    }