//Declara un array a[5] de 5 enteiros. Declara outro array copia[5] de outros 5 elementos. Pide os elementos de a[5] por teclado. 
//Fai que todos os elementos do array copia sexan 1. 
//Copia o 1º elemento do array a[] no 1º elemento do array copia[].
// Copia o 3º elemento do array a[] no 5º elemento do array copia[]. Mostra o array copia[].

import java.util.Scanner;

public class E705 {

    public static void main(String[] args) {
        
        Scanner teclado = new Scanner(System.in);
        int[] a = new int[5];
        int[] copia = new int[5];


        //dar valor al array de a[]
        for (int i = 0; i < copia.length; i++) {
            
            System.out.println("Dime un número");

            a[i] = teclado.nextInt(); // le digo que la posición de a la coja de cada respuesta del teclado.

        }

        //dar valor de 1 a cada elemento de copia []

        for (int i = 0; i < copia.length; i++) {
            copia[i] = 1;
        }

        //ahora copia el primer elemento del array a[] en el primero elemento del array copia[]

        copia[0] = a[0];  // igualo la posición 0 de copia al valor que tiene la posición 0 del array a[]
        copia[4] = a[2]; // igualo la posición del 5º elemento, es decir la 4ª posición, al valor de la posición 2 del array a, es decir, el tercer valor.


        //muestro el array copia[]
        

        for (int valorCopia : copia) {
            
            System.out.println("Os elementos do array copia son " + valorCopia );
        }


        teclado.close();

    }


}