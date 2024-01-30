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
        int numeroFac=1;
        int calculoFactorial=0;

        System.out.println("Dime un número enteiro");
        try {
            numeroFac = teclado.nextInt();
        } catch (InputMismatchException exc) {
            System.out.println("Ten que ser un número enteiro");
        

        while (numeroFac==1) {
                 
            try{
                numeroFac = Integer.parseInt(JOptionPane.showInputDialog("Dime o número para calcular o factorial"));
            } catch (NumberFormatException exc2) {
                System.out.println("Ten que ser un número enteiro, introdúceo de novo");

            }
        }



        for (int i = 1; i  <= calculoFactorial; i--) {
            calculoFactorial *= i;
        }

        System.out.println(calculoFactorial);


    }


}
}

