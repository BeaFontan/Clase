//Programa que vaia pedindo repetidamente 3 números e os mostre ordeados. Despois de mostralos preguntará se quere continuar, repetindo se o usuario contesta
// que ‘si’ á pregunta de se quere facelo de novo.

import java.util.Scanner;

public class E414 {

    public static void main(String[] args) {
        
        Scanner escaner = new Scanner(System.in);
        String continuar = "";
        int numero1 = 0;
        int numero2 = 0;
        int numero3 = 0;
        int menor;
        int maior;
        int medio;


        for (int i = 0; i < 3; i++) 
        {
            System.out.println("Dime un número ");
            numero1 = escaner.nextInt();

            System.out.println("Dime un número ");
            numero2 = escaner.nextInt();

            System.out.println("Dime un número ");
            numero3 = escaner.nextInt();

        }

        if (numero1 < numero2) {
        menor = numero1;
        maior = numero2;
        }
        else {
        menor = numero2;
        maior = numero1;
        }

        //PARA AVERIGUAR AHORA EL MEDIO

        if (numero3 < menor) {
        medio = menor;
        menor = numero3;
        }
        else if (numero3 > menor && numero3 < maior) { 
        
            
        }

        System.out.println("Queres continuar?");
        escaner.nextLine();
        continuar = escaner.nextLine();

        while (continuar.equals("si")) 
        {

            System.out.println("Queres continuar?");
            continuar = escaner.next();
   
        }

        escaner.close();




    }
}