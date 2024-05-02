//1.- Fai unha lista para gardar datos double, que corresponden a varias medidas dunha
// temperatura ambiente. O programa irá pedindo esas medidas ata que se introduce 100. 
//Cando se introduce o 100, mostrarase a media das temperaturas medidas.

import java.util.ArrayList;
import java.util.Scanner;

public class ejer1 {

    public static void main(String[] args) {
        
        Scanner teclado = new Scanner(System.in);
        ArrayList<Double> temperatura = new ArrayList<Double>();
        Double respuesta = 0.00;

        System.out.println("Dime a temperatura para gardar");
        respuesta = teclado.nextDouble();

        while (respuesta != 100) {
            
            temperatura.add(respuesta);
            
            System.out.println("Dime a temperatura para gardar");
            respuesta = teclado.nextDouble();
        }

        for (int i = 0; i < temperatura.size(); i++) {
            double suma = 0;
            double media;

            suma = suma + temperatura.get(i);
            media = suma / temperatura.size();

            if (respuesta == 100) {
                System.out.println(media);
                break;
            }
    

        }



    }
}