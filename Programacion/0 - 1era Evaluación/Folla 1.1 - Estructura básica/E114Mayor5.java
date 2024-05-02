//Mayor que 5

import java.util.Scanner;

public class E114Mayor5{

    public static void main(String[] args) {
        
    Scanner Scan = new Scanner(System.in);

    System.out.println("Dime un número maior a 5");
    float numero = Scan.nextFloat();

        if (numero > 5) {
            System.out.println("Es correcto");
        }
        else{ System.out.println("Es incorrecto");}

    
    Scan.close();

    }
    }