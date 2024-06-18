/*1.
Crea unha clase Participante con nome, apelidos, e idade, que sexa serializable. Fai un programa que pida 3
participantes, e os grave un a un nun ficheiro binario participantes.dat, empregando serialización.
2.
Le a continuación o ficheiro creado no exercicio anterior, lendo un a un cada participante e mostrando os datos
gardados no ficheiro.
3.
Como faríamos para que non se gardase a idade no ficheiro? Modifica o exercicio 1 para que non se garde no
ficheiro. Comproba tamén que se les o ficheiro de novo, a idade non foi gardada (debería valer 0).*/


import java.io.EOFException;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Scanner;

public class AppParticipantes {

    
public static void main(String[] args) {
    
    Scanner teclado = new Scanner(System.in);
    String filename = "participantes.dat";
    ObjectOutputStream escribirOutput = null;
    ObjectInputStream leerInput = null;
    Path path =Paths.get(filename);

    String nome, apelidos;
    int idade;
    Participante part;
    Participante[] array = new Participante[3];
    


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

            escribirOutput = new ObjectOutputStream(Files.newOutputStream(path));
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

            escribirOutput = new ObjectOutputStream(Files.newOutputStream(path));
   
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

        leerInput = new ObjectInputStream(Files.newInputStream(path));

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