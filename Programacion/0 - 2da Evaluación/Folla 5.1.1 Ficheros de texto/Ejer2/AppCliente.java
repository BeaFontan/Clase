import java.util.Scanner;

public class AppCliente {

    public static void main(String[] args) {

        String menu = "Pulsa A para guardar. \n Pulsa B para mostrar";
        String respuesta;
        Scanner teclado = new Scanner(System.in);

        System.out.println(menu);
        respuesta = teclado.nextLine();

        while (!respuesta.equals("fin")) {
            

            switch (respuesta) {
                case "A":
                    
                    Cliente.gardarClientes();

                    break;
            
                case "B":

                    Cliente.lerClientes();

                    break;
            }
            
            System.out.println(menu);
            respuesta = teclado.nextLine();
        }
        
        teclado.close();

    }
}