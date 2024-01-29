// 2. Fai un programa que mostre o seguinte menú e faga o que se explica a continuación ao pulsar esa letra:

//a-Introducir o número flotante.
//b -Mostre a táboa de multiplicar ata 15 dese número. Emprega while.
//c - Mostre a táboa de multiplicar ata 15 dese número, con 1 decimal.
//d- Mostre a táboa de multiplicar ata 15 dese número, sen multiplicar polos múltiplos de 3. (non multiplicará por 3, 6, 9, 12 e 15). Emprega continue.
//e) Mostre a táboa de multiplicar dese número por 0.5 ata 7.5, de 0.5 en 0.5
//f) Sair

import java.util.Scanner;

public class E802 {

    public static void main(String[] args) {
        
        Scanner teclado = new Scanner(System.in);
        String respuesta;
        float numeroIntroducido = 0;
        float multiplicacion = 0;


        System.out.println("Pulsa a para introducir un número float");
        System.out.println("Pulsa b para para mostrar la tabla de multiplicar hasta 15");
        System.out.println("Pulsa c para mostrar la tabla de multiplicar con un decimal");
        System.out.println("Pulsa d para mostrar la tabla de multiplicar sin los múltiplos de 3");
        System.out.println("Pulsa e para multiplicar ese número por 0,5 hasta 7.5");
        System.out.println("Pulsa f para salir");
        respuesta = teclado.nextLine();

        while (!respuesta.equals("f") ){

            switch (respuesta) {
                case "a": // opción para pedir el número float
                    System.out.println("Dime un número ");
                    numeroIntroducido = teclado.nextFloat();
                    teclado.nextLine(); // capturo el intro en el primero número que introduzco después de usar cadenas

                    break;
            
                case "b": // opción para multiplicar el número hasta 15

                    for (int i = 1; i <= 15; i++) {
                        multiplicacion = numeroIntroducido * i;
                        System.out.println(multiplicacion);
                    }

                    break;

                case "c": // caso para mostrar la miltiplicación con un decimal

                        for (int i = 1; i <= 15; i++) {
                        multiplicacion = numeroIntroducido * i;
                        System.out.printf("hhh  %20.1f\n",multiplicacion); // le damos formato a la muestra por pantalla con printf (print formato), y le estamos diciendo
                        //que muestre un total de 7 de ancho con un decimal float. A hhh está de exemplo para comprobar que pon antes.
                    }


                    break;

                case "d": // mostrar la tabla de multiplicar sin miltiplos de 3

                    for (int i = 1; i < 15; i++) {
                        
                        multiplicacion = numeroIntroducido*i;

                        if (multiplicacion % 3 != 0) {

                            System.out.println(multiplicacion);
                            
                        }
                    }

                    break;

                case "e": // multiplicar el número por 0,5 hasta 7.5

                    for (float i = 0.5f; i <= 7.5f; i++) { // le tengo que poner una f a los números porque sino no los reconoce como float, reconoce como base los doubles.
                        multiplicacion = (numeroIntroducido * i);
                        
                        System.out.println(multiplicacion);

                    }

                    break;
            }

            System.out.println("Pulsa a para introducir un número float");
            System.out.println("Pulsa b para para mostrar la tabla de multiplicar hasta 15");
            System.out.println("Pulsa c para mostrar la tabala de multiplicar con un decimal");
            System.out.println("Pulsa d para mostrar la tabla de multiplicar sin los múltiplos de 3");
            System.out.println("Pulsa e para multiplicar ese número por 0,5 hasta 7.5");
            System.out.println("Pulsa f para salir");
            respuesta = teclado.nextLine();   
        }

        teclado.close();

    }
}