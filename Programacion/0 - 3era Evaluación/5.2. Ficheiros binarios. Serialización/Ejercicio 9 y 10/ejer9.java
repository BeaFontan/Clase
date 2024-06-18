
//9. Crea un programa que vaia pedindo doubles por teclado e os vaia gardando nun ficheiro.

import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.EOFException;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Scanner;

public class ejer9 {

    public static void main(String[] args) {
        
        Scanner teclado = new Scanner(System.in);
        Double numero;

        //Defino los objetos File el Data de Output para escribir
        FileOutputStream fileEscribir = null;
        DataOutputStream dataEscribir = null;

        //Defino los ojetos ahora para lectura y los igualo a null, sino luego nos da problemas para cerrarlos.
        FileInputStream fileLeer = null;
        DataInputStream dataLeer = null;
        Double datoLeido = 0.00; //para almacenar los datos.


        //ESCRITURA

        System.out.println("Dime un número, para parar pulsa 0");
        numero = teclado.nextDouble();

        try {
            fileEscribir = new FileOutputStream("ficheroDatos.dat");
            dataEscribir = new DataOutputStream(fileEscribir);

            //condición para salir del bucle
            while (numero != 0) {
            
                dataEscribir.writeDouble(numero);

                System.out.println("Dime un número, para parar pulsa 0");
                numero = teclado.nextDouble();
    
            }
            
        } catch (FileNotFoundException e) {
          
            System.out.println(e.getMessage());

        } catch (IOException e) {

            System.out.println(e.getMessage());

        }finally{
            try {
                if (fileEscribir != null) {
                    fileEscribir.close();
                }
                if (dataEscribir != null) {
                    dataEscribir.close();
                }
            } catch (IOException e) {
                System.out.println(e.getMessage());                                                               
            }
        }
        

        //LECTURA

        try {

            fileLeer = new FileInputStream("ficheroDatos.dat");
            dataLeer = new DataInputStream(fileLeer);

            while (datoLeido != -1) {
                datoLeido = dataLeer.readDouble();

                System.out.println(datoLeido);
            }

        } catch (FileNotFoundException e) {
            
            System.out.println(e.getMessage());

        } catch (EOFException e) {
            System.out.println("Fin de fichero");
            
        } catch (IOException e) {
          
            System.out.println(e.getMessage());

        }finally{
            try {
                if (fileLeer != null) {
                    fileLeer.close();
                }
                if (dataLeer != null) {
                    dataLeer.close();
                }
            } catch (IOException e) {
                System.out.println(e.getMessage());                                                               
            }
        }




        teclado.close();

    }

}