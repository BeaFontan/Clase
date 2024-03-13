//Programa que pida un ano, e diga se é bisesto. Os anos bisestos son aqueles que 
//son múltiplos de 4. 
//EXCEPTO: Os múltiplos de 100 non son bisestos a non ser que sexan múltiplos de 400.
//Por exemplo, 1900 non foi bisesto pero o 2000 si.

import java.util.Scanner;

public class E210AnhoBisiesto {

public static void main (String[] args){
    
Scanner pideTeclado = new Scanner(System.in);
int anhoTeclado;


System.out.println("Dime un año");
anhoTeclado = pideTeclado.nextInt();

if (anhoTeclado % 4 == 0) 
{

    System.out.println("Es año bisiesto");

}

else if (anhoTeclado % 100 != 0) 
{
    System.out.println("No es año bisiesto");
} 

else if (anhoTeclado % 400 ==0)

{
    System.out.println("Es año bisiesto");
}

else
{

    System.out.println("No es año bisiesto");

}

pideTeclado.close();
} 
}