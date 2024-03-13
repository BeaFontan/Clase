//Importe a Euros

import java.util.Scanner;

public class E108DolaresAEuros{

    public static void main(String[] args) {
        
    Scanner Scan = new Scanner(System.in);

    System.out.println("Dime el importe en dolares");
    float numero = Scan.nextFloat();


    //Resultado
    float variable = 0.93f;
    float resultado = numero * variable / 1;

   

    System.out.println("El importe en Euros es " + resultado);
    
    Scan.close();

    }
    }
