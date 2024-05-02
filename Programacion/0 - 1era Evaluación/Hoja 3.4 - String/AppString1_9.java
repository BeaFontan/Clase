//9.O programa deberá ir pedindo cadeas de caracteres, sen puntos, e para cada unha delas cambiar todas
//as letras 'a' por 'e', e todas as 'e' por 'a', e despois imprimir a cadea. O programa rematará se o tamaño da
//cadea introducida é 2 (ten só 2 letras).

import java.util.Scanner;

public class AppString1_9 {

    public static void main(String[] args) {
        
    Scanner teclado = new Scanner(System.in);
    String respuesta;

    System.out.println("Dime a frase");
    respuesta = teclado.nextLine();


    while (respuesta.length() > 2) { // mientras la frase introducida tenga más de 2 letras

       
        respuesta = respuesta.replace('a', '.'); // primero las paso a punto para que no sea e, y evitar que me cambie luego las a.
        //holx que txl

        respuesta = respuesta.replace('e', 'a'); // cambio las e por a
        //hxlx qua txl

        respuesta = respuesta.replace('.', 'e'); // y ahora cambio los puntos, donde tenía las a salvadas, por e
        //hele qua tel

        System.out.println(respuesta);

        System.out.println("Dime a frase");
        respuesta = teclado.nextLine();
        
    }

        teclado.close();


    }
}