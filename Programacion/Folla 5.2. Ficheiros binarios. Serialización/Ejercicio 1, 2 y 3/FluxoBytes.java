import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Scanner;
public class FluxoBytes {
    public static void main(String[] args) {  
        Scanner teclado = new Scanner(System.in);

        //Obtemos o directorio home do sistema onde se almacenará o ficheiro
        String directory = ".";
        String fileName = "Cadenas.txt";
        String absolutePath = directory + File.separator + fileName;


         // escritura do ficheiro
        try(FileOutputStream fileOutputStream = new FileOutputStream(absolutePath)) {

            System.out.println("Dime unha cadea");
            String fileContent = teclado.nextLine();

            //mientrsas no ponga X
            while (!fileContent.equals("X")) {

                //escribo la primera cadena
                fileOutputStream.write(fileContent.getBytes());
                fileOutputStream.flush(); //Forzamos o gardado

                //pregungo las siguientes cadenas hasta que presiono X
                System.out.println("Dime unha cadea");
                fileContent = teclado.nextLine();
            }



        } catch (FileNotFoundException e) {
            System.err.println("Ficheiro non encontrado");
        } catch (IOException e) {
            System.err.println("Error na E/S");
        }



        // lendo o ficheiro

        //le pasamos al ojeto fileinputstream el path del fichero
        try(FileInputStream fileInputStream = new FileInputStream(absolutePath)) {

            //definimos un int porque lee los binarios en int y guarda los datos del archivo.
            int ch = fileInputStream.read();
            //ata a fin do stream (ficheiro), imos mostrando letra a letra

            while(ch != -1) { //mientras que fileinputstream sea distinto de -1

                System.out.print((char)ch);//muestras por pantalla y casteas a char ya al mismo tiempo
                ch = fileInputStream.read(); //y vuelve a leer otra letra

            }

        } catch (FileNotFoundException e) {
            System.err.println("Ficheiro non encontrado");
        } catch (IOException e) {
            System.err.println("Error na E/S");
        } }
}