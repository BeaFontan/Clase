//5. Queremos facer un programa que para calquera ruta introducida, mostre:
//• se o ficheiro existe ou non
//• se se trata dun ficheiro ou dun directorio
//• se é un ficheiro mostrar: nome, tamaño, permisos de lectura e escritura.

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Scanner;

public class Ejer5 {

    public static void main(String[] args) throws IOException {
        
        Scanner teclado = new Scanner(System.in);
        Path objetoPath;
        String respuesta = "";
        System.out.println("Dime a ruta");
        String ruta = teclado.nextLine();

        objetoPath = Paths.get(ruta);

        if (Files.exists(objetoPath)) {
            respuesta = "Existe";
        }

        if (Files.isDirectory(objetoPath)){
            respuesta +=", es un directorio,";
        }

        if (Files.isRegularFile(objetoPath)) {

            long tamaño = Files.size(objetoPath);

            respuesta+=", es un fichero," + objetoPath.getFileName() + ", " + tamaño + " , "  ;
        }

        if (Files.isReadable(objetoPath)) {
            
            respuesta+= "se puede leer, ";

        }

        if (Files.isWritable(objetoPath)) {
            respuesta+= " se puede escribir ";
        }


        System.out.println(respuesta);


        teclado.close();
    }

}