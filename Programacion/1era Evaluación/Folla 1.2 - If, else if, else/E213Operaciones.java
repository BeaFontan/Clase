//13. Programa que pida 2 números e a operación a realizar entre eles (suma, resta, produto e división) e calcule o resultado de facer esa operación.

import java.util.Scanner;


public class E213Operaciones{
public static void main(String[] args)
{

    Scanner pideTeclado = new Scanner(System.in);
    int numero1;
    int numero2;
    int resultado;
    String operacion;


    System.out.println("Dime un número");
    numero1 = pideTeclado.nextInt();

    System.out.println("Dime otro número");
    numero2 = pideTeclado.nextInt();

    //pideTeclado.nextLine();//Tienes que poner esto, para que no te lea el intro y te lea el string, para flipar. Con el next() a secas te coge el string sin necesidad de poner una línea a mayores

    System.out.println("Quieres sumar, restar, multiplicar o dividir los números?");
    operacion = pideTeclado.next();

    //Suma
    if  (operacion.equals("sumar"))
    {
    
        resultado = numero1 + numero2;

        System.out.println("El resultado de la suma de los dos números es " + resultado);
        
    }

    //Resta
    else if  (operacion.equals("restar"))
    {
        
        resultado = numero1 - numero2;

        System.out.println("El resultado de la resta de los dos números es " + resultado);
        
    }

    //Multiplicación
    else if  (operacion.equals("multiplicar"))
    {
        
        resultado = numero1 * numero2;

        System.out.println("El resultado de la multiplicación de los dos números es " + resultado);
        
    }

    //División
    else if  (operacion.equals("dividir"))
    {
        
        resultado = numero1 / numero2;

        System.out.println("El resultado de la división de los dos números es " + resultado);
        
    }

    
    pideTeclado.close();

}
}
