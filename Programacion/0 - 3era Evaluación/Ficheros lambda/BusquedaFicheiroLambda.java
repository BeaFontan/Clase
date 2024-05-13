import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;
import java.util.stream.Collectors;
import java.util.stream.Stream;
public class BusquedaFicheiroLambda { 
    public static void main(String[] args) throws IOException {    


        Path path = Paths.get("./proba");

        //busqueda del metodo buscar por nombre
        List<Path> result = busquedaPorNombre(path, "pom.xml");
        result.forEach(x -> System.out.println(x));  

        List<Path> result2 = busquedaPorExtension(path, ".txt");
        result2.forEach(x -> System.out.println(x));     
    }   


    //Metodo de busca usando .find con Stream
    public static List<Path> busquedaPorNombre(Path path, String fileName)throws IOException {
        //listado que xenera a busqueda
        List<Path> result;    
        //find ten tres atributos de entrada
        //a interfaz funcional fai ignorar as maiúsculas y minúsculas
        try (Stream<Path> pathStream = Files.find(path,
                Integer.MAX_VALUE,
                (p, basicFileAttributes) ->
                        p.getFileName().toString().equalsIgnoreCase(fileName))
        ) {
            result = pathStream.collect(Collectors.toList());
        }
        return result;
    }   



    //método de busca por extensión 
    public static List<Path> busquedaPorExtension(Path path, String ext)
            throws IOException {
        //listado que xera a busca
        List<Path> result;      
        //a interfaz funcional filtra por ficheiros (no directorios) y que
        // tena a extension
        try (Stream<Path> pathStream = Files.find(path,
                Integer.MAX_VALUE,
                (p, attr) -> 
                   attr.isRegularFile() && p.toString().endsWith(ext))
        )
        {
            result = pathStream.collect(Collectors.toList());
        }
        return result;
    }    
}