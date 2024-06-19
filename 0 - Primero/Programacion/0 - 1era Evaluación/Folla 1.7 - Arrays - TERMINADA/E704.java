//Declara un array de 8 enteiros. Pídeos por teclado. Móstraos. Cambia agora o último polo primeiro,
//e o segundo polo penúltimo. Mostra todos os valores.

import java.util.Scanner;

public class E704 {

    public static void main(String[] args) {
        
        Scanner teclado = new Scanner(System.in);
        int[] enteiros = new int[8];

        //System.out.println("Dime un número");

        for (int i = 0; i < enteiros.length; i++) {
            
            System.out.println("Dime un número");
            enteiros[i] = teclado.nextInt();

        }

        for (int valores : enteiros) { // del array de int quiero los valores de el array de enteiros

            System.out.println("Os números son " + valores); // muestrame los valores de enteiros
            
        }

        enteiros[7] = enteiros[0]; // cambio el valor de la posición 7 que es el último, por el de la posición 0 que es el primero.
        enteiros[6] = enteiros[1]; // cambio el valor del penúltimo que es la posición 6 por el valor del segundo, que es la posición 1;

        //Y vuelvo a mostrar los valores con el foreach
        for (int valorCambiado : enteiros) { // quiero el valor de los int del array enteiros

            System.out.println("Os valores cambiados " + valorCambiado); //mestrame el valor
            
        }


        teclado.close();


    }
    
}