import java.io.EOFException;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

public class AppPais {

    public static void main(String[] args) {
        
        String filename = "paiss.dat";
        ObjectInputStream leerInput = null;
        Path path =Paths.get(filename);


        Pais pais1 = new Pais("Alemania", 100000);
        Pais pais2 = new Pais("Francia", 200000);
        Pais pais3 = new Pais("Italia", 300000);
        Pais pais4 = new Pais("Portugal", 400000);

        Pais[] arrayPaises = new Pais[4];
        arrayPaises[0] = pais1;
        arrayPaises[1] = pais2;
        arrayPaises[2] = pais3;
        arrayPaises[3] = pais4;

         //abril el fichero

        try {

            leerInput = new ObjectInputStream(Files.newInputStream(path));

        } catch (IOException e) {

            System.out.println(e.getMessage() + "Erro abrindo o ficheiro");
            
        }


        //leer el fichero

        Pais pais;

        try {

            while ((pais = (Pais)leerInput.readObject())!= null) {
                
                System.out.println(pais.getNome() + " " + pais.getNumeroHabitantes());

            }

            //NECESITAMOS TRES ESCEPCIONES
        } catch (ClassNotFoundException e) { //LA DE LA CLASE ERRÓNEA
            System.out.println(e.getMessage() + "Tipo de obxecto non válido");
        } catch (EOFException e) { //LA DE EOF, EL QUE CIERRA EL BUCLE (!=NULL)
            System.out.println("Fin de fichero");
        
        } catch (IOException e) { //y la de IO para error de lectura del fichero
            System.out.println(e.getMessage() + "Erro lendo o ficheiro");
        }finally{
            //cerrar el fichero

            try {
                if (leerInput != null) {
                    leerInput.close();
                }
            } catch (Exception e) {
            System.out.println("Error cerrando el fichero");
            System.exit(1);
            }
        }



    }}