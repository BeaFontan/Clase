import java.io.BufferedReader;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.stream.Stream; 

public class LerFicheiroLambda { 
    public static void main(String[] args) throws IOException {    
        Path file = Paths.get("datos.txt");  

        // Uso do try-with-resources con lambda

        try(Stream<String>lines = Files.lines(file).onClose(() -> System.out.println("Fin de lectura de ficheiro.")))
        {
            lines.forEach(System.out::println);
        }  



        //versión más eficiente utilizando BufferedReader

        System.out.println("Version mais eficiente....");   


        try(BufferedReader br = Files.newBufferedReader(file);
            Stream<String> lines = br.lines().onClose(() -> System.out.println("Fin de lectura de ficheiro."));)
        {  

            lines.forEach(System.out::println);
        }       



        //versión de procesamento pararelo. Precisas varias liñas no ficheiro para que se aprecia
        System.out.println("Version con procesamento paralelo....");
         try(Stream<String>lines = Files.lines(file).parallel().onClose(() -> System.out.println("Fin de lectura de ficheiro.")))
        {    
            //modificamos esta parte para poder observar os fíos que se xeran
             lines.forEach(s ->{
                    System.out.println(s +" " + Thread.currentThread().getName());});
        }      
    }
}