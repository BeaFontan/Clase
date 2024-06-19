//14. Fai un programa no que definas unha frase. Mostra un menú coas seguintes posibilidades (cada opción fará exactamente o que di, para mostrar a frase premeremos 'f'):
//a) Introducir frase.
//b) Pasar as minúsculas a maiúsculas.
//c)Borrar espazos, poden ser varios espazos seguidos
//d) Inverter a frase.
//e)Escriba a primeira letra de cada palabra en maiúscula (se é minúscula).
//f)Mostrar a frase
//g) Saia do programa.

import java.util.Scanner;

public class AppString1_14 {

    public static void main(String[] args) {
        
        Scanner teclado = new Scanner(System.in);
        String respuesta = "";
        

        System.out.println("Pulsa a para introducir la frase");
        System.out.println("Pulsa b para pasar las minúsculas a mayúsculas");
        System.out.println("Pulsa c para Borrar espacios");
        System.out.println("Pulsa d para invertir la frase");
        System.out.println("Pulsa e para escribir la primera letra de cada palabra en mayúscula si es minúscula");
        System.out.println("Pulsa g para salir del programa");
        respuesta = teclado.nextLine();        

        while (true) {

            switch (respuesta) {
                case "a":

                    System.out.println("Pulsa a para introducir la frase");
                    respuesta = teclado.nextLine();
                    
                    break;
                
                case "b":

                    respuesta.toUpperCase();

                    break;

                case "c":


                break;
            

            }
            
        }
    }
}