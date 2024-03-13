/*1. Programa que mostre un menú como o seguinte:
1. Introducir tres valores enteiros.
2. Mostrar a media
3. Mostrar o produto
4. Mostrar o maior
5. Sair
E faga o que indica o menú, cada vez que se preme a tecla correspondente.
OLLO: Non poderá facer nada se non se introduciron previamente valores para as variables,
pero estas só se introducirán ao premer o a). */

import java.util.Scanner;

public class E901 {

    public static void main(String[] args) {
        
        Scanner introducir = new Scanner(System.in);
        int respuesta;
        int[] almacenar = new int[3];
        int sumaParaMedia = 0;
        double media;
        int producto = 1; // le damos valor inicial de 1 porque 0*0 es 0
        int mayor = 0;

        System.out.println("Pulsa 1 para introducir 3 valores enteros");
        System.out.println("Pulsa 2 para mostrar la media");
        System.out.println("Pulsa 3 para mostrar el producto");
        System.out.println("Pulsa 4 para mostrar el mayor");
        System.out.println("Pulsa 5 para salir");
        respuesta = introducir.nextInt();

        while (respuesta != 1 ){ // mientras no introduzcas los números, no puedes acceder a las otras opciones
            
            System.out.println("primeiro tes que introducir os números");
            respuesta = introducir.nextInt();
        } 
            
        
        while (respuesta != 5) {

            switch (respuesta) {
                case 1:
                    

                    for (int i = 0; i < almacenar.length; i++) {
                        System.out.println("Dime os números");
                        almacenar[i] = introducir.nextInt(); 
                    }

                    break;

                case 2: // para hayar la media
                    

                    for (int i = 0; i < almacenar.length; i++) {
                        
                        sumaParaMedia = almacenar[i] + sumaParaMedia ; // para sumar entre sí

                    }

                    media = (double) sumaParaMedia / almacenar.length; // el total de la suma entre el largo del array, que es lo mismo que el total de los números introducidos
                    //transformo la operación a double para que me de los decimales, sino lo hace como entero.

                    System.out.println("A media dos números é " + media);

                    break;

                case 3: // para hayar el producto
                    

                    for (int i = 0; i < almacenar.length; i++) {
                        
                        producto = almacenar[i] * producto; // para multiplicar los números entre sí

                    }


                    System.out.println("O producto dos números é " + producto);

                    break;

                case 4: // para hayar el mayor
                    

                    for (int i = 0; i < almacenar.length; i++) {
                        
                        mayor = almacenar[0]; // primero le digo que el mayor es el de la posición 1

                        if (almacenar[i] > mayor) //si la posición del bucle es mayor que mayor, 
                        {
                            mayor = almacenar[i]; // mayor es la posición del bucle
                        }

                    }

                    System.out.println("O número maior é " + mayor);

                    break;
            
            }

            System.out.println("Pulsa 1 para introducir 3 valores enteros");
            System.out.println("Pulsa 2 para mostrar la media");
            System.out.println("Pulsa 3 para mostrar el producto");
            System.out.println("Pulsa 4 para mostrar el mayor");
            System.out.println("Pulsa 5 para salir");
            respuesta = introducir.nextInt();
        }

        introducir.close();


    }
}