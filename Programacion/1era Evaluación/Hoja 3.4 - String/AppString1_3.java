//3.Fai un programa que pida unha frase, e mostre a mesma sen a primeira ‘a’ da frase.

import java.util.Scanner;

public class AppString1_3 {

    public static void main(String[] args) {
        
        Scanner teclado = new Scanner(System.in);
        String respuesta;
        int posicion;
        String parte1frase;
        String parte2frase;

        System.out.println("Dime una frase");
        respuesta = teclado.nextLine();

        //primero busco la posición de la primera a
        posicion = respuesta.indexOf('a');

        //luego almacena desde la posición 0 hasta la posición 
        parte1frase = respuesta.substring(0, posicion);
        //luego almaceno desde la posición +1 para que que coja la poisición siguiente, hasta el final
        parte2frase = respuesta.substring(posicion +1, respuesta.length());

        //luego concateno las dos partes de la frase sin la a
        parte1frase = parte1frase.concat(parte2frase);

        System.out.println(parte1frase);

    


        teclado.close();




    }
}