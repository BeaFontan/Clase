/*4.
Fai un programa que pide un Participante por teclado, e o engade ao ficheiro participantes.dat: para isto, debes
abrir en modo APPEND o ficheiro, e engadir o participante. Repite a execución. Se non che sobrescribe o método
writeStreamHeader( ) para que a non se escriba ningunha cabeceira no ficheiro*/

import java.io.EOFException;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardOpenOption;
import java.util.Scanner;

public class AppParticipantes {

    
public static void main(String[] args) {
    
    Scanner teclado = new Scanner(System.in);
    String filename = "participantes.dat";
    ObjectOutputStream escribirOutput = null;
    MiObjectOutputStream leerInput = null;

    String nome, apelidos;
    int idade;
    Participante part;
    Participante[] array = new Participante[3];
    
    Path path =Paths.get(filename);

    for (int i = 0; i < 3; i++) {
        System.out.println("Dime o nome");
        nome = teclado.next();
        System.out.println("Dime os apelidos");
        apelidos = teclado.next();
        System.out.println("Dime a idade");
        idade = teclado.nextInt();

        part = new Participante(nome, apelidos, idade);

        array[i] = part;

    }

    //comprobar si existe el fichero, sino crearlo y

    if (Files.exists(path)) {
        try {

            escribirOutput = new ObjectOutputStream(Files.newOutputStream(path, StandardOpenOption.APPEND));
            //OJO, AQUÍ SOBREESCRIBE SIEMPRE EL FICHERO PORQUE NO LE HEMOS PUESTO LO DE APPEND
    

            for (Participante participante : array) { //por cada participante en el array
                escribirOutput.writeObject(participante); //escríbelo en el fichero.
            }

            System.out.println("Escritura finalizada");

    
        } catch (IOException e) {
    
            System.out.println(e.getMessage());
            System.exit(1);//para el programa
    
        }finally{
            try {
                if (escribirOutput != null) {
                    escribirOutput.close();
                }
            } catch (Exception e) {
                System.out.println(e.getMessage());
            }
        }
    }

    else{ //Si no existe, crearlo y guardar en el fichero
        try {
            Files.createFile(path);
        } catch (IOException e) {
            System.out.println("problema al crear el fichero");
        }
        try {

            escribirOutput = new ObjectOutputStream(Files.newOutputStream(path, StandardOpenOption.APPEND));
   
            for (Participante participante : array) {
                escribirOutput.writeObject(participante);
            }

            System.out.println("Escritura finalizada");
    
        } catch (IOException e) {
    
            System.out.println(e.getMessage());
            System.exit(1);
    
        }finally{
            try {
                if (escribirOutput != null) {
                    escribirOutput.close();
                }
            } catch (Exception e) {
                System.out.println(e.getMessage());
            }
        }

    }

    //leer el fichero////////////////////////////////////////////////////////////////

    //abril el fichero

    try {

        leerInput = new MiObjectOutputStream(Files.newInputStream(path));

    } catch (IOException e) {

        System.out.println(e.getMessage() + "Erro abrindo o ficheiro");
        
    }


    //leer el fichero

    Participante participanteLectura;

    try {

        while ((participanteLectura = (Participante)leerInput.readObject())!= null) {
            
            System.out.println(participanteLectura.getNome() + " " + participanteLectura.getApelidos() + " " + participanteLectura.getIdade());

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


    teclado.close();

}
}