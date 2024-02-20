//Fai un programa que pida o nome dun ficheiro con JOptionPane, e se existe o copie nunha carpeta
//“copia”. Execútao varias veces e comproba que funciona.

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import javax.swing.JOptionPane;

public class Ejer2 {

    public static void main(String[] args) throws IOException {
        
        String archivo = JOptionPane.showInputDialog("Dime o nome do ficheiro");

        //creacion carpeta

        Path crearCarpeta = Paths.get("copiaEjer2");

        try {
            Files.createDirectory(crearCarpeta);
        } catch (IOException e) {
            System.out.println(e.getMessage() + " Erro ó crear a carpeta");
        }


        //ahora fichero
        Path archivoPath = Paths.get(archivo);

        
        if (Files.exists(archivoPath) == true ){

            try {
                                                    //uso la funcion para concatenar la carpeta con el nombre del fichero que se va a copiar, 
                                                    //es decir, en este caso se va a llamar igul
            Files.copy(archivoPath.toAbsolutePath(), crearCarpeta.resolve(archivoPath), StandardCopyOption.REPLACE_EXISTING);
            //función copy: copiar ruta del archvo, en la ruta de la carpeta concatenada con el nombre

            } catch (IOException e) {
                System.out.println(e.getMessage() + " Error al copiar fichero");
            }

            System.out.println("el fichero fue copiado");
        }
        else{
            System.out.println("El archivo no existe");
        }

        


    }
    
}