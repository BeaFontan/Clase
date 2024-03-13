//8.Programa que intercambie a primeira metade dunha cadea de caracteres coa segunda metade.

import java.util.Scanner;

public class AppString1_8 {

    public static void main(String[] args) {
        
    Scanner teclado = new Scanner(System.in);
    String respuesta;
    String primeraParte;
    String segundaParte;
    int division;
    String fraseIntercambiada;


    System.out.println("Dime a frase");
    respuesta = teclado.nextLine();

    division = respuesta.length() / 2;


    primeraParte = respuesta.substring(0, division);
    segundaParte = respuesta.substring(division+1, respuesta.length());

    fraseIntercambiada = segundaParte.concat(primeraParte);

    System.out.println(fraseIntercambiada);

    teclado.close();


    }
}