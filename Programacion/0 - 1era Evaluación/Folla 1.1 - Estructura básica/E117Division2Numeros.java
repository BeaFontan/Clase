import java.util.Scanner;

public class E117Division2Numeros {

    public static void main(String[] args) {
        
    Scanner pedir = new Scanner(System.in);

    System.out.println("Dime un número entero");
    double numero1 = pedir.nextInt();


    System.out.println("Dime un número entero");
    double numero2 = pedir.nextInt();

        if (numero2 == 0) {
            System.out.println("Erro, non se pode dividir por 0");
        }
        else{
            
            double resultado;

            resultado = numero1 / numero2;
            
            System.out.println("o resultado da división é " + resultado);
        }

    
    pedir.close();

    }
    


}