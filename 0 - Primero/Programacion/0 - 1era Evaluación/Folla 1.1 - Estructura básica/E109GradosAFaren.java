//Grados a Faren

import java.util.Scanner;

public class E109GradosAFaren{

    public static void main(String[] args) {
        
    Scanner Scan = new Scanner(System.in);

    System.out.println("Dime los grados");
    float grados = Scan.nextFloat();


    //Resultado
 
    float importeFaren = 32;
    float resultadoFaren = grados - importeFaren / 1.8f; // le pongo la f para que me reconozca que es un float

   

    System.out.println("El total de la conversión a Faren es" + resultadoFaren);
    
    Scan.close();

    }
    }