//Programa que pregunte que hora é, e responda con 'Bos días!', 'Boas tardes!' ou 'Boas noites!'.

import java.util.Scanner;


public class E212BuenosDias {

    public static void main(String[] args) {
        
    Scanner pideTeclado = new Scanner(System.in);
    int hora;
    int minuto;


    System.out.println("Dime la hora");
    hora = pideTeclado.nextInt();

    System.out.println("Dime el minuto");
    minuto = pideTeclado.nextInt();


    if (hora > 6 && hora < 12) 
    {
        System.out.println("Buenos días!");
    }
    


    pideTeclado.close();
    }
    
}