//1. Fai un programa empregando switch no que se mostre o seguinte menú e faga o que se explica a
//continuación ao pulsar esa letra:
//a) Introducir un double
//b) Imprimir o double
//c) Sair

import java.util.Scanner;

public class E801 {

    public static void main(String[] args) {
        Scanner teclado = new Scanner(System.in);
        String respuesta;
        double numeroIntroducido = 0;


        System.out.println("Pulsa a para introducir un número decimal");
        System.out.println("Pulsa b para mostrar el número introducido");
        System.out.println("Pulsa c para salir");
        respuesta = teclado.nextLine();

        while (!respuesta.equals("c")) {
            
       
            switch (respuesta) {
                case "a":
                    System.out.println("Dime el número que quieres almacenar");
                    numeroIntroducido = teclado.nextDouble();
                    teclado.nextLine(); // tengo que capturar el intro con esta línea justo después de pedir el número cuando venimos de trabajar con strings.
                    
                    
                break;
            
                case "b":
                    System.out.println(numeroIntroducido);

                break;

            }

            System.out.println("Pulsa a para introducir un número decimal");
            System.out.println("Pulsa b para mostrar el número introducido");
            System.out.println("Pulsa c para salir");
            respuesta = teclado.nextLine();
        }

        teclado.close();
    }
}