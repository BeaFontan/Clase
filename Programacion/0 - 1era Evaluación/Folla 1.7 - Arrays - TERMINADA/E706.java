// Declara un array de 3 enteiros. Pídeos por teclado. Escribe na primeira posición o valor gardado na
//segunda posición, e na segunda posición o gardado na 3ª. Mostra o array. Volve pedir os valores
//por teclado. Fai o que fixeches antes cun bucle. Mostra de novo o array.

import java.util.Scanner;

public class E706 {

    public static void main(String[] args) {
        
        Scanner teclado = new Scanner(System.in);
        int[] numeros = new int[3];

        //Doi valores al array a través de teclado
        for (int i = 0; i < numeros.length; i++) {
            
            System.out.println("Dime un número");

            numeros[i] = teclado.nextInt();

        }

        numeros[0] = numeros[1]; // escribo en la primera posición el valor guardado en la segunda posición
        
        numeros[1] = numeros[2]; // escribo en la segunda posición el valor guardado en la tercera posición
        
        //muestro los valores del array

        for (int valoresNumero : numeros) {
            
            System.out.println(" El valor es " + valoresNumero);
        }

        
        System.out.println("_______________________________________");

        //Volvo a pedir os valores

            for (int i = 0; i < numeros.length; i++) {
            
            System.out.println("Dime un número");

            numeros[i] = teclado.nextInt();

        }



        // Ahora asigno los valores anteriores con un bucle

        for (int i = 1; i < numeros.length; i++) {
             
            numeros[i] = numeros[i-1];

        }

        //Vuelvo a mostrar el array

            for (int valoresNumero : numeros) {
            
            System.out.println(" El valor es " + valoresNumero);
        }



        teclado.close();

    }


}