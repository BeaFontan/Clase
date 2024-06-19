//Fai un programa que mostre un menú como o seguinte:
//a-Introducir 4 números enteiros.
//b-Calcular o máximo e mostralo.
//c-Calcular o mínimo e mostralo
//d-Calcular a media e mostrala.
//e-Sair

import java.util.Scanner;

public class E804 {

    public static void main(String[] args) {
        Scanner entrada = new Scanner(System.in);
        String respuesta;
        int[] numeros = new int[4];
        int numeroMaior;
        int numeroMenor;
        int suma;
        double media;

        
        System.out.println("Pulsa a para introducir 4 números enteiros");
        System.out.println("Pulsa b para mostrar maior");
        System.out.println("Pulsa c para mostrar o mínimo");
        System.out.println("Pulsa d para calcular a media");
        System.out.println("Pulsa e para sair");
        respuesta = entrada.nextLine();

        while (!respuesta.equals("e")) {
            
            switch (respuesta) {
                case "a":

                    for (int i = 0; i < numeros.length; i++) {
                        System.out.println("Dime o número");
                        numeros[i] = entrada.nextInt();
                        entrada.nextLine(); // capturo el intro en el primero número que introduzco después de usar cadenas
                    }

                    break;
                
                case "b": // para ver el número mayor

                    if (numeros[0] > numeros[1] && numeros[0] > numeros[2] && numeros[0] > numeros[3]) {
                        
                        numeroMaior = numeros[0];
                    }
                    else if(numeros[1] > numeros[0] && numeros[1] > numeros[2] && numeros[1] > numeros[3]){

                        numeroMaior = numeros[1];

                    }
                    else if(numeros[2] > numeros[0] && numeros[2] > numeros[1] && numeros[2] > numeros[3]){

                        numeroMaior = numeros[2];

                    }
                    else{
                        numeroMaior = numeros[3];
                    }

                    System.out.println("O número maior é: " + numeroMaior);

                    break;
            
                case "c": // para ver el número menor

                    if (numeros[0] < numeros[1] && numeros[0] < numeros[2] && numeros[0] < numeros[3]) {
                        
                        numeroMenor = numeros[0];
                    }
                    else if(numeros[1] < numeros[0] && numeros[1] < numeros[2] && numeros[1] < numeros[3]){

                        numeroMenor = numeros[1];

                    }
                    else if(numeros[2] < numeros[0] && numeros[2] < numeros[1] && numeros[2] < numeros[3]){

                        numeroMenor = numeros[2];

                    }
                    else{
                        numeroMenor = numeros[3];
                    }

                    System.out.println("O número menor é: " + numeroMenor);

                    break;
                
                case "d":

                    suma = numeros[0] + numeros[1] + numeros[2] + numeros[3];

                    media = (double) suma / 4;

                    System.out.println("A media dos números é : " + media);

                    break;
            }

            System.out.println("Pulsa a para introducir 4 números enteiros");
            System.out.println("Pulsa b para mostrar maior");
            System.out.println("Pulsa c para mostrar o mínimo");
            System.out.println("Pulsa d para calcular a media");
            System.out.println("Pulsa e para sair");
            respuesta = entrada.nextLine();
        }

        entrada.close();

    }
}