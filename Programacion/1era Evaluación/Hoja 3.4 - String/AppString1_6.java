//6.Programa que pida unha cadea, e quite os espazo en branco repetidos entre 2 palabras. De cada “conxunto” de espazos en branco, só quedará un espacio. 
//Exemplo: “oespazo” quedará “o espazo”.

import java.util.Scanner;

public class AppString1_6 {

    public static void main(String[] args) {
        
    Scanner teclado = new Scanner(System.in);
    String respuesta;
        
    System.out.println("Dime a frase");
    respuesta = teclado.nextLine();
     
    while (respuesta.contains("  ")) { //mientras haya doble espacio, va cogiendo todos los dobles espacios que hay
    
        respuesta = respuesta.replace("  ", " "); //reenplaza doble espacio por un espacio

    }

    System.out.println(respuesta);

    teclado.close();


    }
}