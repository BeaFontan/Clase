//3. Mostra un menú como o seguinte:

//a-Introducir un número enteiro
//b-Mostrar o 25 % do número introducido (será double).
//c-Mostrar o 35 % do número introducido (será double).
//d - Mostra o 50 % do número introducido (será double).
//e-sair



import java.util.Scanner;

public class E803 {

    public static void main(String[] args) {
    
        Scanner introducir = new Scanner(System.in);
        String respuesta;
        int numeroEnteiro = 0;
        double porcentaxe;

        System.out.println("Pulsa a para introducir un número enteiro");
        System.out.println("Pulsa b para mostrar o 25 % do número");
        System.out.println("Pulsa c para mostrar o 35% do número");
        System.out.println("Pulsa d para mostrar o 50% do número");
        System.out.println("Pulsa e para saír");
        respuesta = introducir.nextLine();

        while (!respuesta.equals("e")) {

            switch (respuesta) {
                case "a":
                System.out.println("Dime o número");
                numeroEnteiro = introducir.nextInt();
                introducir.nextLine(); // capturo el intro en el primero número que introduzco después de usar cadenas

                    break;
            
                case "b": // para mostrar o 25% do número en double

                    porcentaxe = numeroEnteiro* 25 / 100;
                    System.out.println("O 25% é: " + porcentaxe);
                    break;

                case "c": // para mostrar o 35% do número en double

                    porcentaxe = numeroEnteiro* 35 / 100;
                    System.out.println("O 35% é: " + porcentaxe);
                    break;

                 case "d": // para mostrar o 50% do número en double

                    porcentaxe = numeroEnteiro* 50 / 100;
                    System.out.println("O 50% é: " + porcentaxe);
                    break;

            }
            

            System.out.println("Pulsa a para introducir un número enteiro");
            System.out.println("Pulsa b para mostrar o 25 % do número");
            System.out.println("Pulsa c para mostrar o 35% do número");
            System.out.println("Pulsa d para mostrar o 50% do número");
            System.out.println("Pulsa e para saír");
            respuesta = introducir.nextLine();
        }

        



        introducir.close();
    }
}