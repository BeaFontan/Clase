//Programa que vaia pedindo números e mostre se son pares ou impares. Rematará cando se introduza o 0.

import java.util.Scanner;

public class E501 {
public static void main(String[] args) {
    

        Scanner escaner = new Scanner(System.in);
        int numero;

        System.out.println("Dime un número");
        numero = escaner.nextInt();


        while (numero != 0) 
        {

        if (numero % 2 == 0) {
            
            System.out.println("O número é par");

        }

        else{
            System.out.println("O número é impar");
        }
        
        System.out.println("Dime un número");
        numero = escaner.nextInt();
            
        }

        escaner.close();




}
    
}