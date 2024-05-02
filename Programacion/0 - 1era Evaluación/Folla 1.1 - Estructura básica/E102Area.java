import java.util.Scanner; // Aquí indica que estamos usando la clase scanner

public class E102Area {

    //Ejercicio 2 - Área de un cuadrado

     public static void main(String[] args) {
        Scanner scaner = new Scanner(System.in); //creo el objeto scanner para poder usarlo a partir de aquí

        System.out.println("Dime el radio del círculo");
        double radio = scaner.nextDouble(); //lo hago double para poder trabajar con decimales

        double resultado = 3.14 * radio; // numero pi por el radio del cuadrado

        System.out.println("El área del circulo es " + resultado);

        scaner.close();//Cierro el Scanner sino protesta
    }

    
}