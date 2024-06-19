//Declara un array de 5 doubles e pídeos por teclado. Escribe na segunda posición o valor de último elemento e mostra de novo todos os valores.

import java.util.Scanner;

public class E702 {

    public static void main(String[] args) {
        
        Scanner teclado = new Scanner(System.in);
        double[] arrayDoubles = new double[5];

        for (int i = 0; i < arrayDoubles.length; i++) {
            
            System.out.println("Dime os 5 números");
            arrayDoubles[i] = teclado.nextDouble();

           
        
        }

         arrayDoubles[1] = arrayDoubles[4];

         

        for (double d : arrayDoubles) {

            System.out.println("Os números foron " + d);
        }


        teclado.close();

    }
}