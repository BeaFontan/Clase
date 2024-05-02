import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

public class Cliente {

    private String nome;
    private String apelidos;
    private int idade;


    public Cliente(String nombre, String apellidos, int edad) {
        this.nome = nombre;
        this.apelidos = apellidos;
        this.idade = edad;
    }


    public String getNome() {
        return nome;
    }


    public void setNome(String nome) {
        this.nome = nome;
    }


    public String getApelidos() {
        return apelidos;
    }


    public void setApelidos(String apelidos) {
        this.apelidos = apelidos;
    }


    public int getIdade() {
        return idade;
    }


    public void setIdade(int idade) {
        this.idade = idade;
    }




    //función para escribir el archivo de texto
    public static void gardarClientes(){

        //crear un fichero 

        //crea una lista de objetos cliente
        ArrayList<Cliente> clientes = new ArrayList<Cliente>();

        //añade los clientes con datos para los atributos
        clientes.add(new Cliente("Ana", "Fernández López",23));
        clientes.add(new Cliente("Antón", "Sueiro Sueiro",33));
        clientes.add(new Cliente("Xan", "Ferreiro Ferreiro",77));

        //designa un string con el nombre del fichero que vamos a crear
        String fichero = "clientes.txt"; 

        //le pasa el nombre del fichero al file (filename)
        File f = new File(fichero);

        //ahora crea el objeto filewritter para pasarle el file dentro de un try-with resources porque puede romper
        try (FileWriter fw = new FileWriter(f)) {

            //ahora crea un objeto printwriter para para imprimir dentro del file
            PrintWriter escritura = new PrintWriter(fw);

            //bucle para recorrer la lista de objetos que pasa a una cadena para poder mostrar luego en el foreach
            for (int i = 0; i < clientes.size(); i++) {
                //ahora maneja los datos, para escribir, crea un string, coge el nombre y añade un ;
                String cadea = clientes.get(i).getNome() + ";"+ 
                    clientes.get(i).getApelidos()+ ";" +
                    clientes.get(i).getIdade();
                //y le procede a imprimir
                escritura.println(cadea);
            }
        } catch (IOException e) {
            System.out.println("Non se pode abrir o ficheiro para escritura");
        }
     
    }

    //función para leer el archivo de texto
    public static void lerClientes(){

        //crea un lista de objetos cliente
        ArrayList<Cliente> clientes = new ArrayList<Cliente>();

        String fichero = "clientes.txt"; 
        //le da el nombre con el string al filename de File
        File f = new File(fichero);

        //todo dentro de un try-catch porque puede dar error al leer o al crear un objeto.
        try {

            //siempre vamos a necesitar un filereader y un bufferedReader juntos, uno lee el otro le da como la posición de memoria

            //crea un objeto filereader y le pasa el file
            FileReader fr = new FileReader(f);

            //es el objeto que necesitamos para leer el fichero linea a linea que le pasamos el filereader
            BufferedReader br = new BufferedReader(fr);

            String cadea;
            //array de string para almacenar los atributos separados
            String [] atributos;

            //iguala la cadena 
            while((cadea = br.readLine())!= null){
                //almacena en la cadena los atributos, le quita los spacios y divide por el ;
                atributos = cadea.trim().split(";");
                //añade a la lista el cliente con los atributos 
                clientes.add(new Cliente(atributos[0], atributos[1], Integer.parseInt(atributos[2])));
           }

           //cierra el bufered reader y el filereader
           br.close();
           fr.close();

           //ahora mostramos los datos con un foreach
           for (Cliente cliente : clientes) {
                System.out.println(cliente.getNome()+", "+cliente.getApelidos()+", "+cliente.getIdade());
           }

           
        } catch (Exception e) {
            System.out.println("Houbo un problema lendo o ficheiro");
        }
     
    }
    

    
}