//Simula o xogo de lanzar 1 dado, dándolle ao xogador o número de intentos que considere oportuno
//para achegarse ao 21. Se chega xusto felicítao, e se non indícalle que perdeu. O xogador pode plantarse en calquera intento.

import java.util.Scanner;

public class E510 {

    public static void main(String[] args) {
        
        
        Scanner escaner = new Scanner(System.in);
        String respuesta;
        int numeroDado;
        int sumaDado = 0;

        System.out.println("¿Quieres lanzar el dado?");
        respuesta = escaner.nextLine();

        while (respuesta.equals("si")) {

            numeroDado = (int) (Math.random()*10) +1; 
    

            System.out.println("Queres seguir lanzando?");
            respuesta = escaner.nextLine();

            sumaDado = numeroDado+numeroDado;

        }

        if (sumaDado == 21) {

        System.out.println("Acertaches!");
        
        }

        else{
        System.out.println("Non acertaches!");
        }
    

        escaner.close();

    }
}