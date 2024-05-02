//Un traballador cobra 10 €/hora, e as horas extras a 16,50 €/hora. Fai un programa que pida as horas traballadas nunha semana e mostre os que cobra o traballador.

import java.util.Scanner;

public class E208HorasTrabajador 
{

    public static void main (String[] args)
    {

    Scanner pedirTeclado = new Scanner(System.in);
    
    int horasNormales;
    int horasExtras;
    double valorHoraNormal = 10;
    double valorHoraExtra = 16.50;
    double totalCobro;


    System.out.println("¿Cuantas horas normales has trabajado esta semana?");
    horasNormales = pedirTeclado.nextInt();

    System.out.println("¿Cuantas horas extras has trabajado esta semana?");
    horasExtras = pedirTeclado.nextInt();

    //Resultado
 
    totalCobro = horasNormales*valorHoraNormal + horasExtras * valorHoraExtra;


     System.out.println("Cobras este mes " + totalCobro + "€");


    pedirTeclado.close();

    }
    

}