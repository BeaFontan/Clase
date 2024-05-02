//Programa que pida números de 4 cifras e diga se son capicúas ou non. Rematará cando se introduzan 3 números que non son capicúas.

import java.util.Scanner;

public class E505 {

    public static void main(String[] args) {
        
        Scanner entrada = new Scanner(System.in);
        int numero;
        int miles;
        int resto;
        int centenas;
        int decenas;
        int unidades;
        int contador = 1;

        System.out.println("Introduce un número de 4 cifras");
        numero = entrada.nextInt();

        while (contador != 3) 
        {

            miles = numero / 1000;
            resto = numero % 1000;

            centenas = resto / 100;
            resto = resto % 100;

            decenas = resto / 10;

            unidades = resto % 10;

            if (miles == unidades && centenas == decenas) {
                
                System.out.println("El número es capicúa");
                
            }

            else{

                 System.out.println("El número no es capicúa");
                 contador++;
                 
            }

            System.out.println("Introduce un número de 4 cifras");
            numero = entrada.nextInt();   
                
        }
        entrada.close();    
    }
    
}