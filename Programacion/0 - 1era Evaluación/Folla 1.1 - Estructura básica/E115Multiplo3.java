import java.util.Scanner;

public class E115Multiplo3 {

    public static void main(String[] args) {
        
    Scanner pedir = new Scanner(System.in);

    System.out.println("Dime un número entero");
    int numero = pedir.nextInt();

        if (numero % 3 == 0) {
            System.out.println("Es múltiplo de tres");
        }
        else{ System.out.println("No es múltiplo de 3");}

    
    pedir.close();

    }
    


}