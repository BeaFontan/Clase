//PIDO VARIABLE POR TECLADO E MOSTRO O SEU VALOR

import java.util.Scanner; //importa la clase Scanner para sacar por pantalla ya predefinida

public class A01EjemploMultiplicar {

    public static void main(String[] args) 
    {
        System.out.println("Introduce un número por teclado");
        Scanner escaner = new Scanner(System.in);//aquí crea el objeto scanner para almacenar el número

        int numero = escaner.nextInt(); // aquí le da valor a lo introducido por teclado

        System.out.println("O número tecleado é " + numero);


        //para calcular el doble dle número 

        int dobleDoNumero = numero * 2;

        System.out.println("O doble do número vale " + dobleDoNumero);

        escaner.close();//cierra el método escaner

    }
    
}
