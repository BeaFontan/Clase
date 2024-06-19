//Queremos calcular o factorial dun número pero asegurándonos que o usuario introduce 
//un enteiro por teclado. Ata que non introduza un enteiro pedirémoslle de novo o 
//número. Faino primeiro coa clase Scanner e logo co JOptionPane. 
//Investiga InputMismatchException e NumberFormatException, para cada un dos casos.

import java.util.InputMismatchException;
import java.util.Scanner;
import javax.swing.JOptionPane;

public class Ejer2 {

    public static void main(String[] args) {
        Scanner teclado = new Scanner(System.in);
        int numeroFac = 0;

        boolean inputValido = false;


        while (!inputValido) {
            try {
                System.out.println("Dime un número entero:");
                numeroFac = teclado.nextInt();
                inputValido = true;
            } catch (InputMismatchException exc) {
                System.out.println("Tiene que ser un número entero. Inténtalo de nuevo:");
                teclado.nextLine(); // Limpiar el buffer de entrada
            }
        }

        int factorial = 1;
        for (int i = 2; i <= numeroFac; i++) {
            factorial *= i;
        }

        System.out.println("El factorial de " + numeroFac + " es: " + factorial);


        System.out.println("________________________________");

        boolean inputValido2 = false;
        int numero = 0;

        while (!inputValido2) {
            String input = JOptionPane.showInputDialog("Dime un número entero");
            if (input == null) { 
                break; // Salir del bucle
            }
            try {
                numero = Integer.parseInt(input);
                if (numero >= 0) {
                    inputValido2 = true;
                } else {
                    JOptionPane.showMessageDialog(null, "Número negativo no válido");
                }
            } catch (NumberFormatException exc) {
                JOptionPane.showMessageDialog(null, "Número incorrecto: " + exc.getMessage());
            }
        }

        // Cálculo del factorial
        if (inputValido2) {
            int factorial2 = 1;
            for (int i = 2; i <= numero; i++) {
                factorial2 *= i;
            }

            System.out.println("El factorial de " + numero + " es: " + factorial2);
        }
        
        teclado.close(); // Cerrar Scanner
    }
}


