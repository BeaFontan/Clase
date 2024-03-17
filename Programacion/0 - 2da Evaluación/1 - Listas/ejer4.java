//4.- Crea un array de 10 enteiros. Asigna os 10 primeiros pares como valores. 
//Crea agora un arraList que sexa similar ao array creado.

import java.util.ArrayList;

public class ejer4 {

    public static void main(String[] args) {
        
        int [] arrayEnteiros = new int[10];
      

        //primero hago el for
        for (int i = 0; i < arrayEnteiros.length; i++) {
            arrayEnteiros [i] = i*2;

            if (i == 10) {
                break;
            }
        }

        for (int i : arrayEnteiros) {
            System.out.println(i);
        }

        System.out.println("_____________________________");


        //ahora el list

        ArrayList<Integer> listaEnteiros = new ArrayList<Integer>();

        for (int i = 0; i < 10; i++) {
            int valor =i*2;
            listaEnteiros.add(valor);
            
        }


        for (Integer dato : listaEnteiros) {
            System.out.println(dato);
        }



    }

}