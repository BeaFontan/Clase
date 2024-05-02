/*Emprega o ficheiro lemario: lemario.cast, que contén un listado de palabras en castelán para facer o seguinte:

Busca todas as palabras que comezan por “cas”
Pide unha palabra por teclado e comproba se está no lemario
Pide unha terminación por teclado e mostra as palabras do lemario con esa terminación.
Pide unha letra e indica (non mostra) o número de palabras do lemario que empeza por esa letra*/

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Scanner;
import java.util.stream.Stream;

public class ejer2 {

    public static void main(String[] args) throws IOException {
        
        Scanner teclado = new Scanner(System.in);
        String palabraBuscar;
        String palabraFinal;
        String totalPalabra;
        long total;

        Path fichero = Paths.get("lemario.txt");

        //Busca todas as palabras que comezan por “cas”

        try (Stream<String> lines = Files.lines(fichero)) {  

            lines.filter(line ->line.startsWith("cas")).forEach(System.out::println);

        }

        //Pide unha palabra por teclado e comproba se está no lemario

        System.out.println("Dime a palabra que queres buscar");
        palabraBuscar = teclado.next();

        try (Stream<String> lines = Files.lines(fichero)) {  

            lines.filter(line ->line.equals(palabraBuscar)).forEach(System.out::println);
        }

        //Pide unha terminación por teclado e mostra as palabras do lemario con esa terminación.

        System.out.println("Dime con que acaba a palabra");
        palabraFinal = teclado.next();

        try (Stream<String> lines = Files.lines(fichero)) {  

            lines.filter(line ->line.endsWith(palabraFinal)).forEach(System.out::println);

        }

        //Pide unha letra e indica (non mostra) o número de palabras do lemario que empeza por esa letra*/


        System.out.println("Dime que letra queres para contar as palabras");
        totalPalabra = teclado.next();

        try (Stream<String> lineas = Files.lines(fichero)) {

            //aquí le digo que recorra las líneas y busque en cada línea las que empiezan con la letra que nos dan.
            total = lineas.filter(linea ->linea.startsWith(totalPalabra)).count();

            System.out.println(total + " palabra que empezan por " + totalPalabra);


        }




        teclado.close();

    }

}