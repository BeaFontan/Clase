//Multiplica 3 números

import java.util.Scanner;

public class E104Multiplica3Numeros {

    public static void main(String[] args) {
        
    Scanner Scan = new Scanner(System.in);

    System.out.println("Dime un número");
    int numero1 = Scan.nextInt();

    System.out.println("Dime otro número");
    int numero2 = Scan.nextInt();

    System.out.println("Dime el terner número");
    int numero3= Scan.nextInt();

    //Resultado

    int resultado = numero1 * numero2 * numero3;
    System.out.println("El resultado de multiplicar " + numero1 + ", " + numero2 + " y " + numero3 + " es " + resultado );
    
    Scan.close();

    }
    }