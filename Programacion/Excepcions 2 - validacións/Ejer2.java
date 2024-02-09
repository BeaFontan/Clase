import java.lang.reflect.Array;
import java.util.Scanner;

public class Ejer2 {

public static void main(String[] args) throws Exception {
    
    Scanner teclado = new Scanner(System.in);
    String numeroIP;

    System.out.println("Dime o número de IP");
    numeroIP = teclado.nextLine();

    comprobarIP(numeroIP);


    while (comprobarIP(numeroIP) == false) {
    
        System.out.println("Dime o número de IP");
        numeroIP = teclado.nextLine();
    
        comprobarIP(numeroIP);
    
    }

    teclado.close();
}



public static boolean comprobarIP (String numIP){

    String[] arrayNumeros = new String[4];
    int numero = 0;

    //Comprobación que haya puntos

    if (!numIP.contains(".")) {
        System.out.println("Os números deben estar separados por puntos");
        return false;
       
    }

    //introduzco en el array la posición de cada numero separado por punto
    arrayNumeros = numIP.split("\\.");

    //Si el array no tiene 4 posiciones
    if (arrayNumeros.length != 4) {
        System.out.println("Faltan números por introducir");
            return false;
    }
  
    //compruebo cada posicion
    for (int i = 0; i < arrayNumeros.length;i++) {

        //Intento convertir el string a números
        try {
            numero = Integer.parseInt(arrayNumeros[i]);
        } catch (Exception e) {

            System.out.println(e.getMessage() + "O número non ten o formato correcto");
            return false;
            
        }

        //Compruebo que el número esté entre los permitidos
        if (numero < 0 || numero > 255) {

            System.out.println("A cadea non é correcta");
            return false;
            
        }
   
    }

    return true;
            

}


}