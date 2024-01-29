//Cambio a horas

import java.util.Scanner;

public class E110CambioHoras{

    public static void main(String[] args) {
        
    Scanner Scan = new Scanner(System.in);

    System.out.println("Dime el total de segundos");
    int segundosTotales = Scan.nextInt();


    //Resultado
 
    int horas = segundosTotales / 3600;
    int minutos = segundosTotales / 60;
    int segundos = segundosTotales / 60;

   

    System.out.println("El resultado es " + horas + " horas "  + minutos + " minutos " + segundos + " segundos");
    
    Scan.close();

    }
    }