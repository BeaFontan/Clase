//1. Cal sería o código indicado para saber se o indicado no path é un ficheiro? E se é
//posible escribir no mesmo? Fai un programa que vaia pedindo o nome dun ficheiro, e mostre se existe e
//se é posible escribir no mesmo. Faino coa clase File, e coa API NIO.

import java.io.File;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Scanner;

public class Ejer1 {

    public static void main(String[] args) {
        String nombre;
        Scanner teclado = new Scanner(System.in);


        System.out.println("Dime o ficheiro que queres buscar con File");
        nombre = teclado.nextLine();

        while (!nombre.equals("X")) {
        
            File nombreArchivo = new File(nombre);

            if (!nombreArchivo.exists()) {
                System.out.println("El fichero no existe");
            }
            else{
                System.out.println("El fichero existe");
            }

            //Comprobar si el fichero se puede escribir
            if (nombreArchivo.canWrite() == true){
                System.out.println("El fichero se puede escribir");
            }
            else{
                System.out.println("El fichero no se puede escribir");
            }


            System.out.println("Dime o ficheiro que queres buscar");
            nombre = teclado.nextLine();
        }


        System.out.println("Dime o ficheiro que queres buscar con Path");
        nombre = teclado.nextLine();

        while (!nombre.equals("Y")) {
        
            Path nombreArchivo = Paths.get(nombre);

            if (!Files.exists(nombreArchivo)) {
                System.out.println("El fichero no existe");
            }
            else{
                System.out.println("El fichero existe");
            }

            //Comprobar si el fichero se puede escribir
            try {
                Files.isWritable(nombreArchivo);
            } catch (Exception e) {
                System.out.println(e.getMessage() + "Problema al intentar ver si el archivo es legible");
            }
            

            if (Files.isWritable(nombreArchivo) == true){
                System.out.println("El fichero se puede escribir");
            }
            else{
                System.out.println("El fichero no se puede escribir");
            }

            System.out.println("Dime o ficheiro que queres buscar");
            nombre = teclado.nextLine();
        }



        





    }

}