//Fai un programa que vaia saudando ao usuario, mentres este diga que si cando preguntamos se quere continuar.

import java.util.Scanner;

public class E402 {

    public static void main(String[] args) {

        Scanner escaner = new Scanner(System.in);
        String palabra;

        System.out.println("Hola, ¿Quieres continuar?");
        palabra = escaner.nextLine();


       while ((palabra.equals("si")))
       {
        
       System.out.println("Hola, ¿Quieres continuar?");
       palabra = escaner.nextLine();
    
       }

       escaner.close();
    }

}