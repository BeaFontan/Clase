//2. Consulta a API da clase Integer, para ver a sintaxe dos métodos toBinaryString(), 
//toOctalString(), e toHexString(), e fai un programa cun menú que permita:
//a) introducir un enteiro
//b) mostrar o enteiro en binario
//c) mostrar o enteiro en octal
//d) mostrar o enteiro en hexadecimal

import java.util.Scanner;

public class Ejer2{
    public static void main(String[] args) {
        
        Scanner teclado = new Scanner(System.in);
        String respuesta = "";
        int numeroIntroducido = 0;

        System.out.println("a) introducir enteniro \n b) mostrar o enteiro en binario \n c) mostrar o enteiro en octal \n d) mostrar o enteiro en hexadecimal" );
        respuesta = teclado.nextLine();

        while (!respuesta.equals("x")) {
            

            switch (respuesta) {
                case "a":
    
                    System.out.println("Dime o número enteiro");
                    numeroIntroducido = teclado.nextInt();
                    
                    break;
            
    
                case "b":
    
                    String numeroBinario;
                    numeroBinario = Integer.toBinaryString(numeroIntroducido);
                    System.out.println(numeroBinario);
    
                    break;

                case "c":

                    String numeroOctal;
                    numeroOctal = Integer.toOctalString(numeroIntroducido);
                    System.out.println(numeroOctal);

                    break;

                case "d":

                    String numeroHexa;
                    numeroHexa = Integer.toHexString(numeroIntroducido);

                    System.out.println(numeroHexa);

                    break;
            }

            System.out.println("a) introducir enteniro \n b) mostrar o enteiro en binario \n c) mostrar o enteiro en octal \n d) mostrar o enteiro en hexadecimal" );
            respuesta = teclado.nextLine();
        }

    }
}