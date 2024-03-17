//4. Fai un programa que pida repetidamente o nome dun ficheiro ou directorio, con JoptionPane, e vaia
//indicando se é unha carpeta ou un ficheiro. O programa rematará cando se teclee “fin”.


import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

import javax.swing.JOptionPane;

public class Ejer4 {

    public static void main(String[] args){
        
        String nombre;
        Path nombreArchivo;

        nombre = JOptionPane.showInputDialog("Dime o nome da carpeta ou ficheiro que queres comprobar");

        while (!nombre.equals("fin")) {

            nombreArchivo = Paths.get(nombre);

            if (Files.exists(nombreArchivo)) {
                if (Files.isDirectory(nombreArchivo)){
                    System.out.println("Es una carpeta");
                }
                if (Files.isRegularFile(nombreArchivo)){
                    System.out.println("Es un fichero");
                }
            }
            else{
                System.out.println("O ficheiro non existe");
            }




            nombre = JOptionPane.showInputDialog("Dime o nome da carpeta ou ficheiro que queres comprobar");
        }

    }
}