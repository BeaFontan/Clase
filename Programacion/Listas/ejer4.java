//4.- Crea un array de 10 enteiros. Asigna os 10 primeiros pares como valores. 
//Crea agora un arraList que sexa similar ao array creado.

import java.util.ArrayList;

public class ejer4 {

    public static void main(String[] args) {
        
        int [] arrayEnteiros = new int[10];
      

        //primero hago el for
        for (int i = 0; i < arrayEnteiros.length; i++) {
            arrayEnteiros [i] = i*2;
        }

        for (int i : arrayEnteiros) {
            System.out.println(i);
        }


        //ahora el list

        ArrayList<Integer> listaEnteiros = new ArrayList<Integer>();

        //le digo que coja el largo del array
        for (int i = 0; i < arrayEnteiros.length; i++) {
            //y añade los elementos del array a la lista
            listaEnteiros.add(arrayEnteiros[i]);
        }

        for (Integer datosLista : listaEnteiros) {
            System.out.println(datosLista);
        }



    }

}