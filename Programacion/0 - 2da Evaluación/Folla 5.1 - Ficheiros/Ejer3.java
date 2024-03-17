//3. Simplifica o código da introdución UD5.- Ficheiros, para empregar o 
//try-with-resources. Lembra que o try-with-resources pode ter un bloque catch 
//se é preciso capturar a excepción: o que non é preciso é
//empregar o bloque finally para liberar os recursos.

import java.io.File;
import java.io.IOException;
import java.util.Scanner;

public class Ejer3{

    public static void main(String[] args) throws IOException{
            // Crear el archivo si no existe
            File fichero = new File("test.txt");
            try {
                if (fichero.createNewFile()) {
                    System.out.println("Archivo 'test.txt' creado con éxito.");
                } else {
                    System.out.println("El archivo 'test.txt' ya existe.");
                }
            } catch (IOException e) {
                System.out.println("Error al crear el archivo 'test.txt': " + e.getMessage());
            }
    
            // Leer el contenido del archivo
            try (Scanner teclado = new Scanner(fichero)) {
                while (teclado.hasNextLine()) {
                    System.out.println(teclado.nextLine());
                }
            } catch (IOException e) {
                e.printStackTrace();
            }


    }

}