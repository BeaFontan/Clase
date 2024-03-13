//Miles Centenas Decenas

import java.util.Scanner;

public class E113MilesCentenasDecenas{

    public static void main(String[] args) {
        
    Scanner pedirTeclado = new Scanner(System.in);

    System.out.println("Dime un número de catro ");
    int numero1 = pedirTeclado.nextInt();

    System.out.println("Dime otro número entero");
    int numero2 = pedirTeclado.nextInt();

    //Resultado
 
    int guardarValor = numero1;
    numero1 = numero2;
    numero2 = guardarValor;
   

    System.out.println("Os valores intercambiados son " + numero1 + " e " + numero2 );
    
    pedirTeclado.close();

    }
    }