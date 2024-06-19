
import java.io.IOException;
import java.nio.charset.Charset;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;


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

    //creo la lista para almacenar los clientes
     ArrayList<Cliente> listaClientes = new ArrayList<Cliente>();

     //añado cada uno de los clientes
     listaClientes.add(new Cliente("Ana", "Fernández López",23));
     listaClientes.add(new Cliente("Antón", "Sueiro Sueiro",33));
     listaClientes.add(new Cliente("Xan", "Ferreiro Ferreiro",77));

     //ahora tengo que hacer una lista de strings para poder mostrarlos luego

     ArrayList<String> clientesString = new ArrayList<>();

     //uso un foreach para volver la lista de objetos a la lista de Strings, pues sino no puedo escribirlos en el archivo

     for (Cliente cliente : listaClientes) {
        //añado ya la cadena completa de datos que quiero mostrar con un ;
        clientesString.add(cliente.getNome() + ";" + cliente.getApelidos() + ";" + cliente.getIdade());
     }


     //protegemos con un try-catch porque puede dar error al intentar escribir, por si no hay hay permisos o algo
     try {
             //Y ahora usamos el metodo de write de Path, y le pasamos el archivo donde va a escribir, la lista de strings que 
        //convertimos de clientes y la codificación de chars para que ponga el texto bien.
        Files.write(Paths.get("clientes.txt"), clientesString , StandardCharsets.ISO_8859_1);

     } catch (Exception e) {
        System.out.println(e.getMessage() + "Erro escribindo no ficheiro");
     }
     

    }



    //función para leer el archivo de texto
    public static void lerClientes(){
    
        //Defino el array de clientes que voy a usar para almacenar los datos del fichero que voy a leer
        ArrayList<Cliente> listaClientesLeer = new ArrayList<Cliente>();

        //En este caso, guardo una variable de la clase Charset donde almaceno la codificación de caracteres:
        Charset variableCaracteres = Charset.forName("ISO-8859-1");
            
        //lo hacemos dentro de try-catch para proteger
        try {
            //ahora defino una lista de string para almacenar el texto de cada línea
            List <String> listaLineas = Files.readAllLines(Paths.get("clientes.txt"), variableCaracteres);

            //ahora recorro cada línea para ir desgranando y almacenando en la lista de objetos
            for (String linea : listaLineas) {
                //defino array de String para ir almacenando cada atributo por separado
                String [] datoString;

                //cada atributo lo igualo a línea, primero sin espacios y luego separado por ; que es como está en el fichero.
                datoString = linea.trim().split(";");

                //y ahora lo añado a la lista de objetos cliente costruyendo un cliente con cada atributo

                listaClientesLeer.add(new Cliente(datoString[0], datoString[1], Integer.parseInt(datoString[2])));
                                                                                //convierto el string a int                                                           
            }


        } catch (IOException e) {
            
            System.out.println(e.getStackTrace() + "Erro lendo no ficheiro");
        }


        //y ahora muestro los datos de la lista creada de objetos

        for (Cliente datoCliente : listaClientesLeer) {
            System.out.println(datoCliente.getNome() + ", " + datoCliente.getApelidos() + ", " + datoCliente.getIdade());
        }

        
    }
    
    
}