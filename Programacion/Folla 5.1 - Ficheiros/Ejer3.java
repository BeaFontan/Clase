//3. Simplifica o código da introdución UD5.- Ficheiros, para empregar o 
//try-with-resources. Lembra que o try-with-resources pode ter un bloque catch 
//se é preciso capturar a excepción: o que non é preciso é
//empregar o bloque finally para liberar os recursos.

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.Scanner;

public class Ejer3{

    public static void main(String[] args) throws IOException{
        
    
    try (Scanner teclado = new Scanner(new File("test.txt"));){
        
        while (scanner.hasNext()) {
            System.out.println(scanner.nextLine());
        }
    } catch (IOException e) {
        e.printStackTrace();

    }


    }

}