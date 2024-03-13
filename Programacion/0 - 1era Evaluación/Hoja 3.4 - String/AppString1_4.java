//4.Fai un programa que pida frases por teclado e as copie noutro String sen letras ‘a’. Mostrará cada frase
//sen letras ‘a’ e pedirá outra frase. Rematará cando a frase non teña letras ‘a’.

import java.util.Scanner;

public class AppString1_4 {

    public static void main(String[] args) {
        
        Scanner pantalla = new Scanner(System.in);
        String entrada;
        String cadena;

        System.out.println("Dime unha frase");
        entrada = pantalla.nextLine();

        cadena = entrada.replaceAll("a", ""); // utilizo el replace all porque me deja poner nada porque devuelve strings, y replace devuelve caracteres.

        System.out.println(cadena);
    
        pantalla.close();

    }
}