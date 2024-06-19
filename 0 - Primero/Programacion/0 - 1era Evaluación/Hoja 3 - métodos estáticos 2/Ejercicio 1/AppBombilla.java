import java.util.Scanner;

public class AppBombilla {

    public static void main(String[] args) {
    
    Scanner teclado = new Scanner(System.in);
    int respuesta;


    Bombilla bombi1 = new Bombilla("Bombilla 1", 10);

    Bombilla bombi2 = new Bombilla("Bombilla 2", 15);

    Bombilla bombi3 = new Bombilla("Bombilla 3", 6);

    System.out.println("A suma das potencias é: " + Bombilla.getValorPotenciaTotal());

    

    System.out.println("___________________________________________");

    bombi1.aumentaPotencia(5);
    System.out.println("O valor da potencia da bombilla 1 é: " + bombi1.getPotencia());

    bombi2.aumentaPotencia(50);

    System.out.println("O valor da potencia da bombilla 2 é: " + bombi2.getPotencia());

    //no vario la potencia de la bombilla 3
    System.out.println("O valor da potencia da bombilla 3 é: " + bombi3.getPotencia());


    System.out.println("A suma das potencias é: " + Bombilla.getValorPotenciaTotal());

    System.out.println("A bombilla con mais potencia é " + Bombilla.comparaBombilla(bombi1, bombi2));





    System.out.println("___________________________________________");





    //No varío la potencia de la bombilla 1
    System.out.println("O valor da potencia da bombilla 1 é: " + bombi1.getPotencia());

    System.out.println("Dime o valor para baixar a potencia da bombilla 2");
    bombi2.baixaPotencia(respuesta = teclado.nextInt());
    System.out.println("O valor da potencia da bombilla 2 é: " + bombi2.getPotencia());

    System.out.println("Dime a potencia para baixar a bombilla 3");
    bombi3.baixaPotencia(respuesta = teclado.nextInt());
    System.out.println("O valor da potencia da bombilla 3 é: " + bombi3.getPotencia());


    System.out.println("A suma das potencias é " + Bombilla.getValorPotenciaTotal());

      System.out.println("A bombilla con mais potencia é " + Bombilla.comparaBombilla(bombi2, bombi3));





    System.out.println("___________________________________________");




    bombi1.baixaPotencia(15);
    bombi2.baixaPotencia(0);
    bombi3.baixaPotencia(4);

    System.out.println("Bombilla 1: " + bombi1.getPotencia() + " , Bombilla 2: " + bombi2.getPotencia() + " , Bombilla 3: " + bombi3.getPotencia() + " , el total de las potencias: " + Bombilla.getValorPotenciaTotal());

    System.out.println("A bombilla con mais potencia é " + Bombilla.comparaBombilla(bombi1, bombi2));

    System.out.println("Ata logo!");
    

 

    }
}