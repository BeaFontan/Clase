import java.util.Scanner;

public class E116ParoImpar {

    public static void main(String[] args) {
        
    Scanner pedir = new Scanner(System.in);

    System.out.println("Dime un número entero");
    int numero = pedir.nextInt();

        if (numero % 2 == 0) {
            System.out.println("Es un número par");
        }
        else{ System.out.println("Es un número impar");}

    
    pedir.close();

    }
    


}