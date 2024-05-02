/*Programa con funcións, para que, dado un array de 4 elementos enteiros, mostre un menú para:
a) Introducir todos os datos
b) Borrar algún dos elementos. ( O usuario indicará o índice do elemento a borrar, e o
programa desprazará os existentes á dereita do elixido unha posición á esquerda)
c) Imprimir o array
d) Imprimir o array en xeito inverso
e) Sair
OLLO: Lembra que en Java non se poden eliminar elementos, debes utilizar un valor especial para
controlar no teu programa que ese valor significa nulo. */

import java.util.Scanner;

public class F013 {

    public static void main(String[] args) {
        Scanner teclado = new Scanner(System.in);
        int[] enteros = new int[4];
        String respuesta = "";

        System.out.println("Pulsa a para introducir los valores");
        System.out.println("Pulsa b para borrar un elemento");
        System.out.println("Pulsa c para mostrar los números");
        System.out.println("Pulsa d para mostrar los números invertidos");
        System.out.println("Pulsa e para mostrar os valores");
        respuesta = teclado.next();

        while (!respuesta.equals("e")) {

            switch (respuesta) {
                case "a": //dar valor al array
                    numerosArray(enteros, teclado);
                    break;

                case "b": // borrar un elemento

                    break;

                case "c": // mostrar los número invertidos

                    break;
                
                case "d": //mostrar los valores

                    break;
                    

            }

            System.out.println("Pulsa a para introducir los valores");
            System.out.println("Pulsa b para borrar un elemento");
            System.out.println("Pulsa c para mostrar los números");
            System.out.println("Pulsa d para mostrar los números invertidos");
            System.out.println("Pulsa e para mostrar os valores");
        }
    
        teclado.close();
    }

    //función para dar valor al array
    public static void numerosArray(int [] valoresArray, Scanner pantalla){

        System.out.println("Dime o número para o array");
            for (int i = 0; i < valoresArray.length; i++) {
            valoresArray[i] = pantalla.nextInt();
        
        }
    }

    //función para borrar un elemento

    public static void borrarElemento(int [] valoresArray, Scanner pantalla){
        int posicion;//almaceno la posición que quiere borrar en esta variable

        System.out.println("Dime que posición de 0 a 4 queres borrar");
         posicion = pantalla.nextInt();

         for (int i = 0; i < valoresArray.length; i++) {
           //si la posición coincide con la posición introducida
            if(i == posicion){
                valoresArray[i] = 0;//pon el valor de esa posición a 0
               
                break; 
                 valoresArray[i]-1;//me quedé aquíiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiii
            
            }
                      
        }
    }
}