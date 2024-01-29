//2.Fai un programa que pida un String, e diga a posición da primeira ‘a’ da frase

import java.util.Scanner;

public class AppString1_2 {

    public static void main(String[] args) {
        
        Scanner teclado = new Scanner(System.in);
        String respuesta;
        int posicion;

        System.out.println("Dime una frase");
        respuesta = teclado.nextLine();

        posicion = respuesta.indexOf('a');

        System.out.println("A a está na posición "+ posicion);


        




        teclado.close();









    }




}