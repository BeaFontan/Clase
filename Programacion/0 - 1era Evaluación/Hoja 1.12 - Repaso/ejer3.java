import java.util.Scanner;

public class ejer3 {


        public static void main(String[] args) {
            Scanner scanner = new Scanner(System.in);
    
            System.out.println("Introduce una cadena:");
            String cadena = introducirCadena(scanner);
    
            System.out.println("Introduce la primera letra a eliminar:");
            char letra1 = scanner.nextLine().charAt(0);
    
            System.out.println("Introduce la segunda letra a eliminar:");
            char letra2 = scanner.nextLine().charAt(0);
    
            String resultado = eliminar(cadena, letra1, letra2);
    
            System.out.println("Cadena resultante: " + resultado);
            
            scanner.close();
        }
    
        
        // Función para introducir una cadena desde la entrada estándar
        public static String introducirCadena(Scanner scanner) {
            System.out.print("Introduce una cadena: ");
            return scanner.nextLine();
        }
    

        // Función para eliminar las sílabas que contienen las letras especificadas
        public static String eliminar(String cadena, char letra1, char letra2) {
            StringBuilder resultado = new StringBuilder();
            boolean eliminar = false;
    
            for (int i = 0; i < cadena.length(); i++) {
                char actual = cadena.charAt(i);
    
                if (actual == letra1 || actual == letra2) {
                    eliminar = true;
                } else if (eliminar && Character.isWhitespace(actual)) {
                    eliminar = false;
                }
    
                if (!eliminar) {
                    resultado.append(actual);
                }
            }
    
            return resultado.toString();
        }
}