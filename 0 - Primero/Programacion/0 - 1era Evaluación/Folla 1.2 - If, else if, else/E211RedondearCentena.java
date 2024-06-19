//Fai un programa que redondee un número de 4 cifras á centena máis próxima. Exemplo, 2340 a 2300, e 2560 a 2600. Comproba que o número introducido ten 4 cifras.

import java.util.Scanner;

public class E211RedondearCentena {
public static void main (String[] args){
    
Scanner pideTeclado = new Scanner(System.in);
int cifraTeclado;
int cifraRedondeada;
int resto;


System.out.println("Dime una número de 4 cifras");
cifraTeclado = pideTeclado.nextInt();
resto = cifraTeclado % 100;

//Comprobación 4 cifras
if (cifraTeclado < 1000 || cifraTeclado>9999) 
{
    System.out.println("El número no es de 4 cifras");
}

//Si tiene cuatro cifras
else
{
    if (resto < 50)
    {
        cifraRedondeada = cifraTeclado - resto;


        System.out.println("El número redondeado es " + cifraRedondeada);

    }
    if(resto >= 50)
    {
    cifraRedondeada = cifraTeclado - resto + 100;

        System.out.println("El número redondeado es " + cifraRedondeada);


    }

} 


pideTeclado.close();
} 
}