import java.util.Scanner;

public class AppBici {

    public static void main(String[] args) {
        
        Scanner teclado = new Scanner(System.in);
        String respuesta;
        BiciElect[] arrayBiciElects = new BiciElect[4];
        String nome;
        String marca;
        int autonomiaKm;

        System.out.println("Pulsa a para introducir una bici");
        System.out.println("Pulsa b para mostrar los elementos del array");
        System.out.println("Pulsa c para cambiar los datos de una bici");
        System.out.println("Pulsa d para mostrar la bicicleta con más autonomía");
        System.out.println("Pulsa e para mostrar la bicicleta con más autonomía");
        System.out.println("Pulsa f para salir");
        respuesta = teclado.next();

        while (!respuesta.equals("f")) {
            
            switch (respuesta) {
                case "a":



                    System.out.println("Dime o nome");
                    nome = teclado.next();
                    System.out.println("Dime a marca");
                    marca = teclado.next();
                    System.out.println("Dime a autonomia");
                    autonomiaKm = teclado.nextInt();

                    if (BiciElect.getNumBicis()== 5) {
                        System.out.println("Non podes introducir máis bicicletas");
                        break;
                    }

                    arrayBiciElects[BiciElect.getNumBicis()] = new BiciElect(nome, marca, autonomiaKm);


                    
                    break;

                case "b":

                   for (int i = 0; i < BiciElect.getNumBicis(); i++) {
                    System.out.println(arrayBiciElects[i].getNome() + " " + arrayBiciElects[i].getMarca() + " " +  arrayBiciElects[i].getAutonomiaKm());
                   }

                    break;

                case "c":
                   int posicion;

                   System.out.println("Dime a posición que queres modificar");
               
                   posicion = teclado.nextInt();
                    System.out.println("Dime o nome");
                    nome = teclado.next();
                    System.out.println("Dime a marca");
                    marca = teclado.next();
                    System.out.println("Dime a autonomia");
                    autonomiaKm = teclado.nextInt();

                   arrayBiciElects[posicion] = new BiciElect(nome, marca, autonomiaKm);

                   break;


                case "d":
                   BiciElect mayor = arrayBiciElects[0];

                    for (int i = 0; i < BiciElect.getNumBicis(); i++) {
                        BiciElect.comparaAutonomia(arrayBiciElects[i], mayor);

                    }
                    System.out.println(mayor.getNome());

                   break;

                case "e":
                   BiciElect menor = arrayBiciElects[0];

                    for (int i = 0; i < BiciElect.getNumBicis(); i++) {
                        BiciElect.comparaAutonomia(arrayBiciElects[i], menor);

                    }
                    System.out.println(menor.getNome());


                break;
            
            }

            System.out.println("Pulsa a para introducir una bici");
            System.out.println("Pulsa b para mostrar los elementos del array");
            System.out.println("Pulsa c para cambiar los datos de una bici");
            System.out.println("Pulsa d para mostrar la bicicleta con más autonomía");
            System.out.println("Pulsa e para mostrar la bicicleta con más autonomía");
            System.out.println("Pulsa f para salir");
            respuesta = teclado.next();
        }



        teclado.close();

    }
}