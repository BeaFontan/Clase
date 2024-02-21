//5. Queremos facer un programa que para calquera ruta introducida, mostre:
//• se o ficheiro existe ou non
//• se se trata dun ficheiro ou dun directorio
//• se é un ficheiro mostrar: nome, tamaño, permisos de lectura e escritura.

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.attribute.PosixFilePermission;
import java.util.Scanner;
import java.util.Set;

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

        //falta si se puede leer y si se puede escribir


        respuesta+=", es un fichero," + objetoPath.getFileName() + ", " + tamaño + " , "  ;
    }






    teclado.close();
    }

}