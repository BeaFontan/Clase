/* 
 2. Programa no que se define un array de 5 enteiros, inicializando todos os valores a 0, e se realizan
unha serie de opcións empregando funcións. O programa deberá mostrar o menú seguinte:
Elixe unha opción:
a) Introducir valor
b) Borrar todos os valores
c) Calcular a media dos valores
d) Calcular o máximo dos valores
e) Calcular o mínimo dos valores
f) Mostrar valores
g) Sair
*/

import java.util.Scanner;

public class F012 {

    public static void main(String[] args) {
    
        Scanner teclado = new Scanner(System.in);
        String respuesta;
        int[] enteros = new int[5];


        System.out.println("Pulsa a para Introducir los valores");
        System.out.println("Pulsa b para borrar todos los valores");
        System.out.println("Pulsa c para calcular media valores");
        System.out.println("Pulsa d para calcular o maximo dos valores");
        System.out.println("Pulsa e para calcular o mínimo dos valores");
        System.out.println("Pulsa f para mostrar os valores");
        System.out.println("Pulsa g para sair");
        respuesta = teclado.next();
    

        while (!respuesta.equals("g")) {

            switch (respuesta) {
                case "a": // dar valor al array

                    numerosArray(enteros, teclado);
                    break;
                
                case "b": // borrar valores de array, los pongo a 0

                    for (int i = 0; i < enteros.length; i++) {
                        enteros[i] = 0;
                    }

                break;
            

                case "c": //calcular media del array
                
                    System.out.println(mediaArrays(enteros));

                break;

                case "d": // calcular el mayor

                    System.out.println(mayorArray(enteros));
                    break;

                case "e": // calcular el menor

                    System.out.println(menorArray(enteros));
                    break;

                case "f": //mostrar valores dados

                mostraArray(enteros);

                break;
            }
        
            System.out.println("Pulsa a para Introducir los valores");
            System.out.println("Pulsa b para borrar todos los valores");
            System.out.println("Pulsa c para calcular media valores");
            System.out.println("Pulsa d para calcular o maximo dos valores");
            System.out.println("Pulsa e para calcular o mínimo dos valores");
            System.out.println("Pulsa f para mostrar os valores");
            System.out.println("Pulsa g para sair");
            respuesta = teclado.next();   
        }

        System.out.println("Gracias por usar el programa");

        teclado.close();
    }

    //funciones///////////////////////////////////////////////////////////////////////////////////////////////////////////

    //función para dar valor a los números
    public static void numerosArray(int [] valoresArray, Scanner pantalla){ // le paso un array que tomará el valor del que declaramos en main y el scaner, para tomar los valores.

        //le pregunto valor que quiere poner UNO A UNO, cada vez que quiera introducir un valor, tiene que pulsar a.

        System.out.println("Dime o número para o array");
         
         for (int i = 0; i < valoresArray.length; i++) {
           
            if(valoresArray[i] == 0){//Si el valor de la posición i es igual a 0
                valoresArray[i] = pantalla.nextInt();  //guarda en esa posición el número
                break; // para, porque no quiero que continúe ocn los demás, se guarda de uno en uno, el siguiente debe pulsar a para guardarlo.
            
            }  
                      
        }
    }

    //función para la media del array
    public static double mediaArrays( int [] valoresMedia){
        double media = 0;
        int sumaNumeros = 0;

        for (int i = 0; i <= valoresMedia.length; i++) {
            sumaNumeros = sumaNumeros + i; 
        }

        media = (double) sumaNumeros / 5;

        return media;
    }

    //función para calcular el mayor
    public static int mayorArray(int[] valoresMayor){
        int mayor = valoresMayor[0]; // de primeras le digo que el mayor es el valor de la posición 0

        for (int i = 1; i < valoresMayor.length; i++) {
            if (valoresMayor[i] > mayor) { //si el valor de la posición i es mayor que mayor
                mayor = valoresMayor[i]; //mayor es el valor de la posición i
            }
        }

        return mayor;
    }

    //función para calcular el menor
    public static int menorArray(int[] valoresMenor){
        int menor =valoresMenor[0];

        for (int i = 0; i < valoresMenor.length; i++) {
            if (valoresMenor[i] < menor) {
                menor = valoresMenor[i];
            }
        }

        return menor;
    }

    //función para mostrar los valores

    public static void mostraArray(int[] valoresMostrar){
        for (int valores : valoresMostrar) {
            System.out.println(valores);
        }
    }

}