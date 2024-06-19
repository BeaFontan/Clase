import java.util.ArrayList;
import java.util.Scanner;

public class AppBiblioteca {

   //defino la lista de usuarios (objetos) arriba para poder utilizarla en todo el programa
   public static ArrayList<Biblioteca> listaUsuariosBiblioteca = new ArrayList<Biblioteca>();

    public static void main(String[] args) {
        
        Scanner teclado = new Scanner(System.in);
        int respuesta;


        String menu = "1-introducir usuarios desde teclado \n 2-gardar usuarios nun ficheiro \n 3-recuperar usuarios do ficheiro \n 4-borrar o contido do ficheiro \n 5-mostrar todos os usuarios.";

        System.out.println(menu);
        respuesta = teclado.nextInt();

        while (respuesta != 99) {
            
            switch (respuesta) {
                case 1:
                    
                    introducirUsuario(teclado);

                    break;

                case 2:
                
                    escribirUsuarioFichero();

                    break;

                case 3:

                    leerUsuarioFichero();
                
                    break;

                case 4:

                    borrarContidoFicheiro();
                
                    break;

                case 5:

                    mostrarListaUsuarios();
                
                    break;
            
                default:

                    System.out.println("Elección non válida");
                    break;
            }


            System.out.println(menu);
            respuesta = teclado.nextInt();

        }

        teclado.close();

    }



    public static void introducirUsuario(Scanner scan){

    String nombre, email, telefono;

    System.out.println("Dime o nome");
    nombre = scan.nextLine();

    System.out.println("Dime o email");
    email = scan.nextLine();

    System.out.println("Dime o teléfono");
    telefono = scan.nextLine();

    Biblioteca usuario = new Biblioteca(nombre, email, telefono);

    //cargo la lista definida en al principio con el usuario
    listaUsuariosBiblioteca.add(usuario);

    };

    public static void escribirUsuarioFichero(){};

    public static void leerUsuarioFichero(){};

    public static void borrarContidoFicheiro(){};

    public static void mostrarListaUsuarios(){};


}