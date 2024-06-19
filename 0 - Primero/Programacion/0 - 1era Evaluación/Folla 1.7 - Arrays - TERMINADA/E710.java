//Declara un array de 12 doubles. Fai un menú para facer o seguinte:
//a/Introducir os 12 números.
//b/Mostrar os 12 números.
//c/Pide unha posición e escribe nesa posición o valor 0
//d/Pide unha posición e escribe nesa posición o valor introducido por teclado.
//e/Intercambia os 2 primeiros valores do array.
//f/Intercambia o 3º e o 4º valor do array.
//g/Intercambia os valores de array 2 a 2 cun bucle: os 2 primeiros, o 3º co 4º, o 5º co 6º, etc.
//h/Sair.

import java.util.Scanner;

public class E710 {

    public static void main(String[] args) {
        
        double[] numerosDoubles = new double[12];
        Scanner teclado = new Scanner(System.in);
        String respuesta;

        System.out.println("Pulsa A para introducir 12 números");
        System.out.println("Pulsa B para Mostrar os 12 números");
        System.out.println("Pulsa C Para introducir el valor 0 en una posición");
        System.out.println("Pulsa D Para introducir en una posición el valor que quieras");
        System.out.println("Pulsa E para intercambiar los 2 primeros números del array");
        System.out.println("Pulsa F para intercambiar el 3º y 4º valor");
        System.out.println("Pulsa G para intercambiar los valores con la posición siguiente");
        System.err.println("Pulsa H para salir");
        
        respuesta = teclado.nextLine();

        while (!respuesta.equals("h")) {
       
        switch (respuesta) {
            case "a": //opción para pedir los números
                    for (int i = 0; i < numerosDoubles.length; i++) {
                        System.out.println("Dime un número");
                        
                        numerosDoubles[i] = teclado.nextDouble();
                    }

                    teclado.nextLine(); // poño esta línea para que non me colla o intro, esto é en strings.
                
                break;

            case "b": //opción mostrar los números

                    for (double valor : numerosDoubles) {
                
                        System.out.println(valor);
                    }
                break;
            
            case "c": //opción de poner a 0 una posición que me diga

                int posicionB = 0;//declaro aquí el int para almacenar la posición que quiere

                System.out.println("En que posición de 0 a 11 quieres igualar a 0");
                posicionB = teclado.nextInt();

                numerosDoubles[posicionB] = 0; // yo no le quito uno por que doy por echo que conoce los indices, si el tipo no los conociera, se restaría 1 por el índice 0
                
                //muestro el resultado
                for (double valores : numerosDoubles) {
                    System.out.println(valores);  
                }

                break;

            case "d": // opción de pedir posición y pedir valor, para introducirlo en la posición      
                int posicionD = 0;
                int valorD = 0;

                System.out.println("Dime en que posición de 12 quieres cambiar el valor");
                posicionD = teclado.nextInt();

                System.out.println("Dime el valor que quieres introducir");
                valorD = teclado.nextInt();

                numerosDoubles[posicionD-1] = valorD; // aquí si que cuento con que no sabe los índices de 0

                //muestro el resultado
                for (double valores : numerosDoubles) {
                    System.out.println(valores);  
                }

                break;
            
            case "e": // opción para intecambiar los dos primeros valores

                double almacenarDato = 0; // designo una variable para guardar el valor que había para intercambiar.

                almacenarDato = numerosDoubles[0];
                numerosDoubles[0] = numerosDoubles[1];
                numerosDoubles[1] = almacenarDato;


                //muestro el resultado
                for (double valores : numerosDoubles) {
                    System.out.println(valores);  
                }
                break;
        

            case "f": // opción para intercambiar el 3º y 4º valor

                double almacenarDatoF = 0; // designo una variable para guardar el valor que había para intercambiar.

                almacenarDato = numerosDoubles[2]; 
                numerosDoubles[2] = numerosDoubles[3];
                numerosDoubles[3] = almacenarDato;


                //muestro el resultado
                for (double valores : numerosDoubles) {
                    System.out.println(valores);  
                }

                break;

            case "g": //opción para intercambiar el valor con la posición siguiente

                for (int i = 0; i < numerosDoubles.length; i++) {
                    numerosDoubles[i] = i+2;
                }

                for (double valores : numerosDoubles) {
                    
                    System.out.println(valores);
                }

                break;
                
            }

        System.out.println("Pulsa A para introducir 12 números");
        System.out.println("Pulsa B para Mostrar os 12 números");
        System.out.println("Pulsa C Para introducir el valor 0 en una posición");
        System.out.println("Pulsa D Para introducir en una posición el valor que quieras");
        System.out.println("Pulsa E para intercambiar los 2 primeros números del array");
        System.out.println("Pulsa F para intercambiar el 3º y 4º valor");
        System.out.println("Pulsa G para intercambiar los valores con la posición siguiente");
        System.err.println("Pulsa H para salir");
        
        respuesta = teclado.nextLine();

        }


        teclado.close();

    }
    
}