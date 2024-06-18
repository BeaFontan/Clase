import java.io.DataInputStream;
import java.io.EOFException;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;

import javax.xml.crypto.Data;
public class DataInputStreamInt {
      public static void main(String[] args) {

          //Hace una función que llama en el main
          lerInt();

    }


    //Uso de recursos e excepcións clásica sen try with resources

    public static void lerInt(){

        //Ahora define los Inputs para leer
        FileInputStream fis = null;
        DataInputStream entrada = null;
        int n = 0; //define el int porque son enteros lo que estamos leyendo.


        try {

            fis = new FileInputStream("datos.dat");

            entrada = new DataInputStream(fis);

            //mientras sea distinto de menos 1, esto realmente no está controlando nada, pero while true es una mala práctica, realmente lo que controla es la excepción.
            while (n != -1) {   

                n = entrada.readInt();

                System.out.println(n);  //se mostra na pantalla

            }

        } catch (FileNotFoundException e) {
            System.out.println(e.getMessage());
        } catch (EOFException e) {
            System.out.println("Fin de fichero"); //muestra un mensaje de aviso de fichero.
        } catch (IOException e) {
            System.out.println(e.getMessage());
        } finally {
            //SE CIERRAN TODOS LOS RECURSOS
            try {
                if (fis != null) {
                    fis.close();
                }
                if (entrada != null) {
                    entrada.close();
                }
            } catch (IOException e) {
                System.out.println(e.getMessage());                                                               
            }
        }
    }
}