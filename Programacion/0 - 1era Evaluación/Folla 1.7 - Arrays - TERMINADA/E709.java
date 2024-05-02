//Declara un array de 10 enteiros. Fai un menú para facer o seguinte:
//a) Introducir os 10 números.
//b)Mostrar os 10 números.
//c)Poñer a 0 os 3 primeiros elementos do array.
//d)Poñer a 10 os 3 últimos elementos do array.
//e)Sair.

import java.util.Scanner;

public class E709 {

    public static void main(String[] args) {
        
    int[]enteros = new int[10];
    Scanner teclado = new Scanner(System.in);
    String respuesta;

    System.out.println("Pulsa A para introducir 10 números");
    System.out.println("Pulsa B para Mostrar os 10 números");
    System.out.println("Pulsa C para poner el valor de 0 a las 3 primeras posiciones");
    System.out.println("Pulsa D para poner el valor de 10 a las 3 últimas posiciones");
    System.err.println("Pulsa E para salir");
    
    respuesta = teclado.nextLine();

    //mientras la respuesta no sea la opción e, es decir, salir,
    while (!respuesta.contains("e")) {
        

        //función asignar los números
        if (respuesta.equals("a")) {
            
            for (int i = 0; i < enteros.length; i++) {
                System.out.println("Dime un número");
                
                enteros[i] = teclado.nextInt();
            }
            teclado.nextLine(); // poño esta línea para que non me colla o intro, esto é en strings.

        }

        //opción mostrar los números
        else if (respuesta.equals("b")) {

            for (int valor : enteros) {
                
                System.out.println(valor);
            }
        }

        //opción de poner a 0 los 3 primeros elementos del array
        else if (respuesta.equals("c")) {

            for (int i = 0; i <= 2; i++) {
                
                enteros[i] = 0;
                
            }
            
           for (int valores : enteros) {
                System.out.println(valores);  
           }

        }

        //opción d, poner a 10 los tres últimos elementos del array
        else if (respuesta.equals("d")) {

            for (int i = 7; i < enteros.length; i++) {
                
                enteros[i] = 10;
                
            }
            

           for (int valoresD : enteros) {
                System.out.println(valoresD);  
           }
            
        }


        //vuelve a preguntar cada vez que acabe una de las opciones que es lo que quiere hacer
        System.out.println("Pulsa A para introducir 10 números");
        System.out.println("Pulsa B para Mostrar os 10 números");
        System.out.println("Pulsa C para poner el valor de 0 a las 3 primeras posiciones");
        System.out.println("Pulsa D para poner el valor de 10 a las 3 últimas posiciones");
        System.err.println("Pulsa E para salir");
        respuesta = teclado.nextLine();

    }

    teclado.close();

    }
}