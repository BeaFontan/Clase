import java.util.Scanner; // Aquí indica que estamos usando la clase scanner

public class E101Resta {

    //Ejercicio 1 - Resta 2 números

     public static void main(String[] args) {
        
        //Número 1
        System.out.println("Introduzca el número mayor");//pregunta por consola el primer numero
        Scanner sca = new Scanner(System.in); //"Escanea" el número
        int numeroMayor = sca.nextInt();//lo almacena en el int
    
        //Número 2
        System.out.println("Introduzca el número menor");
        Scanner scados = new Scanner(System.in);
        int numeroMenor = sca.nextInt();

        //Restado
        int resultado = numeroMayor - numeroMenor;

        System.out.println("El resultado de la resta es " + resultado); // saca por pantalla el resultado concatenado con la frase
    }

    
}