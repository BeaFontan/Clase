import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardOpenOption;
import java.util.Scanner;


public class FluxoBytesNIO {
public static void main(String[] args) {

    Scanner teclado = new Scanner(System.in);
    //creada la ruta para el fichero
    String directory = ".";
    String fileName = "sampleNIO.txt";
    //creamos el path
    Path path = Paths.get(directory, fileName);


    System.out.println("Dime unha cadea");
    //Le damos el contenido 
    String content = teclado.nextLine();


    //Escribir
    try {
        while (!content.equals("fin")) {
            //usamos Files.write para escribir, le damos el path. el contenido a bytes y trucate para sobreescribir
            //Files.write(path, content.getBytes(), StandardOpenOption.TRUNCATE_EXISTING);

            content = content + ";";
            //ahora uso el append para que no me sobreescriba, sino que ponga uno detrás de otro y
            //respeta lo que ya existía en el fichero.
            Files.write(path, content.getBytes(), StandardOpenOption.APPEND);

            //vuelvo a preguntar
            System.out.println("Dime unha cadea");
            content = teclado.nextLine();

        }

    } catch (IOException e) {

        System.err.println("Error na E/S");
        
    }


    //Leer
    try { 

        //En un array de bytes, hacemos la lectura de bytes con Files.readAllByes y le pasamos el fichero, es decir,
        // el path.
        
        byte[] data = Files.readAllBytes(path);

        //creo un objeto String y le paso el array de bytes
        String contenido = new String(data);

        // en un array de strings almaceno el contenido de strings separados por el ; que le ponía antes.
        String[] strings = contenido.split(";");

        // Mostrar los strings individuales
        for (String str : strings) {
            System.out.println(str);
        }
   


    } catch (IOException e) {

        System.err.println("Error na E/S");
    }

    teclado.close();
}
}