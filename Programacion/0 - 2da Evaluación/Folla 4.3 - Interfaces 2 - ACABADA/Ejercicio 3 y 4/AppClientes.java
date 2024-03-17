import java.util.Arrays;
import java.util.Scanner;

public class AppClientes {
    public static void main(String[] args) {
    
        Scanner teclado = new Scanner(System.in);
        Cliente [] arrayClientes = new Cliente[4];

        String nomeCiudad, nome;
        int poboacion;

        for (int i = 0; i < arrayClientes.length; i++) {
            System.out.println("Dime o nome da cidade");
            nomeCiudad = teclado.next();
            System.out.println("Dime a poboacion da cidade");
            poboacion = teclado.nextInt();
            System.out.println("Dime o nome do cliente");
            nome = teclado.next();

            Cidade cid = new Cidade(nomeCiudad,poboacion);

            Cliente clie = new Cliente(nome, cid);

            arrayClientes[i] = clie;

        }

        Arrays.sort(arrayClientes);

        for (Cliente clienteDatos : arrayClientes) {
            System.out.println(clienteDatos.getNome());
        }


        teclado.close();

    }
}
