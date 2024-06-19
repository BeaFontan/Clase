import java.util.Scanner;

public class ejer4 {

    public static void main(String[] args) {
        
    Scanner teclado = new Scanner(System.in);
    String cadea;

    System.out.println("Dime unha frase como máximo de 30 caracteres");
    cadea = teclado.nextLine();

    while (cadea.contains("c") || cadea.equals("The end")) {
       
        if (cadea.length() >= 30) {

            System.out.println("Menos de 30 caracteres");
            System.out.println("Dime unha frase como máximo de 30 caracteres");
            cadea = teclado.nextLine();

        }
        else{

                System.out.println(contaCs(cadea));

        }



    }






    teclado.close();

}

public static int contaCs(String frase){

    int contadorC=0;

    for (int i = 0; i < frase.length(); i++) { // ojo, este length lleva paréntesis
    
           if (frase.charAt(i) == 'c') {
            contadorC++;
           }
        
}

    return contadorC;


}



}