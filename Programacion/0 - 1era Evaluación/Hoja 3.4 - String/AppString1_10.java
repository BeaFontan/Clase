//10. O programa deberá ir pedindo unha cadea e un char, eliminará ese char da cadea, e mostrará a cadea.
//Logo pedirá outro par cadea/char. Rematará cando o char sexa o punto ‘.’

import java.util.Scanner;

public class AppString1_10 {

    public static void main(String[] args) {
        
        Scanner teclado = new Scanner(System.in);
        String frase;
        String caracter;



        System.out.println("Dime a frase");
        frase = teclado.nextLine();
        System.out.println("Dime o caracter que queres eliminar");
        caracter = teclado.nextLine();


        while (!caracter.contains(".")) { //mientras el caracter que responda no sea .


            while (frase.contains(caracter)) {//mientras la frase contenga el caracter que nos han introducido
                
                frase = frase.replace(caracter, "");//reemplaza el caracter por nada
            
            }

            System.out.println(frase);

    
            System.out.println("Dime a frase");
            frase = teclado.nextLine();
            System.out.println("Dime o caracter que queres eliminar");
            caracter = teclado.nextLine();
            
        }

        
        teclado.close();
        
    }
}