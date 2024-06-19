//6. Fai un programa que cree nunha carpeta “ficheirosTemporais” ata 5 ficheiros de texto, cada un con
//unha frase introducida por teclado. Os ficheiros serán “exemplo1.txt”, “exemplo2.txt”, etc.

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Scanner;

public class Ejer6 {

    public static void main(String[] args) {
        
        Scanner teclado = new Scanner(System.in);
        String respuesta = "";

        //Crear carpeta
        Path carpeta = Paths.get("ficheirosTemporais");

        try {
            Files.createDirectory(carpeta);
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
            System.out.println(e.getMessage());
        }

        //ahora crear los archivos y esquibir

        for (int i = 0; i < 5; i++) {
            
            //creación de los ficheros
            try {
                Files.createFile(carpeta.resolve("exemplo" + i + ".txt"));
            } catch (IOException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }


            //y ahora escribo en el fichero
            System.out.println("Dime a frase para escribir nos ficheiros");
            respuesta = teclado.nextLine();

            





        }





    }
    
}