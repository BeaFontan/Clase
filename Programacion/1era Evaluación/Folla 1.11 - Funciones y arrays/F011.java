/* Fai un programa na que se defina un array de 4 floats, con dúas funcións: unha para introducir os
valores do array desde teclado e outra para mostralos ao final.*/

import java.util.Scanner;

public class F011 {

    public static void main(String[] args) {
    
        Scanner pantalla = new Scanner(System.in);
        float [] ArrayPantalla = new float[4];

        darValorArray(ArrayPantalla, pantalla);

        mostraArray(ArrayPantalla);

        pantalla.close();
    
    }



    public static void darValorArray(float [] valoresArray, Scanner pantalla){ // le paso un array que tomará el valor del que declaramos en main y el scaner, para tomar los valores.

       System.out.println("Dime 4 números para o array");
        for (int i = 0; i < valoresArray.length; i++) {
            valoresArray[i] = pantalla.nextFloat();            
        }
    }
    

    //función para mostrar los valores de array
    public static void mostraArray (float [] arrayDentro)  { 
        for (int i = 0; i < arrayDentro.length; i++) {
            System.out.println(arrayDentro[i]);
        }
    }


}