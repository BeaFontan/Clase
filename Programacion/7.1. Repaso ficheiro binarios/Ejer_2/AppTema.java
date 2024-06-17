import java.io.EOFException;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutput;
import java.io.ObjectOutputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.Scanner;

public class AppTema {
    public static void main(String[] args) {
        
        Scanner teclado = new Scanner(System.in);
        int respuesta;
        String menu=""" 
                1. Ver todos os temas
                2. Introducir un tema novo
                3. Gardar os temas no ficheiro
                4. Eliminar un dos temas
                5. Saír
                """;
               
        ArrayList<Tema> arrayTemas = new ArrayList<Tema>();
        

        String fileName ="temas.dat";
        File file = new File(fileName);

        //CARGAR LOS DATOS DEL FICHERO QUE YA EXISTEN EN EL ARRAYLIST

        if (!file.exists()) {
            try {
                file.createNewFile();
            } catch (IOException e) {
                System.out.println("Problema al crear el fichero");
            }
        }
        else if (file.exists()) {
            Tema temaLectura;
            try (ObjectInputStream ois = new ObjectInputStream(new FileInputStream(file)) ) {

              try {

                while ((temaLectura = (Tema) ois.readObject()) != null) {
                    
                    arrayTemas.add(temaLectura);
                    
                }
 
                ois.close();
                
              } catch (EOFException e) {
                System.out.println("Non hay mais datos");
              }
              catch (ClassNotFoundException c){
                    System.out.println("Tipo e obxecto inválido");
              }
              catch(IOException i){
                System.out.println("Erro lendo o ficheiro");
              }

            } catch (Exception e) {
                System.out.println(e.getMessage());
            }
        }
        else{
            System.out.println("Problema al encontrar el fichero");
        }



        //MENÚ
        System.out.println(menu);
        respuesta = teclado.nextInt();

        while (respuesta!= 5) {
            
            switch (respuesta) {
                case 1: //Ver todos los temas
                
                    for (Tema tema : arrayTemas) {
                        System.out.println(tema.toString());
                    }
                    
                    break;   
                    
                case 2: //Introducir un tema novo
                    String nome, autor, xenero;
                    int ano;
                    Tema tema;

                    teclado.nextLine();
                    System.out.println("Dime o título da canción");
                    nome = teclado.nextLine();
                    System.out.println("Dime o autor");
                    autor = teclado.nextLine();
                    System.out.println("Dime o ano");
                    ano = teclado.nextInt();
                    teclado.nextLine();
                    System.out.println("Dime o xenero");
                    xenero = teclado.nextLine();

                    tema = new Tema(nome, autor, ano, xenero);

                    arrayTemas.add(tema);
                    
                    break;

                case 3: //Gardar os temas no ficheiro
                    
                    if (file.exists()) {
                        try (ObjectOutputStream oos = new ObjectOutputStream(new FileOutputStream(file,false))) {
                            
                            for (Tema tema2 : arrayTemas) {
                                oos.writeObject(tema2);
                            }

                            oos.close();
                            System.out.println("Temas gardados");

                        } catch (IOException e) {
                            System.out.println(e.getMessage());
                        }
                    }
                    else{
                        System.out.println("Problema gardando no ficheiro");
                    }

                    break;

                case 4: //Eliminar un tema

                    System.out.println("Dime o índice do tema que queres eliminar");
                    respuesta = teclado.nextInt();

                    arrayTemas.remove(respuesta);
                    
                    break;   

                default:
                    System.out.println("Opción non válida");
                    break;
            }

            
        System.out.println(menu);
        respuesta = teclado.nextInt();

        }
        
        teclado.close();

    }


}
