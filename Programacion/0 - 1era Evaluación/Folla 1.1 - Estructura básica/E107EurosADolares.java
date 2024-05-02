//Resto Euros a dolares

import java.util.Scanner;

public class E107EurosADolares{

    public static void main(String[] args) {
        
    Scanner Scan = new Scanner(System.in);

    System.out.println("Dime el importe en euros");
    double numero = Scan.nextDouble();


    //Resultado

    double resultado = numero * 1.07 / 1;

   

    System.out.println("El importe en dolares es " + resultado);
    
    Scan.close();

    }
    }