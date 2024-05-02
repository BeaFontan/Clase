/*Programa que mostre o seguinte menú, e cada opción chame a unha función (excepto a opción a)
que non chama a unha función) que faga o cálculo. Non empregues arrays:
a) Introducir 3 valores enteiros. (sen chamada a función, directamente no main( ) )
b) Mostrar os 3 valores.
c) Calcular a media. A función calculará os valores e o resultado imprimese no main( ) .
d) Calcular o maior dos 3 valores.
e) Calcular o menor dos 3 valores. */

import java.util.Scanner;

public class F013 {

    public static void main(String[] args) {
        Scanner teclado = new Scanner(System.in);
        String respuesta;
        int numero1=0;
        int numero2=0;
        int numero3=0;
        String MostrarNumerosIntroducidos;

        System.out.println("Pulsa a para introducir 3 números enteiros.");
        System.out.println("Pulsa b para mostrar os números introducidos");
        System.out.println("Pulsa C para calcular a media");
        System.out.println("Pulsa d para calcular o maior dos 3 valores");
        System.out.println("Pulsa e para calcular o menor dos tres valores");
        respuesta = teclado.next();

        while (!respuesta.equals("z")) {
            
        
            switch (respuesta) {
                case "a":

                    System.out.println("Dime o primeiro número");
                    numero1 = teclado.nextInt();
                    
                    System.out.println("Dime o segundo número");
                    numero2 = teclado.nextInt();

                    System.out.println("Dime o terceiro número");
                    numero3 = teclado.nextInt();

                    break;
            
                case "b":

                    MostrarNumerosIntroducidos = mostrarResultados(numero1, numero2, numero3);
                    System.out.println(MostrarNumerosIntroducidos);

                    break;

                case "c": //media dos tres números

                    System.out.println("A media dos 3 números é " + mediaTresNumeros(numero1, numero2, numero3));

                    break;
                
                case "d"://maior de 3 números
                    System.out.println("O maior dos 3 números é: " + maximoEnteiros(numero1, numero2, numero3));

                    break;

                case "e": // menor dos tres números

                    System.out.println("O menor dos 3 números é: " + menorEnteiros(numero1, numero2, numero3));


            }

                System.out.println("Pulsa a para introducir 3 números enteiros.");
                System.out.println("Pulsa b para mostrar os números introducidos");
                System.out.println("Pulsa C para calcular a media");
                System.out.println("Pulsa d para calcular o maior dos 3 valores");
                System.out.println("Pulsa e para calcular o menor dos tres valores");
                respuesta = teclado.next();
              
        }

        teclado.close();


    }

    //Función para mostrar los númetos introducidos
    public static String mostrarResultados (int a, int b, int c){
        //tengo que almacenar lo que quiero que muestre y luego return la variable.
        String resposta = "Os números introducidos foron " + a + " " + b + " " + c;
        return resposta;

    }

    //Función para calcular media 
    public static int mediaTresNumeros(int a, int b, int c){
        int suma;
        int media;


        suma = a+b+c;
        media =suma / 3;

        return media;
    }


    //Función para mostrar el mayor
    public static int maximoEnteiros ( int x, int y, int z){

        int mayor = x;

        if (y > mayor) {
            mayor = y;
        }
        if(z > mayor){
            
            mayor = z;
        }
 
        return mayor;

    }


    //Función para mostrar el menor
    public static int menorEnteiros ( int x, int y, int z){

        int menor = x;

        if (y < menor) {
            menor = y;
        }
        if(z < menor){
            
            menor = z;
        }
 
        return menor;

    }

}