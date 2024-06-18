import java.io.EOFException;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.util.Scanner;

public class AppTemperatura {
    
public static void main(String[] args) throws ClassNotFoundException {
    
Scanner teclado = new Scanner(System.in);
int respuesta;
Temperatura registroTemperatura;
double tempMaxima, tempMinima;
int dia;
String lugar;
final String nombreFichero = "temperaturas.dat";
File file = new File(nombreFichero);
boolean fin=false;


System.out.println("Pulsa 1 para introducir las temperaturas en el fichero. \n Pulsa 2 para ver el registro de temperaturas. \n Pulsa 3 para salir");
respuesta = teclado.nextInt();

while (respuesta != 3) {

    switch (respuesta) {
        case 1:
        
            System.out.println("Dime a temperatura máxima");
            tempMaxima = teclado.nextDouble();
            System.out.println("Dime a temperatura mínima:");
            tempMinima = teclado.nextDouble();
            System.out.println("Dime ó día");
            dia = teclado.nextInt();
            System.out.println("Dime o lugar");
            lugar = teclado.next();

            registroTemperatura = new Temperatura(tempMaxima, tempMinima, dia, lugar);

         
            try (FileOutputStream fos = new FileOutputStream(file, true);
            ObjectOutputStream oos = file.length() == 0 ? new ObjectOutputStream(fos) : new ObjectOutputStream(fos)) {
           oos.writeObject(registroTemperatura);
            } catch (IOException e) {
                System.out.println(e.getMessage());
            }

            break;

            
        case 2:

        if (file.exists()) {
            try (ObjectInputStream ois = new ObjectInputStream(new FileInputStream(file))) {
                while (!fin) {
                    try {
                        Temperatura tempLectura = (Temperatura) ois.readObject();
                        System.out.println(tempLectura.toString());
                    } catch (EOFException e) {
                        fin = true;
                    }
                }
            } catch (IOException e) {
                System.out.println(e.getMessage());
            }
        } else {
            System.out.println("El archivo no existe");
        }

             fin = false;  // Reset the flag for next reading session

            break;
     
        default:

            System.out.println("Opción no válida");

            break;

    
    }
    
    System.out.println("Pulsa 1 para introducir las temperaturas en el fichero. \n Pulsa 2 para ver el registro de temperaturas. \n Pulsa 3 para salir");
    respuesta = teclado.nextInt();

}


teclado.close();

}
}
