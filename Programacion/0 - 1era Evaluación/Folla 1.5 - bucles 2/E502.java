//Programa que simule o lanzamento dun dado. O programa irá lanzando o dado e o xogador tentará atinar cun único intento por cada lanzamento. Rematará cando acerte, 
//e mostrará o número de veces xogadas.

import java.util.Scanner;

public class E502 {

    public static void main(String[] args) {
        
        Scanner escaner = new Scanner(System.in);
        int numero;
        int numeroDado;
        int vecesXogadas = 1;

        System.out.println("Dime un número");
        numero = escaner.nextInt();

        numeroDado = (int) (Math.random()*10) +1; // Math.random() da un número entre 0 y uno, por lo que es double, por eso se pasa a int. 
        //y se multiplica por el número máximo que quieres poner y +1, porque nunca llega al número máximo.

        while (numero != numeroDado) 
        {
        ++vecesXogadas;
        System.out.println("Non acertaches, dime outro número");
        numero = escaner.nextInt();
            
        }

        System.out.println("Acertaches! O número de tiradas foi " + vecesXogadas);

        escaner.close();




    }
}