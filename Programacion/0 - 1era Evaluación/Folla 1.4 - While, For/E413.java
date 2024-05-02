//Calcula o número de cifras que ten un enteiro introducido por teclado, empregando un bucle que vaia dividindo por 10.

import java.util.Scanner;

public class E413 {

public static void main(String[] args) {
    
        Scanner escaner = new Scanner(System.in);

        System.out.println("Dime un número");
        int numero = escaner.nextInt();//utilizo esta variable por primera vez para almacenar el número y luego la uso para almacenar el resultado.
        int acumulador = 0;


        //Bucle para calcular las cifras
        while (numero > 0) {
        
            numero = numero / 10;//almaceno el resultado
            acumulador++;
   
        }

        System.out.println("O número de cifras foi " + acumulador);

        escaner.close();





}    
}