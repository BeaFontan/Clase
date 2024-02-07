import java.util.Scanner;

public class Ejer2 {

public static void main(String[] args) throws Exception {
    
    Scanner teclado = new Scanner(System.in);
    String numeroIP;

    System.out.println("Dime o número de IP");
    numeroIP = teclado.nextLine();

    System.out.println(comprobarIP(numeroIP));

  








}

public static String comprobarIP(String numIP){

    numIP.split(".");

    for (int i = 0; i < numIP.length();i++) {
        if (i < 0 || i > 255) {
            return "A cadea non é correcta";
        }
    }

    return "A IP é correcta";

}


}