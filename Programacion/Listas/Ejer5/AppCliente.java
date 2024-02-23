import java.lang.reflect.Array;
import java.util.ArrayList;
import java.util.Scanner;

class AppCliente {

    public static void main(String[] args) {
       
        Scanner teclado = new Scanner(System.in);
        ArrayList<Cliente> listaClientes = new ArrayList<Cliente>();
        String respuesta;

        System.out.println("Pulsa A para introducir \n Pulsa B para mostrar \n Pulsa C para salir");
        respuesta = teclado.nextLine();

        while (!respuesta.equals("C")) {
            
            switch (respuesta) {
                case "A":
                    String nome, telefono, email;

                    System.out.println("Dime o nome do cliente");
                    nome = teclado.nextLine();
                    System.out.println("Dime o telefono");
                    telefono = teclado.nextLine();
                    System.out.println("Dime o email");
                    email = teclado.nextLine();

                    Cliente cliente = new Cliente(nome, telefono, email);

                    listaClientes.add(cliente);
                    
                    break;

                case "B":
                    
                    for (Cliente datoCliente : listaClientes) {
                        System.out.println(datoCliente.getNome() + " " + datoCliente.getTelefono() + " " + datoCliente.getEmail());
                    }

                    break;                

                default:

                    System.out.println("Opción no válida");

                    break;
    
            }

            System.out.println("Pulsa A para introducir \n Pulsa B para mostrar \n Pulsa C para salir");
            respuesta = teclado.nextLine();

        }

        teclado.close();

    }

}