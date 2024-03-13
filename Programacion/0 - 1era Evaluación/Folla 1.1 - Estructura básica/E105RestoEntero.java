//Resto entero de 2 números

import java.util.Scanner;

public class E105RestoEntero {

    public static void main(String[] args) {
        
    Scanner Scan = new Scanner(System.in);

    System.out.println("Dime un número");
    int numero1 = Scan.nextInt();

    System.out.println("Dime otro número");
    int numero2 = Scan.nextInt();


    //Resultado

    int resto = numero1 % numero2;
    System.out.println("El resultado del módulo es " + resto );
    
    Scan.close();

    }
    }