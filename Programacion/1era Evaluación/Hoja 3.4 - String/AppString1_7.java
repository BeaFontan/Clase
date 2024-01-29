//Programa que conte o numero de palabras que aparecen nunha cadea de caracteres. As palabras
//poderán estar separadas por un espacio ou por varios.

import java.util.Scanner;

public class AppString1_7 {

    public static void main(String[] args) {
        
    Scanner teclado = new Scanner(System.in);
    String respuesta;
    int contador = 1; //lo pongo a uno, para que me cuenta ya la primera palabra
        
    System.out.println("Dime a frase");
    respuesta = teclado.nextLine();

    //primero quito los espacios del principio y final y los que sean más de un espacio entre medias.
    respuesta.trim();//quito espacio de principio y final
     
    while (respuesta.contains("  ")) { //mientras haya doble espacio, va cogiendo todos los dobles espacios que hay
    
        respuesta = respuesta.replace("  ", " "); //reemplaza doble espacio por un espacio

    }


    //ahora cuento las palabras
    while (respuesta.contains(" ")) {//mientras que haya un espacio (ojo, lo lee como un todo, en cuanto encuentre el primer espacio, continua)
        contador++; //cuenta una
        respuesta = respuesta.replaceFirst(" ", ""); //y reemplaza ese espacio por nada, así vuelve a contar desde el inicio y cuenta otra vez pero las palabras pegadas
    }



    System.out.println("O número de palabras é " + contador);

    teclado.close();




    }
}