//2.- Fai unha lista para almacenar saúdos diferentes introducidos por teclado. O programa pedirá saúdos 
//ata que se introduza “fin”. Entón o programa despedirase cun dos saúdos introducidos, elixido aleatoriamente.

import java.util.ArrayList;
import java.util.Scanner;

public class ejer2 {

    public static void main(String[] args) {
        
        Scanner teclado = new Scanner(System.in);

        ArrayList <String> listaSaludos = new ArrayList<String>();

        String respuesta;

        System.out.println("Dime o saúdos que queres gardar");
        respuesta = teclado.nextLine();

        while (!respuesta.equals("fin")) {
            
            listaSaludos.add(respuesta);

            System.out.println("Dime o saúdos que queres gardar");
            respuesta = teclado.nextLine();

        }

        int indiceAleatorio = (int)  (Math.random()*listaSaludos.size());
        int indiceAleatorio2 = (int)  (Math.random()*listaSaludos.size());


        System.out.println(listaSaludos.get(indiceAleatorio) + " " + listaSaludos.get(indiceAleatorio2));

    }


}