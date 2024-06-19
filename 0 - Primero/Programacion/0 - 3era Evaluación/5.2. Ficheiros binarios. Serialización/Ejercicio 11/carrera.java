/*11. Queremos gardar nun ficheiro carreira.bin unha serie de resultado dunha carreira, formado
por dorsal (int) e tempo (double). Pide por teclado o dorsal e tempo de 5 corredores e gárdao
nun ficheiro binario*/

import java.io.DataOutputStream;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Scanner;

public class carrera {

    public static void main(String[] args) {
        
        Scanner teclado = new Scanner(System.in);
        FileOutputStream fileEscribir = null;
        DataOutputStream dataEscribir = null;
        String directorio = ".";
        String nombreFichero = "carrera.bin";
        String rutaFichero = directorio + File.separator + nombreFichero;

        int dorsal=0;
        double tempo=0;

        try {

                fileEscribir = new FileOutputStream(rutaFichero);
                dataEscribir = new DataOutputStream(fileEscribir);


                while (dorsal != -1) {

                    for (int i = 0; i <= 5; i++) {
                        System.out.println("Dime o dorsal do corredor");
                        dorsal = teclado.nextInt();
                        System.out.println("Dime o tempo");
                        tempo = teclado.nextDouble();
            
                    }

                    dataEscribir.writeInt(dorsal);
                    dataEscribir.writeDouble(tempo);
                }


                } catch (FileNotFoundException e) {
                
                    System.out.println(e.getMessage());

                } catch (IOException e) {

                    System.out.println(e.getMessage());
                } finally{

                    try {
                        if (dataEscribir != null) {
                            dataEscribir.close();
                        }
                        if (fileEscribir != null) {
                            fileEscribir.close();
                        }
                        
                    } catch (Exception e) {
                        System.out.println(e.getMessage());
                    }

                }
            


    }
}